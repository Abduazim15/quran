import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quron/screens/read_dua_screen.dart';

import '../data/constants.dart';
import '../data/duas.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({super.key});

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  final _duas = duas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Duolar',
          style: TextStyle(
              color: Constants.primaryColor, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                _duas[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
