import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobil/api/bloc/auth_bloc/auth_bloc.dart';
import 'package:tobeto_mobil/api/bloc/auth_bloc/auth_event.dart';
import 'package:tobeto_mobil/api/bloc/auth_bloc/auth_state.dart';
import 'package:tobeto_mobil/api/bloc/user_bloc/user_bloc.dart';
import 'package:tobeto_mobil/api/bloc/user_bloc/user_event.dart';
import 'package:tobeto_mobil/api/bloc/user_bloc/user_state.dart';
import 'package:tobeto_mobil/configuration/configuration.dart';
import 'package:tobeto_mobil/constants/global_text.dart';
import 'package:tobeto_mobil/constants/pages/auth_text.dart';
import 'package:tobeto_mobil/core/widgets/dialogs/show_auth_error.dart';
import 'package:tobeto_mobil/core/widgets/loading_widget/loading_state_widget.dart';
import 'package:tobeto_mobil/firebase_options.dart';
import 'package:tobeto_mobil/pages/authentication/login/login_page.dart';
import 'package:tobeto_mobil/pages/authentication/recover/recover_page.dart';
import 'package:tobeto_mobil/pages/authentication/register/register_page.dart';
import 'package:tobeto_mobil/pages/home/home_page.dart';
import 'package:tobeto_mobil/pages/no_connection/no_connection_page.dart';
import 'package:tobeto_mobil/utils/router/route_generator.dart';
import 'package:tobeto_mobil/utils/theme/theme_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        authBlocProvider,
        userBlocProvider,
        announcementBlocProvider,
        applicationBlocProvider,
        examBlocProvider,
        reviewBlocProvider,
        educationBlocProvider,
        catalogBlocProvider,
        teamBlocProvider,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeGenerator.lightTheme(),
        darkTheme: ThemeGenerator.darkTheme(),
        themeMode: ThemeMode.system,
        onGenerateRoute: (route) => RouteGenerator.onGenerateRoute(route),
        home: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthStateLoading) {
              LoadingStateWidget.instance().show(
                context: context,
                text: loadingStateWidgetLoadingText,
              );
            } else if (state is AuthStateRecoverLinkSent) {
              _showOverlay(context, recoveryLinkSentText);
            } else if (state is AuthStateRegistered) {
              _showOverlay(context, registerRegisteredText);
            } else {
              LoadingStateWidget.instance().hide();
            }

            final error = state.error;
            if (error != null) {
              showAuthError(
                exception: error,
                context: context,
              );
            }
          },
          buildWhen: (previous, current) {
            if (current is AuthStateLoading) {
              return false;
            }

            if (current is AuthStateLoggedOut && current.error != null) {
              return false;
            }

            if (current is AuthStateRegistered) {
              return false;
            }

            if (current is AuthStateRecoverLinkSent) {
              return false;
            }

            return true;
          },
          builder: (context, state) {
            if (state is AuthStateInitial) {
              context.read<AuthBloc>().add(
                    const AuthEventInitialize(),
                  );
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthStateNoConnection) {
              return const NoConnectionPage();
            }
            if (state is AuthStateInRegisterView) {
              return const RegisterPage();
            }
            if (state is AuthStateInRecoverView) {
              return const RecoverPage();
            }
            if (state is AuthStateLoggedIn) {
              _onDifferentAccount(context, state.user);
              return const HomePage();
            }
            return const LoginPage();
          },
        ),
      ),
    ),
  );
}

void _showOverlay(BuildContext context, String text) {
  LoadingStateWidget.instance().hide();
  LoadingStateWidget.instance().show(
    context: context,
    text: text,
    onClose: () {
      context.read<AuthBloc>().add(const AuthEventInitialize());
      LoadingStateWidget.instance().hide();
    },
  );
}

void _onDifferentAccount(BuildContext context, User user) {
  final userBloc = context.read<UserBloc>();

  if (userBloc.state is UserStateFetched) {
    final userState = userBloc.state as UserStateFetched;
    if (userState.userModel.email != user.email) {
      userBloc.add(UserEventFetch(id: user.uid));
    }
  }
}
