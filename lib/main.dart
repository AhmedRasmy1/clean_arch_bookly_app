import 'package:bookly/Features/home/data/repositores/home_repo_impl.dart';
import 'package:bookly/Features/home/domian/usecases/featch_featuerd_books_use_case.dart';
import 'package:bookly/Features/home/domian/usecases/featch_newest_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/core/utils/bloc_observer/simple_bloc_observer.dart';
import 'package:bookly/core/utils/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/home/domian/entities/entity_book.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EntityBookAdapter());
  await Hive.openBox<EntityBook>(kFeauturedBooks);
  await Hive.openBox<EntityBook>(kNewestBooks);
  Bloc.observer = SimpleBlocObserver(); //! to call the bloc observer
  setUp(); //! to call the dependency injection
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(), //! dependency injection
            ),
          )..fetchFeaturedBooks(pageNumber: 0),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FeatchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..featchNewestBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
