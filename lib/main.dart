// Flutter code sample for NavigationRail

// This example shows a [NavigationRail] used within a Scaffold with 3
// [NavigationRailDestination]s. The main content is separated by a divider
// (although elevation on the navigation rail can be used instead). The
// `_selectedIndex` is updated by the `onDestinationSelected` callback.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_home/styles.dart' as styles;

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: FlutterHomeApp(),
    );
  }
}

class FlutterHomeApp extends StatefulWidget {
  FlutterHomeApp({Key key}) : super(key: key);

  @override
  _FlutterHomeAppState createState() => _FlutterHomeAppState();
}

class _FlutterHomeAppState extends State<FlutterHomeApp> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 50, 50, 100),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.black87,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.wifi_outlined, color: Colors.white),
                selectedIcon: Icon(Icons.wifi),
                label: Text('Connect', style: styles.navRailButtonStyle),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.home_work_outlined, color: Colors.white),
                selectedIcon: Icon(Icons.home_work),
                label: Text('Spaces', style: styles.navRailButtonStyle),
              ),
              // NavigationRailDestination(
              //   icon: Icon(Icons.star_border, color: Colors.white),
              //   selectedIcon: Icon(Icons.star),
              //   label: Text('Third', style: styles.navRailButtonStyle),
              // ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Text('Add the IP Address of your Homebridge Server',
                      style: styles.bodyText),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid IP address.';
                              }
                              return null;
                            },
                            style: styles.bodyText,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar.
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('Processing Data')));
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
