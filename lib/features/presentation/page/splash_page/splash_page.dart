import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/domain/repositories/use_repository.dart';
import 'package:flutter_base_project/features/presentation/page/splash_page/splash_page_bloc/splash_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../configs/app_images.dart';
import '../../../domain/repositories/auth_repository.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SplashPageCubit(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
          userRepository: RepositoryProvider.of<UserRepository>(context),
        );
      },
      child: const SplashChildPage(),
    );
  }
}

class SplashChildPage extends StatefulWidget {
  const SplashChildPage({Key? key}) : super(key: key);

  @override
  State<SplashChildPage> createState() => _SplashChildPageState();
}

class _SplashChildPageState extends State<SplashChildPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashPageCubit>().checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(AppImages.icLogoTransparent),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
