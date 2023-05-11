import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String imagepath;
  String text;
  String image;
  String name;
  String time;
  CustomCard(
      {super.key,
      required this.imagepath,
      required this.text,
      required this.image,
      required this.name,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Material(
        elevation: 5.0,
        shadowColor: const Color.fromARGB(255, 3, 94, 139),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagepath),
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
              const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(image),
                        //  'assets/images/girl.jpg'
                        radius: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 25),
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                      ),
                      
                      const Icon(
                        Icons.timelapse_outlined,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          time,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
