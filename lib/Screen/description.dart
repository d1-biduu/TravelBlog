import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/bottombar.dart';

class Display extends StatefulWidget {
  const Display({
    super.key,
  });

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  bool isIconPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/mountain.jpg'),
              fit: BoxFit.cover,
              opacity: 0.7)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 1,
                            fillColor: Colors.transparent,
                            padding: const EdgeInsets.all(13.0),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 22.0,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Image.asset(
                              'assets/icons/savee.png',
                              scale: 25,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Color in UI Design : A\n(Practical) Framework",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28,
                                  letterSpacing: 0.9,
                                  height: 1.3),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/girl.jpg'),
                                  radius: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Christina",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      letterSpacing: 1),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 18.0, right: 3),
                                  child: Icon(
                                    Icons.timelapse_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "10 min",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(),
        floatingActionButton: FloatingActionButton(
            elevation: 3,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isIconPressed = !isIconPressed;
                });
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.favorite,
                      color: isIconPressed ? Colors.red : Colors.black,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    "200",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            )),
        //  floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
