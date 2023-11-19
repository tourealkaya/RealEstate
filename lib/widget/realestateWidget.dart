import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:realestate/repository/real_estate_repository.dart';
import 'package:realestate/widget/propertyWidget.dart';
import 'package:flutter/services.dart';

class RealEstateWidget extends StatelessWidget {
  const RealEstateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final propertyRepository = GetIt.instance<RealEstateRepository>();
    final properties = propertyRepository.properties;

    return Scaffold(
      appBar: AppBar(
          title: const Text("Real Estate")),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (BuildContext context, int index) {
          return PropertyWidget(property: properties[index]);
        },
      ),
    );
  }
}
