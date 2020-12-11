import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;

  UserImagePicker(this.imagePickFn);
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickImage() async {
    PickedFile pickedImageFile =
        // await ImagePicker().getImage(source: ImageSource.gallery);
        await ImagePicker().getImage(
            source: ImageSource.gallery,
            imageQuality: 50,
            maxWidth: 150); //reduce imgage size and quality
    setState(() {
      _pickedImage = File(pickedImageFile.path);
    });
    widget.imagePickFn(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text('Add Profile Image')),
      ],
    );
  }
}
