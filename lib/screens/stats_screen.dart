import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otdohni_app/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:otdohni_app/model/data_model.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  //late List<DataModel> _chartData; // best version but that have some error
  late List<DataModel> _chartData = getChartData(); // change to best version

  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        _chartData = getChartData(); // good initialization version but that have some error
      },
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.statistics),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: secondaryColor,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        /// do something
                      },
                      child: Text('Week')),
                  ElevatedButton(
                      onPressed: () {
                        /// do something
                      },
                      child: Text('Month'))
                ],
              ),
              SfCartesianChart(
                series: <ChartSeries>[
                  ColumnSeries<DataModel, String>(
                      animationDuration: 10000,
                      dataSource: _chartData,
                      xValueMapper: (DataModel data, _) => data.day,
                      yValueMapper: (DataModel data, _) => data.data,
                      color: Color.fromRGBO(8, 142, 255, 1))
                ],
                primaryXAxis: CategoryAxis(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataModel> getChartData() {
    final List<DataModel> chartData = [
      DataModel(day: AppLocalizations.of(context)!.monday, data: 20.5),
      DataModel(day: AppLocalizations.of(context)!.tuesday, data: 45.8),
      DataModel(day: AppLocalizations.of(context)!.wednesday, data: 90.2),
      DataModel(day: AppLocalizations.of(context)!.thursday, data: 14.5),
      DataModel(day: AppLocalizations.of(context)!.friday, data: 47.1),
      DataModel(day: AppLocalizations.of(context)!.saturday, data: 6.9),
      DataModel(day: AppLocalizations.of(context)!.sunday, data: 9.6),
    ];
    return chartData;
  }
}
