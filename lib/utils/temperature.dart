import 'package:flutter/material.dart';
import '../utils/extensions.dart';
import '../utils/validators.dart';

class TemperatureForm extends StatefulWidget {
  const TemperatureForm({Key? key}) : super(key: key);

  @override
  _TemperatureFormState createState() => _TemperatureFormState();
}

class _TemperatureFormState extends State<TemperatureForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String firstName = "";
  String lastName = "";
  String bodyTemp = "";
  int? temperatureUnit;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Your information has been submitted'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Full name:", style: TextStyle(fontWeight: FontWeight.w700)),
                  Text("$firstName $lastName"),
                  const SizedBox(height: 10),
                  const Text("Body Temperature:", style: TextStyle(fontWeight: FontWeight.w700)),
                  Text("$bodyTemp ${temperatureUnit == 1 ? "ºC" : "ºF"}"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Go to profile', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/profile');
                  _formKey.currentState?.reset();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                  _formKey.currentState?.reset();
                },
              ),
            ],
          );
        },
      );
    }
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
              DropdownMenuItem(child: Text("ºF"), value: 2),
            ],
            hint: const Text("Select unit"),
            onChanged: (value) => setState(() => temperatureUnit = value),
            validator: (value) => value == null ? 'Please select a unit' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(60)),
            onPressed: _submit,
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}