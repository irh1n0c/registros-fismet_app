import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> submitTemperatureRecord({
    required String firstName,
    required String lastName,
    required String bodyTemp,
    required String temperatureUnit,
    required List<File> images,
  }) async {
    try {
      // Upload images and get their URLs
      List<String> imageUrls = await Future.wait(
        images.map((image) => _uploadImage(image))
      );

      // Add record to Firestore
      await _firestore.collection('temperature_records').add({
        'firstName': firstName,
        'lastName': lastName,
        'bodyTemperature': bodyTemp,
        'temperatureUnit': temperatureUnit,
        'imageUrls': imageUrls,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Error submitting temperature record: $e');
    }
  }

  Future<String> _uploadImage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = _storage.ref().child('temperature_images/$fileName');
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
}