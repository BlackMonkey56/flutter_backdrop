import 'package:flutter/material.dart';

class TwoPanels extends StatefulWidget {

  final AnimationController controller;


  TwoPanels({this.controller});

  @override
  _TwoPanelsState createState() => new _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints){
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      end: new RelativeRect.fromLTRB(0.0, backPanelHeight, 0.0, frontPanelHeight),
    ).animate(new CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints){

    final ThemeData theme = Theme.of(context);

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            color: theme.primaryColor,
            child: new Center(
              child: new Text("Back Panel", style: new TextStyle(
                fontSize: 24.0, color: Colors.white),
              ),//Text
            ),//Center
          ),//Container
          new PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: new Material(
              color: Colors.lime,
              elevation: 12.0,
              borderRadius: new BorderRadius.only(
                topLeft: new Radius.circular(16.0),
                topRight: new Radius.circular(16.0)),
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: header_height,
                    child: new Center(
                      child: new Text("To Do List", style: new TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold
                      ),
                      ),//Text
                    ),//Center
                  ),//Container
                  new Expanded(
                      child: new Center(
                        child: new Text("Check List here", style: new TextStyle(
                            fontSize: 24.0, color: Colors.black),),
                      ),//Center
                  ),//Expanded
                ],//<Widget>[]
              ),//Column
            ),//Material
          ),//PositionedTransition
        ],//<Widget>[]
      ),//Stack
    );//Container
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
        builder: bothPanels,
    );
  }
}
