import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../BlocLayer/speedBloC.dart';

class Speed extends StatefulWidget {
  Speed({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  PositionBloc positionBloc;
  int timeInSeconds = 0;
  @override
  void initState() {
    super.initState();
    positionBloc = PositionBloc();
  }

  @override
  void dispose() {
    super.dispose();
    positionBloc.close();
  }

  Position p;
  @override
  Widget build(BuildContext context) {
    double speedOfCurrentPostion;
    double speedOfLastPostion;
    Position _currentPosition;
    Position _lastPosition;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(65.0),
                child: FlatButton(
                    onPressed: () {
                      positionBloc.add(PostionEvent.currantpositionchanged);
                    },
                    child: Text("Current Speed",
                        style: TextStyle(
                          fontSize: 30,
                        )))),
            BlocBuilder<PositionBloc, Position>(
              bloc: positionBloc,
              builder: (context, state) {
                if (state != null) {
                  _currentPosition = state;
                  speedOfCurrentPostion = state.speed;
                  if (speedOfCurrentPostion != null) {
                    speedOfCurrentPostion =
                        ((18 / 5) * (state.speed)).roundToDouble();
                  } else {
                    speedOfCurrentPostion = 0.0;
                  }

                  return Text('$speedOfCurrentPostion',
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: "Digital",
                        color: Colors.green,
                      ));
                } else {
                  return Text("0.0",
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: "Digital",
                        color: Colors.green,
                      ));
                }
              },
            ),
            new Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Kmh",
                    style: TextStyle(
                      fontSize: 25,
                    ))),
            new Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlatButton(
                    onPressed: () {
                      positionBloc.add(PostionEvent.lastpositionchanged);
                    },
                    child: Text("From 10 to 30",
                        style: TextStyle(
                          fontSize: 30,
                        )))),
            BlocBuilder<PositionBloc, Position>(
              bloc: positionBloc,
              builder: (context, state) {
                if (state != null) {
                  _lastPosition = state;
                  speedOfLastPostion = state.speed;
                  if (speedOfLastPostion != null) {
                    speedOfLastPostion =
                        ((18 / 5) * (state.speed)).roundToDouble();
                  } else {
                    speedOfCurrentPostion = 0.0;
                  }

                  while (speedOfLastPostion == 10.0 ||
                      speedOfCurrentPostion == 30.0) {
                    int timeofCurrentSpeed = _currentPosition.timestamp.second;
                    int timeoflastSpeed = _lastPosition.timestamp.second;

                    int timeBtween = timeofCurrentSpeed - timeoflastSpeed;

                    return Text('$timeBtween',
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: "Digital",
                          color: Colors.green,
                        ));
                  }
                  return Text("0",
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: "Digital",
                        color: Colors.green,
                      ));
                } else {
                  return Text("0",
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: "Digital",
                        color: Colors.green,
                      ));
                }
              },
            ),
            new Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Seconds",
                    style: TextStyle(
                      fontSize: 25,
                    ))),
            new Padding(
                padding: const EdgeInsets.all(15.0),
                child: FlatButton(
                    onPressed: () {
                      positionBloc.add(PostionEvent.lastpositionchanged);
                    },
                    child: Text("From 30 to 10",
                        style: TextStyle(
                          fontSize: 30,
                        )))),
            BlocBuilder<PositionBloc, Position>(
              bloc: positionBloc,
              builder: (context, state) {
                if (state != null) {
                  _lastPosition = state;
                  speedOfLastPostion = state.speed;
                  if (speedOfLastPostion != null) {
                    speedOfLastPostion =
                        ((18 / 5) * (state.speed)).roundToDouble();
                  } else {
                    speedOfCurrentPostion = 0.0;
                  }

                  while (speedOfCurrentPostion == 10.0 ||
                      speedOfLastPostion == 30.0) {
                    int timeofCurrentSpeed = _currentPosition.timestamp.second;
                    int timeoflastSpeed = _lastPosition.timestamp.second;

                    int timeBtween = timeofCurrentSpeed - timeoflastSpeed;

                    return Text('$timeBtween',
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: "Digital",
                          color: Colors.green,
                        ));
                  }
                  return Text("0",
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: "Digital",
                        color: Colors.green,
                      ));
                } else {
                  return Text("0",
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: "Digital",
                        color: Colors.green,
                      ));
                }
              },
            ),
            new Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Seconds",
                    style: TextStyle(
                      fontSize: 25,
                    )))
          ],
        ),
      ),
    );
  }
}
