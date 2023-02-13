import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelling_app/cubit/app_cubit_state.dart';
import 'package:travelling_app/cubit/app_cubits.dart';
import 'package:travelling_app/widget/font2.dart';
import 'package:travelling_app/widget/font1.dart';
import '../widget/app_button.dart';
import 'package:travelling_app/widget/button_main.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({Key? key}) : super(key: key);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int Gottenstar = 4;
  int BoxColor = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, Cubitstate>(builder: (context, state) {
      if (state is DetailState) {
        DetailState detail = state as DetailState;
        return SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).gohome();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ))
                      ],
                    )),
                Positioned(
                    top: 250,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 30, right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text1(
                                  font: detail.place.name,
                                  color: Colors.black,
                                ),
                                Text1(
                                  font: "\$ ${detail.place.price}",
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.blueAccent,
                                ),
                                Text2(
                                    font: detail.place.location,
                                    color: Colors.blueAccent,
                                    size: 18),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            child: Row(
                              children: [
                                Wrap(
                                    children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star_outlined,
                                    color: index < detail.place.stars
                                        ? Colors.yellow
                                        : Colors.grey,
                                  );
                                })),
                                const SizedBox(width: 10.0),
                                Text1(
                                  font: "(5.0)",
                                  color: Colors.grey,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            alignment: Alignment.topLeft,
                            child: Text1(
                                font: "People",
                                color: Colors.grey[800],
                                size: 20.0),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            alignment: Alignment.topLeft,
                            child: Text2(
                              font: "Number of people in your group",
                              color: Colors.grey,
                              size: 15.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            child: Wrap(
                              children: List.generate(5, (index1) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      BoxColor = index1;
                                    });
                                  },
                                  child: Container(
                                    child: Appbutton(
                                      size: 60,
                                      color: index1 == BoxColor
                                          ? Colors.black
                                          : Colors.grey[300],
                                      backgroundcolor: Colors.black54,
                                      text: "$index1",
                                      textcolor: index1 == BoxColor
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            child: Text1(
                                font: "Description",
                                color: Colors.black.withOpacity(0.8),
                                size: 25),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20, left: 20),
                            child: Text2(
                              font: detail.place.description,
                              color: Colors.grey.withOpacity(0.8),
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 10,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Appbutton(
                            size: 55,
                            color: Colors.white,
                            backgroundcolor: Colors.black54,
                            icIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          SizedBox(width: 50),
                          Button(
                              text: "Book trip now", istext: true, size: 250),
                        ],
                      ),
                    ))
              ],
            ));
      } else {
        return Container();
      }
    }));
  }
}
