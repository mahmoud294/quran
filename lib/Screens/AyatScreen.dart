import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quran/providers/SourProvider.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class AyatScreen extends StatefulWidget {
  static const routeName = "/AyatSCreen";
  @override
  _AyatScreenState createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SourProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(value.selectedSouraName),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
          itemCount: value.ayatList.length,
          itemBuilder: (context, index) => Card(
            elevation: 8,
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                        color: Theme.of(context).accentColor, width: 3.2),
                  ),
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 15),
                              child: Text(value.tafseerList[index].tafseer,style:TextStyle(fontSize: 20)),),
                          ListTile(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(text: value.ayatList[index].text),
                              ).then(
                                (value) => Fluttertoast.showToast(
                                    msg: "تم النسخ",
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white),
                              );
                            },
                            title: Text("نسخ"),
                            leading: Icon(Icons.content_copy),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 2,
                            thickness: 2,
                            endIndent: 27,
                            indent: 27,
                          ),
                          ListTile(
                            onTap: () {
                              Share.share(
                                value.ayatList[index].text,
                              );
                            },
                            title: Text("مشاركه"),
                            leading: Icon(Icons.share),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                title: Text(
                  value.ayatList[index].text,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
