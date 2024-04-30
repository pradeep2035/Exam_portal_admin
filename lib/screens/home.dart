import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sat_portal/sharedpreference_helper.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  // final String adminName;
  // final String adminiD;
  // final String adminContact;
   const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  DateTime today = DateTime.now();
  List<String> todos = ["Task 1", "Task 2", "Task 3"];
  List<bool?> todoCompleted = [false, false, false];
  bool isAddingTask = false;
  
  TextEditingController taskController = TextEditingController();
 

  //final mydata = Mydata();


  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _toggleAddingTask() {
    setState(() {
      isAddingTask = !isAddingTask;
    });
  }

  


 

  void _addTask() {
    setState(() {
      todos.add(taskController.text);
      todoCompleted.add(false);
      taskController.clear();
      isAddingTask = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          top: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: screenHeight * 0.07,
                                width: screenWidth * 0.17,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade100,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.wifi_tethering_rounded,color: Colors.deepPurple,),
                                      Text(
                                        "Welcome, ${SharedPreferencesHelper.getadminName()}",
                                        style: GoogleFonts.workSans(
                                            fontSize: 18,
                                            color:
                                                Colors.deepPurple.shade400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.deepPurple,
                              size: 28,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: screenHeight * 0.50,
                            width: screenWidth * 0.25,
                            child: TableCalendar(
                              locale: "en_US",
                              rowHeight: 43,
                              headerStyle: HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                  titleTextStyle: GoogleFonts.workSans(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                              availableGestures: AvailableGestures.all,
                              selectedDayPredicate: (day) =>
                                  isSameDay(day, today),
                              focusedDay: today,
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 10, 16),
                              onDaySelected: _onDaySelected,
                            ),
                          ),
                          SizedBox(width: 50,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Notification bell",
                                    style: GoogleFonts.workSans(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.14,
                                  ),
                                  Text(
                                    "view all",
                                    style: GoogleFonts.workSans(
                                        fontSize: 15,
                                        color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: screenHeight*0.2,
                                width: screenWidth*0.33,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.deepPurple.shade300,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.shade100,
                                      blurRadius: 5.0,
                                      spreadRadius: 4.0,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0,left: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey.shade100.withOpacity(0.3)
                                        ),
                                        child: Icon(
                                          Icons.notifications_none_rounded,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        "Have a good day",
                                        style: GoogleFonts.workSans(
                                            color: Colors.white, fontSize: 17),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: screenHeight * 0.40,
                                width: screenWidth * 0.33,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.purple.shade50,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple.shade100,
                                      blurRadius: 5.0,
                                      spreadRadius: 4.0,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 0.8,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "To-Do List",
                                          style: GoogleFonts.workSans(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: _toggleAddingTask,
                                            icon: Icon(
                                              isAddingTask
                                                  ? Icons.remove
                                                  : Icons.add,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                    Divider(color: Colors.grey, thickness: 1),
                                    SizedBox(height: 10),
                                    isAddingTask
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller: taskController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Enter task',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: _addTask,
                                                icon: Icon(Icons.check),
                                                color: Colors.grey,
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: todos.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: Checkbox(
                                              value: todoCompleted[index],
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  todoCompleted[index] =
                                                      value;
                                                });
                                              },
                                            ),
                                            title: Text(
                                              todos[index],
                                              style: GoogleFonts.workSans(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Divider(
                      //   color: Colors.grey.shade300,
                      //   indent: 20,
                      //   endIndent: 20,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 10,),
                      //   child: Align(
                      //     alignment: Alignment.bottomLeft,
                      //     child: SizedBox(
                      //       height: screenHeight * 0.05,
                      //       width: screenWidth * 0.2,
                      //       child: TextField(
                      //         controller: searchController,
                      //         onChanged: (value) {
                      //         filterSearchResults(value);
                      //          },
                      //         decoration: InputDecoration(
                      //           contentPadding:
                      //               EdgeInsets.symmetric(vertical: 10),
                      //           filled: true,
                      //           fillColor: Colors.grey[100],
                      //           hintText: 'Search school name or ID',
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10.0),
                      //             borderSide: BorderSide(
                      //                 color: Colors.deepPurple, width: 2.5),
                      //           ),
                      //           enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10.0),
                      //             borderSide: BorderSide(
                      //                 color: Colors.grey, width: 1.0),
                      //           ),
                      //           border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10.0),
                      //           ),
                      //           prefixIcon: Icon(Icons.search),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                        
                      
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

