import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Benefits extends StatefulWidget {
  const Benefits({super.key});

  @override
  State<Benefits> createState() => _BenefitsState();
}

class _BenefitsState extends State<Benefits> {
  //Url do video
  final videoUrl = "https://www.youtube.com/watch?v=XXplGH5v1P8&t=341s";

  late YoutubePlayerController controller;

  //Coisas para inicializar o video
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);

    controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: YoutubePlayerFlags(autoPlay: false),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6D7DB2),
      appBar: AppBar(backgroundColor: Color(0xFF6D7DB2)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 270,
              margin: EdgeInsets.only(bottom: 30, top: 30),
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFD3D1E8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "CBT-I Benefits",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Text(
                    """CBT-I focuses on exploring the connection between the way we think, the things we do, and how we sleep. During treatment, a trained CBT-I provider helps to identify thoughts, feelings, and behaviors that are contributing to the symptoms of insomnia.""",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            Container(
              height: 200,
              width: 300,
              child: YoutubePlayer(controller: controller)
            ),
          ],
        ),
      ),
    );
  }
}
