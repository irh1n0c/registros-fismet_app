import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'extensions.dart';
import 'validators.dart';

class TemperatureForm extends StatefulWidget {
  const TemperatureForm({Key? key}) : super(key: key);

  @override
  _TemperatureFormState createState() => _TemperatureFormState();
}

class _TemperatureFormState extends State<TemperatureForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  
  String firstName = "";
  String lastName = "";
  String bodyTemp = "";
  int? temperatureUnit;
  List<XFile> images = [];

  Future<void> _submitToFirestore() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _firestore.collection('temperature_records').add({
          'firstName': firstName,
          'lastName': lastName,
          'bodyTemperature': bodyTemp,
          'temperatureUnit': temperatureUnit == 1 ? 'Celsius' : 'Fahrenheit',
          'timestamp': FieldValue.serverTimestamp(),
        });
        _showSuccessDialog();
      } catch (e) {
        _showErrorDialog('Error saving data: $e');
      }
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        images.add(image);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  void _showSuccessDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data Submitted Successfully'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Full name:", style: TextStyle(fontWeight: FontWeight.w700)),
                Text("$firstName $lastName"),
                const SizedBox(height: 10),
                const Text("Body Temperature:", style: TextStyle(fontWeight: FontWeight.w700)),
                Text("$bodyTemp ${temperatureUnit == 1 ? "ºC" : "ºF"}"),
                const SizedBox(height: 10),
                const Text("Images:", style: TextStyle(fontWeight: FontWeight.w700)),
                Text("${images.length} image(s) selected"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
                _formKey.currentState?.reset();
                setState(() {
                  firstName = "";
                  lastName = "";
                  bodyTemp = "";
                  temperatureUnit = null;
                  images.clear();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'First Name'),
            onChanged: (value) => setState(() => firstName = value.capitalize()),
            validator: Validators.validateName,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Last Name'),
            onChanged: (value) => setState(() => lastName = value.capitalize()),
            validator: Validators.validateName,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Body Temperature'),
            keyboardType: TextInputType.number,
            onChanged: (value) => setState(() => bodyTemp = value),
            validator: Validators.validateTemperature,
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<int>(
            items: const [
              DropdownMenuItem(child: Text("ºC"), value: 1),
              // ignore: sort_child_properties_last
              DropdownMenuItem(child: Text("ºF"), value: 2),
            ],
            hint: const Text("Select unit"),
            onChanged: (value) => setState(() => temperatureUnit = value),
            validator: (value) => value == null ? 'Please select a unit' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text("Pick Image"),
          ),
          const SizedBox(height: 10),
          if (images.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Image.file(File(images[index].path), height: 100, width: 100, fit: BoxFit.cover),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: GestureDetector(
                          onTap: () => _removeImage(index),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(60)),
            onPressed: _submitToFirestore,
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}