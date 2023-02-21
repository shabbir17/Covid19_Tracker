// ignore_for_file: unused_local_variable

import 'package:covid_19_tracker_app/Services/states_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Model/world_states_model.dart';
import 'countries_list_screen.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
                future: statesServices.fetchWorldStatesRecords(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {

                  print(snapshot.data.toString());
                  if (!snapshot.hasData) {
                    return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                          controller: _controller,
                        ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          // ignore: prefer_const_literals_to_create_immutables
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recoverd": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths.toString())
                          },
                          chartValuesOptions:  const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),

                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          // ignore: prefer_const_constructors
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left),
                          // ignore: prefer_const_constructors
                          animationDuration: Duration(microseconds: 12000),
                          chartType: ChartType.ring,
                          ringStrokeWidth: 20.0,
                          colorList: colorList,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(title: "Total", value: snapshot.data!.cases.toString()),
                                ReusableRow(title: "Deaths", value: snapshot.data!.deaths.toString()),
                                ReusableRow(title: "Today Deaths", value: snapshot.data!.todayDeaths.toString()),
                                ReusableRow(title: "Recovered", value: snapshot.data!.recovered.toString()),
                                ReusableRow(title: "Active", value: snapshot.data!.active.toString()),
                                ReusableRow(title: "Critical", value: snapshot.data!.critical.toString()),
                                ReusableRow(title: "Testes", value: snapshot.data!.tests.toString()),
                                ReusableRow(title: "Today Recovered", value: snapshot.data!.todayRecovered.toString()),

                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CountriesListScreen();
                            }));
                  },
                          child: Container(
                            height: MediaQuery.of(context).size.height * .06,
                            decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("Track Countries"),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title;
  String value;

  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
