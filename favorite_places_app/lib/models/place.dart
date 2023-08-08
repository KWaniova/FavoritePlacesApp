import 'package:uuid/uuid.dart';

import 'Location.dart';

final uuid = Uuid();

class Place {
  final String id;
  final String title;

  Place({
    required this.title,
  }) : id = uuid.v4();
}
