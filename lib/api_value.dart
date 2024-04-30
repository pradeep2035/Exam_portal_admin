class ApiValue {
  static List url = [
    "production url",
    "https://exam-portal-p3fq.onrender.com/"
  ];
  static int isBeta = 1;
  //========================================================Authentication
  String adminLoginUrl = '${url[isBeta]}admin_login';
  String schoolregisterUrl = '${url[isBeta]}post/school_details';
  //========================================================Question Bak
  String questionUploadUrl = '${url[isBeta]}post/question_bank';
  String questionListUrl = '${url[isBeta]}get/question_bank';
  String searchQuestionUrl = '${url[isBeta]}search/question_bank';
  String detailQuestionUrl = '${url[isBeta]}question_popup';
  String deleteQuestionUrl = '${url[isBeta]}delete_question';
  //========================================================user search api
  String searchUserUrl = '${url[isBeta]}search/school_details';
  //========================================================user data api
  String userDataUrl = '${url[isBeta]}schools';
  String deleteUserDataUrl = '${url[isBeta]}schools';



}

ApiValue apiValue = ApiValue();
