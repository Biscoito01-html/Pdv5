import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;

class ImagePickter extends StatefulWidget {
  final Function setImage;
  const ImagePickter({super.key, required this.setImage});

  @override
  State<ImagePickter> createState() => _ImagePickterState();
}

class _ImagePickterState extends State<ImagePickter> {
  File? image;

  void getImage() async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 600);

    if (pickedFile == null) return;

    setState(() {
      image = File(pickedFile.path);
    });

    final appDir = await path_provider.getApplicationDocumentsDirectory();
    String fileName = path.basename(image!.path);
    image!.copy('${appDir.path}/$fileName');
    widget.setImage(image!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Center(
            child: image != null
                ? Image.file(
                    image!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const Text("Imagem"),
          ),
        ),
        TextButton(
          onPressed: getImage,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Selecionar imagem"),
              Icon(Icons.camera),
            ],
          ),
        ),
      ],
    );
  }
}