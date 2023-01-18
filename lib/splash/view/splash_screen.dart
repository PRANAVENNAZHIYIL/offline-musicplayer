import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/splash/view_model/splash_provider.dart';
import 'package:music_player_app/utilities/view/core.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<SplashProvider>().goHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.bottomRight,
              colors: [
                primary0,
                primary1,
              ],
            ),
          ),
        ),
        Center(
          child: Align(
            alignment: Alignment.center,
            child: FadeInDownBig(
              child: Container(
                height: 250,
                width: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/cloud.png",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
        ),
        Align(
          alignment: const AlignmentDirectional(
            0.1,
            0.3,
          ),
          child: FadeInUpBig(
            child: Text(
              "MusicPods",
              style: TextStyle(
                fontSize: 25,
                color: kWhite,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
