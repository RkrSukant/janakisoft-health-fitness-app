import 'package:floor/floor.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/sqlite/db_constants.dart';

@Entity(tableName: DatabaseConstants.exampleTable)
class ExampleEntity {
  @PrimaryKey()
  @ColumnInfo(name: DatabaseConstants.exampleId)
  final int id;

  @ColumnInfo(name: DatabaseConstants.exampleName)
  final String name;

  @ColumnInfo(name: DatabaseConstants.exampleName2)
  final String nameTwo;

  @ColumnInfo(name: DatabaseConstants.exampleName3)
  final String nameThree;

  ExampleEntity({
    required this.id,
    required this.name,
    required this.nameTwo,
    required this.nameThree,
  });
}
