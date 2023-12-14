import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/views/home/home_cubit.dart';

void main() {
  group('HomeCubit', () {
    HomeCubit buildCubit() => HomeCubit();

    group('constructor', () {
      test('works properly', () {
        expect(buildCubit, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildCubit().state,
          equals(HomeTab.todos),
        );
      });
    });

    group('setTab', () {
      blocTest<HomeCubit, HomeTab>(
        'sets tab to given value',
        build: buildCubit,
        act: (cubit) => cubit.setTab(HomeTab.stats),
        expect: () => [HomeTab.stats],
      );
    });
  });
}
