import 'dart:ui';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(login());

class login extends StatefulWidget {
  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  final _emailController=TextEditingController();
  final _passController=TextEditingController();

  Future SignIn()  async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(), password: _passController.text.trim()
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,

            body:SingleChildScrollView(
              child: Container(
                color: Color(0xffFBEAE7),
                height: MediaQuery.of(context).copyWith().size.height,
                child: Stack(
                  children: <Widget>[
                    // Transform.translate(
                    //   offset: Offset(-60.0,-30.0),
                    //   child: Container(
                    //     width: 100.0,
                    //     height: 100.0,
                    //     decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: Color(0xff2F4181).withOpacity(0.8),
                    //         boxShadow: const [
                    //           BoxShadow(
                    //               color: Color(0xff304284),
                    //               blurRadius: 70,
                    //               spreadRadius: 100
                    //           )
                    //         ]
                    //     ),
                    //   ),
                    // ),
                    // Transform.translate(
                    //   offset: Offset(-120.0,410.0),
                    //   child: Container(
                    //     width: 100.0,
                    //     height: 100.0,
                    //     decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: Color(0xff44235A).withOpacity(0.8),
                    //         boxShadow: const [
                    //           BoxShadow(
                    //               color: Color(0xff442359),
                    //               blurRadius: 200,
                    //               spreadRadius: 120
                    //           )
                    //         ]
                    //     ),
                    //   ),
                    // ),
                    // Transform.translate(
                    //   offset: Offset(-220.0,700.0),
                    //   child: Container(
                    //     width: 100.0,
                    //     height: 100.0,
                    //     decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: Color(0xff692A49).withOpacity(0.8),
                    //         boxShadow: const [
                    //           BoxShadow(
                    //               color: Color(0xff692A49),
                    //               blurRadius: 300,
                    //               spreadRadius: 240
                    //           )
                    //         ]
                    //     ),
                    //   ),
                    // ),
                    Center(
                      child: Column(
                        children:  [
                          SizedBox(
                            height: 150,
                          ),



                          SizedBox(height: 4,),
                          Text("Sign in",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize:46),),
                          SizedBox(height: 60,),
                          SizedBox(height: 4,),



                          SizedBox(
                            height: 75,
                            width: 250,
                            child: TextField(
                              style: TextStyle(color: Colors.red),
                              controller: _emailController,

                              decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.mail_outline_outlined,color: Colors.red,),
                                  labelText: 'E-mail',
                                  labelStyle: TextStyle(
                                      color: Colors.red
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red
                                      )
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          SizedBox(
                            height: 75,
                            width: 250,
                            child: TextField(
                              obscureText: true,
                              controller: _passController,
                              style: TextStyle(color: Colors.redAccent),

                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.key,color: Colors.red,),
                                  labelText: 'Password',

                              labelStyle: TextStyle(

                                      color: Colors.red
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.redAccent
                                      )
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 36,),

                          GestureDetector(
                            onTap: SignIn,
                            child: Container(
                              height: 55,
                              width: 220,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Center(
                                   child: Text('Sign in',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),



                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text("                           Not registered yet?.."),
                              Text("Register Now!",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ));
  }
}