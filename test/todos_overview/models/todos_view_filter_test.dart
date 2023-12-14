import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todos/models/todos_view_filter.dart';
import 'package:todos_repository/todos_repository.dart';

void main() {
  group('TodosViewFilter', () {
    final completedTodo = Todo(
      id: '0',
      title: 'completed',
      isCompleted: true,
    );

    final incompleteTodo = Todo(
      id: '1',
      title: 'incomplete',
    );

    group('apply', () {
      test('always returns true when filter is .all', () {
        expect(
          TodosFiltersEnum.all.apply(completedTodo),
          isTrue,
        );
        expect(
          TodosFiltersEnum.all.apply(incompleteTodo),
          isTrue,
        );
      });

      test(
        'returns true when filter is .activeOnly '
        'and the todo is incomplete',
        () {
          expect(
            TodosFiltersEnum.activeOnly.apply(completedTodo),
            isFalse,
          );
          expect(
            TodosFiltersEnum.activeOnly.apply(incompleteTodo),
            isTrue,
          );
        },
      );

      test(
          'returns true when filter is .completedOnly '
          'and the todo is completed', () {
        expect(
          TodosFiltersEnum.completedOnly.apply(incompleteTodo),
          isFalse,
        );
        expect(
          TodosFiltersEnum.completedOnly.apply(completedTodo),
          isTrue,
        );
      });
    });

    group('applyAll', () {
      test('correctly filters provided iterable based on selected filter', () {
        final allTodos = [completedTodo, incompleteTodo];

        expect(
          TodosFiltersEnum.all.applyAll(allTodos),
          equals(allTodos),
        );
        expect(
          TodosFiltersEnum.activeOnly.applyAll(allTodos),
          equals([incompleteTodo]),
        );
        expect(
          TodosFiltersEnum.completedOnly.applyAll(allTodos),
          equals([completedTodo]),
        );
      });
    });
  });
}
