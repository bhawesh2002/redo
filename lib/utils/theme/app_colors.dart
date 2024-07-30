import 'dart:ui';

class AppColors {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static Color primaryEmrald = emrald['500']!;
  static Color primarySilver = silver['500']!;
  // Primary Color
  static const Map<String, Color> emrald = {
    '50': Color(0xffeffef6),
    '100': Color(0xffd9ffee),
    '200': Color(0xffb5fdde),
    '300': Color(0xff7bfac4),
    '400': Color(0xff3beda3),
    '500': Color(0xFF06DF85), //Primary Emrald
    '600': Color(0xFF04BA6E),
    '700': Color(0xff0a8b56),
    '800': Color(0xff0e6d47),
    '900': Color(0xff0d5a3d),
    '950': Color(0xff013220),
  };
  //Neutral Color
  static const Map<String, Color> silver = {
    '50': Color(0xfff7f7f7),
    '100': Color(0xfff0f0f0),
    '200': Color(0xffe3e3e3),
    '300': Color(0xffd1d1d1),
    '400': Color(0xffc2c2c2),
    '500': Color(0xffaaaaaa), //Primary Silver
    '600': Color(0xff969696),
    '700': Color(0xff818181),
    '800': Color(0xff6a6a6a),
    '900': Color(0xff585858),
    '950': Color(0xff333333),
    '1000': Color(0xFF242424),
    '1050': Color(0xFF1A1A1A),
  };
}
