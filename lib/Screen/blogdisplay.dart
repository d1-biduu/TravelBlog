import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DisplayBlogs extends StatefulWidget {
  @override
  State<DisplayBlogs> createState() => _DisplayBlogsState();
}

class _DisplayBlogsState extends State<DisplayBlogs> {

  String? title;
  String? description;
  bool isloading = false;
  var documents = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Future<void> getValueFromDatabase() async {
    setState(() {
      isloading = true;
    });
    var response = await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      documents = response.docs;
      documents.reversed.toList();
      isloading = false;
    });
  }
  Future<void> deleteValueFromDatabase(String documentId, String imageURl) async{
final collection = await FirebaseFirestore.instance.collection('users');
collection 
    .doc(
documentId)
    .delete() 
    .then((_) => print('Deleted'));

   await FirebaseStorage.instance.refFromURL(imageURl).delete();

  } 
  



  @override
  void initState() {
    super.initState();
    getValueFromDatabase();
   
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: isloading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 5.0,
                      shadowColor: const Color.fromARGB(255, 3, 94, 139),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.13,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${documents[index]['imageurl']}'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            documents[index]['title'],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1),
                                          ),
                                      
                                   
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    documents[index]['description'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                                  ),
                                    ],
                                      ),
                                 const SizedBox(width: 80,),
                                     
                                       IconButton(onPressed: (){
deleteValueFromDatabase(documents[index].id, documents[index]['imageurl']);
setState(() {
  documents.removeAt(index);
});
Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayBlogs()));
                                  }, icon: const Icon(Icons.delete, color: Colors.red,)),
                                   ],
                                  ),
                                 
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }
}
