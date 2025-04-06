import 'package:sukant_flutter_boilerplate/features/example/data/model/example_model.dart';
import 'package:sukant_flutter_boilerplate/shared/storage/sqlite/entity/example_entity.dart';

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
