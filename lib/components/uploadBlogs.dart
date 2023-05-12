import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelblog/Screen/blogdisplay.dart';
import 'package:travelblog/Screen/description.dart';

import '../widgets/button.dart';

class UploadBlogs extends StatefulWidget {
  UploadBlogs({super.key});

  @override
  State<UploadBlogs> createState() => _UploadBlogsState();
}

class _UploadBlogsState extends State<UploadBlogs> {
  File? _image;
  String imagePath = "";
  var downloadURL;
  final storageRef = FirebaseStorage.instance.ref();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  uploadImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() async {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        var fileName =
            DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
        var data =
            await storageRef.child('images/assets/$fileName').putFile(_image!);
        print('data is $data');

        setState(() {
          storageRef
              .child('images/assets/$fileName')
              .getDownloadURL()
              .then(((value) {
            downloadURL = value;
            print('Value is $value');
          }));
        });
      } else {
        print("image is not selected");
      }
    });
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: const Center(
          child: Text("Upload Your Blogs",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  uploadImage();
                },
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: _image != null
                        ? ClipRRect(
                            child: Image.file(
                              _image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(28, 140, 137, 137),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color.fromARGB(62, 158, 158, 158),
                                  width: 1,
                                )),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.blue,
                              size: 28,
                            ),
                          )),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: _formkey,
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 22, 112, 158)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "Title",
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the title";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 22, 112, 158)),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: "Description",
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the description";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.076,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                print('Download is $downloadURL');
                                var data = {
                                  'title': titleController.text,
                                  'description': descriptionController.text,
                                  'imageurl': downloadURL,
                                };
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .add(data)
                                    .then((value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                        "Your blog is successfully added!"),
                                    duration: Duration(seconds: 3),
                                  ));

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DisplayBlogs()));
                                });
                              }
                            },
                            child: const Text("Upload your blogs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 1)))),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
