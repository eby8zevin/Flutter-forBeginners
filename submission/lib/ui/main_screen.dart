import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:submission/model/data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 8.0,
                      crossAxisSpacing: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final Data modelData = data[index];
                    // return InkWell(
                    //   child: Card(
                    //     child: Column(
                    //       children: [
                    //         //SvgPicture.network(modelData.image),
                    //         Text(modelData.name)
                    //       ],
                    //     ),
                    //   ),
                    // );
                    return Container(
                      color: Colors.blue, // color of grid items
                      child: Center(
                        child: Text(
                          modelData.name[index],
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    );
                  }))
        ]),
      ),
    );
  }
}
