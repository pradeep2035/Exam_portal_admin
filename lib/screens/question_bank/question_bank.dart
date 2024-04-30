import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sat_portal/components/question_detail_dailog.dart';
import 'package:sat_portal/controllers/question_controller.dart';

class QuestionBank extends StatefulWidget {
  const QuestionBank({super.key});

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   fetchQuestionBank();
  }


  final QuestionBankController qc = Get.put(QuestionBankController());
  List<Map<String, dynamic>> questionBank = [];
    List<Map<String, dynamic>> filteredQuestionBank = [];
  final TextEditingController searchController = TextEditingController();
  bool isEasyLevelSelected = false;
  bool isMediumLevelSelected = false;
  bool isHardLevelSelected = false;
    String level='';
  List<String> selectedQuestionIds = [];


  fetchQuestionBank()async{
    try {
      List<Map<String, dynamic>> data = await qc.fetchData();
      setState(() {
        questionBank = data;
      });
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }
  void filterSearchResults(String query) async {
  if (query.isNotEmpty) {
    try {
      List<Map<String, dynamic>> searchResults = await qc.searchQuestion(query);
      setState(() {
        filteredQuestionBank = searchResults;
      });
    } catch (e) {
      print('Error searching: $e');
      setState(() {
        filteredQuestionBank = [];
      });
    }
  } else {
    setState(() {
      filteredQuestionBank = List.from(questionBank);
    });
  }
}

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        TextEditingController subjectCntrl = TextEditingController();
        TextEditingController topicCntrl = TextEditingController();
        TextEditingController questionCntrl = TextEditingController();
        TextEditingController answerCntrl = TextEditingController();
        //TextEditingController optionCntrl= TextEditingController();
        int optionCount = 2;
        String level = " ";
        List<TextEditingController> optionsCntrl = List.generate(
          optionCount,
          (index) => TextEditingController(),
        );

        return StatefulBuilder(
          builder: (context, setState) {
            void _incrementOptionCount() {
              if (optionCount < 4)
                setState(() {
                  optionCount++;
                  optionsCntrl.add(TextEditingController());
                });
            }

            void _decrementOptionCount() {
              if (optionCount > 2) {
                setState(() {
                  optionCount--;
                  optionsCntrl.removeLast();
                });
              }
            }

            return AlertDialog(
              title: Text(
                'Upload Questions',
                style: GoogleFonts.lato(
                    fontSize: 24,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600),
              ),
              content: Container(
                height: screenHeight * 0.8,
                width: screenWidth * 0.6,
                //color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.2,
                          child: TextField(
                            controller: subjectCntrl,
                            cursorColor: Colors.deepPurple,
                            decoration: InputDecoration(
                              focusColor: Colors.deepPurple,
                              hoverColor: Colors.deepPurple,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: "Subject*",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.2,
                          child: TextField(
                            controller: topicCntrl,
                            cursorColor: Colors.deepPurple,
                            decoration: InputDecoration(
                              focusColor: Colors.deepPurple,
                              hoverColor: Colors.deepPurple,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: "Topic*",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: questionCntrl,
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        focusColor: Colors.deepPurple,
                        hoverColor: Colors.deepPurple,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.deepPurple, width: 2.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: "Question",
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.2,
                          child: TextField(
                            controller: answerCntrl,
                            cursorColor: Colors.deepPurple,
                            decoration: InputDecoration(
                              focusColor: Colors.deepPurple,
                              hoverColor: Colors.deepPurple,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: "Answer",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.28,
                          //color: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isEasyLevelSelected = true;
                                    isMediumLevelSelected = false;
                                    isHardLevelSelected = false;
                                    level = "Easy";
                                  });
                                },
                                child: isEasyLevelSelected
                                    ? Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.deepPurple)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            height: screenHeight * 0.05,
                                            width: screenWidth * 0.06,
                                            decoration: BoxDecoration(
                                                //color: Colors.purple.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1.2,
                                                    color:
                                                        Colors.grey.shade600)),
                                            child: Center(
                                              child: Text(
                                                "Easy",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.8,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: screenHeight * 0.05,
                                        width: screenWidth * 0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1.2,
                                                color: Colors.grey.shade600)),
                                        child: Center(
                                          child: Text(
                                            "Easy",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.8),
                                          ),
                                        ),
                                      ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isEasyLevelSelected = false;
                                    isMediumLevelSelected = true;
                                    isHardLevelSelected = false;
                                    level = "Medium";
                                  });
                                },
                                child: isMediumLevelSelected
                                    ? Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.deepPurple)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            height: screenHeight * 0.05,
                                            width: screenWidth * 0.06,
                                            decoration: BoxDecoration(
                                                //color: Colors.purple.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1.2,
                                                    color:
                                                        Colors.grey.shade600)),
                                            child: Center(
                                              child: Text(
                                                "Medium",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.8,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: screenHeight * 0.05,
                                        width: screenWidth * 0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1.2,
                                                color: Colors.grey.shade600)),
                                        child: Center(
                                          child: Text(
                                            "Medium",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.8),
                                          ),
                                        ),
                                      ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isEasyLevelSelected = false;
                                    isMediumLevelSelected = false;
                                    isHardLevelSelected = true;
                                    level = "Hard";
                                  });
                                },
                                child: isHardLevelSelected
                                    ? Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.deepPurple)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            height: screenHeight * 0.05,
                                            width: screenWidth * 0.06,
                                            decoration: BoxDecoration(
                                                //color: Colors.purple.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1.2,
                                                    color:
                                                        Colors.grey.shade600)),
                                            child: Center(
                                              child: Text(
                                                "Hard",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.8,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: screenHeight * 0.05,
                                        width: screenWidth * 0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1.2,
                                                color: Colors.grey.shade600)),
                                        child: Center(
                                          child: Text(
                                            "Hard",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.8),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Number of Options: ',
                          style: TextStyle(
                              fontSize: 16.5,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: _decrementOptionCount,
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 2.0,
                                  ),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '$optionCount', // Quantity value
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: _incrementOptionCount,
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 2.0,
                                  ),
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Generate text fields for options based on optionCount

                    for (int i = 0; i < optionCount; i++)
                      SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextField(
                            controller: optionsCntrl.length > i
                                ? optionsCntrl[i]
                                : TextEditingController(),
                            cursorColor: Colors.deepPurple,
                            decoration: InputDecoration(
                              focusColor: Colors.deepPurple,
                              hoverColor: Colors.deepPurple,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: "Option ${i + 1}",
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    print("LIST");

                    ///print(optionsCntrl.toString());
                    List<String> options = [];
                    for (TextEditingController controller in optionsCntrl) {
                      options.add(controller.text);
                    }
                    //String jsonList = jsonEncode(options);
                    print("===============");
                    print(options);
                    await qc.uploadQuestion(
                        subjectCntrl.text.toString(),
                        questionCntrl.text.toString(),
                        answerCntrl.text.toString(),
                        options,
                        topicCntrl.text.toString(),
                        level.toLowerCase().toString());
                  },
                  child: Text('Upload'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.grey.shade100,
        child: Row(
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
                        padding: const EdgeInsets.only(top:15.0,left:20.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            height: screenHeight * 0.05,
                            width: screenWidth * 0.2,
                            child: TextField(
                              controller:searchController ,
                              onChanged: (value) {
                                filterSearchResults(value);
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Search subject or topic...',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                      width: 2.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.0),
                                ),
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Question Bank',
                              style: GoogleFonts.lato(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                            Spacer(),
                            ElevatedButton(
                                onPressed: _showDialog, 
                                child: Text("Create")),
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        height: screenHeight*0.78,
                        width: screenWidth*0.86,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0,color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: questionBank.isEmpty
                            ? Center(child: CircularProgressIndicator())
                            : 
                            SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                        columns: [
                          DataColumn(label: Text('SUBJECT',style: GoogleFonts.lato(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text('QUESTION',style: GoogleFonts.lato(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text('ANSWER',style: GoogleFonts.lato(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text('DIFFICULTY',style: GoogleFonts.lato(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w900))),
                          DataColumn(label: Text('WATCH', style: GoogleFonts.lato(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w900))), 
                          DataColumn(label: Text('ACTION',style: GoogleFonts.lato(color: Colors.black,fontSize: 17.8,fontWeight: FontWeight.w900))), 
                        ],
                        rows:  searchController.text.isEmpty ? // Check if search field is empty
                       questionBank
                       .map(
                        (question) => DataRow(
                          cells: [
                            DataCell(Text(question['subject'], style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))),
                            DataCell(Text(
                              question['question'].length > 40 ? '${question['question'].substring(0, 37)}...' : question['question'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              question['answer'].length > 40 ? '${question['answer'].substring(0, 37)}...' : question['answer'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              level = question['difficulty_level'],
                              style: TextStyle(color: level == "easy" ? Colors.green : Colors.red),
                            )),
                            DataCell(IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () async{
                              String questionId=question['_id'];
                                await qc.fetchQuestionById(questionId);
                                Map<String, dynamic>? questionDetails = await qc.fetchQuestionById(questionId);
                                if (questionDetails != null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return QuestionDialog(questionDetails: questionDetails);
                                    },
                                  );
                                } else {
                                  print("errorrrrrrrrr");
                                }
                              },
                            )),
                            DataCell(IconButton(
                              icon: Icon(Icons.delete_outline,color: Colors.red,),
                              onPressed: () async{
                                String questionId=question['_id'];
                                await qc.deleteData(questionId);
                              },
                            )),
                          ],
                        ),
                      )
                      .toList()
                    : filteredQuestionBank // Show search results if search field is not empty
                      .map(
                        (question) => DataRow(
                          cells: [
                            DataCell(Text(question['subject'], style: TextStyle(color: Colors.black, fontSize: 15.8, fontWeight: FontWeight.bold))),
                            DataCell(
                              Text(
                              question['question'].length > 60 ? '${question['question'].substring(0, 59)}...' : question['question'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              question['answer'].length > 60 ? '${question['answer'].substring(0, 59)}...' : question['answer'],
                              overflow: TextOverflow.ellipsis,
                            )),
                            DataCell(Text(
                              level = question['difficulty_level'],
                              style: TextStyle(color: level == "easy" ? Colors.green : Colors.red),
                            )),
                            DataCell(IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: ()async {
                                String questionId=question['_id'];
                                await qc.fetchQuestionById(questionId);
                                Map<String, dynamic>? questionDetails = await qc.fetchQuestionById(questionId);
                                if (questionDetails != null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return QuestionDialog(questionDetails: questionDetails);
                                    },
                                  );
                                } else {
                                  print("errorrrrrrrrr");
                                }
                              },
                            )),
                            DataCell(IconButton(
                              icon: 
                              // If selected, show Tick icon
                               Icon(Icons.delete_outline_outlined),
                              onPressed: () async{
                                String questionId=question['_id'];
                                await qc.deleteData(questionId);
                                setState(() {
                                });
                                // Handle adding question here
                              },
                            )),
                          ],
                        ),
                      )
                      .toList(),
                ),
              )
                                  
            ),
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
