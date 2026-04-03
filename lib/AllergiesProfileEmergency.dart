// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataRepository {
  static String name = '';
  static String age = '';
  static String gender = '';
  static String bloodType = '';
  static String birthDate = '';
  static List<String> allergiesList = [];
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  void _pickBirthDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        DataRepository.birthDate = pickedDate.toIso8601String().split('T')[0];
        _birthDateController.text = DataRepository.birthDate;
      });
    }
  }

  Future<void> _saveData() async {
    String name = _nameController.text;
    String age = _ageController.text;
    String gender = _genderController.text;
    String bloodType = _bloodTypeController.text;

    DataRepository.name = name;
    DataRepository.age = age;
    DataRepository.gender = gender;
    DataRepository.bloodType = bloodType;

    try {
      await FirebaseFirestore.instance.collection('users').doc('profile').set({
        'name': name,
        'age': age,
        'gender': gender,
        'bloodType': bloodType,
        'birthDate': DataRepository.birthDate,
        'allergies': DataRepository.allergiesList,
      });
      // ignore: avoid_print
      print('Data saved successfully');
    } catch (e) {
      // ignore: avoid_print
      print('Failed to save data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: const Color.fromARGB(255, 67, 74, 109),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _genderController,
                decoration: const InputDecoration(
                  hintText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _bloodTypeController,
                decoration: const InputDecoration(
                  hintText: 'Blood Type',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _birthDateController,
                onTap: _pickBirthDate,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: 'Birth Date',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveData,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _bloodTypeController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }
}

class SecondButtonPage extends StatefulWidget {
  const SecondButtonPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondButtonPageState createState() => _SecondButtonPageState();
}

class _SecondButtonPageState extends State<SecondButtonPage> {
  final TextEditingController _allergiesController = TextEditingController();

  Future<void> _saveAllergy() async {
    String allergies = _allergiesController.text;
    if (allergies.isNotEmpty) {
      setState(() {
        DataRepository.allergiesList.add(allergies);
        // ignore: avoid_print
        print('Added allergy: $allergies');
      });

      try {
        await FirebaseFirestore.instance.collection('users').doc('profile').update({
          'allergies': DataRepository.allergiesList,
        });
        // ignore: avoid_print
        print('Allergy data saved successfully');
      } catch (e) {
        // ignore: avoid_print
        print('Failed to save allergy data: $e');
      }

      _allergiesController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allergies'),
        backgroundColor: const Color.fromARGB(255, 67, 74, 109),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _allergiesController,
                decoration: const InputDecoration(
                  hintText: 'Enter your allergies',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveAllergy,
                child: const Text('Save'),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: DataRepository.allergiesList
                    .map(
                      (allergy) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(allergy),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              setState(() {
                                DataRepository.allergiesList.remove(allergy);
                                // ignore: avoid_print
                                print('Removed allergy: $allergy');
                              });

                              try {
                                await FirebaseFirestore.instance.collection('users').doc('profile').update({
                                  'allergies': DataRepository.allergiesList,
                                });
                                // ignore: avoid_print
                                print('Allergy data removed successfully');
                              } catch (e) {
                                // ignore: avoid_print
                                print('Failed to remove allergy data: $e');
                              }
                            },
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _allergiesController.dispose();
    super.dispose();
  }
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Data'),
        backgroundColor: const Color.fromARGB(255, 67, 74, 109),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${DataRepository.name}'),
                        Text('Age: ${DataRepository.age}'),
                        Text('Gender: ${DataRepository.gender}'),
                        Text('Blood Type: ${DataRepository.bloodType}'),
                        Text('Birth Date: ${DataRepository.birthDate}'),
                        const Text('Allergies:'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: DataRepository.allergiesList
                              .map((allergy) => Text(allergy))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
