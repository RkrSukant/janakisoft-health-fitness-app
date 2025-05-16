import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/auth/presentation/widgets/forgot_password_progress_indicator.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/appbar.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_filled_button.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/screen_container.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/text_field_widget.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ScreenContainer(
        color: AppColors.whiteFFFFFF,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              Strings.forgotPassword,
              style: textFF6D00s32w700,
            ),
            addVerticalSpace(Dimens.spacing_16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.spacing_4),
              child: Text(
                Strings.forgotPasswordMsg,
                textAlign: TextAlign.center,
                style: text8F9098s14w500,
              ),
            ),
            addVerticalSpace(Dimens.spacing_24),
            CustomTextField(
                textController: _emailController, hintText: Strings.email),
            addVerticalSpace(Dimens.spacing_32),
            RoundedFilledButtonWidget(text: Strings.sendCode, onPress: () {}),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ForgotPasswordProgressIndicatorWidget(isActive: true),
                addHorizontalSpace(Dimens.spacing_12),
                const ForgotPasswordProgressIndicatorWidget(),
                addHorizontalSpace(Dimens.spacing_12),
                const ForgotPasswordProgressIndicatorWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
