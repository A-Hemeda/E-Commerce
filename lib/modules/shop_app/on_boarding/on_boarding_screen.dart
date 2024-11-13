import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../shared/componants/componant.dart';
import '../login/login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body
  });
}

class onBoardingScreen extends StatefulWidget {

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'images/onBoarding1.jpeg',
        title: 'Screen Title 1',
        body: 'Screen Body 1',
    ),
    BoardingModel(
      image: 'images/onBoarding1.jpeg',
      title: 'Screen Title 2',
      body: 'Screen Body 2',
    ),
    BoardingModel(
      image: 'images/onBoarding1.jpeg',
      title: 'Screen Title 3',
      body: 'Screen Body 3',
    )
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                navigateTo(context, ShopLogingScreen());
              },
              child: Text('SKIP')
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (index){
                  if(index == boarding.length-1){
                    setState(() {
                      isLast = true;
                    });
                  } else{
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context,index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length ,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    expansionFactor: 2,
                    spacing: 5,
                    dotHeight: 10,
                    dotWidth: 10
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast == true){
                      navigateTo(context, ShopLogingScreen());
                    }
                    else{
                    boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                    );}
                  },
                  child: Icon(
                      Icons.arrow_forward_rounded,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage('${model.image}'))),
      SizedBox(
        height: 30,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
