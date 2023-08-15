import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendedBookWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String amazonLink;

  const RecommendedBookWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.amazonLink,
  });

  _launchAmazonURL() async {
    if (await canLaunch(amazonLink)) {
      await launch(amazonLink);
    } else {
      throw 'Could not launch $amazonLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                imageUrl,
                height: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'By $author',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                  onPressed: _launchAmazonURL,
                  icon: const Icon(FontAwesomeIcons.amazon),
                  label: const Text("Buy on Amazon")),
            ],
          ),
        ),
      ),
    );
  }
}
