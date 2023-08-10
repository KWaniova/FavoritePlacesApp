import 'package:favorite_places_app/models/place_location.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});

  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  bool _isGettingLocation = false;
  PlaceLocation? _pickedLocation;

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;

    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();
    setState(() {
      _isGettingLocation = false;
    });

    setState(() {
      _pickedLocation = PlaceLocation(
          latitude: locationData.latitude!, longitude: locationData.longitude!);
    });

    widget.onSelectLocation(_pickedLocation!);

    print("latitude >> " + locationData.latitude.toString());
    print("longitude >> " + locationData.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text("No location chosen",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ));
    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.2))),
            child: Center(child: previewContent)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
            ),
          ],
        )
      ],
    );
  }
}
