import 'package:boring_form/field/boring_field.dart';
import 'package:boring_form/theme/boring_form_theme.dart';
import 'package:flutter/material.dart';

class BoringDropDownField<T> extends BoringField<T> {
  BoringDropDownField(
      {super.key,
      required super.jsonKey,
      required this.items,
      super.fieldController,
      super.decoration,
      super.displayCondition,
      super.boringResponsiveSize,
      super.onChanged});

  final List<DropdownMenuItem<T?>> items;

  @override
  Widget builder(context, controller, child) {
    final style = BoringFormTheme.of(context).style;

    return BoringField.boringFieldBuilder(
      style,
      decoration?.label,
      child: DropdownButtonFormField<T?>(
        decoration: getDecoration(context),
        onChanged: isReadOnly(context)
            ? null
            : ((value) {
                controller.value = value;
              }),
        value: controller.value,
        items: items,
      ),
    );
  }

  @override
  void onValueChanged(T? newValue) {}
}
