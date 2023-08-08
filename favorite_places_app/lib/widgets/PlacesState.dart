import 'package:favorite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final data = [
  Place(title: 'Bathroom'),
];

class SthNotifier extends StateNotifier<List<Place>> {
  SthNotifier() : super(data);
}

final provider = StateNotifierProvider<SthNotifier, List<Place>>((ref) {
  return SthNotifier();
});
