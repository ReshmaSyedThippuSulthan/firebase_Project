import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_task/controller/product_controller.dart';
import 'package:provider/provider.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<String> gridList = ["Item1", "Item2", "Item3", "Item4", "Item5"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductController>().allProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "PRODUCT DETAILS",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductController>(builder: (context, provider, child) {
          // final List value = provider.productData!.products!;
          if (provider.productData != null &&
              provider.productData!.products != null) {
            return GridView.builder(
              itemCount: provider.productData!.products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      provider.productData!.products![index].discountPercentage!
                          .toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text(
              "NO DATA",
              style: TextStyle(fontSize: 20),
            ),
          );
        }),
      ),
    );
  }
}
