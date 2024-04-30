import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sat_portal/controllers/auth_controller.dart';
import 'package:sat_portal/sharedpreference_helper.dart';

class Enroll extends StatefulWidget {
  @override
  _EnrollState createState() => _EnrollState();
}

class _EnrollState extends State<Enroll> with SingleTickerProviderStateMixin {
    final AdminAuthController admnc = Get.put(AdminAuthController());

  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _spocIdController = TextEditingController();
  final _boardController = TextEditingController();
  final _schoolNameController = TextEditingController();
  final _schoolcityController = TextEditingController();
  final _schoolStateController = TextEditingController();
  final _schoolPinController = TextEditingController();
  final _schoolIDController = TextEditingController();

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _emailController.dispose();
    _spocIdController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        image: DecorationImage(
            image: AssetImage("assets/bg_image_enroll.jpg"),
            fit: BoxFit.cover),
      ),
      padding: EdgeInsets.fromLTRB(screenWidth * 0.2, screenHeight * 0.05,
          screenWidth * 0.2, screenHeight * 0.05),
      child: Column(
        children: [
          Expanded(
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(25)),
                        color: Colors.grey[300],
                      ), // TabBar background color
                      child: IgnorePointer(
                        ignoring: true,
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: false,
                          indicator: BoxDecoration(
                            color: const Color.fromARGB(255, 163, 125, 230),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor:
                              Color.fromARGB(255, 105, 101, 101),
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: -17),
                          tabs: [
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.looks_one_rounded,
                                    color: Color.fromARGB(255, 105, 101, 101)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "School Information",
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.looks_two_rounded,
                                    color: Color.fromARGB(255, 105, 101, 101)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Your Profile",
                                ),
                              ],
                            )),
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.looks_3_rounded,
                                    color: Color.fromARGB(255, 105, 101, 101)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Preview",
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // Your Profile Tab View
                          Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Form(
                                key: _formKey,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Step 1",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[500]),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "School Information",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color.fromARGB(
                                                195, 42, 4, 107)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Enter school registration information properly",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 126, 107, 177)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          width: screenWidth * 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: _buildRowWithTextField(
                                                          label: "School Name",
                                                          controller:
                                                          _schoolNameController,
                                                              
                                                          keyboardType:
                                                              TextInputType
                                                                  .text)),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label: "Board",
                                                        controller:
                                                           _boardController,
                                                        keyboardType:
                                                            TextInputType.text),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: _buildRowWithTextField(
                                                          label: "School City",
                                                          controller:
                                                              _schoolcityController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress)),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label:
                                                            "School State",
                                                        controller:
                                                            _schoolStateController,
                                                        keyboardType:
                                                            TextInputType
                                                                .name),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: _buildRowWithTextField(
                                                          label:
                                                              "School PinCode",
                                                          controller:
                                                              _schoolPinController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .streetAddress)),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child:
                                                        _buildRowWithTextField(
                                                      label: "School ID",
                                                      controller:
                                                          _schoolIDController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              )),
                          // School Information Tab View
                          Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Form(
                                key: _formKey,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Step 2",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[500]),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Spoc Profile",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Color.fromARGB(
                                                195, 42, 4, 107)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Please enter information about Spoc",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 126, 107, 177)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          width: screenWidth * 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label: "First Name",
                                                        controller:
                                                            _firstnameController,
                                                        keyboardType:
                                                            TextInputType.text),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label: "Last Name",
                                                        controller:
                                                            _lastNameController,
                                                        keyboardType:
                                                            TextInputType.text),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label: "Email",
                                                        controller:
                                                            _emailController,
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label: "Phone Number",
                                                        controller:
                                                            _phoneNumberController,
                                                        keyboardType:
                                                            TextInputType
                                                                .number),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label: "Password",
                                                        controller:
                                                            _passwordController,
                                                        obscureText: true),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                    child: _buildRowWithTextField(
                                                        label: "Spoc ID",
                                                        controller:
                                                            _spocIdController,
                                                        keyboardType:
                                                            TextInputType
                                                                .number),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              )),
                          // Additional User Tab View
                          SingleChildScrollView(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  'Additional User Content',
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(right: screenWidth * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    if (_tabController.index < 3) {
                      _tabController.animateTo(_tabController.index - 1);
                    }
                  },
                  label: Text(
                    "Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async{
                    SharedPreferencesHelper.setSchoolId(SchoolId: _schoolIDController.text.toString());
                    SharedPreferencesHelper.setSchoolName(schoolName: _schoolNameController.text.toString());
                    SharedPreferencesHelper.setschoolCity(schoolCity: _schoolcityController.text.toString());
                    SharedPreferencesHelper.setschoolState(schoolState: _schoolStateController.text.toString());
                    SharedPreferencesHelper.setschoolPin(schoolPin: _schoolPinController.text.toString());
                    SharedPreferencesHelper.setspocName(spocName: _firstnameController.text+_lastNameController.toString());
                    SharedPreferencesHelper.setspocId(spocId: _spocIdController.text.toString());
                    SharedPreferencesHelper.setspocPassword(spocPassword: _passwordController.text.toString());
                    SharedPreferencesHelper.setspocContact(spocContact: _phoneNumberController.text.toString());
                    SharedPreferencesHelper.setspocmail(spocmail: _emailController.text.toString());

                    await admnc.registerUser(
                      SharedPreferencesHelper.getSchoolId(),
                       SharedPreferencesHelper.getschoolName(), 
                       SharedPreferencesHelper.getschoolCity(),
                       SharedPreferencesHelper.getschoolState(), 
                       SharedPreferencesHelper.getschoolPin(),
                        SharedPreferencesHelper.getspocName(), 
                        SharedPreferencesHelper.getspocId(), 
                        SharedPreferencesHelper.getspocPassword(),
                        SharedPreferencesHelper.getspocContact(), 
                        SharedPreferencesHelper.getspocmail());
                    // Check if any field is empty
                    if (
                        // Add checks for other text fields here
                        _formKey.currentState!.validate()) {
                      // Form is valid and not empty, move to the next tab
                      if (_tabController.index < 2) {
                        _tabController.animateTo(_tabController.index + 1);
                      }
                    } else {
                      // Form is empty or not valid, display error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill all fields correctly.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent[400]),
                  child: Row(
                    children: [
                      Text(
                        "Next Step",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowWithTextField(
      {required String label,
      TextInputType? keyboardType,
      bool obscureText = false,
      TextEditingController? controller}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[600]),
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your $label ",
                ),
                keyboardType: keyboardType,
                obscureText: obscureText,
                inputFormatters: keyboardType == TextInputType.number
                    ? [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                            label == "Phone Number" ||
                                    label == "School Phone Number"
                                ? 10
                                : 6), // Set limit based on label
                      ]
                    : null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your $label";
                  }
                  // Check if the input is empty or doesn't meet the digit requirement
                  if (label == "Phone Number" ||
                      label == "School Phone Number") {
                    if (value.length != 10 || int.tryParse(value) == null) {
                      return "Please enter a valid $label"; // Error message for invalid phone number
                    }
                  } else if (label == "Pincode" && value.length != 6) {
                    return "Please enter a valid $label"; // Error message for invalid pincode
                  }
                  return null; // Return null if the input is valid
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
