import 'package:flutter/material.dart';
import 'package:travelblog/widgets/button.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/leaves.jpg",
              ),
              fit: BoxFit.cover,
              opacity: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ListTile(
                title: Text(
                  "Everyday New",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 26,
                    letterSpacing: 1,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text("Travel Blog",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                          letterSpacing: 1)),
                ),
              ),
              const SizedBox(),
              Column(
                children: [
                  CustomButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    text: 'SIGN IN',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    text: 'SIGN IN WITH GOOGLE',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
