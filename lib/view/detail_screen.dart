import 'package:covid_19_tracker_app/view/world_states_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String? image;
  String? name;
  int? totalCases, totalDeath, active, critical, todayRecovered, test,totalRecovered;

  DetailScreen(
      {required this.image,
      required this.name,
      required this.totalCases,
      required this.totalDeath,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.test,
      required this.totalRecovered
      });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(widget.name!),
      centerTitle: true,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.066),
              child: Card(
                child: Column(
                  children: [
                    ReusableRow(title: 'Cases', value:widget.totalCases.toString()),
                    ReusableRow(title: 'Today Recovered', value:widget.todayRecovered.toString()),
                    ReusableRow(title: 'Total Recovered ', value:widget.totalRecovered.toString()),
                    ReusableRow(title: 'Critical', value:widget.critical.toString()),
                    ReusableRow(title: 'Active', value:widget.active.toString()),
                    ReusableRow(title: 'Test', value:widget.test.toString()),
                    ReusableRow(title: 'Death', value:widget.totalDeath.toString()),
                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.image!),
            )
          ],
        )


      ],
    ),);
  }
}
