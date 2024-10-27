import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridScreen(),
    );
  }
}

class GridScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://scontent.flpb1-1.fna.fbcdn.net/v/t1.6435-9/61283332_370497186911856_6254792071807238144_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=0Wn_PYMCqOAQ7kNvgFB36t9&_nc_zt=23&_nc_ht=scontent.flpb1-1.fna&_nc_gid=AHRj-o7mAfytBqQ0V3pXqSl&oh=00_AYB49G8Gx4esnGuBRZtJFvD8FPnf0-O5kHsHonROuFaJkQ&oe=67461E25',
    'https://cdn.pixabay.com/photo/2022/12/01/04/40/backpacker-7628303_1280.jpg',
    'https://img.freepik.com/fotos-premium/paisaje-anime_1230717-47274.jpg',
    'https://c.wallhere.com/photos/ff/fd/anime_landscape_sky_freedom_anime_girls_sunset_Pixiv_Fantasia-1948951.jpg!d',
    'https://c.wallhere.com/photos/7c/b1/anime_landscape_neon_colorful-1698735.jpg!d',
    'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2020/08/genshin-impact-2022393.jpg?tf=1200x',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grilla de Imagenes')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          int crossAxisCount = orientation == Orientation.portrait ? 2 : 3;
          return GridView.count(
            crossAxisCount: crossAxisCount,
            padding: EdgeInsets.all(8.0),
            children: List.generate(
              imageUrls.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl: imageUrls[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.network(
          imageUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
