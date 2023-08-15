import 'package:flutter/material.dart';

class CustomNewsWidget extends StatelessWidget {
  final String image;
  final String headline;
  final String author;
  final String createdAt;

  const CustomNewsWidget({
    required this.image,
    required this.headline,
    required this.author,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        // Headline
        Text(
          headline,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        // Author and posted date
        Row(
          children: [
            const Icon(
              Icons.person,
              size: 16,
              color: Colors.cyan,
            ),
            const SizedBox(width: 4),
            Text(author),
            const SizedBox(width: 8),
            const Icon(
              Icons.calendar_today,
              size: 16,
              color: Colors.cyan,
            ),
            const SizedBox(width: 4),
            Text(createdAt),
          ],
        ),
      ],
    );
  }
}
