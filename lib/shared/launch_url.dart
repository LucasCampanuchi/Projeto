import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/message.dart';

launchURL(String? url) async {
  if (url != null) {
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      message(
        'Erro ao abrir a página',
      );
    }
  } else {
    message(
      'Erro ao abrir a página',
    );
  }
}
