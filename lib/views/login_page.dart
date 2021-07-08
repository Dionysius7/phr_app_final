import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;
    return Scaffold(
       body: SafeArea(
         child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo_only.png", width: width/2, height: height/3.5)
                    ],
                  ),
                  Container(
                    width: width/1.5,
                    child:  Align(
                        alignment: Alignment.topLeft,
                        child: Text("Login", style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),textAlign: TextAlign.start,)
                        
                      ),
                  ),
                  Container(
                    width: width/1.5,
                    child:  Align(
                        alignment: Alignment.topLeft,
                        child: Text("Please sign in to continue", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey[500])),
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: width/1.5,
                    child:  Align(
                        alignment: Alignment.topLeft,
                        child: TextField(
                          cursorColor: Colors.indigo,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone, color: Colors.black), 
                            hintText: "Phone", 
                            focusColor: Colors.black,
                            fillColor: Colors.black, 
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo))
                          ),),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    width: width/1.5,
                    child: MaterialButton(
                      onPressed: () {}, 
                      child: Text("Login", style: TextStyle(fontSize: 20,)),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(13),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35))
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(0),
                    height: height/7,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/top_right_decoration.png")
                        ],
                      ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 35),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  // Get.to()
                                },
                                child: Text("Sign Up", style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),)
                              ),
                          ],
                        ),
                    ),
                  )
                ],
              ),
            ],
           )
         )
    );
  }
}