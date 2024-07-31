import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:redo/utils/enums/prirority.dart';
import 'package:redo/utils/measurements/uisizes.dart';
import 'package:redo/utils/models/todo.dart';
import 'package:redo/utils/theme/app_colors.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PrirorityAdapter());
  Hive.registerAdapter(TodoAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    UiSizes().init(context); //initialize UiSizes
    List<Color> primary = AppColors.emrald.values.toList();
    List<Color> neutral = AppColors.silver.values.toList();
    List<String> primaryShadeValue = AppColors.emrald.keys.toList();
    List<String> neutralShadeValue = AppColors.silver.keys.toList();
    // List<Color> allColors = [...primary, ...neutral];
    // List<String> shadeValue = [...primaryShadeValue, ...neutralShadeValue];
    return MaterialApp(
      theme: ThemeData(fontFamily: 'GalanoGrotesque'),
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "REDO",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '''Redo is a Todo App that helps you to keep track of your daily tasks and goals. '''
                    '''It is designed to be simple and easy to use. It is built with Flutter and Firebase. '''
                    '''It is a work in progress and will be updated regularly. It is open source and contributions are welcome. '''
                    '''You can find the source code on GitHub.''',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Color Palette",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text("Emrald",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                ),
                GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    padding: const EdgeInsets.all(16),
                    children: List.generate(primary.length, (index) {
                      return Material(
                        elevation: 15,
                        color: primary[index],
                        shadowColor: AppColors.silver['200']!,
                        shape: index == 5
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.white,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(22),
                              )
                            : null,
                        borderRadius:
                            index != 5 ? BorderRadius.circular(22) : null,
                        child: InkWell(
                          onTap: () {},
                          splashColor: primary[index],
                          child: SizedBox(
                            child: Center(
                              child: Text(
                                '${primary[index].value.toRadixString(16).replaceFirst('ff', '#')}\n${primaryShadeValue[index]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  color: primary[index].computeLuminance() > 0.5
                                      ? AppColors.black
                                      : AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text("Silver",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                ),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  padding: const EdgeInsets.all(16),
                  children: List.generate(
                    neutral.length,
                    (index) {
                      return Material(
                        elevation: 15,
                        color: neutral[index],
                        shadowColor: AppColors.silver['200']!,
                        shape: index == 5
                            ? RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.white,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(22),
                              )
                            : null,
                        borderRadius:
                            index != 5 ? BorderRadius.circular(22) : null,
                        child: InkWell(
                          onTap: () {},
                          splashColor: neutral[index],
                          child: SizedBox(
                            child: Center(
                              child: Text(
                                '${neutral[index].value.toRadixString(16).replaceFirst('ff', '#')}\n${neutralShadeValue[index]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: neutral[index].computeLuminance() > 0.5
                                      ? AppColors.black
                                      : AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
