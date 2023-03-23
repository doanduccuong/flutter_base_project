import 'package:flutter/material.dart';
import 'package:flutter_base_project/application/sign_in_page_bloc/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../configs/app_images.dart';
import '../../../../enum/load_status.dart';
import '../../../application/app_cubit.dart';
import '../../../../component/app_email_input.dart';
import '../../../../component/app_tiny_button.dart';
import '../../../../component/obscure_text_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final appCubit = RepositoryProvider.of<AppCubit>(context);
        return SignInCubit(appCubit: appCubit);
      },
      child: const SignInPageChild(),
    );
  }
}

class SignInPageChild extends StatefulWidget {
  const SignInPageChild({Key? key}) : super(key: key);

  @override
  State<SignInPageChild> createState() => _SignInChildPageState();
}

class _SignInChildPageState extends State<SignInPageChild> {
  late TextEditingController usernameTextController;

  late TextEditingController passwordTextController;

  late ObscureTextController obscurePasswordController;

  late SignInCubit _cubit;

  @override
  void initState() {
    super.initState();
    usernameTextController = TextEditingController(text: 'mobile@newwave.com');
    passwordTextController = TextEditingController(text: "mobile");
    obscurePasswordController = ObscureTextController(obscureText: true);
    _cubit = BlocProvider.of<SignInCubit>(context);
    _cubit.changeUsername(username: usernameTextController.text);
    _cubit.changePassword(password: passwordTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBodyWidget(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget buildBodyWidget() {
    final showingKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        SizedBox(
            height: showingKeyboard ? 0 : 200,
            width: 200,
            child: Image.asset(AppImages.icLogoTransparent)),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: AppEmailInput(
            textEditingController: usernameTextController,
            onChanged: (text) {
              _cubit.changeUsername(username: text);
            },
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: AppPasswordInput(
            obscureTextController: obscurePasswordController,
            textEditingController: passwordTextController,
            onChanged: (text) {
              _cubit.changePassword(password: text);
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildSignButton(),
      ],
    );
  }

  Widget _buildSignButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppTintButton(
            title: "S.of(context).button_signIn",
            onPressed: _signIn,
            isLoading: state.signInStatus == LoadStatus.loading,
          ),
        );
      },
    );
  }

  void _signIn() {
    _cubit.signIn();
  }
}
