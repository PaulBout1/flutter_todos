import 'package:flutter_bloc/flutter_bloc.dart';

enum HomeTab { todos, stats }

class HomeCubit extends Cubit<HomeTab> {
  HomeCubit() : super(HomeTab.todos);

  void setTab(HomeTab tab) => emit(tab);
}
