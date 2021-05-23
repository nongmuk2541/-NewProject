import 'package:flutter/material.dart';
import 'package:New_Project_KMUTTNEWS/screens/login_view.dart';
import 'package:New_Project_KMUTTNEWS/screens/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:kmutt_news/constants.dart';
//import 'package:kmutt_news/widgets/category_card.dart';
// import 'package:kmutt_news/constants.dart';
// import 'package:image/image.dart';

class AddMore extends StatefulWidget {
  static const routeName = '/more';
  @override
  State<StatefulWidget> createState() {
    return _AddMoreState();
  }
}

class _AddMoreState extends State<AddMore> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "KMUTT NEWS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Itim',
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            // Text(
            //   auth.currentUser.email,
            //   style: TextStyle(
            //     fontSize: 12,
            //     fontFamily: 'Itim',
            //     color: Colors.white,
            //   ),
            // ),
            IconButton(
              icon: Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                });
              },
            ),
          ],
        ),
        //-----------------------------------------------------Tabbar View-------------------------------------------------------------
        body: Container(
          padding: EdgeInsets.all(30),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .85,
            crossAxisSpacing: 20,
            mainAxisSpacing: 40,
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  splashColor: Colors.orange[500],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Image.network(
                        //   'https://img-premium.flaticon.com/png/512/295/295128.png?token=exp=1621142714~hmac=ad9a351cbe6c3aeb151f74c9d9437ce2',
                        //   width: 60,
                        //   height: 60,
                        // ),

                        Image.asset(
                          'image/lock.png',
                          width: 60,
                          height: 60,
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontFamily: 'Itim',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  splashColor: Colors.orange[500],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Image.network(
                        //   'https://img-premium.flaticon.com/png/512/1946/1946369.png?token=exp=1621142990~hmac=9075626c368c2c3c4a82f52bbd4b9a0e',
                        //   width: 60,
                        //   height: 60,
                        // ),

                        Image.asset(
                          'image/like.png',
                          width: 60,
                          height: 60,
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontFamily: 'Itim',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  splashColor: Colors.orange[500],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Image.network(
                        //     'https://img-premium.flaticon.com/png/512/1518/1518224.png?token=exp=1621142615~hmac=6d6d38f3392c8a7e3fcfc8fac36fbfb2',
                        //     width: 60,
                        //     height: 60,
                        //     fit: BoxFit.cover),

                        Image.asset(
                          'image/save.png',
                          width: 60,
                          height: 60,
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontFamily: 'Itim',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  splashColor: Colors.orange[500],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Image.network(
                        //   'https://img-premium.flaticon.com/png/512/945/945147.png?token=exp=1621143209~hmac=38023e1522dd6d378bfa2c1f9330c3e0',
                        //   width: 60,
                        //   height: 60,
                        // ),

                        Image.asset(
                          'image/settings.png',
                          width: 60,
                          height: 60,
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Setting",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontFamily: 'Itim',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // CategoryCard(
              //   title: "Login",
              //   imageSrc: "assets/icons/password.png",
              //   press: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Login(),
              //       ),
              //     );
              //   },
              // ),
              // CategoryCard(
              //   title: "Save",
              //   imageSrc: "assets/icons/heart.png",
              //   press: () {},
              // ),
              // CategoryCard(
              //   title: "Public\nRelations",
              //   imageSrc: "assets/icons/speaker.png",
              //   press: () {},
              // ),
              // CategoryCard(
              //   title: "Setting",
              //   imageSrc: "assets/icons/gear.png",
              //   press: () {},
              // ),
            ],
          ),
        ));
  }
}
