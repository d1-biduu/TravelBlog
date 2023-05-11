import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelblog/Screen/description.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
   var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: formKey,
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
              
                children: [
                  TextFormField(
                    
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.6,
                                            color: Color.fromARGB(
                                                255, 228, 233, 231)),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      labelText: " Name"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your name";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                 TextFormField(
                    
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.6,
                                            color: Color.fromARGB(
                                                255, 228, 233, 231)),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      labelText: "Password"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                TextFormField(
                    
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 0.6,
                                            color: Color.fromARGB(
                                                255, 228, 233, 231)),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      labelText: "Email"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your Email";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(
                                height: 47,
                                width: 320,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 83, 140, 210),
                                          Color.fromARGB(255, 142, 215, 226),
                                        ]),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      onSurface: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      //make color or elevated button transparent
                                    ),
                                    onPressed: () async{
                                      if(formKey.currentState!.validate()){
var data={
'username':nameController.text,
'password':passwordController.text,
'email':emailController.text,

};
await FirebaseFirestore.instance.collection("users").doc("testing").set(data).then((value) {

  
  
   Navigator.push(context, MaterialPageRoute(builder: (context)=> const Display()));
});
 


                                      }
                                    },
                                    child: const Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),  
                ],
              ) 
            )
          ],
        ),
      )
    );
  }
}