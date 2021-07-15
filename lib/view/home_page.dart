import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape
            ? landScapeView(size)
            : portraitView(size);
      },
    );
  }

  SingleChildScrollView portraitView(Size size) => SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              title(Orientation.portrait),
              ancre(Orientation.portrait),
              chargeProjects(Orientation.portrait),
              profil(),
              contactInfo(Orientation.portrait),
              copyrights(size, Orientation.portrait),
            ],
          ),
        ),
      );

  Container copyrights(Size size, Orientation orientation) {
    return Container(
      margin: EdgeInsets.only(top: 80.0),
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: orientation == Orientation.portrait
            ? Center(
                child: Text(
                "SMOOTH AND DESIGN - ALL RIGHTS RESERVEDS",
                style: TextStyle(
                    color: Color(0xFF617689),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ))
            : Text(
                "SMOOTH AND DESIGN - ALL RIGHTS RESERVEDS",
                style: TextStyle(
                    color: Color(0xFF617689),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  SingleChildScrollView landScapeView(Size size) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFFAFAFA),
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 110,
            ),
            title(Orientation.landscape),
            SizedBox(
              height: 10,
            ),
            ancre(Orientation.landscape),
            SizedBox(
              height: 200,
            ),
            chargeProjects(Orientation.landscape),
            SizedBox(
              height: 400,
            ),
            contactInfo(Orientation.landscape),
            copyrights(size, Orientation.landscape),
          ],
        ),
      ),
    );
  }

  Widget contactInfo(Orientation orientation) {
    return orientation == Orientation.landscape
        ? Container(
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                myPresentation(),
                contact(),
                socialMedia(),
              ],
            ),
        )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myPresentation(),
              contact(),
              socialMedia(),
            ],
          );
  }

  Widget myPresentation() {
    return Container(
      width: 600,
      height: 300,
      child: Container(
        decoration: decoration(Colors.white),
      ),
    );
  }

  Container socialMedia() {
    return Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          genereButton("assets/icons/linkedin.png", ""),
          genereButton("assets/icons/instagram.png", "instagram"),
          genereButton("assets/icons/git.png", ""),
        ],
      ),
    );
  }

  Widget genereButton(String assetName, String? type) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: type == "instagram" ? 60 : 100,
        child: Image.asset(assetName),
      ),
    );
  }

  BoxDecoration decoration(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0),
        BoxShadow(color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0),
      ],
    );
  }

  Widget chargeProjects(Orientation orientation) {
    return orientation == Orientation.landscape
        ? Row(
            /// LANDSCAPE
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 1024.0,
                child: SvgPicture.asset("assets/mes_projets.svg"),
              ),
              Container(
                width: 500.0,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            leading: Container(color: Color(0xFF617689), width: 100.0, height: 150.0,),
                            title: Text("PROJECT #$position", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("data", style: TextStyle(fontSize: 25.0,),),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        : Column(
            /// PORTRAIT
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 524.0,
                child: SvgPicture.asset("assets/mes_projets.svg"),
              ),
              Container(
                width: 924,
                padding: EdgeInsets.all(20.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 200,
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            margin: EdgeInsets.only(right: 20.0),
                            color: Color(0xFF617689),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Entry ${entries[index]}',
                                  style: TextStyle(
                                    color: Color(0xFF617689),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  'APPLICATION MOBILE',
                                  style: TextStyle(
                                      color: Color(0xFF617689), fontSize: 14.0),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.0,
                              blurRadius: 4.0),
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.0,
                              blurRadius: 4.0),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ],
          );
  }

  Container contact() {
    return Container(
      width: 100,
      height: 400,
      child: Image.asset("assets/contact.png"),
    );
  }

  Container profil() {
    return Container(
      width: 100,
      height: 400,
      child: Image.asset("assets/icons/profil.png"),
    );
  }

  Center ancre(Orientation orientation) {
    return Center(
      child: Container(
        width: orientation == Orientation.landscape ? 100.0 : 50,
        height: orientation == Orientation.landscape ? 200.0 : 100,
        alignment: Alignment.center,
        child: Image.asset("assets/ancre.png"),
      ),
    );
  }

  Center title(Orientation orientation) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: orientation == Orientation.landscape ? 600.0 : 300,
        height: orientation == Orientation.landscape ? 700.0 : 350,
        child: Image.asset("assets/ben_ndui.png"),
      ),
    );
  }
}
