import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sat_portal/api_value.dart';
import 'package:sat_portal/screens/admin.dart';
import 'package:sat_portal/screens/home.dart';
import 'package:sat_portal/sharedpreference_helper.dart';

class AdminAuthController extends GetxController{
    Dio dio = Dio();



    Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await dio.get(apiValue.userDataUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['schools'];
        final List<Map<String, dynamic>> typedData = data.cast<Map<String, dynamic>>();
        print(typedData);
        return typedData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

//======================================================search api
Future<List<Map<String, dynamic>>> searchUser(String query) async {
  try {
    Map<String, dynamic> data = {'query': query};
    print(query);
    final response = await dio.get(apiValue.searchUserUrl, queryParameters: data);
    if (response.statusCode == 200) {
      List<dynamic> userList = response.data['data'];
      //print(questionList);
      // Convert each item to Map<String, dynamic>
      List<Map<String, dynamic>> mappedUserDataList = userList.map((item) => item as Map<String, dynamic>).toList();
      print(mappedUserDataList);
      return mappedUserDataList;
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


//========================================================================delete user
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


adminLogin(String adminUserId, String adminPassword) async {
  try {
    // Make API call to submit question IDs
    print("hello");
    final response = await dio.post(apiValue.adminLoginUrl, 
    data:{
            "u_id":adminUserId,
            "password": adminPassword
        }
    );
    if (response.statusCode == 200) {
      print("successfully login");
      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> userDataList = responseData["data"];
      if (userDataList.isNotEmpty) {
        final Map<String, dynamic> userData = userDataList.first;
        final String adminName = userData["name"].toString();
        final String adminId = userData["id"].toString();
        final String adminContact = userData["contact"].toString();
        
        print("Admin Name: $adminName");
        print("Admin ID: $adminId");
        print("Admin Contact: $adminContact");
        SharedPreferencesHelper.setadminName(adminName: adminName);
        SharedPreferencesHelper.setadminId(adminId: adminId);
         SharedPreferencesHelper.setadminContact(adminContact: adminContact);
        
        // Navigate to the next page and pass the data if needed
        Get.off(() => AdminPage());
      } else {
        throw Exception("No user data found in response");
      }
      Get.off(()=>AdminPage());
    } else {
      throw Exception('Failed to submit data');
    }
  } catch (e) {
    print('Failed to submit data: $e');
    // Handle error, maybe show a snackbar or toast
  }
}


registerUser(String schoolId,schoolName,city,state,pincode,spocname,spocid,spocpassword,spoccontact,email)async{
  

    try {
      final response = await dio.post(apiValue.schoolregisterUrl,
            data:{
            {
              "school_id": schoolId,
              "name": schoolName,
              "address": {
                "city": city,
                "state": state,
                "pin_code": pincode
              },
              "spoc_name": spocname,
              "spoc_id": spocid,
              "spoc_password": spocpassword,  
              "spoc_contact": spoccontact,
              "email": email
             }

          });
         
      if (response.statusCode == 200) {
         //Get.to(()=>AdminPage());
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

}