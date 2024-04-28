import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:map/config/routes/route_imports.gr.dart';
import 'package:map/features/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:map/service_locator.dart';
import 'package:map/core/services/size_config.dart';
import 'package:map/features/presentation/widgets/next_button.dart';
import 'package:map/features/presentation/widgets/tab_indicator.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final theme = customTheme.myTheme;
  final PageController _pageController = PageController(initialPage: 0);
  final _buttons = Buttons();
  final TextEditingController _registerName = TextEditingController();
  final TextEditingController _registerEmail = TextEditingController();
  final TextEditingController _registerPassword = TextEditingController();

  final TextEditingController _loginEmail = TextEditingController();
  final TextEditingController _loginPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight),
            painter: ShapePainter(),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: SizeConfig.screenHeight / 3.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(
                    context,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (page) {},
                    children: [
                      _buildSignIn(),
                      _buildSignUp(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget card1() {
  //   return Container(
  //     alignment: Alignment.center,
  //     width: SizeConfig.screenWidth / 1.3,
  //     child: Card(
  //       elevation: 10,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           _customTextField(Icons.email_outlined, 'Email Address', null, _loginEmail),
  //           const Divider(),
  //           _customTextField(Icons.lock, 'Password', Icons.remove_red_eye, _loginPassword)
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSignIn() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 2.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth / 20,
                  vertical: SizeConfig.screenHeight / 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _customTextField(
                      Icons.email, 'Email Address', null, _loginEmail),
                  _separator(),
                  _customTextField(Icons.lock, 'Password', Icons.remove_red_eye,
                      _loginPassword),
                ],
              ),
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return _buttons.customButton(
                  state is AuthLoginLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('LOGIN'), () {
                BlocProvider.of<AuthCubit>(context).login(
                    _loginEmail.text.trim(),
                    _loginPassword.text.trim(),
                    context);
              });
            },
          ),
          const Text('Or'),
          _buttons.customButton(Text('LOGIN AS GUEST'), () {}),
        ],
      ),
    ));
  }

  Widget _buildSignUp() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 20),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth / 20,
                      vertical: SizeConfig.screenHeight / 30),
                  child: Column(
                    children: [
                      _customTextField(
                          Icons.person_2, 'Name', null, _registerName),
                      _separator(),
                      _customTextField(
                          Icons.email, 'Email Address', null, _registerEmail),
                      _separator(),
                      _customTextField(Icons.lock, 'Password',
                          Icons.remove_red_eye, _registerPassword),
                    ],
                  ),
                ),
              )),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return _buttons.customButton(
                  state is AuthLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text('SIGNUP'), () {
                BlocProvider.of<AuthCubit>(context).register(
                    _registerName.text.trim(),
                    _registerEmail.text.trim(),
                    _registerPassword.text.trim(),
                    context);
              });
            },
          )
        ],
      ),
    );
  }

  Widget _separator() {
    return Column(
      children: [
        Gap(SizeConfig.screenHeight / 30),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Gap(SizeConfig.screenHeight / 60)
      ],
    );
  }

  Widget _customTextField(IconData iconData, String hintText,
      IconData? trailingIconData, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          icon: Icon(iconData),
          suffixIcon: Icon(trailingIconData)),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: 60,
      width: screensize.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                //highlightColor: Colors.white,
                onPressed: null,
                child: const Text(
                  "Existing",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: null,
                child: const Text(
                  "New",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
