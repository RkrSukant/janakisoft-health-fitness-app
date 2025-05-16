import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:janakisoft_health_fitness_app/features/dashboard/presentation/widgets/cardio_dashboard_component.dart';
import 'package:janakisoft_health_fitness_app/features/dashboard/presentation/widgets/skincare_dashboard_component.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: Dimens.spacing_8,
          crossAxisSpacing: Dimens.spacing_8,
          children:const [
            CardioDashboardComponentWidget(),
            SkinCareDashboardComponentWidget(),
            CardioDashboardComponentWidget(),
          ]
        ),
      ),
    ));
  }
}
