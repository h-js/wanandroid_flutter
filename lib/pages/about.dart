import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:wanandroid_flutter/util/ToastUtil.dart';

import 'articleDetail.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _list = <String>[
      "fluttertoast",
      "dio",
      "cookie_jar",
      "flutter_webview_plugin",
      "flutter_swiper",
      "share",
    ];
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            title: Text("关于"),
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
            actions: <Widget>[
              PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz),
                offset: Offset(100, 100),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: "1",
                        child: ListTile(
                          leading: Icon(Icons.share),
                          title: Text('分享'),
                        ),
                      ),
                      PopupMenuDivider(), //分割线
                      const PopupMenuItem<String>(
                        value: "2",
                        child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('设置'),
                        ),
                      ),
                    ],
                tooltip: "点击弹出菜单",
                onSelected: (String result) {
                  print(result);
                  switch (result) {
                    case "1":
                      //需要重启，不然会有 MissingPluginException(No implementation found for method getAll on channel plugins.flutter.io/share)异常
                      Share.share(
                          '【玩安卓Flutter版】\nhttps://github.com/yechaoa/wanandroid_flutter');
                      break;
                    case "2":
                      YToast.show(msg: "设置");
                      break;
                  }
                },
                onCanceled: () {
                  print("取消");
                },
              ),
            ],
            flexibleSpace: new FlexibleSpaceBar(
              //background: Image.asset("images/a.jpg", fit: BoxFit.fill),
              background: Image.network(
                  "https://avatars3.githubusercontent.com/u/19725223?s=400&u=f399a2d73fd0445be63ee6bc1ea4a408a62454f5&v=4",
                  fit: BoxFit.cover),
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 800.0,
            delegate: new SliverChildBuilderDelegate(
              (context, index) => Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "wanandroid_flutter V1.0",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Github ：",
                                style: TextStyle(fontSize: 20),
                              ),
                              GestureDetector(
                                child: Text(
                                  "wanandroid_flutter",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      fontSize: 20,
                                      color: Colors.blue),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (context) => new ArticleDetail(
                                          title: "wanandroid_flutter",
                                          url:
                                              "https://github.com/yechaoa/wanandroid_flutter"),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "CSDN ：",
                                style: TextStyle(fontSize: 20),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  child: Text(
                                    "https://blog.csdn.net/yechaoa",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        fontSize: 20,
                                        color: Colors.blue),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                        builder: (context) => new ArticleDetail(
                                            title: "CSDN ：yechaoa",
                                            url:
                                                "https://blog.csdn.net/yechaoa"),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "用到的库：",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ListView.builder(
                          itemCount: _list.length,
                          shrinkWrap: true,
                          //禁掉ListView的滑动，跟CustomScrollView滑动冲突
                          physics: new NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int position) {
                            return ListTile(
                              title: new Text(_list[position].toString()),
                            );
                          },
                        ),
                        Divider(),
                      ],
                    ),
                  ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
