import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _keepLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Title(color:Colors.black,child: Text("sat.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 34,letterSpacing: 1.0),)),
        // actions: [
        //   //SizedBox(height: screenHeight*0.06,),
        //   Text("sat.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 34,letterSpacing: 1.0),),
        //   SizedBox(width: screenWidth*0.01,)
        // ],
        
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
         color: Colors.white, 
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset("assets/login_admin.jpg",height: screenHeight,width: screenWidth*0.4,),
            ),
            //SizedBox(width: screenWidth*0.1,),
            Container(
              height: screenHeight,
              width: screenWidth*0.4,
              child: Padding(
                padding:  EdgeInsets.only(left: screenWidth*0.1, right: screenWidth*0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Align(
                    alignment:Alignment.centerLeft,
                    child: Text("Log In",style: TextStyle(fontSize: 35,color: Colors.deepPurple,fontWeight:FontWeight.w800,letterSpacing: 1.0),)),
                   SizedBox(height: screenHeight*0.01,),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Text("Login with your credentials provided.",style: TextStyle(fontSize: 16.5,color: Colors.grey.shade700,fontWeight:FontWeight.w400),)),
                    SizedBox(height: screenHeight*0.04,),
                    TextField(
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
                        labelText:"Username",
                        suffixIcon: Icon(Icons.person_outline_rounded),
                    ), 
                    ),
                   SizedBox(height: screenHeight*0.03,),
                    TextField(
                    cursorColor: Colors.deepPurple,
                    obscureText: true,
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
                      labelText:"Password",
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                     ), 
                    ),
                    SizedBox(height: screenHeight*0.01,),
                    Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          activeColor: Colors.deepPurple,
                          checkColor: Colors.white,
                          hoverColor: Colors.deepPurple.shade100,
                          value: _keepLoggedIn,
                           onChanged: (value) { 
                            setState(() {
                              _keepLoggedIn = value!;
                            });
                          }, 
                        ),
                        Text("Keep me logged in",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),)
                      ],
                    ),
                    SizedBox(height: screenHeight*0.03,),
                    Container(
                      height: screenHeight*0.06,
                      width:screenWidth*0.1,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text("Login",style: TextStyle(fontSize: 18,color: Colors.white),)),
                    ),
                  ],
                ),
              ),
            ),
          

          ],
        ),
      ),
    );
  }
}