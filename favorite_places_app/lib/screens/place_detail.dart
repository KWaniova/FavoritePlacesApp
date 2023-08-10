import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(children: [
        Image.file(
          place.image!,
          width: double.infinity,
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // const CircleAvatar(radius: 70),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Colors.black,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Text(
                    place.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
