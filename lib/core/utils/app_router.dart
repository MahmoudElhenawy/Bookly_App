import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/auth/presentation/views/login_view.dart';
import 'package:bookly/features/auth/presentation/views/signup_view.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manger/cubit/simmilarbooks_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const bookDetiles = '/bookDetiles';
  static const searchView = '/searchView';
  static const loginView = '/LoginView';
  static const signupView = '/SignupView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: signupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetiles,
        builder: (context, state) {
          final extra = state.extra;
          if (extra is BookModel) {
            return BlocProvider(
              create: (context) =>
                  SimmilarbooksCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(bookModel: extra),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Text('No Book Data'),
              ),
            );
          }
        },
      ),
    ],
  );
}
