import 'package:expiry_tracker/core/constants/auth_constants.dart';
import 'package:expiry_tracker/shared/constants/colors.dart';
import 'package:expiry_tracker/shared/widgets/custom_appbar.dart';
import 'package:expiry_tracker/shared/widgets/input_field.dart';
import 'package:expiry_tracker/shared/widgets/social_media_button.dart';
import 'package:expiry_tracker/shared/widgets/subhead.dart';
import 'package:expiry_tracker/shared/widgets/submit_button.dart';
import 'package:expiry_tracker/shared/widgets/title.dart';
import 'package:flutter/material.dart' hide Title;

import 'core/network/network_service.dart';
import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NetworkService _networkService = NetworkService();
  late final AuthRemoteDataSource _authRemoteDataSource;
  late final AuthRepositoryImpl _authRepository;
  late final LoginUseCase _loginUseCase;

  MyApp({super.key}) {
    _authRemoteDataSource = AuthRemoteDataSourceImpl(
      networkService: _networkService,
    );
    _authRepository = AuthRepositoryImpl(
      remoteDataSource: _authRemoteDataSource,
      networkService: _networkService,
    );
    _loginUseCase = LoginUseCase(_authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(title: "XDDDD"));
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => AuthBloc(loginUseCase: _loginUseCase),
    //     ),
    //   ],
    //   child: MaterialApp.router(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     ),
    //     routerConfig: AppRoutes.router,
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Jó reggelt, Anett Fehér",
        notificationsCount: 0,
        profileImageUrl: "https://i.ibb.co/5X06GKsw/profile.png",
      ),
      backgroundColor: AppColors.bgColorDefault,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Title(
            text: "Expiry Tracker",
            subtitle: "Tartsd számon, amid van – ne hagyd pazarolni!",
          ),
          SizedBox(height: 30),
          SubmitButton(
            text: "Bejelentkezés",
            margin: EdgeInsets.all(25),
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaButton(
                socialMedia: AuthConstants.google,
                onPressed: () {},
              ),
              SocialMediaButton(
                socialMedia: AuthConstants.facebook,
                onPressed: () {},
              ),
            ],
          ),
          Subhead(
            text: "Megjegyzés",
            margin: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 8),
          ),
          SizedBox(height: 50),
          Form(
            key: _formKey,
            child: InputField(
              text: "Password",
              controller: _controller,
              margin: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 8),
              icon: Image.asset("assets/images/lock.png"),
              isPassword: true,
              obscurePassword: _obscurePassword,
              onToggleVisibility: _togglePasswordVisibility,
              passwordStrength: 4,
              passwordStrengthText: "Erős",
            ),
          ),
        ],
      ),
    );
  }
}
