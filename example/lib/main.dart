import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

void main() => runApp(
      MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('SpinBox for Flutter'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.swap_horiz)),
                  Tab(icon: Icon(Icons.swap_vert)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                HorizontalSpinBoxPage(),
                VerticalSpinBoxPage(),
              ],
            ),
          ),
        ),
      ),
    );

class HorizontalSpinBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final caption = Theme.of(context).textTheme.caption;
    return Scrollbar(
      child: ListView(
        children: [
          ListTile(
            title: Text('Basic', style: caption),
            subtitle: SpinBox(
              value: 10,
              autofocus: true,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
          ListTile(
            title: Text('Decimals', style: caption),
            subtitle: SpinBox(
              max: 10.0,
              value: 5.0,
              decimals: 1,
              step: 0.1,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
          ListTile(
            title: Text('Accelerated', style: caption),
            subtitle: SpinBox(
              min: -1.0,
              max: 1.0,
              value: 0.25,
              decimals: 3,
              step: 0.001,
              acceleration: 0.001,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
          ListTile(
            title: Text('Decorated', style: caption),
            subtitle: SpinBox(
              value: 50,
              inputDecoration: InputDecoration(
                hintText: 'Hint',
                labelText: 'Label',
                helperText: 'Helper',
                prefixText: 'Prefix',
                suffixText: 'Suffix',
                counterText: 'Counter',
              ),
              inputValidator: (text) => text.isEmpty ? 'Invalid' : null,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ],
      ),
    );
  }
}

class VerticalSpinBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 128,
        child: SpinBox(
          min: -50,
          max: 50,
          value: 15,
          spacing: 24,
          direction: Axis.vertical,
          textStyle: TextStyle(fontSize: 48),
          incrementIcon: Icon(Icons.keyboard_arrow_up, size: 64),
          decrementIcon: Icon(Icons.keyboard_arrow_down, size: 64),
          inputDecoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(24),
          ),
        ),
      ),
    );
  }
}
