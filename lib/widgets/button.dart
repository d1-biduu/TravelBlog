import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  Color color;
  Color textColor;
  String text;


   CustomButton({super.key, required this.color, required this.textColor, required this.text, });

  @override
  Widget build(BuildContext context) {
    return 
   SizedBox(
                      width: MediaQuery.of(context).size.width * 0.89,
                      height: MediaQuery.of(context).size.height * 0.072,
                      
                        child: Padding(
                          padding: const EdgeInsets.only(right:15.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: color,
                                 shadowColor: Colors.transparent,
                               
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                
                              ),
                              onPressed: () {
                              },
                              child: Text(
                                text,
                                style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.5,),
                              ),),
                        ),
                      );
  }
}