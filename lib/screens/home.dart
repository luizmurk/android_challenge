import 'package:enn_bee/widgets/imageTItle.dart';
import 'package:flutter/material.dart';
import '../repository/repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<dynamic> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Android Challenge'),
      ),
      body: FutureBuilder<dynamic>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data!["page"]["cards"];
            print("items here");
            print(items);
            final welcomeText = items[0]["card"]["value"];
            final welcomeTextColorCode =
                items[0]["card"]["attributes"]["text_color"];
            final welcomeTextFontSize =
                items[0]["card"]["attributes"]["font"]["size"];
            final Color color = HexColor(welcomeTextColorCode);

            final image1Url = items[2]["card"]["image"]["url"];
            final image1Title = items[2]["card"]["title"]["value"];
            final image1Description = items[2]["card"]["description"]["value"];
            final image1TitleTextColorCode =
                items[2]["card"]["title"]["attributes"]["text_color"];
            final Color image1Titlecolor = HexColor(image1TitleTextColorCode);
            final image1TitleTextFontSize =
                items[2]["card"]["title"]["attributes"]["font"]["size"];
            final image1DescriptionTextColorCode =
                items[2]["card"]["description"]["attributes"]["text_color"];
            final Color image1Descriptioncolor =
                HexColor(image1DescriptionTextColorCode);
            final image1DescriptionTextFontSize =
                items[2]["card"]["description"]["attributes"]["font"]["size"];

            final image2Url = items[4]["card"]["image"]["url"];
            final image2Title = items[4]["card"]["title"]["value"];
            final image2Description = items[4]["card"]["description"]["value"];
            final image2TitleTextColorCode =
                items[4]["card"]["title"]["attributes"]["text_color"];
            final Color image2Titlecolor = HexColor(image2TitleTextColorCode);
            final image2TitleTextFontSize =
                items[4]["card"]["title"]["attributes"]["font"]["size"];
            final image2DescriptionTextColorCode =
                items[4]["card"]["description"]["attributes"]["text_color"];
            final Color image2Descriptioncolor =
                HexColor(image2DescriptionTextColorCode);
            final image2DescriptionTextFontSize =
                items[4]["card"]["description"]["attributes"]["font"]["size"];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Text(welcomeText,
                          style: TextStyle(
                              color: color,
                              fontSize: welcomeTextFontSize.toDouble()))),
                  SizedBox(
                    height: 25,
                  ),
                  ImageTitle(
                      image1Title,
                      image1Description,
                      image1Url,
                      image1Titlecolor,
                      image1TitleTextFontSize,
                      image1Descriptioncolor,
                      image1DescriptionTextFontSize),
                  SizedBox(
                    height: 15,
                  ),
                  ImageTitle(
                      image2Title,
                      image2Description,
                      image2Url,
                      image2Titlecolor,
                      image2TitleTextFontSize,
                      image2Descriptioncolor,
                      image2DescriptionTextFontSize)
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return Center(child: const CircularProgressIndicator());
        },
      ));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
