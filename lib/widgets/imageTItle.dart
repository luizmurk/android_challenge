import 'package:flutter/material.dart';
import '../models/data.dart';

class ImageTitle extends StatelessWidget {
  final String image_title;
  final String image_description;
  final String image_url;
  final Color title_text_color;
  final int title_font_size;
  final Color description_text_color;
  final int description_font_size;
  ImageTitle(
      this.image_title,
      this.image_description,
      this.image_url,
      this.title_text_color,
      this.title_font_size,
      this.description_text_color,
      this.description_font_size);

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image_url),
                  fit: BoxFit.cover,
                ),
              ),
              child: null /* add child content here */,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(image_title,
                        style: TextStyle(
                            color: title_text_color,
                            fontSize: title_font_size.toDouble())),
                    SizedBox(
                      height: 5,
                    ),
                    Text(image_description,
                        style: TextStyle(
                            color: description_text_color,
                            fontSize: description_font_size.toDouble()))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
