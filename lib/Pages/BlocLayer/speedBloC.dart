import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

enum PostionEvent { currantpositionchanged, lastpositionchanged }

class PositionBloc extends Bloc<PostionEvent, Position> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currantposition;
  Position _lastPosition;

  @override
  Position get initialState => new Position();

  @override
  Stream<Position> mapEventToState(PostionEvent event) async* {
    // Logic

    if (event == PostionEvent.currantpositionchanged) {
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        _currantposition = position;
      }).catchError((e) {
        print(e);
      });
      yield _currantposition;
    } else if (event == PostionEvent.lastpositionchanged) {
      geolocator
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        _lastPosition = position;
      }).catchError((e) {
        print(e);
      });
      yield _lastPosition;
    } else {
      yield state;
    }
  }
}
