import 'restaurant_type.dart';
import 'comment.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final double rating;
  final List<Comment> comments;

  Restaurant({
    required this.name,
    required this.address,
    required this.type,
    required this.rating,
    List<Comment>? comments,
  }) : comments = comments ?? [];

  void addComment(Comment comment) {
    comments.add(comment);
  }

  double get averageRate {
    if (comments.isEmpty) return 0;
    final sum = comments.fold<int>(0, (sum, comment) => sum + comment.star);
    return sum / comments.length;
  }
}
