import 'package:mapa_contatos/paginas/contatos.dart';
import 'package:flutter/material.dart';
import 'maps.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void goContacts() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => contacts()));
  }

  void goMaps() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()));
  }

  void checkLocation() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      PermissionStatus permissionStatus = await Permission.location.request();
    }
  }

  initState() {
    super.initState();
    checkLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 100),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey, width: 3)),
                child: SizedBox.expand(
                  child: FlatButton(
                      onPressed: () {
                        goMaps();
                      },
                      color: Colors.grey[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('LOCALIZAÇÃO',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30))
                        ],
                      )),
                ),
              )
            ]),
            SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey, width: 3)),
                child: SizedBox.expand(
                  child: FlatButton(
                      onPressed: () {
                        goContacts();
                      },
                      color: Colors.grey[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CONTATOS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30))
                        ],
                      )),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
