import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ForumPostForm extends StatefulWidget {
  @override
  _ForumPostFormState createState() => _ForumPostFormState();
}

class _ForumPostFormState extends State<ForumPostForm> {
  final TextEditingController _textEditingController = TextEditingController();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedImage;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_selectedImage != null)
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.file(
                _selectedImage!.path as File,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text("Attach Image"),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Type your paragraph here...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform your post submission logic here
              String text = _textEditingController.text;
            },
            child: Text("Submit Post"),
          ),
        ],
      ),
    );
  }
}
