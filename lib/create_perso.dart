import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:shared_preferences/shared_preferences.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}


enum DiabTreatment { insu_pump, multi_inj }

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}



// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  DiabTreatment _trt = DiabTreatment.multi_inj;
  @override

  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    String? name;
    int? weight;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Prénom"),
            onSaved: (value){name=value;},
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre prénom';
              }
              return null;
            },
          ),
          TextFormField(
            onSaved: (value){weight=value as int;},
            decoration: const InputDecoration(labelText: "Poids"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre poids';
              }
              return null;
            },
          ),
          ListTile(
            title: const Text('Pompe à insuline'),
            leading: Radio(
              value: DiabTreatment.insu_pump,
              groupValue: _trt,
              onChanged:(val){
                setState(() {
                  _trt=DiabTreatment.insu_pump;
                });
              },
              activeColor: Colors.green,
              toggleable: true,
            ),
          ),
          ListTile(
            title: const Text('Multi injection d insulines'),
            leading: Radio(
              value: DiabTreatment.multi_inj,
              groupValue: _trt,
              onChanged: (val) {
                setState(() {
                  _trt = DiabTreatment.multi_inj;
                });
              },
              activeColor: Colors.green,
              toggleable: true,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data...')),
                  );
                  _save(name, weight);
                  _read();
                }
              },
              child: const Text('Submit'),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('Read'),
              onPressed: () {
                _read();
              },
            ),
          ),*/
        ],
      ),
    );
  }
  _read() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'weight';
    final poids = prefs.getInt(key);
    print('read ---- $poids');
    if(poids != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('read -: $poids')),
      );
    }
  }

  _save(String? name, int? weight) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'treatment';
    final value = _trt;
    String val;
    if(value == DiabTreatment.multi_inj){
      val="Multi injection";
    }
    else{
      val="Pompe à insuline";
    }
    prefs.setString(key, val);
    prefs.setString("name",name!);
    prefs.setInt("weight", weight!);
    prefs.setBool("validated",true);
    print('saved --  $val');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('saved : $val , $name , $weight')),
    );
  }
}