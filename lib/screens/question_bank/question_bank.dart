import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sat_portal/controllers/question_controller.dart';

class QuestionBank extends StatefulWidget {
  const QuestionBank({super.key});

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  List questionBank=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   fetchquestionlist();
  }

fetchquestionlist()async{
  questionBank=await qc.fetchQuestiona();
  print(questionBank);
}

  final QuestionBankController qc = Get.put(QuestionBankController());
   bool isEasyLevelSelected=false;
   bool isMediumLevelSelected=false;
   bool  isHardLevelSelected=false;
   
   void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;
      TextEditingController subjectCntrl= TextEditingController();
      TextEditingController topicCntrl= TextEditingController();
      TextEditingController questionCntrl= TextEditingController();
      TextEditingController answerCntrl= TextEditingController();
      //TextEditingController optionCntrl= TextEditingController();
        int optionCount = 2; 
        String level=" ";
        List<TextEditingController> optionsCntrl = List.generate(
          optionCount,
          (index) => TextEditingController(),
        );

        return StatefulBuilder(
          builder: (context, setState) {
            void _incrementOptionCount() {
              if (optionCount < 5) 
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
              title: Text('Upload Questions',style: TextStyle(fontSize: 24,letterSpacing: 1.0,fontWeight: FontWeight.w600),),
              content: Container(
                height: screenHeight*0.8,
                width: screenWidth*0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: screenHeight*0.06,
                          width: screenWidth*0.2,
                          child: TextField(
                          controller:subjectCntrl ,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                          focusColor: Colors.deepPurple,
                          hoverColor: Colors.deepPurple,
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                              labelText:"Subject*",
                          ), 
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          height: screenHeight*0.06,
                          width: screenWidth*0.2,
                          child: TextField(
                          controller: topicCntrl,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                          focusColor: Colors.deepPurple,
                          hoverColor: Colors.deepPurple,
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                              labelText:"Topic*",
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
                          borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                              labelText:"Question",
                          ), 
                          ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          height: screenHeight*0.06,
                          width: screenWidth*0.2,
                          child: TextField(
                                controller:answerCntrl,
                                cursorColor: Colors.deepPurple,
                                decoration: InputDecoration(
                                focusColor: Colors.deepPurple,
                                hoverColor: Colors.deepPurple,
                                focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                    labelText:"Answer",
                                ), 
                                ),
                        ),
                              SizedBox(width:20,),
                              Container(
                                height: screenHeight*0.05,
                                width: screenWidth*0.28,
                                //color: Colors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                        isEasyLevelSelected=true;
                                        isMediumLevelSelected=false;
                                        isHardLevelSelected=false;
                                        level="Easy";
                                        });
                                      },
                                      child:isEasyLevelSelected?
                                      Container(
                                        height: screenHeight*0.06,
                                        width: screenWidth*0.07,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: Colors.deepPurple)
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                          height: screenHeight*0.05,
                                          width: screenWidth*0.06,
                                          decoration: BoxDecoration(
                                            //color: Colors.purple.shade100,
                                            borderRadius:BorderRadius.circular(10),
                                            border: Border.all(width: 1.2,color: Colors.grey.shade600)
                                          ),
                                          child: Center(child:Text("Easy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.8,color: Colors.black),),),
                                          ),
                                        ),
                                      ):
                                      Container(
                                        height: screenHeight*0.05,
                                        width: screenWidth*0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border.all(width: 1.2,color: Colors.grey.shade600)
                                        ),
                                        child: Center(child:Text("Easy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.8),),),
                                      ),
                                    ),


                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                        isEasyLevelSelected=false;
                                        isMediumLevelSelected=true;
                                        isHardLevelSelected=false;
                                        level="Medium";
                                        });
                                      },
                                      child:isMediumLevelSelected?
                                      Container(
                                        height: screenHeight*0.06,
                                        width: screenWidth*0.07,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: Colors.deepPurple)
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                          height: screenHeight*0.05,
                                          width: screenWidth*0.06,
                                          decoration: BoxDecoration(
                                            //color: Colors.purple.shade100,
                                            borderRadius:BorderRadius.circular(10),
                                            border: Border.all(width: 1.2,color: Colors.grey.shade600)
                                          ),
                                          child: Center(child:Text("Medium",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.8,color: Colors.black),),),
                                          ),
                                        ),
                                      ):
                                       Container(
                                        height: screenHeight*0.05,
                                        width: screenWidth*0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border.all(width: 1.2,color: Colors.grey.shade600)
                                        ),
                                        child: Center(child:Text("Medium",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.8),),),
                                      ),
                                    ),


                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                        isEasyLevelSelected=false;
                                        isMediumLevelSelected=false;
                                        isHardLevelSelected=true;
                                        level="Hard";
                                        });
                                      },
                                      child:isHardLevelSelected?
                                      Container(
                                        height: screenHeight*0.06,
                                        width: screenWidth*0.07,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: Colors.deepPurple)
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                          height: screenHeight*0.05,
                                          width: screenWidth*0.06,
                                          decoration: BoxDecoration(
                                            //color: Colors.purple.shade100,
                                            borderRadius:BorderRadius.circular(10),
                                            border: Border.all(width: 1.2,color: Colors.grey.shade600)
                                          ),
                                          child: Center(child:Text("Hard",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.8,color: Colors.black),),),
                                          ),
                                        ),
                                      ):
                                       Container(
                                        height: screenHeight*0.05,
                                        width: screenWidth*0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border.all(width: 1.2,color: Colors.grey.shade600)
                                        ),
                                        child: Center(child:Text("Hard",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.8),),),
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
                        Text('Number of Options: ',style: TextStyle(fontSize: 16.5,color: Colors.deepPurple,fontWeight: FontWeight.w600),),
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
                              SizedBox(width: 10,),
                              Text(
                                '$optionCount', // Quantity value
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10,),
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
                      height: screenHeight*0.08,
                      width: screenWidth*0.2,
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
                              borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                                  labelText:"Option ${i + 1}",
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
                  onPressed: () async{
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
                      level.toLowerCase().toString()
                      );
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
      body:Container(
        height:screenHeight,
        width: screenWidth,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,right: 10,left:230,bottom: 10),
          child: Container(
            height: screenHeight,
            width: screenWidth*0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16)
              ),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 0.8,
              )
            ),
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 15,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(left:10,right:150),
                          child: SizedBox(
                            height: screenHeight*0.05,
                            width: screenWidth*0.2,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical:10),
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Search',
                                focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.deepPurple, width: 2.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                   Icon(Icons.settings,color: Colors.black,),
                   SizedBox(width: screenWidth*0.01,),
                   Icon(Icons.person_outline_rounded,color: Colors.black,)
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0),
                child: Row(
                  children: [
                   Text('Question Bank',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),) ,
                   Spacer(),
                   ElevatedButton(onPressed: _showDialog, child: Text("Create")),
                   
                  ],
                ),
              ),

              ],
            ),
          ),

        ),
      ) ,
    );
  }
}