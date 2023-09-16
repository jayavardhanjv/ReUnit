import 'dart:math';

String generateUniqueId() {
  // Get the current timestamp in milliseconds
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  // Generate a random number
  int random = Random().nextInt(10000);

  // Combine the timestamp and random number to create a unique ID
  String uniqueId = '$timestamp$random';

  return uniqueId;
}
