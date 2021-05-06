import 'dart:ui';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:timosh_app/ui/carsList.dart';
import 'After_AddAds.dart';
import 'client/hive_names.dart';
import 'package:rive/rive.dart';
import 'models/car.dart';

import 'package:hive_flutter/hive_flutter.dart';

class CallbackAnimation extends SimpleAnimation {
  CallbackAnimation(
    String animationName, {
    @required this.callback,
    double mix,
  }) : super(animationName, mix: mix);

  final Function callback;

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    instance.animation.apply(instance.time, coreContext: artboard, mix: mix);

    if (!instance.advance(elapsedSeconds)) {
      _onCompleted(callback);
    }
  }

  void _onCompleted(Function callback) {
    final start =
        instance.animation.enableWorkArea ? instance.animation.workStart : 0;
    final currentFrame = ((instance.time - start) * instance.animation.fps);
    final endFrame =
        instance.animation.enableWorkArea ? instance.animation.workEnd : 120;
    if (currentFrame >= endFrame - 1) {
      isActive = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => callback());
    }
  }
}

void main() async {
  await Hive.initFlutter();
  /*Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(AttributesAdapter());
  Hive.registerAdapter(MetaDataAdapter());*/
  await Hive.openBox<Car>(HiveBoxes.car);
  await Hive.openBox(HiveBoxes.account);
  /*FlareCache.doesPrune = false;
  final assetProvider =
      AssetFlare(bundle: rootBundle, name: 'assets/notlike.flr');
  final assetProvider1 =
      AssetFlare(bundle: rootBundle, name: "assets/nosearch.flr");
  final assetProvider2 =
      AssetFlare(bundle: rootBundle, name: "assets/showin.flr");
  // await Firebase.initializeApp();

  await cachedActor(assetProvider);
  await cachedActor(assetProvider1);
  await cachedActor(assetProvider2);*/
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  void dispose() async {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Roboto',
          accentColor: Color.fromRGBO(2, 7, 39, 1),
          primaryColorBrightness: Brightness.dark,
          brightness: Brightness.dark),
      home: HomePage(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      routes: <String, WidgetBuilder>{
        '/screen1': (BuildContext context) => new After_AddAds(),
        '/screen2': (BuildContext context) =>
            new CarsList(cars: savelistcars, intpage: 1),
        '/screen3': (BuildContext context) =>
            new CarsList(cars: {'results': []}, intpage: 1),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Artboard _artboard;
  CallbackAnimation _animation;

  // Has the animation finished
  bool _isAnimationComplete = false;

  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
    rootBundle.load('assets/internet.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller = SimpleAnimation('internet'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  /// Loads dat afrom a Rive file and initializes playback
  _loadRiveFile() async {
    // Load your Rive data
    final data = await rootBundle.load('assets/home.riv');
    // Create a RiveFile from the binary data
    final file = RiveFile();
    if (file.import(data)) {
      // Get the artboard containing the animation you want to play
      final artboard = file.mainArtboard;

      artboard.addController(
        _animation = CallbackAnimation(
          'home',
          callback: () {
            setState(() => _isAnimationComplete = true);
          },
        ),
      );

      // Wrapped in setState so the widget knows the artboard is ready to play
      setState(() => _artboard = artboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 7, 39, 1),
      body: FutureBuilder<Map<String, dynamic>>(
        //future: fetchPhotos(http.Client()),

        future: CarsProvider().fetchCars(filter),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Stack(children: [
              SafeArea(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(5, 30, 70, 1),
                            ),
                            padding: EdgeInsets.only(
                                left: 16, top: 12, right: 16, bottom: 12),
                            child: Text(
                              "Ой, проблема з інтернетом",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                          )))),
              Positioned.fill(
                  child: Center(
                      child: Text(
                "Тімош",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(5, 50, 100, 1),
                    fontSize: 34),
              ))),
              Center(
                child: Container(
                    //   margin: const EdgeInsets.only(top: 150.0),
                    width: MediaQuery.of(context).size.width * 0.85,
                    // height: MediaQuery.of(context).size.height - 150,
                    child:
                        /*FlareActor("assets/internet.flr",
                        alignment: Alignment.bottomCenter, callback: (value) {
                      topbul = false;
                    }, fit: BoxFit.contain, animation: "Internet")*/

                        _riveArtboard == null
                            ? Container()
                            : Rive(
                                artboard: _riveArtboard,
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter)),
              ),
            ]);
          }
          if (snapshot.hasData && _isAnimationComplete) {
            savelistcars = snapshot.data;
            return CarsList(cars: snapshot.data, intpage: 0);
          } else
            return Stack(children: [
              Center(
                  child: Text(
                "Тімош",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(5, 50, 100, 1),
                    fontSize: 34),
              )),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child:
                        /*FlareActor("assets/hop.flr",
                        alignment: Alignment.bottomCenter, callback: (value) {
                      setState(() {
                        topbul = true;
                      });
                    }, fit: BoxFit.contain, animation: "Untitled")
                    */
                        _artboard != null
                            ? Rive(
                                artboard: _artboard,
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter,
                              )
                            : Container()),
              )
            ]);
        },
      ),
    );
  }
}
