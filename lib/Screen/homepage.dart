import 'package:flutter/material.dart';

import '../model/images.dart';
import '../widgets/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Images> imageList = Images.allImages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Image.asset(
            'assets/icons/menu.png',
            scale: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 25,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/girl.jpg'),
                  radius: 16,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Your Daily\n",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                          fontSize: 25,
                          letterSpacing: 0.8),
                      children: const [
                        WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: SizedBox(height: 28)),
                        TextSpan(
                          text: "Recommendation",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 33,
                            color: Colors.black,
                            letterSpacing: 0.8,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemExtent: 260.0,
                        //  shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  height: 240,
                                  child: Stack(children: <Widget>[
                                    Image.asset(
                                      imageList[index].imageURl,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    Positioned(
                                      bottom: 25,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              imageList[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1),
                                              softWrap: false,
                                              maxLines: 4,
                                              overflow: TextOverflow.fade,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      imageList[index].image),
                                                  radius: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Text(
                                                    imageList[index].text,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  CustomCard(
                    image: 'assets/images/girl.jpg',
                    imagepath: 'assets/images/mountain.jpg',
                    name: 'Bidisha',
                    text: 'Inspiration for New\nproject can be found',
                    time: '10 min',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    image: 'assets/images/girl.jpg',
                    imagepath: 'assets/images/village.jpg',
                    name: 'Binisha',
                    text: 'Inspiration for New\nproject can be found',
                    time: '20 min',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
