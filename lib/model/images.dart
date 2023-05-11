class Images{
    String imageURl;
  String name;
  String image;
  String text;

Images(this.imageURl, this.name,this.image, this.text);

 static  List<Images> allImages()
  {
    var imageList =  <Images>[];


    imageList.add( Images('assets/images/nature.jpg', 'Color in UI design:\nA (Practical)\nFramework', 'assets/images/girl.jpg', 'Christina'));
    imageList.add( Images('assets/images/hills.jpg', 'Why is UI?UX designer\nbest job in the\nworld', 'assets/images/girl.jpg', 'Christina'));
   
  
    return imageList;
  }
  }