import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sat_portal/screens/enroll.dart';
import 'package:sat_portal/screens/home.dart';
import 'package:sat_portal/screens/question_bank/question_bank.dart';
import 'package:sat_portal/screens/user.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String currentMenuItem = 'Home'; // Default menu item

  void _selectMenuItem(String menuItem) {
    setState(() {
      currentMenuItem = menuItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Widget _buildContent() {
      switch (currentMenuItem) {
        case 'Home':
          return Home(); // Define your home details widget
        case 'Enroll':
          return Enroll(); // Define your enroll details widget
        case 'User':
          return User(); // Define your user details widget
        case 'Question Bank':
          return QuestionBank(); // Define your question bank details widget
        default:
          return Container(); // Default case
      }
    }

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.grey.shade100,
        child: Row(
          children: [
            Container(
              width: 200, // Adjust the width of the side menu
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/main_logo.png",
                            height: screenHeight * 0.08,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Upstair",
                            style: GoogleFonts.ubuntu(
                                fontSize: 27,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                      ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      // Handle Home onTap
                      _selectMenuItem('Home');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle Enroll onTap
                      _selectMenuItem('Enroll');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        'Enroll',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle User onTap
                      _selectMenuItem('User');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        'User',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle Question Bank onTap
                      _selectMenuItem('Question Bank');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        'Question Bank',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 5, bottom: 10),
                child: Container(
                  height: screenHeight,
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16)),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 0.8,
                      )),
                  child: Column(
                    children: [
                      Expanded(child: _buildContent()),
                    ],
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
