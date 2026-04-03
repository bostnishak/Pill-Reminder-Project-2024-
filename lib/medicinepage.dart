// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Medicine {
  final String name;
  final String imageUrl;
  final String description;

  Medicine({
    required this.name,
    required this.imageUrl,
    required this.description,
  });
}

class Medicine1 extends Medicine {
  Medicine1()
      : super(
          name: 'FUCIDIN',
          imageUrl:
              'https://www.pharmacyonline.co.uk/uploads/images/products/large/pharmacy-online-fucidin-fucidin-1592409278fucidin-cream.jpg',
          description:
 'SUBSTANCE: 1 g of cream contains 20 mg fusidic acid and 10 mg hydrocortisone acetate.Butyl hydroxyanisole (E320), cetyl alcohol, glycerol 85%, liquid paraffin,polysorbate 60.'
 'POSSİBLE SİDE EFFECTS: welling of the hands, feet, ankles, face, lips, or especially the mouth or throat swelling that makes it difficult to swallow or breathe,Skin redness, itching, appearance of rashes, allergy-related skin inflammation,skin discoloration'
 'APPLICATION ROUTE AND METHOD: It is applied by rubbing on the skin.The use of FUCIDIN H on the face and hands, in areas such as the groin and armpits is also cosmetic is compatible in this respect.'
        );
}
class Medicine2 extends Medicine {
  Medicine2() : super(
    name: 'CALPOL',
    imageUrl: 'https://ilacfiyati.com/dosyalar/2019/05/CALPOL-120-MG-150-ML-SUSPANSIYON.png',
    description: 
    'SUBSTANCE: One scoop (5 ml) contains 120 mg paracetamol. Sorbitol solution, strawberry flavor, sucrose, Nipagin M (methylhydroxybenzoate), glycerol, Avicel rc 591, Carmoisin E 122, xanthan gum, purified water'
    'POSSİBLE SİDE EFFECTS: Infection (microbial disease that causes inflammation),Headache, Sleepiness, Numbness (Paresthesia), upper respiratory tract infection, Nausea'
    'APPLICATION ROUTE AND METHOD: It is taken orally. Shake the bottle vigorously before each use.'
  );
}

class Medicine3 extends Medicine {
  Medicine3()
      : super(
          name: 'ADVANTAN',
          imageUrl:
              'https://cdn.hekimce.com/uploads/2022/basliksiz-1-1671763665.jpg',
          description:
    'SUBSTANCE: 1 g ADVANTAN contains 1 mg methylprednisolone aceponate, Excipients: White soft paraffin, liquid paraffin, microcrystalline wax,hydrogenated castor oil.'
    'POSSİBLE SİDE EFFECTS: Purulent skin blisters (pustules), watery sacs (vesicles), itching, pain, redness and skinbumps (papules), rash, cracks in the skin (fissures), dilation of capillaries'
    'APPLICATION ROUTE AND METHOD: ADVANTAN is applied topically (superficially) to the diseased skin in a thin layer once a day.It is applied lightly.'
        );

}

class Medicine4 extends Medicine {
  Medicine4()
      : super(
          name: 'OTRIVINE',
          imageUrl:
              'https://i-cf65.ch-static.com/content/dam/cf-consumer-healthcare/health-professionals/tr_TR/respiratory-health/packshots/OTRIVINE-Doz_Ayarli.jpg?auto=format',
          description:
     'SUBSTANCE: Each 1 ml contains 1 mg xylometazoline hydrochloride.Benzalkonium chloride, disodium edetate, sodium dihydrogen phosphate,disodium phosphate, sodium chloride, sorbitol (E420), methylhydroxy propyl cellulose pure water.'
     'POSSİBLE SİDE EFFECTS: Hypersensitivity (allergic) reactions (swelling of the face and throat (angioedema), skin such as rash, itching).'
     'APPLICATION ROUTE AND METHOD: Spray once into each nostril, 2-3 times a day as needed.'
        );
}

class Medicine5 extends Medicine {
  Medicine5()
      : super(
          name: 'IBUCOLD C',
          imageUrl:
              'https://cdn.yeniakit.com.tr/images/news/625/hem-grip-ilaci-hem-c-vitamini-ibucold-c-nedir-ne-ise-yarar-h1697722765-d96817.jpg',
          description:
      'SUBSTANCE: calcium hydrogen phosphate anhydrous,croscarmellose sodium,Microcrystalline cellulose ph 101,Colloidal silicon dioxide,Povidone K30,Talc,'
      'POSSİBLE SİDE EFFECTS: Severe headache, neck stiffness, nausea, vomiting and confusion (aseptic meningitis).'    
      'APPLICATION ROUTE AND METHOD: For oral use only.Tablets should be taken as a whole, without breaking or chewing, with a glass of water.'
        );
}

class Medicine6 extends Medicine {
  Medicine6()
      : super(
          name: 'CROXILEX',
          imageUrl:
              'https://cdn.hekimce.com/uploads/2022/basliksiz-1-1671573674.jpg',
          description:
        'SUBSTANCE: Sodium starch glycolate, colloidal silicon dioxide,microcrystalline cellulose, magnesium stearate, hypromellose,titanium dioxide, polyethylene glycol'
       ' POSSİBLE SİDE EFFECTS: Swelling of the face, lips, mouth, tongue or throat, causing difficulty in swallowing or breathing, Rash, itching or hives on the skin of the face, lips, tongue or body swelling of other parts'   
        'APPLICATION ROUTE AND METHOD: Tablets should be swallowed whole without chewing.'
        );
}

class Medicine7 extends Medicine {
  Medicine7()
      : super(
          name: 'EUTHYROX',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKd8XGWYFAogCoWEGHQmHVd1LGdT8a_UqRrS73gfX0ug&s',
          description:
      'SUBSTANCE: 175 mcg levothyroxine sodium for each tablet contains  Mannitol, Corn starch, Croscarmellose sodium, Gelatin (fish gelatin), Anhydrous citric acid'
      'POSSİBLE SİDE EFFECTS:  Headache, Increased intracranial pressure (pseudotumor cerebri), Tremors, Restlessness, Sleep disorder, Heart rhythm disorders'   
      'APPLICATION ROUTE AND METHOD:EUTHYROX is a medicine used orally. In the morning (at least half an hour before breakfast)It is taken on an empty stomach'
        );
}

class Medicine8 extends Medicine {
  Medicine8()
      : super(
          name: 'PAROL',
          imageUrl:
              'https://cdn.hekimce.com/uploads/2022/basliksiz-1-1668369873.jpg',
          description:
       'SUBSTANCE: 500 mg paracetamol, Microcrystalline cellulose, povidone K-30, corn starch, stearic acid.'
       'POSSİBLE SİDE EFFECTS: Swelling of the hands, feet, face and lips or especially in the throat that may cause shortness of breath swelling  '
       'APPLICATION ROUTE AND METHOD: It is taken orally. Swallow with a glass of water.'
        );
}

class Medicine9 extends Medicine {
  Medicine9()
      : super(
          name: 'NEXIUM',
          imageUrl:
              'https://cdn.hekimce.com/uploads/2023/basliksiz-1-1673446893.jpg',
          description:
      'SUBSTANCE: Contains esomeprazole 40 mg (as sodium salt)'
      'POSSİBLE SİDE EFFECTS:  Contains esomeprazole 40 mg (as sodium salt)Sudden wheezing, swelling of the lips, tongue and throat or body, skin rash, fainting or difficulty swallowing (severe allergic reaction).'    
      'APPLICATION ROUTE AND METHOD: Tablets should not be chewed or crushed. You can take your tablets with food or on an empty stomach. It should be swallowed whole with half a glass of liquid.'
        );
}

class Medicine10 extends Medicine {
  Medicine10()
      : super(
          name: 'SYNJARDY',
          imageUrl:
              'https://ilacfiyati.com/dosyalar/2020/10/SYNJARDY-5MG-1000-MG-FILM-KAPLI-TABLET-60-ADET.png',
          description:
      'SUBSTANCE: Each SYNJARDY 5 mg/1000 mg film-coated tablet contains 5 mg empagliflozin and 1000 mg'
      'POSSİBLE SİDE EFFECTS: Increased levels of ketone bodies in your urine or bloodRapid,weight loss,Nausea or vomitingStomache,chxcessive thirst,apid and deep breathing '     
      'APPLICATION ROUTE AND METHOD: Swallow your tablet whole with water'
        );
}

class Medicine11 extends Medicine {
  Medicine11()
      : super(
          name: 'GLIFOR',
          imageUrl:
              'https://finestgears.to/wp-content/uploads/2022/04/glifor-1000mg.jpg',
          description:
      'SUBSTANCE: Each film-coated tablet contains 1000 mg of metformin hydrochloride, equivalent to 780 mg of metformin base.'
      'POSSİBLE SİDE EFFECTS: Nausea, Vomiting, Diarrhea, Abdominal pain,Loss of appetite.'     
      'APPLICATION ROUTE AND METHOD: If you are taking one dose of GLIFOR a day, take it in the morning (at breakfast). If you are taking GLIFOR in two divided doses per day, take it in the morning (at breakfast) and in the evening (at dinner).'
        );
}

class Medicine12 extends Medicine {
  Medicine12()
      : super(
          name: 'CREBROS',
          imageUrl:
              'https://ilacfiyati.com/dosyalar/2019/05/CREBROS-5-MG-40-FILM-KAPLI-TABLET.png',
          description:
      'SUBSTANCE: Bovine lactose monohydrate, microcrystalline cellulose,polyvinylpyrrolidone, colloidal anhydrous silica, croscarmellose sodium, magnesium stearate,hypromellose, titanium dioxide, talc and polyethyleneglycol'
      'POSSİBLE SİDE EFFECTS: swelling of the mouth, tongue, face and/or throat, breathing or swallowing difficulties (chest tightness)or wheezing), hives, sudden drop in blood pressure that can be fatalallergic reaction including fainting or shock (hypersensitivity reaction)'     
      'APPLICATION ROUTE AND METHOD: For oral use only'
        );
}

class Medicine13 extends Medicine {
  Medicine13()
      : super(
          name: 'BENEXOL',
          imageUrl:
              'https://aydinpostcom.teimg.com/aydinpost-com/images/haberler/2020/02/benexol-b12-faydalari-neler-yan-etkisi-var-mi-kilo-aldirir-mi_u0aaMWoUG0.jpg',
          description:
      'SUBSTANCE: Each tablet contains 250 mg vitamin B, 250 mg vitamin B6 and 1 mg vitamin B12.'
      'POSSİBLE SİDE EFFECTS: Diarrhea, Indigestion, Nausea, vomiting, Stomach and abdominal pain, Abnormal urine odor. High doses may cause acne. '     
      'APPLICATION ROUTE AND METHOD: It can be better absorbed by the stomach when taken on an empty stomach with a glass of water.'
        );
}

class Medicine14 extends Medicine {
  Medicine14()
      : super(
          name: 'CORASPRIN',
          imageUrl:
              'https://cdn.hekimce.com/uploads/2022/basliksiz-1-1671575741.jpg',
          description:
      'SUBSTANCE:100 mg acetylsalicylic acid Excipients: Cellulose, corn starch, eudragit L30D, talc, triethylcitrate. '
      'POSSİBLE SİDE EFFECTS: Headache, Dizziness, Hearing impairment, Tinnitus or confusion '     
      'APPLICATION ROUTE AND METHOD: Take the tablets orally with some water, preferably before meals.'
        );
}

class Medicine15 extends Medicine {
  Medicine15()
      : super(
          name: 'ERITREIN',
          imageUrl:
              'https://ilacfiyati.com/dosyalar/2019/05/ERITRETIN-30-GR-JEL.png',
          description:
      'SUBSTANCE: 1 g gel contains 40 mg erythromycin 4%  and 250 mcg tretinoin 0.025% '
      'POSSİBLE SİDE EFFECTS: Erythema at the application site, peeling, skin irritation, burning sensation on the skin, stinging sensation at the application site'     
      'APPLICATION ROUTE AND METHOD: After cleansing and drying your skin, apply a thin layer to the problem area.'
        );
}

class FirstButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicines'),
        backgroundColor: const Color.fromARGB(255, 67, 74, 109),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine1(),
                      ),
                    ),
                  );
                },
                child: const Text('FUCIDIN'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine2(),
                      ),
                    ),
                  );
                },
                child: const Text('CALPOL'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine3(),
                      ),
                    ),
                  );
                },
                child: const Text('ADVANTAN'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine4(),
                      ),
                    ),
                  );
                },
                child: const Text('OTRIVINE'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine5(),
                      ),
                    ),
                  );
                },
                child: const Text('IBUCOLD C'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine6(),
                      ),
                    ),
                  );
                },
                child: const Text('CROXILEX '),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine7(),
                      ),
                    ),
                  );
                },
                child: const Text('EUTHYROX'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine8(),
                      ),
                    ),
                  );
                },
                child: const Text('PAROL'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine9(),
                      ),
                    ),
                  );
                },
                child: const Text('NEXIUM'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine10(),
                      ),
                    ),
                  );
                },
                child: const Text('SYNJARDY'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine11(),
                      ),
                    ),
                  );
                },
                child: const Text('GLIFOR'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine12(),
                      ),
                    ),
                  );
                },
                child: const Text('CREBROS'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine13(),
                      ),
                    ),
                  );
                },
                child: const Text('BENEXOL'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine14(),
                      ),
                    ),
                  );
                },
                child: const Text('CORASPRIN'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineDetailPage(
                        medicine: Medicine15(),
                      ),
                    ),
                  );
                },
                child: const Text('ERITREIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicineDetailPage extends StatelessWidget {
  final Medicine medicine;

  const MedicineDetailPage({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Detail'),
        backgroundColor: const Color.fromARGB(255, 67, 74, 109),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                medicine.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    medicine.description,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FirstButtonPage(),
));
}