class Game{
  final String hiddenCardPath ='assets/images/hidden.png';
  List<String>? gameImg;


  final List<String> cardList=[
    "assets/images/circle.png",
    "assets/images/heart.webp",
    "assets/images/circle.png",
    "assets/images/triangle.jpg",
    "assets/images/heart.webp",
    "assets/images/triangle.jpg",
    "assets/images/star.jpg",
    "assets/images/star.jpg",
  ];
List<Map<int,String>> matchCheck =[];
  final int cardCount =8;

  void initGame(){
    gameImg=List.generate(cardCount, (index) => hiddenCardPath);
  }
}