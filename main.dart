import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kişilik Anketi'),
          backgroundColor: Color(0xffee7942),
        ),
        backgroundColor: Color(0xfffffafa),
        body: AnketForm(),
      ),
    );
  }
}

class AnketForm extends StatefulWidget {
  @override
  _AnketFormState createState() => _AnketFormState();
}

class _AnketFormState extends State<AnketForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _gender = 'Cinsiyetinizi Seçiniz';
  bool _isAdult = false;
  bool _smokes = false;
  double _cigarettesPerDay = 0;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Adınız ve Soyadınız'),
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          DropdownButton<String>(
            value: _gender,
            onChanged: (String? newValue) {
              setState(() {
                _gender = newValue!;
              });
            },
            items: <String>['Cinsiyetinizi Seçiniz', 'Erkek', 'Kadın', 'Diğer']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          CheckboxListTile(
            title: Text('Reşit misiniz?'),
            value: _isAdult,
            onChanged: (bool? value) {
              setState(() {
                _isAdult = value!;
              });
            },
          ),
          SizedBox(height: 16.0),
          SwitchListTile(
            title: Text('Sigara kullanıyor musunuz?'),
            value: _smokes,
            onChanged: (bool value) {
              setState(() {
                _smokes = value;
              });
            },
          ),
          if (_smokes)
            Column(
              children: [
                Text('Günde kaç tane sigara kullanıyorsunuz?'),
                Slider(
                  value: _cigarettesPerDay,
                  min: 0,
                  max: 40,
                  divisions: 40,
                  label: _cigarettesPerDay.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _cigarettesPerDay = value;
                    });
                  },
                ),
              ],
            ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffee7942), // Button color
            ),
            onPressed: () {
              setState(() {
                _submitted = true;
              });
            },
            child: Text('Bilgileri Gönder'),
          ),
          if (_submitted)
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Adınız ve Soyadınız: $_name'),
                  Text('Cinsiyet: $_gender'),
                  Text('Reşit misiniz?: ${_isAdult ? "Evet" : "Hayır"}'),
                  Text('Sigara kullanıyor musunuz?: ${_smokes ? "Evet" : "Hayır"}'),
                  if (_smokes)
                    Text('Günde kaç tane sigara kullanıyorsunuz?: ${_cigarettesPerDay.round()}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

