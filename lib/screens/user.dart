import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sat_portal/controllers/auth_controller.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }
  final AdminAuthController admnc = Get.put(AdminAuthController());

  List<Map<String, dynamic>> userBank = [];
  TextEditingController taskController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
    List<Map<String, dynamic>> filteredUserBank = [];
   

    fetchUserData()async{
    try {
      List<Map<String, dynamic>> data = await admnc.fetchData();
      setState(() {
        userBank = data;
      });
      print("+++++++++++++++++++++++++");
      print(userBank);
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }


 void filterSearchResults(String query) async {
  if (query.isNotEmpty) {
    try {
      List<Map<String, dynamic>> searchResults = await admnc.searchUser(query);
      setState(() {
        filteredUserBank = searchResults;
      });
    } catch (e) {
      print('Error searching: $e');
      setState(() {
        filteredUserBank = [];
      });
    }
  } else {
    setState(() {
      filteredUserBank = List.from(userBank);
    });
  }
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
               body:Column(
                 children: [
                  Padding(
                        padding: const EdgeInsets.only(top:15.0,left:20.0,bottom: 15),
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
                                hintText: 'Search School name or ID',
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
                   Container(
                    height: screenHeight*0.78,
                    width: screenWidth*0.86,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0,color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: userBank.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : 
                        SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                    columns: [
                      DataColumn(label: Text('School ID',style: GoogleFonts.lato(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900))),
                      DataColumn(label: Text('School Name',style: GoogleFonts.lato(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900))),
                      DataColumn(label: Text('Spoc Name',style: GoogleFonts.lato(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900))),
                      DataColumn(label: Text('Spoc Contact', style: GoogleFonts.lato(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900))), 
                      DataColumn(label: Text('Created At',style: GoogleFonts.lato(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900))),
                      DataColumn(label: Text('Action',style: GoogleFonts.lato(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w900))), 
                    ],
                    rows:  searchController.text.isEmpty ? // Check if search field is empty
                    userBank
                    .map(
                    (user) => DataRow(
                      cells: [
                        DataCell(Text(user['school_id'], style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))),
                        DataCell(Text(
                          user['name'].length > 40 ? '${user['name'].substring(0, 37)}...' : user['name'],
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                          user['spoc_name'].length > 40 ? '${user['spoc_name'].substring(0, 37)}...' : user['spoc_name'],
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                            user['spoc_contact'],
                        )),
                        DataCell(Text(
                            user['createdAt'],
                        )),
                        DataCell(
                          IconButton(
                          icon: Icon(Icons.delete_outline,color: Colors.red,),
                          onPressed: () async{
                            String userId=user['_id'];
                            await admnc.deleteData(userId);
                          },
                        )
                        ),
                      
                      ],
                    ),
                    )
                    .toList()
                  : filteredUserBank // Show search results if search field is not empty
                    .map(
                    (user) => DataRow(
                      cells: [
                         DataCell(Text(user['school_id'], style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))),
                        DataCell(Text(user['name'], style: TextStyle(color: Colors.black, fontSize: 15.8, fontWeight: FontWeight.bold))),
                        DataCell(
                          Text(
                          user['spoc_name'].length > 60 ? '${user['spoc_name'].substring(0, 59)}...' : user['spoc_name'],
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                          user['spoc_contact'].length > 60 ? '${user['spoc_contact'].substring(0, 59)}...' : user['spoc_contact'],
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                            user['createdAt'],
                        )),
                        DataCell(
                          IconButton(
                          icon: Icon(Icons.delete_outline,color: Colors.red,),
                          onPressed: () async{
                            String userId=user['_id'];
                            await admnc.deleteData(userId);
                          },
                        )
                        ),
                      ],
                    ),
                                 )
                                 .toList(),
                                 ),
                               )
                                    
                             ),
                 ],
               ),
    );
  }
}

