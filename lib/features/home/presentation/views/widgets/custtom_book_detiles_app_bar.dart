import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CusttomBoohDetilesAppBar extends StatelessWidget {
  const CusttomBoohDetilesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.close)),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
