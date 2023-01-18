// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player_app/utilities/view/core.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicPlayArtwork extends StatelessWidget {
  MusicPlayArtwork({Key? key, required this.id}) : super(key: key);
  dynamic id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.w,
        height: MediaQuery.of(context).size.height / 2.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80.w))),
        child: QueryArtworkWidget(
          id: id,
          type: ArtworkType.AUDIO,
          artworkBorder: BorderRadius.circular(
            14.0,
          ),
          nullArtworkWidget: Image.asset(
            newLogo,
            // width: MediaQuery.of(context).size.width,
            //  height: MediaQuery.of(context).size.height / 2.h,
          ),
        ),
      ),
    );
  }
}
