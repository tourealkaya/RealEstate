/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/data/property.dart';
import 'package:image_picker/image_picker.dart';

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = ModalRoute.of(context)!.settings.arguments as Property;

    return Scaffold(
      appBar: AppBar(
        title: Text("Property ${property.propertyId}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: "${property.propertyId}",
              decoration: const InputDecoration(labelText: "Property ID"),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: property.propertType,
              onChanged: (text) {
                property.propertType = text;
              },
              decoration: const InputDecoration(labelText: "Type"),
            ),
            TextFormField(
              initialValue: "${property.numberOfRoom}",
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (text) {
                try {
                  property.numberOfRoom = int.parse(text);
                } on FormatException {
                  //exception
                }
              },
              decoration: const InputDecoration(labelText: "Room"),
            ),
            TextFormField(
              initialValue: "${property.price}",
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (text) {
                try {
                  property.price = int.parse(text);
                } on FormatException {
                  //exception
                }
              },
              decoration: const InputDecoration(labelText: "Price"),
            ),
              Image.asset(
                property.imageUrl,
              ),
          ],
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/data/property.dart';

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
        //title: Text("Property ${property.propertyId}"),
       /* leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),*/
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: "${property.propertyId}",
              decoration: const InputDecoration(labelText: "Property ID"),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              initialValue: property.propertType,
              onChanged: (text) {
                setState(() {
                  property.propertType = text;
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
                    //exception
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
                    //exception
                  }
                });
              },
              decoration: const InputDecoration(labelText: "Price"),
            ),
            GestureDetector(
              onTap: _pickImage,
              child: Image.asset(
                property.imageUrl,
              ),
            ),
          ],
        ),
      ),
    );
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