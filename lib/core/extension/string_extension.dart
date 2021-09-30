import 'package:flutter/widgets.dart';
import 'package:try_starter/l10n/localization.dart';

extension StringExtension on String {
  String intelliTrim() {
    return length > 15 ? '${substring(0, 15)}...' : this;
  }

  String? t(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }

  String get initial {
    final str = split(' ');
    var initial = '';
    if (str.length < 2) {
      initial = str[0][0];
    } else if (str.length >= 2) {
      initial = '${str[0][0]}${str[1][0]}';
    }

    return initial;
  }
}
