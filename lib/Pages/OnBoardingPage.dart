import 'package:flutter/material.dart';
import 'package:y2ztest/CONST/AppColors.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBordingPageState createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  final List<Map<String, dynamic>>? sliderListImages = [
    {
      'id': 1,
      'image_url': 'assets/img1.jpg',
    },
    {
      'id': 2,
      'image_url': 'assets/img2.jpg',
    },
    {
      'id': 3,
      'image_url': 'assets/img3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SizedBox(
          width: screenwidth,
          height: screenheight,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    // pageSnapping: true,
                    // allowImplicitScrolling: ,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: sliderListImages!.length,
                    itemBuilder: (context, index) {
                      // contents of slider
                      return Image.asset(
                        sliderListImages![index]["image_url"],
                        width: screenwidth,
                        height: screenheight * .80,
                        fit: BoxFit.contain,
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sliderListImages!.length,
                  (index) => buildDot(index, context),
                ),
              ),
              SizedBox(
                  width: screenwidth,
                  height: screenheight * .10,
                  child: currentIndex == sliderListImages!.length - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: screenheight * .037,
                              margin: const EdgeInsets.all(18),
                              width: screenwidth * .19,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blueGrey,
                                  backgroundColor: Colors.blue,
                                  disabledForegroundColor:
                                      Colors.blue.withOpacity(0.38),
                                  disabledBackgroundColor:
                                      Colors.blue.withOpacity(0.12),
                                  side: const BorderSide(
                                    width: 2.0,
                                    color: AppColors.kAccentColor,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  if (currentIndex ==
                                      sliderListImages!.length - 1) {
                                    Navigator.of(context).pushNamed("/login");
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : Container()),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kAccentColor,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 1);
  }
}
