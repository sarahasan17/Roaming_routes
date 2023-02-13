import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelling_app/cubit/app_cubit_state.dart';
import 'package:travelling_app/cubit/app_cubits.dart';
import 'package:travelling_app/widget/font2.dart';
import 'package:travelling_app/widget/font1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    "balloning.png": "balloning",
    "hiking.png": "hiking",
    "kayaking.png": "kayaking",
    "snorkling.png": "snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, Cubitstate>(builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, color: Colors.black54, size: 40),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text2(font: "Discover")),
                const SizedBox(
                  height: 17,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: TabBar(
                      controller: tabcontroller,
                      labelPadding: const EdgeInsets.only(left: 20, right: 30),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: labelcolor(color: Colors.black54, Radius: 3),
                      isScrollable: true,
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "Inspiration"),
                        Tab(text: "Emotions"),
                      ]),
                ),
                Container(
                  height: 270,
                  child: TabBarView(
                    controller: tabcontroller,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailpage(info[index]);
                            },
                            child: Container(
                              width: 200,
                              height: 280,
                              margin:
                                  const EdgeInsets.only(right: 8.0, top: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                  )),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 280,
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("image/mountain.png"))),
                            );
                          }),
                      ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .detailpage(info[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: 10.0, right: 10, left: 10),
                                height: 40,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.lightBlueAccent[200]),
                                child: Text2(font: info[index].location),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text1(font: "Explore more", size: 22),
                      Text2(
                        font: "see also",
                        size: 15,
                        color: Colors.blue[800],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 110,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 85,
                                height: 85,
                                margin: const EdgeInsets.only(right: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "image/${image.keys.elementAt(index)}"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Center(
                                child: Text2(
                                    font: image.values.elementAt(index),
                                    size: 15.0),
                              )
                            ],
                          );
                        }),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

class labelcolor extends Decoration {
  final Color color;
  double Radius;
  labelcolor({required this.color, required this.Radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _Labelcolor2(color: color, Radius: Radius);
  }
}

class _Labelcolor2 extends BoxPainter {
  @override
  final Color color;
  double Radius;
  _Labelcolor2({required this.color, required this.Radius});
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _Paint = Paint();
    _Paint.color = color;
    _Paint.isAntiAlias = true;
    final Offset circleoffset = Offset(
        configuration.size!.width / 2 + Radius / 2,
        configuration.size!.height - Radius);
    canvas.drawCircle(offset + circleoffset, Radius, _Paint);
    // TODO: implement paint
  }
}
