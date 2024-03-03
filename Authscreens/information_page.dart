import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_flow/Mainscreens/home_screen.dart';
import 'package:health_flow/Authscreens/auth.dart';


void main() {
  runApp(const MaterialApp(
    home: InformationPage(),
  ));
}

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  String _genderController = 'Female';
  bool _isMaleSelected = false;

  int _heightController = 0;
  int _weightController = 0;
  String _ageController = "4/12/2023";
  DateTime _selectedDate = DateTime.now();

  final AuthService _authService = AuthService();

  final heightItems = List.generate(201, (index) => index);
  final weightItems = List.generate(201, (index) => index);
  bool isItemsFilled = false;
  int index = 0;
  
  final _heightScrollController = FixedExtentScrollController(initialItem:20 );
  // bu şekilde initialize değeri veriliyor
  @override
  void initState() {
    super.initState();

    // Tek bir init fonksiyonu içinde her iki listeyi de doldur
    if (!isItemsFilled) {
      isItemsFilled = true;
    }

    _heightController= heightItems[index];
    _weightController = weightItems[index];
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text(''),
          content: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Choose Your Gender',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff898989),
                  ),
                ),
                const SizedBox(height: 150),
                SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMaleSelected = true;
                        _genderController = 'Male';
                        print(_genderController);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: !_isMaleSelected
                              ? Colors.white
                              : const Color(0xffcecece),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: const Color(0xff3164d2))),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Male',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Image.asset(
                              'assets/images/man.jpg',
                              width: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMaleSelected = false;
                      _genderController = 'Female';
                      print(_genderController);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: !_isMaleSelected
                            ? const Color(0xffcecece)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2, color: const Color(0xff3164d2))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Female',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Image.asset(
                            'assets/images/woman.jpg',
                            width: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text(''),
          content: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Choose Your Height',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff898989),
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 350,
                  child: CupertinoPicker(
                    itemExtent: 50,
                    scrollController: _heightScrollController,
                    onSelectedItemChanged: (index) {
                        this.index = index;
                        _heightController = heightItems[index];
                        print('height${_heightController}');
                    },
                    children: heightItems
                        .map((item) => Center(
                              child: Text(
                                item.toString(),
                                style: const TextStyle(fontSize: 32),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text(''),
          content: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Choose Your Weight',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff898989),
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 350,
                  child: CupertinoPicker(
                    itemExtent: 50,
                    onSelectedItemChanged: (index) {
                        this.index = index;
                        _weightController = weightItems[index];
                        print('weight${_weightController}');
                    },
                    children: weightItems
                        .map((item) => Center(
                          child: Text(
                          item.toString(),
                          style: const TextStyle(fontSize: 32),
                          ),
                        ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text(''),
          content: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Select Your Birthdate',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff898989),
                  ),
                ),
                const SizedBox(height: 100),
                SizedBox(
                  height: 300,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _selectedDate,
                    onDateTimeChanged: (DateTime newDate) {
                        _selectedDate = newDate;
                        _ageController = "${newDate.day}/${newDate.month}/${newDate.year}";
                        print(_ageController);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

      ];

  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xff3164d2)),
          ),
          child: Stack(
            children: [
              Stepper(
                type: StepperType.horizontal,
                currentStep: _activeStepIndex,
                steps: stepList(),
                onStepContinue: () {
                  if (_activeStepIndex < stepList().length - 1) {
                    _activeStepIndex += 1;
                  }
                  setState(() {});
                },
                onStepCancel: () {
                  if (_activeStepIndex > 0) {
                    _activeStepIndex -= 1;
                  }
                  setState(() {});
                },
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return const SizedBox.shrink();
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_activeStepIndex > 0) {
                              _activeStepIndex -= 1;
                              setState(() {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffa9a9a9),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25)),
                          child: const Text('Back'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async{
                            if (_activeStepIndex < stepList().length) {
                              if (_activeStepIndex == 3){
                                Map <String,dynamic> userData = {
                                  'gender' : _genderController,
                                  'height' : _heightController,
                                  'weight' : _weightController,
                                  'age' : _ageController
                                };

                                String? uid = FirebaseAuth.instance.currentUser?.uid;

                                if(uid != null) {
                                  await _authService.addUserInfo(uid,userData);
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePageScreen()));
                                }else{
                                _activeStepIndex += 1;
                                }
                              setState(() {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 25)),
                          child: Text(_activeStepIndex == 3 ? 'Done' : 'Next'),                        
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}