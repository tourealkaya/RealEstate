import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/data/property.dart';
import 'dart:io';

class PropertyDetailsWidget extends StatefulWidget {
  const PropertyDetailsWidget({Key? key}) : super(key: key);

  @override
  _PropertyDetailsWidgetState createState() => _PropertyDetailsWidgetState();
}

class _PropertyDetailsWidgetState extends State<PropertyDetailsWidget> {
  late Property property;

  @override
  Widget build(BuildContext context) {
    property = ModalRoute.of(context)!.settings.arguments as Property;

    return Scaffold(
      appBar: AppBar(
        title: Text("Property ${property.propertyId}"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context, property);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: property.propertType,
                items: ["House", "Apartment"]
                    .map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                onChanged: (selectedType) {
                  setState(() {
                    property.propertType = selectedType!;
                  });
                },
                decoration: const InputDecoration(labelText: "Type"),
              ),
              TextFormField(
                initialValue: "${property.numberOfRoom}",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (text) {
                  setState(() {
                    try {
                      property.numberOfRoom = int.parse(text);
                    } on FormatException {
                      // Exception
                    }
                  });
                },
                decoration: const InputDecoration(labelText: "Room"),
              ),
              TextFormField(
                initialValue: "${property.price}",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (text) {
                  setState(() {
                    try {
                      property.price = int.parse(text);
                    } on FormatException {
                      // Exception
                    }
                  });
                },
                decoration: const InputDecoration(labelText: "Price"),
              ),
              GestureDetector(
                onTap: () async {
                  await _pickImage();
                },
                child: buildImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    if (kIsWeb) {
      return Image.network(
        property.imageUrl,
        height: 300,
      );
    } else {
      if (property.imageUrl.startsWith('assets/')) {
        return Image.asset(
          property.imageUrl,
          height: 300,
        );
      } else {
        return Image.file(
          File(property.imageUrl),
          height: 300,
        );
      }
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print("Chemin de l'image de la galerie : ${pickedFile.path}");

      setState(() {
        property.imageUrl = pickedFile.path;
      });
    }
  }
}
