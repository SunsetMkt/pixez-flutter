import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pixez/page/hello/new/new_illust/new_illust_page.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(vsync: this, length: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My"),
        bottom: TabBar(controller: _controller, tabs: [
          Tab(
            text: "Illust",
          ),
        ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          NewIllustPage(),
        ],
      ),
    );
  }
}
