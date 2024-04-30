import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._ctor();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._ctor();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late SharedPreferences _prefs;
  
    static void setadminName({required String adminName}) {
    _prefs.setString("adminName", adminName);
  }

  
  static String getadminName() {
    return _prefs.getString("adminName") ?? "";
  }
    static void setadminId({required String adminId}) {
    _prefs.setString("adminId", adminId);
  }

  
  static String getadminId() {
    return _prefs.getString("adminId") ?? "";
  }


    static void setadminContact({required String adminContact}) {
    _prefs.setString("adminContact", adminContact);
  }

  
  static String getadminContact() {
    return _prefs.getString("adminContact") ?? "";
  }
//================================================
 
    static void setIsLoggedIn({required bool isLoggedIn}) {
    _prefs.setBool("isLoggedIn",isLoggedIn );
  }

  
  static bool getIsLoggedIn() {
    return _prefs.getBool("isLoggedIn") ?? false;
  }

  static void setSchoolName({required String schoolName}) {
    _prefs.setString("schoolName", schoolName);
  }

  static String getschoolName() {
    return _prefs.getString("schoolName") ?? "";
  }

  static void setSchoolId({required String SchoolId}) {
    _prefs.setString("SchoolId", SchoolId);
  }

  static String getSchoolId() {
    return _prefs.getString("SchoolId") ?? "";
  }
  

  static void setschoolCity({required String schoolCity}) {
    _prefs.setString("schoolCity", "");
  }

  static String getschoolCity() {
    return _prefs.getString("schoolCity") ?? "";
  }


  static void setschoolPin({required String schoolPin}) {
    _prefs.setString("schoolPin", schoolPin);
  }

  static String getschoolPin() {
    return _prefs.getString("schoolPin") ?? "";
  }
  
  static void setUserClass({required String userClass}) {
    _prefs.setString("userClass", userClass);
  }

  static String getschoolState() {
    return _prefs.getString("schoolState") ?? "";
  }

  static void setschoolState({required String schoolState}) {
    _prefs.setString("schoolState", "");
  }

  static String getspocName() {
    return _prefs.getString("spocName") ?? "";
  }

  static void setspocName({required String spocName}) {
    _prefs.setString("spocName", spocName);
  }

  static String getspocId() {
    return _prefs.getString("spocId") ?? "";
  }

  static void setspocId({required String spocId}) {
    _prefs.setString("spocId", spocId);
  }

  static String getspocPassword() {
    return _prefs.getString("spocPassword") ?? " ";
  }
 

 static void setspocPassword({required String spocPassword}) {
    _prefs.setString("spocPassword", spocPassword);
  }

  static String getspocmail() {
    return _prefs.getString("spocmail") ?? " ";
  }
 

 static void setspocmail({required String spocmail}) {
    _prefs.setString("spocmail", spocmail);
  }

  static String getspocContact() {
    return _prefs.getString("spocContact") ?? " ";
  }
 

 static void setspocContact({required String spocContact}) {
    _prefs.setString("spocContact", spocContact);
  }

  static int getUserBoardIndexPref() {
    return _prefs.getInt("userBoardIndexPref") ?? 0 ;
  }


  static void setUserLanguagePref({required String userLanguagePref}) {
    _prefs.setString("userLanguagePref", userLanguagePref);
  }

  static String getUserLanguagePref() {
    return _prefs.getString("userLanguagePref") ?? "English";
  }


 static void setUserLanguageIndexPref({required int userLanguageIndexPref}) {
    _prefs.setInt("userLanguageIndexPref", userLanguageIndexPref);
  }

  static int getUserLanguageIndexPref() {
    return _prefs.getInt("userLanguageIndexPref") ?? 0 ;
  }


  static void setUserClassPref({required String userClassPref}) {
    _prefs.setString("userClassPref", userClassPref);
  }

  static String getUserClassPref() {
    return _prefs.getString("userClassPref") ?? "All Classes";
  }

   static void setUserClassIndexPref({required int userClassIndexPref}) {
    _prefs.setInt("userClassIndexPref", userClassIndexPref);
  }

  static int getUserClassIndexPref() {
    return _prefs.getInt("userClassIndexPref") ?? 0 ;
  }


 static void setUserPref({required String userPref}) {
    _prefs.setString("userPref", userPref);
  }

  static String getUserPref() {
    return _prefs.getString("userPref") ?? "";
  }
  


  static void cleanUser(){
    _prefs.clear();
  }
}