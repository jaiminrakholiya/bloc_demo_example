import 'package:bloc_demo_exmaple/features/home/home_bloc.dart';
import 'package:bloc_demo_exmaple/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        children: [
          Container(
            height: 200,
            width:  double.maxFinite,
            decoration: BoxDecoration(

              image:  DecorationImage(
                  // fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl))
            ),
          ),

          Text(productDataModel.name),
          Text(productDataModel.description),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$'+productDataModel.price.toString()),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                       homeBloc.add(HomeProductWishlistButtonClikedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClikedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.shopping_cart)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
