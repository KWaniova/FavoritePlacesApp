import 'package:favorite_places_app/screens/place_detail.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;

  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('Got no places yet, start adding some!'),
      );
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
              leading: places[index].image != null
                  ? CircleAvatar(
                      radius: 26,
                      backgroundImage: FileImage(places[index].image!),
                    )
                  : null,
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'longitude: ' +
                    places[index].location!.longitude!.toString() +
                    ', latitude: ' +
                    places[index].location!.latitude!.toString(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaceDetailScreen(place: places[index]),
                ));
                // Go to detail page ...
              },
            ));
  }
}
