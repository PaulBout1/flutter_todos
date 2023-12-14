part of 'todos_overview_bloc.dart';

enum TodosStatusEnum { initial, loading, success, failure }

final class TodosOverviewState extends Equatable {
  const TodosOverviewState({
    this.status = TodosStatusEnum.initial,
    this.todos = const [],
    this.filter = TodosFiltersEnum.all,
    this.lastDeletedTodo,
  });

  final TodosStatusEnum status;
  final List<Todo> todos;
  final TodosFiltersEnum filter;
  final Todo? lastDeletedTodo;

  Iterable<Todo> get filteredTodos => filter.applyAll(todos);

  TodosOverviewState copyWith({
    TodosStatusEnum Function()? status,
    List<Todo> Function()? todos,
    TodosFiltersEnum Function()? filter,
    Todo? Function()? lastDeletedTodo,
  }) {
    return TodosOverviewState(
      status: status != null ? status() : this.status,
      todos: todos != null ? todos() : this.todos,
      filter: filter != null ? filter() : this.filter,
      lastDeletedTodo:
          lastDeletedTodo != null ? lastDeletedTodo() : this.lastDeletedTodo,
    );
  }

  @override
  List<Object?> get props => [
        status,
        todos,
        filter,
        lastDeletedTodo,
      ];
}
