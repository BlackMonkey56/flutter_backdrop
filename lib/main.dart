import 'package:flutter/material.dart';
import 'package:flutter_backdrop/twopanels.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: new ThemeData(primarySwatch: Colors.deepOrange),
  home: new BackdropPage(),
));

class BackdropPage extends StatefulWidget{
  @override
  _BackdropPageState createState() => new _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage> with SingleTickerProviderStateMixin{
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  bool get isPanelVisible{
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Backdrop"),
        elevation: 0.0,
        leading: new IconButton(
            icon: new AnimatedIcon(
                icon: AnimatedIcons.list_view,
                progress: controller.view,
            ),//AnimatedIcon
            onPressed: (){
              controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
            },
        ),//IconButton
      ),//AppBar
      body: new TwoPanels(
        controller: controller,
      ),//TwoPanels
    );//Scaffold
  }
}