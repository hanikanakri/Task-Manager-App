

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/database/db/sqflite.dart';
import 'package:task_manager_app/features/home_page/data/get_pagination_notes_respond_moedl.dart';
import 'package:task_manager_app/features/home_page/presentations/widgets/add_pagination_data_database.dart';

class MockSqfliteDataBase extends Mock implements SqfliteDataBase {}

class MockTodoList extends Mock implements TodoList {}


void main() {
  group('AddPaginationDataDatabase', () {
    late MockSqfliteDataBase mockSqfliteDataBase;
    late AddPaginationDataDatabase addPaginationDataDatabase;
    late TodoList todoList;

    setUp(() {
      mockSqfliteDataBase = MockSqfliteDataBase();
      todoList = TodoList(id: 1, userId: 1, todo: 'Test Todo');
      addPaginationDataDatabase = AddPaginationDataDatabase(
        id: todoList.id,
        index: 0,
        model: [todoList],
        sqfliteDataBase: mockSqfliteDataBase,
      );
    });

    test('insertData should call insertDatabase on SqfliteDataBase', () async {
      when(mockSqfliteDataBase.insertDatabase("any")).thenAnswer((_) async => 1);

      await addPaginationDataDatabase.insertData();

      verify(mockSqfliteDataBase.insertDatabase("any")).called(1);
    });

    test('updateData should call updateDatabase on SqfliteDataBase', () async {
      when(mockSqfliteDataBase.updateDatabase("any")).thenAnswer((_) async => 1);

      await addPaginationDataDatabase.updateData();

      verify(mockSqfliteDataBase.updateDatabase("any")).called(1);
    });

    test('checkDatabase should call readDatabase and then either insertData or updateData', () async {
      when(mockSqfliteDataBase.readDatabase("any")).thenAnswer((_) async => []);
      when(mockSqfliteDataBase.insertDatabase("any")).thenAnswer((_) async => 1);

      await addPaginationDataDatabase.checkDatabase();

      verify(mockSqfliteDataBase.readDatabase("any")).called(1);
      verify(mockSqfliteDataBase.insertDatabase("any")).called(1);
      verifyNever(mockSqfliteDataBase.updateDatabase("any"));
    });

    test('deleteData should call deleteMyDatabase on SqfliteDataBase', () async {
      when(mockSqfliteDataBase.deleteMyDatabase("any")).thenAnswer((_) async => 1);

      await addPaginationDataDatabase.deleteData();

      verify(mockSqfliteDataBase.deleteMyDatabase("any")).called(1);
    });

    test('readData should call readDatabase on SqfliteDataBase', () async {
      when(mockSqfliteDataBase.readDatabase("any")).thenAnswer((_) async => []);

      await addPaginationDataDatabase.readData();

      verify(mockSqfliteDataBase.readDatabase("any")).called(1);
    });
  });
}