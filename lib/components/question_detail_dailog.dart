import 'package:flutter/material.dart';

class QuestionDialog extends StatelessWidget {
  final Map<String, dynamic> questionDetails;

  QuestionDialog({required this.questionDetails});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Question Details',style: TextStyle(fontSize:19,color: Colors.deepPurple,fontWeight: FontWeight.w600),),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Subject:  ${questionDetails['subject']}'),
          SizedBox(height:3,),
          Text('Topic:  ${questionDetails['topic']}'),
          SizedBox(height:3,),
          Text('Question:  ${questionDetails['question']}'),
          SizedBox(height:3,),
          Text('Answer:  ${questionDetails['answer']}'),
          SizedBox(height:3,),
          Text('Options:  ${questionDetails['options']}'),
          SizedBox(height:3,),
          Text('Difficulty Level:  ${questionDetails['difficulty_level']}'),
          // Add more fields as needed
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog box
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
