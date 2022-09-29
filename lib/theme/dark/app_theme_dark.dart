
import '../app_theme.dart';
import '../elements/app_colors.dart';
import '../elements/app_data_theme.dart';
import '../elements/app_text_theme.dart';
import 'app_colors_dark.dart';
import 'app_data_theme_dark_impl.dart';
import 'app_text_theme_dark_impl.dart';

///
class AppThemeDark extends AppTheme {
  const AppThemeDark();

  @override
  AppColors get colors => AppColorsDark();

  @override
  AppTextTheme get textTheme => AppTextThemeDarkImpl(colors);

  @override
  AppDataTheme get dataTheme => AppDataThemeDarkImpl(colors);
}
