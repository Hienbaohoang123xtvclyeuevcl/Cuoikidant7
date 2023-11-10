import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcaycanh/ui/auth/auth_manager.dart';

import '../orders/order_screen.dart';
import '../admin/user_product_screen.dart';
import '../personal/personal_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text(''),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Trang cá nhân'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(PersonalScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Trang chủ'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Đơn đã đặt'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.routeName);
              }),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.edit),
          //   title: const Text('Admin'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(UserProductsScreen.routeName);
          //   },
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Đăng xuất'),
            onTap: () {
              // Navigator.of(context)
              //   ..pop()
              //   ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          )
        ],
      ),
    );
  }
}
