import 'package:flutter/material.dart';
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
       decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                   child:
                Padding(
                  padding: const EdgeInsets.only(left:35, right: 35, top:35),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus nisl at nulla tincidunt cursus. Sed nibh augue, rhoncus sit amet purus ut, luctus suscipit nisi. In molestie augue et mauris posuere pharetra. In fermentum efficitur velit, et lobortis dui varius at. Aliquam vulputate arcu sit amet tellus hendrerit, eget finibus erat accumsan. ',
                          style: TextStyle(
                            height: 1.5,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.5,
                                  
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus nisl at nulla tincidunt cursus. Sed nibh augue, rhoncus sit amet purus ut, luctus suscipit nisi. In molestie augue et mauris posuere pharetra. In fermentum efficitur velit, et lobortis dui varius at. Aliquam vulputate arcu sit amet tellus hendrerit, eget finibus erat accumsan. ',
                          style: TextStyle(
                            height: 1.5,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.5,
                          ),    textAlign: TextAlign.justify,),
                        
                      ],
                    ),
                  ),
                ),
    
    );
  }
}