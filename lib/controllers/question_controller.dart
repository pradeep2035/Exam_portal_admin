import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sat_portal/api_value.dart';
import 'package:http/http.dart' as http;
class QuestionBankController extends GetxController{
  Dio dio = Dio();


  uploadQuestion(String subjectname,questiondata,answer,optionsList,topicName,difficultylevel)async{
   print(subjectname);
   //print(question);
   print(answer);
   //print(options);
   print(difficultylevel);

    try {
      final response = await dio.post("https://exam-portal-p3fq.onrender.com/post/question_bank",
            data:{
            "subject": subjectname,
            "question":questiondata,
            "answer": answer,
            "options":optionsList,
            "topic": topicName,
            "difficulty_level":difficultylevel ,
          });
         
      if (response.statusCode == 200) {
         Get.back();
          // List data = responseData['data'];
         Get.snackbar("success", "Upload successfully");
        
      }
    } catch (e) {
      print("Error while uploading question: ${e.toString()}");
      Get.snackbar("failure", "Upload failed");
      return null; // Returning null to indicate an error
    }
    return null; // Returning null in case of any other unexpected condition
  }

  fetchQuestiona()async{
  try {
      final response = await dio.get(apiValue.questionListUrl);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData != null && responseData["status_code"] == 200) {
          List data = responseData['data'];
          print("=================================");
          print(data);
          return data;
        }
      }
    } catch (e) {
      print("Error fetching while fyeching questions: $e");
      return null; // Returning null to indicate an error
    }
    return null; // Returning null in case of any other unexpected condition
  }

  void uploaddemo(String subjectname,questiondata,answer,optionsList,topicName,difficultylevel)async{
    Map<String, dynamic> postData = {
            "subject": subjectname,
            "question":questiondata,
            "answer": answer,
            "options":optionsList,
            "topic": topicName,
            "difficulty_level":difficultylevel ,
    // Add more key-value pairs as needed
  };

  // URL of the API endpoint
  String apiUrl = 'https://exam-portal-p3fq.onrender.com/post/question_bank';

  try {
    // Send a POST request with the data
    var response = await http.post(Uri.parse(apiUrl),
      body: json.encode(postData) , // Pass the data as the body of the request
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      print('Response: ${response.body}');
      // Handle the response data here
    } else {
      print('Failed with status code: ${response.statusCode}');
      // Handle the error here
    }
  } catch (e) {
    print('Error: $e');
    // Handle any exceptions here
  }
  }
}


