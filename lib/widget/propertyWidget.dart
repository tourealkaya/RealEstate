import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:realestate/data/property.dart';
import 'dart:io';

class PropertyWidget extends StatefulWidget {
  final Property property;

  const PropertyWidget({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyWidgetState createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
  late Widget imageWidget;

  @override
  void initState() {
    super.initState();
    loadImageWidget();
  }

  Future<void> loadImageWidget() async {
    if (kIsWeb) {
      // Flutter Web: Load image from network
      imageWidget = Image.network(
        widget.property.imageUrl,
        width: 120,
        height: 120,
      );
    } else {
      // Mobile or Desktop: Load image from file or assets
      if (widget.property.imageUrl.startsWith('assets/')) {
        imageWidget = Image.asset(
          widget.property.imageUrl,
          width: 120,
          height: 120,
        );
      } else {
        // Use Image.file for local files on mobile
        imageWidget = Image.file(
          File(widget.property.imageUrl),
          width: 120,
          height: 120,
        );
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  void updateImage() async {
    await loadImageWidget();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, '/details', arguments: widget.property);
        updateImage();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            imageWidget,
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