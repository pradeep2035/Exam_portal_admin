import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sat_portal/api_value.dart';
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

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await dio.get(apiValue.questionListUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<Map<String, dynamic>> typedData = data.cast<Map<String, dynamic>>();
        return typedData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

//======================================================search api
Future<List<Map<String, dynamic>>> searchQuestion(String query) async {
  try {
    Map<String, dynamic> data = {'query': query};
    print(query);
    final response = await dio.get(apiValue.searchQuestionUrl, queryParameters: data);
    if (response.statusCode == 200) {
      List<dynamic> questionList = response.data['data'];
      //print(questionList);
      // Convert each item to Map<String, dynamic>
      List<Map<String, dynamic>> mappedQuestionList = questionList.map((item) => item as Map<String, dynamic>).toList();
      print(mappedQuestionList);
      return mappedQuestionList;
    } else if (response.statusCode == 404) {
      print("FAILED SEARCH API");
      return [];
    }
  } catch (e) {
    print('Error searching: $e');
    throw Exception('Failed to search: $e');
  }
  return [];
}

Future<Map<String, dynamic>?>fetchQuestionById(String id) async {
  try {
     Map<String, dynamic> data = {'id': id};
      final response = await dio.get(apiValue.detailQuestionUrl,queryParameters: data);
      if (response.statusCode == 200) {
        final  data = response.data['data'];
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
}

//=================================================================DELETE API FOR QUESTION
 deleteData(String id) async {

  try {
    Map<String, dynamic> data = {'id': id};
    final response = await Dio().delete(apiValue.deleteUserDataUrl,queryParameters: data);
    
    // Check the response status code
    if (response.statusCode == 200) {
      // Successful DELETE request
      print('Data deleted successfully.');
    } else {
      // Handle other status codes if needed
      print('Failed to delete data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle error
    print('Error deleting data: $e');
  }
}

  
}


