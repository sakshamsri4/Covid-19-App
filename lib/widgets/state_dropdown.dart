import 'package:flutter/material.dart';

class StateDropDown extends StatelessWidget {
  final List<String> states;
  final String state;
  final Function(String) onChanged;

  const StateDropDown(
      {@required this.states, @required this.state, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: new Text('Select Country'),
          value: state,
          items: states
              .map((e) => DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        //Text(e),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          e,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
