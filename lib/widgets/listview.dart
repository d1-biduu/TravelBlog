import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  final String text1;
    final String text2;
  final Function() onpressed;
  final String imagepath;
  const Custom({super.key, required this.text1,required this.text2, required this.onpressed, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
 height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: const Color.fromARGB(255, 254, 255, 255),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(90.0),
                  
                ),
                child:  Image.asset(
                        imagepath,
                        

                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.only(right:30.0,top:30,bottom:30,left:15),
                child: RichText(
                  text: TextSpan(
                    text: text1,
                    style: const TextStyle(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                          text:text2,
                             
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            height: 1.8,
                          )),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0, top:10),
                child: SizedBox(
                  height: 45,
                  width: 100,
                  child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: onpressed,
          child: const Text('EXPLORE'),
        ),
                ),
 

           ),
            ],
          ),
    );
  }

}