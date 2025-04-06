import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_flutter_boilerplate/features/auth/presentation/widgets/forgot_password_progress_indicator.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/colors.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/dimens.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/strings.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/text_styles.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/utils.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/appbar.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/rounded_filled_button.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/screen_container.dart';
import 'package:sukant_flutter_boilerplate/shared/widgets/text_field_widget.dart';

@RoutePage()
class EnterOTPScreen extends ConsumerStatefulWidget {
  const EnterOTPScreen({super.key});

  @override
  ConsumerState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends ConsumerState<EnterOTPScreen> {
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
              Strings.enterOTP,
              style: text2A4ECAs32w700,
            ),
            addVerticalSpace(Dimens.spacing_16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.spacing_4),
              child: Text(
                Strings.enterOTPMessage,
                textAlign: TextAlign.center,
                style: text8F9098s14w500,
              ),
            ),
            addVerticalSpace(Dimens.spacing_24),
            CustomTextField(
                textController: _emailController, hintText: Strings.email),
            addVerticalSpace(Dimens.spacing_32),
            RoundedFilledButtonWidget(
                text: Strings.resetPassword, onPress: () {}),
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
