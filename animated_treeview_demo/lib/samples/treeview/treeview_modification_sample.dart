// MIT License
// Copyright (c) [2021] [Jawwad Hassan]


import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:animated_treeview_demo/utils/utils.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TreeView Modification Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TreeView Modification Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TreeView.simple(
        tree: TreeNode.root(),
        expansionBehavior: ExpansionBehavior.collapseOthersAndSnapToTop,
        shrinkWrap: true,
        expansionIndicator: ExpansionIndicator.DownUpChevron,
        builder: (context, level, item) => item.isRoot
            ? buildRootItem(level, item)
            : buildListItem(level, item),
      ),
    );
  }

  Widget buildRootItem(int level, TreeNode item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text("Item ${item.level}-${item.key}"),
              subtitle: Text('Level $level'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildAddItemChildButton(item),
                if (item.children.isNotEmpty) buildClearAllItemButton(item)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(int level, TreeNode item) {
    return Card(
      color: colorMapper[level.clamp(0, colorMapper.length - 1)]!,
      child: ListTile(
        title: Text("Item ${item.level}-${item.key}"),
        subtitle: Text('Level $level'),
        dense: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildRemoveItemButton(item),
            buildAddItemButton(item),
          ],
        ),
      ),
    );
  }

  Widget buildAddItemButton(TreeNode item) {
    return IconButton(
      onPressed: () => item.add(TreeNode()),
      icon: Icon(Icons.add_circle, color: Colors.green),
    );
  }

  Widget buildRemoveItemButton(TreeNode item) {
    return IconButton(
      onPressed: () => item.delete(),
      icon: Icon(Icons.delete, color: Colors.red),
    );
  }

  Widget buildAddItemChildButton(TreeNode item) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.green[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        icon: Icon(Icons.add_circle, color: Colors.green),
        label: Text("Add Child", style: TextStyle(color: Colors.green)),
        onPressed: () => item.add(TreeNode()),
      ),
    );
  }

  Widget buildClearAllItemButton(TreeNode item) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          icon: Icon(Icons.delete, color: Colors.red),
          label: Text("Clear All", style: TextStyle(color: Colors.red)),
          onPressed: () => item.clear()),
    );
  }
}
