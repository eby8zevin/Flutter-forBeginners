import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:submission/model/data.dart';
import 'package:submission/ui/detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _launchView = 'list';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Programming Language',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            PopupMenuButton<String>(
              color: Colors.white,
              onSelected: (value) {
                if (value == 'list') {
                  setState(() {
                    _launchView = 'list';
                  });
                } else if (value == 'grid') {
                  setState(() {
                    _launchView = 'grid';
                  });
                } else if (value == 'openUrl') {
                  _launchInBrowser(Uri.parse(
                      'https://www.simplilearn.com/best-programming-languages-start-learning-today-article'));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'list',
                    child: Text('ListView'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'grid',
                    child: Text('GridView'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'openUrl',
                    child: Text('Source'),
                  ),
                ];
              },
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (_launchView == 'list') {
            if (constraints.maxWidth <= 600) {
              return const LanguagesList();
            } else if (constraints.maxWidth <= 1200) {
              return const LanguagesGrid(count: 4);
            } else {
              return const LanguagesGrid(count: 6);
            }
          } else {
            if (constraints.maxWidth >= 600) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Sorry! View Mobile only.",
                    style: TextStyle(color: Colors.black)),
                duration: Duration(seconds: 2),
                backgroundColor: Color.fromARGB(255, 242, 203, 4),
              ));
              return const LanguagesList();
            } else {
              return const LanguagesGrid(count: 2);
            }
          }
        }),
      );
    });
  }
}

class LanguagesList extends StatelessWidget {
  const LanguagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Data dataList = data[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(dataList: dataList)));
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.lightBlue, width: 2),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: 100,
                    height: 100,
                    color: const Color(0x6FB6B6B6),
                    child: SvgPicture.network(dataList.image),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          dataList.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          dataList.link,
                          style: const TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}

class LanguagesGrid extends StatelessWidget {
  final int count;

  const LanguagesGrid({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: count,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: data.map((dataGrid) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(dataList: dataGrid)));
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.lightBlue, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.network(
                    dataGrid.image,
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    dataGrid.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    dataGrid.link,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
