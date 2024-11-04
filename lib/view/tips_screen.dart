import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipScreen extends StatefulWidget {
  String imageValue = " ";
  TipScreen({super.key, required this.imageValue});

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  bool isChecked = true;
  List<Map<String, dynamic>> tips = [
    {"Tips": "₹20", "select": false},
    {"Tips": "₹30", "select": false},
    {"Tips": "₹50", "select": false},
    {"Tips": "Other", "select": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 340,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 219, 239),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Thank you for adding a Tip!",
                            style: TextStyle(
                                fontSize: 70.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.info_outline,
                          color: Colors.black,
                          size: 25,
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.maxFinite,
                      // height: 240,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "you've made their days! 100% of  the tip will go to your delivery  partner for this and future orders.",
                                    style: TextStyle(
                                        fontSize: 45.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  height: 90,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 205, 218, 229),
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(widget.imageValue)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: tips.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if(tips[index]["select"]){
                                      
                                    }
                                    tips = [
                                      {"Tips": "₹20", "select": false},
                                      {"Tips": "₹30", "select": false},
                                      {"Tips": "₹50", "select": false},
                                      {"Tips": "Other", "select": false}
                                    ];
                                    tips[index]["select"] =
                                        !tips[index]["select"];
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: 250.sp,
                                      decoration: BoxDecoration(
                                          color: tips[index]['select']
                                              ? Colors.orange[100]
                                              : Colors.white12,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: tips[index]['select']
                                                ? Colors.deepOrange
                                                : Colors.black45,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            tips[index]["Tips"],
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          tips[index]["select"]
                                              ? const Icon(
                                                  Icons.cancel,
                                                  size: 18,
                                                  color: Colors.deepOrange,
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            endIndent: 10,
                            indent: 10,
                            color: Colors.black26,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.deepOrange,
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {});
                                },
                              ),
                              Text(
                                "Add this tip automatically to future orders",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 52.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
