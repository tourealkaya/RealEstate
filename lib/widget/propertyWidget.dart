import 'package:flutter/material.dart';
import 'package:realestate/repository/real_estate_repository.dart';
import 'package:realestate/data/property.dart';

class PropertyWidget extends StatefulWidget {
  final Property property;

  const PropertyWidget({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyWidgetState createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: widget.property)
            .then((_) => setState(() {}));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              child: Image.asset(
                widget.property.imageUrl,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Property ${widget.property.propertyId}"),
                  Text("${widget.property.propertType}  ${widget.property.numberOfRoom} rooms"),
                  Text("${widget.property.price}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
