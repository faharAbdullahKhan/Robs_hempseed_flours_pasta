import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/model/cart_post_model.dart';

class AddToCartController extends GetxController{

  List<Products> lst = [];

  add(String image, String name, int quantity) {
    lst.add(Products(image: image, name: name, quantity: quantity));
    print(lst[0].quantity);
    update();
  }

  del(int index) {
    lst.removeAt(index);
    update();
  }

}