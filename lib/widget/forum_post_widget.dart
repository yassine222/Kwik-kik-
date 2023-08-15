import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:popup_menu_2/contextual_menu.dart';
import 'package:popup_menu_2/popup_menu_item.dart';

class ForumPostWidget extends StatelessWidget {
  final String userName;
  final String userImageURL;
  final String datePosted;
  final String postImageURL;
  final String postContent;

  ForumPostWidget({
    required this.userName,
    required this.userImageURL,
    required this.datePosted,
    required this.postImageURL,
    required this.postContent,
  });
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userImageURL),
            ),
            title: Text(
              userName,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              datePosted,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
          Image.network(postImageURL),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(postContent),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LikeButton(
                        likeCount: 12,
                        likeBuilder: (isTapped) {
                          return Icon(
                            isTapped
                                ? Icons.thumb_up
                                : Icons.thumb_up_alt_outlined,
                            color: Colors.blue,
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      LikeButton(
                        likeCount: 12,
                        likeBuilder: (isTapped) {
                          return Icon(
                            isTapped ? Icons.favorite : Icons.favorite_border,
                            color: Colors.pink,
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      LikeButton(
                        likeCount: 12,
                        likeBuilder: (isTapped) {
                          return Icon(
                            isTapped
                                ? Icons.celebration
                                : Icons.celebration_outlined,
                            color: Color.fromARGB(255, 95, 219, 99),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
