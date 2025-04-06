import 'package:floor/floor.dart';
import 'package:sukant_flutter_boilerplate/shared/storage/sqlite/entity/example_entity.dart';


@dao
abstract class ExampleDao{
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int?> insert(ExampleEntity entity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int?>> insertAllData(List<ExampleEntity> items);

  @Query('select * from example')
  Future<List<ExampleEntity>?> fetchAllExample();
}