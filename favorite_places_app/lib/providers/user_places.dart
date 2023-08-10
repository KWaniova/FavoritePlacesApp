import 'dart:io';

import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/models/place_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File? image, PlaceLocation location) {
    state = [Place(title: title, image: image, location: location), ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) {
  return UserPlacesNotifier();
});
