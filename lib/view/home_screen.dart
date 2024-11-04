import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_task/service/auth_service.dart';
import 'package:new_task/view/login_page.dart';
import 'package:new_task/view/tips_screen.dart';
import 'package:provider/provider.dart';
import '../utils/app_string.dart';
import '../utils/custom_snack_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "";
  String userMailID = "";
  List<Map<String, dynamic>> listOfHomeScreen = [
    {
      "Image":
          "https://img.freepik.com/free-psd/tasty-crunchy-walnuts-ice-cream-png-isolated-transparent-background_191095-9900.jpg",
      "like": false,
    },
    {
      "Image":
          "https://img.freepik.com/free-psd/fresh-tasty-cupcake-isolated-transparent-background_84443-1755.jpg",
      "like": false,
    },
    {
      "Image": "https://images.unsplash.com/photo-1508737804141-4c3b688e2546",
      "like": false,
    },
    {
      "Image":
          "https://img.freepik.com/free-photo/delicious-ice-cream-with-topping_23-2150735432.jpg",
      "like": false,
    },
    {
      "Image": "https://images.unsplash.com/photo-1542007920-992d2c424d09",
      "like": false,
    },
    {
      "Image": "https://images.unsplash.com/photo-1530648672449-81f6c723e2f1",
      "like": false,
    },
    {
      "Image":
          "https://img.freepik.com/free-photo/chocolate-ice-cream-dessert_144627-8364.jpg",
      "like": false,
    },
    {
      "Image": "https://images.unsplash.com/photo-1587668178277-295251f900ce",
      "like": false,
    },
    {
      "Image":
          "https://img.freepik.com/free-photo/chocolate-cake-with-chocolate-sprinkles_144627-8998.jpg",
      "like": false,
    },
  ];
  // bool like = false;

  @override
  void initState() {
    getUser();

    super.initState();
  }

  getUser() {
    userName = context.read<AuthService>().currentUser;
    userMailID = context.read<AuthService>().userMailId;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome, $userName",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _logoutDialog();
              },
              icon: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(),
                  Text(
                    "LogOut",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ))
        ],
      ),
      //),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listOfHomeScreen.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {
                      _tipDialogBox(listOfHomeScreen[index]["Image"]);
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 170,
                                width: 150,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Colors.black26,
                                        Colors.black,
                                      ],
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter),
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          listOfHomeScreen[index]["Image"]),
                                      // AssetImage("assets/images/cake1.png"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Positioned(
                                right: 1,
                                child: IconButton(
                                    onPressed: () {
                                      listOfHomeScreen[index]["like"] =
                                          !listOfHomeScreen[index]["like"];
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      listOfHomeScreen[index]["like"]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 40,
                                      color: listOfHomeScreen[index]["like"]
                                          ? Colors.red
                                          : Colors.white,
                                    )),
                              ),
                              const Positioned(
                                bottom: 2,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 9.0, bottom: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                            text: "FLAT DEAL",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                  text: "\n ₹:125 OFF",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  children: [
                                                    TextSpan(
                                                        text: "\n ABOVE ₹.199",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ])
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Cake Trends",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Row(children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 8, 96, 12),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Icon(Icons.star,
                                        color: Colors.white, size: 20)),
                                const SizedBox(width: 2),
                                Text(
                                  "4.1(140).40-45mins",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                              const SizedBox(height: 5),
                              Row(children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 111, 24, 126),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Icon(Icons.cake,
                                        color: Colors.white, size: 22)),
                                const SizedBox(width: 2),
                                Text(
                                  "Perfect Cake Delivery",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 52.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Bakery,Cakes and Pastri",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 57.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Padapai . 3.0 km",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 57.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_vert_outlined,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Log Out',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure, You want to Log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                context.read<AuthService>().logout().then((value) {
                  if (value == "Success") {
                    CustomSnackBar.sucessSnackBar(
                        context: context, message: AppString.logoutSuccess);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => true,
                    );
                  } else {
                    CustomSnackBar.errorSnackBar(
                        context: context,
                        message: value ?? AppString.commonEror);
                  }
                });
              },
              child:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _tipDialogBox(String selectImage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return TipScreen(
          imageValue: selectImage,
        );
      },
    );
  }
}
