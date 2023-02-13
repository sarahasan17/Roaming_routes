import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelling_app/cubit/app_cubits.dart';
import '../widget/font1.dart';
import '../widget/font2.dart';
import '../widget/button_main.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({Key? key}) : super(key: key);

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  List text_1 = ["Travellers", "Exploring", "Live the"];
  List text_2 = ["Enjoy", "Can be fun", "Moment"];
  List image = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: image.length,
          itemBuilder: (_, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/" + image[index]),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 120, left: 40, right: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text1(size: 40, font: text_1[index]),
                            Text2(size: 43, font: text_2[index]),
                            const SizedBox(
                              height: 20,
                            ),
                            Text2(
                                size: 25,
                                color: Colors.grey[850],
                                font: "Adventures are the "),
                            Text2(
                                size: 25,
                                color: Colors.grey[850],
                                font: "best way to learn."),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context).getData();
                              },
                              child: Container(
                                  width: 200,
                                  child: const Button(text: " ", size: 150)),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(3, (index1) {
                            return Container(
                              margin: const EdgeInsets.all(3),
                              height: index == index1 ? 25 : 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == index1
                                      ? Colors.blueAccent
                                      : Colors.blue[300]),
                            );
                          }),
                        )
                      ]),
                ));
          }),
    );
  }
}
