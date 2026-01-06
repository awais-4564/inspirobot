import 'package:aiimagegeneratoraichabotapp/Providers/translaterprovider.dart';
import 'package:flutter/material.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateProvider c;
  final ValueNotifier<String> selectedLanguage;
  final bool isFrom;

  const LanguageSheet({
    super.key,
    required this.c,
    required this.selectedLanguage,
    required this.isFrom,
  });

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final filteredLanguages = _getFilteredLanguages();

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search Language',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                _search = value.toLowerCase();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLanguages.length,
              itemBuilder: (_, index) {
                final language = filteredLanguages[index];
                return ListTile(
                  title: Text(language),
                  onTap: () {
                    if (widget.isFrom) {
                      widget.c.from = language;
                    } else {
                      widget.c.to = language;
                    }
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getFilteredLanguages() {
    if (_search.isEmpty) return widget.c.lang;
    return widget.c.lang
        .where((lang) => lang.toLowerCase().contains(_search))
        .toList();
  }
}
