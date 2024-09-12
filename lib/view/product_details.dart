import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/provider/product_provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    getValueFromApi();
    super.initState();
  }

  getValueFromApi() async {
    var provider = Provider.of<ProductProvider>(context, listen: false);

    Future.delayed(Duration.zero, () async {
      await provider.getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,),
        body: Consumer<ProductProvider>(
            builder: (context, productProvider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productProvider.getUserStatus == StatusUtils.loading
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: ListView.builder(
                                itemCount: productProvider.productList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(productProvider
                                                    .productList[index].image ??
                                                "")),
                                        Text(
                                            "Title is : ${productProvider.productList[index].title}"),
                                        Text(
                                            "Price : ${productProvider.productList[index].price}"),
                                        Text(
                                            "Description : ${productProvider.productList[index].description}"),
                                      ],
                                    ),
                                  );
                                }))
                  ],
                )));
  }
}
