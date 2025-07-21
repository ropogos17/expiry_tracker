import 'package:expiry_tracker/features/announcements/presentation/widgets/announcement_card.dart';
import 'package:expiry_tracker/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:expiry_tracker/shared/constants/colors.dart';
import 'package:expiry_tracker/shared/widgets/title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/app_routes.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'core/network/network_service.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(loginUseCase: _loginUseCase),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
        children: [
          Title(
            text: "Expiry Tracker",
            subtitle: "Tartsd számon, amid van – ne hagyd pazarolni!",
          ),
          AnnouncementCard(
            title: "Regisztráció megerősítése",
            description:
                "Köszönjük, hogy csatlakoztál! Kérjük, erősítsd meg az email címed a folytatáshoz – így értesíteni tudunk, ha egy étel hamarosan lejár.",
            backgroundColor: Color(0xFFFFF7ED),
            titleColor: Color(0xFF92400E),
            borderColor: Color(0xFFFDBA74),
            externalLink: "https://example.com/confirm-registration",
            isRead: false,
          ),
        ],
      ),
    );
  }
}
