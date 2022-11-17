import 'package:flutter/material.dart';
import 'package:yokeshinzone/pages/home/tabs/DummyTab.dart';
import 'package:yokeshinzone/pages/home/tabs/now_loading_tab.dart';
import 'package:yokeshinzone/pages/home/tabs/popular_tab.dart';
import 'package:yokeshinzone/pages/home/tabs/top_rated_tab.dart';
import 'package:yokeshinzone/pages/home/tabs/upcoming_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 450,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(children: <Widget>[
                    Container(
                      height: 550.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Avengers.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 550.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.grey.withOpacity(0.0),
                              Colors.black,
                            ],
                            stops: const [0.0,1.0])
                      ),
                    )
                  ]),
                ),
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Popular"),
                    Tab(text: "Top Rated"),
                    Tab(text: "Now Playing"),
                    Tab(text: "Upcoming"),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              HomePopularTab(),
              HomeTopRatedTab(),
              HomeNowPlayingTab(),
              HomeUpcomingTab(),
            ],
          ),
        ),
      ),
    );
  }
}
