import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'utils/colors_util.dart';
import 'utils/date_utils.dart' as date_util;
import 'notification_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = [];
  DateTime currentDateTime = DateTime.now();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedMedicine = '';
  bool isEveryday = false;

  @override
  void initState() {
    super.initState();
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController = ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget horizontalCapsuleListView() {
    return Container(
      width: width,
      height: 150,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentDateTime = currentMonthList[index];
          });
        },
        child: Container(
          width: 80,
          height: 140,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: (currentMonthList[index].day != currentDateTime.day)
                  ? [
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.6)
                    ]
                  : [
                      HexColor("ED6184"),
                      HexColor("EF315B"),
                      HexColor("E2042D")
                    ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: const [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.black12,
              )
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  currentMonthList[index].day.toString(),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? HexColor("465876")
                        : Colors.white,
                  ),
                ),
                Text(
                  date_util.DateUtils.weekdays[
                      currentMonthList[index].weekday - 1],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? HexColor("465876")
                        : Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topView() {
    return Container(
      height: height * 0.35,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor("c6e2ff").withOpacity(0.7),
            HexColor("c6e2ff").withOpacity(0.5),
            HexColor("c6e2ff").withOpacity(0.3),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: const [0.0, 0.5, 1.0],
          tileMode: TileMode.clamp,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black12,
            offset: Offset(4, 4),
            spreadRadius: 2,
          )
        ],
        borderRadius: const
 BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          titleView(),
          horizontalCapsuleListView(),
        ],
      ),
    );
  }

  Widget medicineDropdown() {
    List<String> medicineList = [
      'FUCIDIN',
      'CALPOL',
      'ADVANTAN',
      'OTRIVINE',
      'IBUCOLD C',
      'CROXİLEX',
      'EUTHYROX',
      'PAROL',
      'NEXIUM',
      'SYNJARDY',
      'GLIFOR',
      'CREBROS',
      'BENEXOL',
      'CORASPRİN',
      'ERITREIN',
    ];

    return DropdownButton<String>(
      value: selectedMedicine.isNotEmpty ? selectedMedicine : null,
      onChanged: (String? newValue) {
        setState(() {
          selectedMedicine = newValue!;
        });
      },
      items: medicineList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget frequencyDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Frequency',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        DropdownButton<bool>(
          value: isEveryday,
          onChanged: (bool? newValue) {
            setState(() {
              isEveryday = newValue!;
            });
          },
          items: [
            DropdownMenuItem<bool>(
              value: false,
              child: const Text('One Time'),
            ),
            DropdownMenuItem<bool>(
              value: true,
              child: const Text('Everyday'),
            ),
          ],
        ),
      ],
    );
  }

  void addMedicine() async {
    DateTime notificationDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    if (notificationDate.year == currentDateTime.year &&
        notificationDate.month == currentDateTime.month &&
        notificationDate.day == currentDateTime.day) {
      setState(() {
        currentDateTime = notificationDate;
      });
    }

    await FirebaseFirestore.instance.collection('medicines').add({
      'medicine': selectedMedicine,
      'date': notificationDate,
    });

    NotificationHelper.scheduleNotification(
      notificationDate.hashCode,
      'Medicine Reminder',
      'Time to take $selectedMedicine',
      notificationDate,
    );

    Navigator.of(context).pop();
  }

  Widget floatingActionButton() {
    return Align(
      alignment: Alignment(0.95, 0.95),
      child: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: HexColor("ED6184"),
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      height: 400,
                      width: 320,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Add Medicine",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          medicineDropdown(),
                          const SizedBox(
                            height: 10,
                          ),
                          frequencyDropdown(), 
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: TextField(
                                      style: const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        hintText: 'Select Date',
                                        hintStyle: TextStyle(color: Colors.white60),
                                      ),
                                      controller: TextEditingController(
                                        text: "${selectedDate.toLocal()}".split(' ')[0],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedDate = picked;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final TimeOfDay? picked = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        selectedTime = picked;
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: TextField(
                                      style: const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        hintText: 'Select Time',
                                        hintStyle: TextStyle(color: Colors.white60),
                                      ),
                                      controller: TextEditingController(
                                        text: selectedTime.format(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final TimeOfDay? picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedTime = picked;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 320,
                            child: Material(
                              color: Colors.transparent,
                              child: ElevatedButton(
                                onPressed: addMedicine, 
                                child: const Text("Add Medicine"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget todoList() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, height * 0.38, 10, 10),
      width: width,
      height: height * 0.60,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('medicines')
            .where('date', isGreaterThanOrEqualTo: DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day))
            .where('date', isLessThanOrEqualTo: DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, 23, 59, 59))
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final medicines = snapshot.data!.docs;
          return ListView.builder(
            itemCount: medicines.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              final medicine = medicines[index]['medicine'];
              final time = TimeOfDay.fromDateTime((medicines[index]['date'] as Timestamp).toDate()).format(context);
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) async {
                  await FirebaseFirestore.instance.collection('medicines').doc(medicines[index].id).delete();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$medicine alarm dismissed"),
                  ));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width: width - 20,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white12,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '$medicine at $time',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red, 
                        ),
                        onPressed: () async {
                          await FirebaseFirestore.instance.collection('medicines').doc(medicines[index].id).delete();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$medicine alarm dismissed"),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor("95bf5"),
      body: SafeArea(
        child: Stack(
          children: [
            topView(),
            todoList(),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton(),
    );
  }
}
