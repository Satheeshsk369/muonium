import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MuoniumApp());

class MuoniumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muonium',
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _textEditingController = TextEditingController();
  String _pythonCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Muonium'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveFile,
          ),
          IconButton(
            icon: Icon(Icons.folder_open),
            onPressed: _openFile,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              maxLines: null,
              onChanged: (value) {
                setState(() {
                  _pythonCode = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Python Code',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Syntax Highlighted Code:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(
                  _pythonCode,
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveFile() {
    // Add your code here to save the file
    String code = _textEditingController.text;
    print('Saving file:\n$code');
  }

  void _openFile() {
    // Add your code here to open a file
    print('Opening file');
  }
}
