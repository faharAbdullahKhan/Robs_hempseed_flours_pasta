import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/model/cart_post_model.dart';

class FavoriteController extends GetxController{

  List<Products> favLst = [];

  add(String image, String name, int quantity) {
    favLst.add(Products(image: image, name: name, quantity: quantity));
    print(favLst.length);
    update();
  }

  del(int index) {
    favLst.removeAt(index);
    update();
  }

}