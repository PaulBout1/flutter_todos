import 'package:todos_repository/todos_repository.dart';

enum TodosFiltersEnum { all, activeOnly, completedOnly }

extension TodosViewFilterX on TodosFiltersEnum {
  bool apply(Todo todo) {
    switch (this) {
      case TodosFiltersEnum.all:
        return true;
      case TodosFiltersEnum.activeOnly:
        return !todo.isCompleted;
      case TodosFiltersEnum.completedOnly:
        return todo.isCompleted;
    }
  }

  Iterable<Todo> applyAll(Iterable<Todo> todos) {
    return todos.where(apply);
  }
}
