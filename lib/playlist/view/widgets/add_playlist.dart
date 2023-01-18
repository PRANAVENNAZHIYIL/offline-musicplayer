import 'package:flutter/material.dart';
import 'package:music_player_app/all_songs/view_model/allsongs_provider.dart';
import 'package:music_player_app/playlist/view_model/fuctions/playlist_button_fn.dart';
import 'package:music_player_app/playlist/view_model/fuctions/playlist_functions.dart';
import 'package:music_player_app/utilities/view/body_container.dart';
import 'package:music_player_app/utilities/view/core.dart';
import 'package:music_player_app/utilities/view/main_empty_widget.dart';
import 'package:music_player_app/utilities/view/main_text_widget.dart';
import 'package:music_player_app/utilities/view/query_art.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

class AddSongsToPlayList extends StatelessWidget {
  final int folderIndex;
  const AddSongsToPlayList({Key? key, required this.folderIndex})
      : super(key: key);
  static List<dynamic> updatelist = [];
  static List<dynamic> dltlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAmber,
        title: Text(
            "Songs are adding to ${context.read<PlaylistProviderFuctions>().playlistNotifier[folderIndex].name} "),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: context.read<AllsongsProvider>().audioQuery.querySongs(
            sortType: SongSortType.DURATION,
            orderType: OrderType.DESC_OR_GREATER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true),
        builder: (context, item) {
          if (item.data == null) {
            return Column(
              children: const [
                BodyContainer(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            );
          }
          if (item.data!.isEmpty) {
            return const MainItemEmpty();
          }
          context.read<AllsongsProvider>().songs.clear();
          context.read<AllsongsProvider>().songs = item.data!;

          return BodyContainer(
            child:
                Consumer<PlaylistButtonFunctions>(builder: (context, value, _) {
              return ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    onTap: () async {},
                    leading: QueryArtImage(
                      songModel: context.read<AllsongsProvider>().songs[index],
                      artworkType: ArtworkType.AUDIO,
                    ),
                    title: MainTextWidget(
                      title:
                          context.read<AllsongsProvider>().songs[index].title,
                    ),
                    subtitle: MainTextWidget(
                      title: context
                              .read<AllsongsProvider>()
                              .songs[index]
                              .artist ??
                          "No Artist",
                    ),
                    trailing:
                        context.watch<PlaylistButtonFunctions>().playlistButton(
                              context,
                              index,
                              folderIndex,
                              context.read<AllsongsProvider>().songs[index].id,
                            ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    color: kWhite,
                  );
                },
                itemCount: context.read<AllsongsProvider>().songs.length,
              );
            }),
          );
        },
      ),
    );
  }
}
