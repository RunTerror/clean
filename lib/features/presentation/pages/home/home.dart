import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:map/config/routes/route_imports.gr.dart';
import 'package:map/service_locator.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await localApiService.deleteUser();
                context.mounted
                    ? AutoRouter.of(context).replace(const AuthScreenRoute())
                    : null;
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
