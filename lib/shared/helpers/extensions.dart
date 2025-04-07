
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:janakisoft_health_fitness_app/shared/enums/toast_type.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
          (Map<K, List<E>> map, E element) =>
      map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension SumOfExtension<T> on Iterable<T> {
  num sumOf(num Function(T) mapper) {
    num sum = 0;
    for (T element in this) {
      sum += mapper(element);
    }
    return sum;
  }
}

extension PrintStackTrace on Object {
  void printStackTrace() {
    if (this is Error) {
      final error = this as Error;
      debugPrint(error.stackTrace.toString());
    } else {
      debugPrint('No stack trace available for this object.');
    }
  }
}

extension Extensions on String? {
  bool isNotNullOrEmpty() {
    return this != null && this != "";
  }

  bool isNullOrEmpty() {
    return this == null || this == '';
  }
}

extension ContextExtensions on BuildContext {
  void showToast(String title, ToastType type) {
    Color activeColor = AppColors.black1F2024;
    if (type == ToastType.success) {
      activeColor = AppColors.green0CCB6B;
    } else if (type == ToastType.info) {
      activeColor = AppColors.blue006FFD;
    } else if (type == ToastType.warning) {
      activeColor = AppColors.orangeFF962E;
    } else {
      activeColor = AppColors.redC51523;
    }
    var fToast = FToast();
    fToast.init(this);
    return fToast.showToast(
        gravity: ToastGravity.BOTTOM,
        child: Container(
          margin: const EdgeInsets.only(bottom: Dimens.spacing_0),
          height: Dimens.spacing_40,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
            border: Border.all(color: activeColor),
            borderRadius: BorderRadius.circular(25.0),
            color: addWhite(activeColor, 0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.spacing_2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  type == ToastType.success ? Icons.check_circle : Icons.info,
                  color: activeColor,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: text1F2024s12w700,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}