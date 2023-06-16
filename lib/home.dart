import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  File? _image;
  List _output = [];
  final imagepicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 3,
        threshold: 0.0,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = prediction as List;
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    // ignore: deprecated_member_use
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image as File);
  }

  pickimage_gallery() async {
    // ignore: deprecated_member_use
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image as File);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      drawer: NavigationDrawer(),

      body: SafeArea(
        child: Container(
          color: Color(0xffFBEAE7),
          height: h,
          width: w,
          child: Column(
            children: [
              // Container(
              //   height: 150,
              //   width: 150,
              //   padding: EdgeInsets.all(10),
              //   child: Image.asset(''),
              // ),
              SizedBox(height: 15,),
              Container(

                child: Text(
                  'To know about your skin upload your image by camera or gallery.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 150,
                          width: 180,
                          child: Card(
                            elevation: 10,
                            child: InkWell(
                              onTap: () {
                                pickimage_camera();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('assets/images/camera.png'),
                                ),
                              ),
                            ),
                            // child: ElevatedButton(
                            //   //color: Colors.teal[800],
                            //   //shape: RoundedRectangleBorder(
                            //   //     borderRadius: BorderRadius.circular(10)),
                            //   // child: Text('Capture',
                            //   //     style: GoogleFonts.roboto(fontSize: 18)),
                            //   onPressed: () {
                            //     pickimage_camera();
                            //   }, child: Text('Camera'),),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            height: 150,
                            width: 180,
                            child: Card(
                              elevation: 10,
                              child: InkWell(
                                onTap: () {
                                  pickimage_gallery();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage('assets/images/images.png'),
                                  ),
                                ),
                              ),
                            )
                            // child: ElevatedButton(
                            //   // color: Colors.teal[800],
                            //   // shape: RoundedRectangleBorder(
                            //   //     borderRadius: BorderRadius.circular(10)),
                            //   // child: Text('Gallery',
                            //   //     style: GoogleFonts.roboto(fontSize: 18)),

                            // ),
                            ),
                        // Container(
                        //    child:ElevatedButton(onPressed: (){FirebaseAuth.instance.signOut();}, child: Text('signOut'))
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              loading != true
                  ? Container(
                      child: Column(
                        children: [
                          Container(
                            height: 220,
                            // width: double.infinity,
                            padding: EdgeInsets.all(15),
                            child: Image.file(_image as File),
                          ),
                          if (_output != null)
                            Column(
                              children: [
                                Text(
                                  (_output[0]['label']).toString().substring(0),style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  'Confidence: ' +
                                      (_output[0]['confidence']).toStringAsFixed(3),
                                ),
                                Text((_output[2]['label'])
                                    .toString()
                                    .substring(0),style: TextStyle(fontSize: 22)),
                                Text(
                                  'Confidence: ' +
                                      (_output[2]['confidence']).toStringAsFixed(3),
                                ),
                                Text((_output[1]['label'])
                                    .toString()
                                    .substring(0),style: TextStyle(fontSize: 22)),


                              ],
                            )
                          else
                            Text(''),
                          _output != null
                              ? Text(
                                  'Confidence: ' +
                                      (_output[1]['confidence']).toStringAsFixed(3),
                                )
                              : Text('')
                        ],
                      ),
                    )
                  : Container(),
              Container(
                child: ElevatedButton(
                  onPressed: (
                      ){Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomePage();
                  }));}, child: null,
                ),
              ),

              // ElevatedButton(onPressed: Store, child: Text('Store'))
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, child: Text('SignOut'))
        ],
      ),
    ),
  );

}

