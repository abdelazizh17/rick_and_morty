import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.character});
  final Character character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      leading: const BackButton(
        color: MyColors.myWhite,
      ),
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myDeepPurple,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontSize: 18,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myDeepPurple,
      thickness: 2,
    );
  }

  Widget displayStatus() {
    if (character.statusIfDeadOrAlive.isNotEmpty) {
      return Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                blurRadius: 20,
                color: MyColors.myDeepPurple,
                offset: Offset(2, 0),
              ),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(character.statusIfDeadOrAlive),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Species : ', character.species),
                      buildDivider(285),
                      characterInfo('Gender : ', character.gender),
                      buildDivider(290),
                      characterInfo('Location : ', character.location),
                      buildDivider(277),
                      const SizedBox(
                        height: 20,
                      ),
                      displayStatus(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 600,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
