import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:submission/model/data.dart';
import 'package:submission/ui/detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
          backgroundColor: Colors.blue,
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const LanguagesList();
          } else if (constraints.maxWidth <= 1200) {
            return const LanguagesGrid(count: 4);
          } else {
            return const LanguagesGrid(count: 6);
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
                  )
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
    return Container();
  }
}
