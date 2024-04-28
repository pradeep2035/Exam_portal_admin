class ApiValue {
  static List url = [
    "production url",
    "https://exam-portal-p3fq.onrender.com/"
  ];
  static int isBeta = 1;
  //========================================================Authentication
  String userRegisterUrl = '${url[isBeta]}user';
  //========================================================Question Bak
  String questionUploadUrl = '${url[isBeta]}post/question_bank';
  String questionListUrl = '${url[isBeta]}get/question_bank';
  //========================================================Category List
}

ApiValue apiValue = ApiValue();
