import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:submission/model/data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Data dataList;

  const DetailScreen({Key? key, required this.dataList}) : super(key: key);

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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SvgPicture.network(
                dataList.image,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.54,
                padding: const EdgeInsets.all(40),
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .5)),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 100),
                      const Icon(
                        Icons.flutter_dash,
                        color: Colors.white,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 50,
                        child: Divider(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        dataList.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 45),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Expanded(
                              flex: 1,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.blue,
                                value: 1,
                                valueColor: AlwaysStoppedAnimation(Colors.blue),
                              )),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  dataList.link,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 60,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    dataList.detail,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Skills: ${dataList.skill}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () =>
                            {_launchInBrowser(Uri.parse(dataList.link))},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          "Belajar ${dataList.name}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )),
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
