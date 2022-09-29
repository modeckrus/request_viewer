import 'elements/app_colors.dart';
import 'elements/app_data_theme.dart';
import 'elements/app_text_theme.dart';

/// Тема
abstract class AppTheme {
  const AppTheme();

  AppTextTheme get textTheme;

  AppColors get colors;

  AppDataTheme get dataTheme;
}
