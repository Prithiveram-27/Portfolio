// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../models/pageControlModel.dart';
import '../providers/googleSignInProvider.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late PageController _pageController;
  int _pageIndex = 0;
  int _indexPath = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pageControlList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: ((context, index) {
                    return pageControllerScreen(
                      pageControlList[index].imgPath,
                      pageControlList[index].title,
                      pageControlList[index].desc,
                      index,
                    );
                  }),
                ),
              ),
              _pageIndex != pageControlList.length - 1
                  ? Row(
                      children: [
                        ...List.generate(
                          pageControlList.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: dotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22)),
                              gradient: LinearGradient(colors: [
                                Colors.purpleAccent,
                                Colors.lightBlue
                              ]),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.swipe_right,
                                color: Colors.white,
                                //size: 48.0,
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [],
                    )
            ],
          ),
        )),
      ),
    );
  }
}

class dotIndicator extends StatelessWidget {
  const dotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 6,
      height: isActive ? 14 : 6,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.deepPurpleAccent
            : Colors.deepPurpleAccent.withOpacity(0.4),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      duration: Duration(milliseconds: 300),
    );
  }
}

final List<PageControlModel> pageControlList = [
  PageControlModel(
      "assets/images/pg1.jpg",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
  PageControlModel(
      "assets/images/pg2.jpg",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
  PageControlModel(
      "assets/images/pg3.jpg",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
];

class pageControllerScreen extends StatelessWidget {
  String pgImgPath;
  String title;
  String desc;
  int index;
  pageControllerScreen(this.pgImgPath, this.title, this.desc, this.index);
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    return Column(
      children: [
        const Spacer(),
        Image.asset(
          pgImgPath,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          desc,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        index == pageControlList.length - 1
            ? Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  gradient: LinearGradient(
                      colors: [Colors.purpleAccent, Colors.lightBlue]),
                ),
                child: InkWell(
                  onTap: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  child: Row(children: [
                    const Spacer(),
                    FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18,
                      ),
                    ),
                    const Spacer()
                  ]),
                ),
              )
            : Container(
                height: 5,
              ),
        const Spacer()
      ],
    );
  }
}
