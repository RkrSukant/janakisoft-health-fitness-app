import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/routes/app_route.gr.dart';
import 'package:janakisoft_health_fitness_app/routes/route_util.dart';
import 'package:janakisoft_health_fitness_app/shared/enums/toast_type.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/extensions.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/image_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_filled_button.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/text_field_widget.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                ImageConstants.icAppIcon,
                height: Dimens.spacing_120,
                width: Dimens.spacing_120,
              ),
              addVerticalSpace(Dimens.spacing_16),
              loginWidget(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget loginWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          Strings.signIn,
          style: textFF6D00s32w700,
        ),
        addVerticalSpace(Dimens.spacing_16),
        const Text(
          Strings.loginMsg,
          style: text8F9098s14w500,
        ),
        addVerticalSpace(Dimens.spacing_24),
        CustomTextField(
            textController: _emailController, hintText: Strings.email),
        addVerticalSpace(Dimens.spacing_16),
        CustomTextField(
          textController: _passwordController,
          hintText: Strings.password,
          obscureText: true,
        ),
        addVerticalSpace(Dimens.spacing_8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  context.routePush(const ForgotPasswordRoute());
                },
                child: const Padding(
                  padding: EdgeInsets.all(Dimens.spacing_4),
                  child: Text(
                    Strings.forgotPassword,
                    style: text8F9098s12w400,
                  ),
                )),
          ],
        ),
        addVerticalSpace(Dimens.spacing_32),
        RoundedFilledButtonWidget(
            text: Strings.login,
            onPress: () {
              if (_isValid()) {
                context.pushRoute(const DashboardRoute());
              }
            }),
        addVerticalSpace(Dimens.spacing_12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              Strings.dontHaveAnAccount,
              style: text1F2024s14w400,
            ),
            InkWell(
              onTap: () {
                context.routePush(const RegisterRoute());
              },
              child: const Padding(
                padding: EdgeInsets.all(Dimens.spacing_4),
                child: Text(
                  Strings.register,
                  style: textFF6D00s14w600,
                ),
              ),
            ),
          ],
        ),
        addVerticalSpace(Dimens.spacing_16),
        Row(
          children: [
            addDivider(),
            addHorizontalSpace(Dimens.spacing_16),
            const Text(
              "Or",
              style: text1F2024s14w400,
            ),
            addHorizontalSpace(Dimens.spacing_16),
            addDivider(),
          ],
        ),
        addVerticalSpace(Dimens.spacing_16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ssoLoginWidget(ImageConstants.icGoogle, () {
              context.pushRoute(const DashboardRoute());
            }),
            addHorizontalSpace(Dimens.spacing_16),
            ssoLoginWidget(ImageConstants.icFacebook, () {
              context.pushRoute(const OnboardingRoute());
            }),
            addHorizontalSpace(Dimens.spacing_16),
            ssoLoginWidget(ImageConstants.icApple, () {
              context.pushRoute(LandingRoute());
            }),
          ],
        )
      ],
    );
  }

  bool _isValid() {
    if (_emailController.text.isEmpty) {
      context.showToast(Strings.enterEmail, ToastType.error);
      return false;
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text)) {
      context.showToast(Strings.invalidEmail, ToastType.error);
      return false;
    }
    if (_passwordController.text.isEmpty) {
      context.showToast(Strings.enterEmail, ToastType.error);
      return false;
    }
    return true;
  }

  Widget ssoLoginWidget(String image, Function() callback) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteFFFFFF,
            borderRadius: BorderRadius.circular(Dimens.spacing_16)),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacing_16),
          child: Image.asset(
            image,
            height: Dimens.spacing_32,
            width: Dimens.spacing_32,
          ),
        ),
      ),
    );
  }
}
