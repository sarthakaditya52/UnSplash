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
        title: Text('UnSplash',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[400],
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  border: Border.all(color: Colors.grey[400], width: 4),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white70,
                ),
                controller: tabController,
                tabs: <Widget>[
                  Tab(text: 'Cats'),
                  Tab(text: 'One Item'),
                ],
              ),
            ),
          ),
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
