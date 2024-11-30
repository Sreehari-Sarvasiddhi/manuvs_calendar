import 'package:flutter/material.dart';
import 'package:manuvs_calendar/constants/constants.dart';
import 'package:manuvs_calendar/language_toggle.dart';
import 'package:manuvs_calendar/location_dropdown/location_singleton.dart';

/// Flutter code sample for migrating from [ToggleButtons] to [SegmentedButton].

class ToggleButtonsApp extends StatelessWidget {
  const ToggleButtonsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const Scaffold(
          body: ToggleButtonsExample(),
        ),
      ),
    );
  }
}

const List<(Languages, String)> LanguagesOptions = <(Languages, String)>[
  (Languages.telugu, 'TE'),
  (Languages.english, 'EN'),
];

class ToggleButtonsExample extends StatefulWidget {
  const ToggleButtonsExample({super.key});

  @override
  State<ToggleButtonsExample> createState() => _ToggleButtonsExampleState();
}

class _ToggleButtonsExampleState extends State<ToggleButtonsExample> {
  Set<Languages> _segmentedButtonSelection = <Languages>{};

  @override
  void initState() {
    super.initState();
    _segmentedButtonSelection = <Languages>{getInitialLang()};
  }

  Languages getInitialLang() {
    try {
      if (LocationSingletonData().language == Languages.english) {
        return Languages.english;
      } else {
        return Languages.telugu;
      }
    } catch (_) {
      return Languages.english;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          SegmentedButton<Languages>(
            // ToggleButtons above allows multiple or no selection.
            // Set `multiSelectionEnabled` and `emptySelectionAllowed` to true
            // to match the behavior of ToggleButtons.
            multiSelectionEnabled: false,
            emptySelectionAllowed: false,
            // Hide the selected icon to match the behavior of ToggleButtons.
            showSelectedIcon: false,
            // SegmentedButton uses a Set<T> to track its selection state.
            selected: _segmentedButtonSelection,
            // This callback updates the set of selected segment values.
            onSelectionChanged: (Set<Languages> newSelection) {
              LocationSingletonData().language = newSelection.single;
              setState(() {
                _segmentedButtonSelection = newSelection;
              });

              Constants.homePageKey.currentState?.reloadContent();
            },
            // SegmentedButton uses a List<ButtonSegment<T>> to build its children
            // instead of a List<Widget> like ToggleButtons.
            segments: LanguagesOptions.map<ButtonSegment<Languages>>(
                ((Languages, String) lang) {
              return ButtonSegment<Languages>(
                  value: lang.$1, label: Text(lang.$2));
            }).toList(),
          ),
        ],
      ),
    );
  }
}

enum Languages {
  telugu,
  english,
}
