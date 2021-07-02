import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_app_expense_app/Controller/landing_page_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LandingPageController getLandingCon = Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    List dates = [
      "Last Payment 17 May",
      "Last Payment 26 May",
      "Last Payment 15 May",
      "Last Payment 28 May"
    ];

    return Scaffold(
      body: SafeArea(child:
         Container(
          height: _height,
          width: _width,
          color: Color(0xff1b1e31),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  "PAYMENT CATEGORIES",
                  style: TextStyle(
                      color: Color(0xff565975), fontSize: 12),
                ),
              ),
              cards(_height, _width),
              Container(
                height: 35,
                width: _width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            "LATEST TRANCTION",
                            style: TextStyle(
                                color: Color(0xff565975), fontSize: 12),
                          )),

                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Row(
                          children: [
                            Text(
                              "Show All  ",
                              style: TextStyle(
                                  color: Color(0xff565975), fontSize: 12),
                            ),
                            Icon(Icons.arrow_forward_ios_sharp,
                                size: 12, color: Color(0xff565975))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              listView(_height, _width),
            ],
          ),
      ),
      ),
    );
  }

  Widget listView(var _height, _width) {
    return Container(
      height: _height * 0.65 - 85,
      width: _width,
      child: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(
            Duration(seconds: 1),
                () {
                  getLandingCon.callAllMethods();
            },
          );
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: getLandingCon.transaction.length,
          itemBuilder: (context, index) {
            return Obx(() { return Container(
              height: 55,
              width: _width,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(left: 12, right: 12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff242947),
                              ),
                              child: SvgPicture.asset('Assets/images/transfer.svg'),
                            ),
                            Container(
                              width: 160,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getLandingCon.transaction[index].name,
                                    style: TextStyle(color: Color(0xfffefdff)),
                                  ),
                                  Text(
                                    getLandingCon.transaction[index].day,
                                    style: TextStyle(color: Color(0xff565975)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (getLandingCon.transaction[index].income
                                        ? "+ "
                                        : "- ") +
                                    "\u20B9" +
                                    getLandingCon.transaction[index].amt
                                        .toString(),
                                style: TextStyle(
                                    color: getLandingCon.transaction[index].income
                                        ? Color(0xff0dbb69)
                                        : Color(0xffd75875)),
                              ),
                              Text(
                                getLandingCon.transaction[index].time,
                                style: TextStyle(color: Color(0xff5b607b)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: _width,
                    child: Divider(
                      height: 1,
                      color: Color(0xff272a3d),
                    ),
                  ),
                ],
              ),
            );});
          },
        ),
      ),
    );
  }

  Widget cards(var _height, _width) {
    List dates = [
      "Last Payment 17 May",
      "Last Payment 26 May",
      "Last Payment 15 May",
      "Last Payment 28 May"
    ];
    List<int> col1=[0xff6052e4,0xff188de0,0xfff99875,0xfff99875];
    List<int> col2=[0xff857bef,0xff10a4a8,0xffe06b74,0xffe06b74];
    var fraction, scale;
    if (_width < 500) {
      fraction = 0.50;
      scale = 0.95;
    } else if (_width < 1000) {
      fraction = 0.40;
      scale = 0.95;
    } else {
      fraction = 0.20;
      scale = 0.95;
    }
    return Obx(() {
    return  Container(
      height: _height * 0.35,
      width: _width,
      child: new Swiper(
        itemCount: getLandingCon.spends.length,
        viewportFraction: fraction,
        scale: scale,
        loop: false,
        autoplay: false,
        autoplayDelay: 6000,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              width: _width,
              color: Colors.transparent,
              child: Card(
                elevation: 5,
                color: Color(0xff1b1e31),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.transparent,
                child: Container(
                  // height: 320,
                  color: Color(0xff1b1e31),
                  child: Column(
                    children: [
                      Container(
                        height: _height * 0.35 - 10,
                        width: _width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Material(
                          elevation: 0,
                          //color: Colors.blue,
                          color: Color(0xff1b1e31),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: Container(
                                height: _height * 0.35 - 10,
                                // color: Colors.red,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(col1[index]),
                                      Color(col2[index]),
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getLandingCon.spends[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Color(0xfff9feff)),
                                          ),
                                          Text(
                                            dates[index],
                                            style: TextStyle(
                                                color: Color(0xfff9feff)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\u20B9" +
                                                getLandingCon
                                                    .spends[index].spend
                                                    .toString(),
                                            style: TextStyle(
                                                color: Color(0xfff9feff)),
                                          ),
                                          Text(
                                            getLandingCon
                                                .spends[index].percentage
                                                .toString()+'%',
                                            style: TextStyle(
                                                color: Color(0xfff9feff)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );});
  }
}
