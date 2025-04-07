import 'package:janakisoft_health_fitness_app/features/example/data/model/example_model.dart';
import 'package:janakisoft_health_fitness_app/shared/storage/sqlite/entity/example_entity.dart';

class ExampleMapper {
  static ExampleEntity mapToEntity(ExampleModel item) {
    return ExampleEntity(
      id: item.id,
      name: item.name,
      nameTwo: item.nameTwo,
      nameThree: item.nameThree,
    );
  }
}
