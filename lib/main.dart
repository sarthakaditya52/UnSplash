import 'package:flutter/material.dart';
import 'package:unsplash/tabs/cats.dart' as cats;
import 'package:unsplash/tabs/oneItemWB.dart' as oneItem;

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnSplash'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(text: 'Cats',),
            Tab(text: 'One item - white background',),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          cats.Cats(),
          oneItem.OneItem(),
        ],
      ),
    );
  }
}
