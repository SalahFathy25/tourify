import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  final List<Map<String, String>> videos = const [
    {"title": "Explore Egypt", "videoId": "5-itlcXI8C8"},
    {"title": "Medinet Habu Egypt Virtual Tour", "videoId": "fsQiaQhw_IM"},
    {"title": "Valley of the kings", "videoId": "AeM74XzJrN0"},
    {
      "title": "Temple of Hatshepsut, Egypt's Most Powerful Queen",
      "videoId": "xWCcNK-a8bQ"
    },
    {"title": "Exploring the real Egypt", "videoId": "6MG-eF_Um-c"},
    {"title": "Island Temple of Isis, Philae ", "videoId": "pemoNsAYWhc"},
    {"title": "The Pyramids of Giza", "videoId": "0o9NRVhPmhs"},
    {
      "title": "Experience the Great Pyramids of Egypt in 360 VR",
      "videoId": "XSOBntGm4UY"
    },
    {"title": "Karnak Temple Egypt Virtual Tour", "videoId": "VtI9debZPGU"},
    {"title": "Underwater Life, Marsa Alam, Egypt", "videoId": "eKumVFvGHFA"},
    {"title": "Abu Simbel Egypt Virtual Tour", "videoId": "zaH5ZGu4vk8"},
    {"title": "Egypt's Greatest Temple: Karnak", "videoId": "R-A74cymE_s"},
    {"title": "Step Pyramid of Djoser | Egypt", "videoId": "IHwyoczYPMs"},
    {"title": "Luxor, City of Pharaohs | Egypt", "videoId": "lNklJi2mVLY"},
    {
      "title": "Medinet Habu, Temple of Ramses III | Egypt",
      "videoId": "WpjXDt6jnpM"
    },
    {
      "title": "Abu Simbel, Temple of Ramses II | Egypt",
      "videoId": "_R__0r8H1pM"
    },
    {
      "title": "Sail the Nile River Egypt Virtual Tour",
      "videoId": "FRIx7R_E9sM"
    },
    {
      "title":
          "Citadel of Cairo, Egypt Virtual Tour| Mosque of Muhammad Ali Pasha",
      "videoId": "4DtokS96qtc"
    },
    {"title": "Qasr AL-Baron", "videoId": "VHH7HFhKwss"},
    {"title": "Explore Cairo in 360° - VR city tour", "videoId": "yF8W85JwJwU"},
    {
      "title": "Mortuary Temple of Queen Hatshepsut VR",
      "videoId": "oqrvRNW4nIk"
    },
    {"title": "Pyramids of Egypt Virtual Tour", "videoId": "mOuvAJRknXk"},
    {
      "title": "Virtual Egypt: The Biggest Egyptian Temple - Karnak",
      "videoId": "9_6inr3KLx0"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Videos",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        backgroundColor: Color(0xFF203A58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            String videoId = videos[index]["videoId"]!;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerPage(
                        videoId: videoId, title: videos[index]["title"]!),
                  ),
                );
              },
              child: Hero(
                tag: videoId,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.network(
                          'https://img.youtube.com/vi/$videoId/0.jpg',
                          width: double.infinity,
                          height: 200, // Large thumbnail
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          videos[index]["title"]!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Video Player Page
class VideoPlayerPage extends StatefulWidget {
  final String videoId;
  final String title;

  const VideoPlayerPage(
      {super.key, required this.videoId, required this.title});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          // Video player at the top
          Hero(
            tag: widget.videoId,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              onReady: () {
                _controller.addListener(() {});
              },
            ),
          ),

          // Video title below
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          // Extra spacing to make it look clean
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
