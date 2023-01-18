import 'package:flutter/material.dart';
import 'package:music_player_app/utilities/view/body_container.dart';
import 'package:music_player_app/utilities/view/core.dart';
import 'package:music_player_app/utilities/view/main_text_widget.dart';
import 'package:music_player_app/utilities/view/query_art.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import '../../../all_songs/view_model/allsongs_provider.dart';
import '../../../playing_music/view/music_play.dart';
import '../../../playing_music/view_model/music_utilities.dart';
import '../../view_model/fuctions/playlist_functions.dart';
import '../widgets/add_playlist.dart';

class PlayListHomeScreen extends StatelessWidget {
  final int folderIndex;
  const PlayListHomeScreen({Key? key, required this.folderIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<PlaylistProviderFuctions>(context, listen: false)
            .getallPlaylists();
        Provider.of<PlaylistProviderFuctions>(context, listen: false)
            .showSelectSong(context, folderIndex);
      },
    );

    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        title: Text(context
            .read<PlaylistProviderFuctions>()
            .playlistNotifier[folderIndex]
            .name),
        backgroundColor: kAmber,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => AddSongsToPlayList(
                      folderIndex: folderIndex,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.playlist_add,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<PlaylistProviderFuctions>(
        builder: (context, value, child) {
          return BodyContainer(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MusicScreen(),
                        ),
                      );
                      context.read<MusicUtils>().playCheck(context, index);
                    },
                    leading: QueryArtImage(
                      songModel: context.read<AllsongsProvider>().songs[context
                          .read<PlaylistProviderFuctions>()
                          .selectPlaySong[index]],
                      artworkType: ArtworkType.AUDIO,
                    ),
                    title: MainTextWidget(
                      title: context
                          .read<AllsongsProvider>()
                          .songs[context
                              .read<PlaylistProviderFuctions>()
                              .selectPlaySong[index]]
                          .title,
                    ),
                    subtitle: MainTextWidget(
                      title: context
                          .read<AllsongsProvider>()
                          .songs[context
                              .read<PlaylistProviderFuctions>()
                              .selectPlaySong[index]]
                          .artist
                          .toString(),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    color: kWhite,
                  );
                },
                itemCount: context
                    .read<PlaylistProviderFuctions>()
                    .selectPlaySong
                    .length,
              ),
            ),
          );
        },
      ),
    );
  }

  // showdeleteBox(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext ctx) {
  //       return AlertDialog(
  //         title: const Text(
  //           "Details",
  //         ),
  //         content: const Text(
  //           "Clear Playlist",
  //           style: TextStyle(
  //             color: Color.fromARGB(117, 0, 0, 0),
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               primary: const Color.fromARGB(255, 42, 11, 99),
  //               onPrimary: kWhite,
  //             ),
  //             child: const Text("cancel"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               primary: kAmber,
  //               onPrimary: kWhite,
  //             ),
  //             child: const Text(
  //               "Clear",
  //             ),
  //             onPressed: () {},
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
