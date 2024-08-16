import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quron/ui/screens/dua_category.dart';
import 'package:quron/ui/screens/read_dua_screen.dart';

import '../../data/constants.dart';
import '../../data/duas.dart';

class DuaPage extends StatelessWidget {
  DuaPage({super.key});

  final _duas = duas;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Duolar',
            style: TextStyle(
                color: Constants.primaryColor, fontWeight: FontWeight.bold),
          ),
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Constants.primaryColor.withOpacity(0.4)),
                  child: TabBar(
                    tabs: const [
                      TabItem(title: 'Jadval'),
                      TabItem(title: 'Umumiy'),
                    ],
                    labelColor: Constants.primaryTextColor,
                    dividerHeight: 0,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                )),
          ),
        ),
        body: TabBarView(children: [
          GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: DuaCategories.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5),
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Constants.primaryColor.withOpacity(0.4)),
                  child: InkWell(
                    onTap: () {
                      List<Dua> categoryDuas = [];
                      for(var dua in _duas){
                        if(dua.category == DuaCategories.values[index])
                          categoryDuas.add(dua);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DuaCategory(duas: categoryDuas, category: DuaCategories.values[index].value.name),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              DuaCategories.values[index].value.asset,
                              height: 90,
                            )),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 13, bottom: 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text(
                                DuaCategories.values[index].value.name,
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
          AllDuas(duas: _duas),
        ]),
      ),
    );
  }
}

class AllDuas extends StatelessWidget {
  const AllDuas({
    super.key,
    required List<Dua> duas,
  }) : _duas = duas;

  final List<Dua> _duas;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ReadDuaScreen(dua: _duas[index])));
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                        ),
                        width: 50,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              _duas[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                            )),
                      ),
                    ],
                  ),
                ));
          },
          itemCount: _duas.length,
        ))
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(title)],
      ),
    );
  }
}
