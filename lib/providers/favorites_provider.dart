import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    //  สลับสถานะชอบ/ไม่ชอบ
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false; // คืน false เมื่อเอาออกจาก favorite
    } else {
      state = [...state, meal];
      return true; // คืน true เมื่อเพิ่มเข้า favorite
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteNotifier, List<Meal>>((ref) {
      return FavoriteNotifier();
    });
