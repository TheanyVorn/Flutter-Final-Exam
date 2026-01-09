import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../../models/comment.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import './restaurant_comments_form.dart';

class RestaurantCommentsView extends StatefulWidget {
  const RestaurantCommentsView({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantCommentsView> createState() => _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  void _showAddCommentForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return RestaurantCommentsForm(
          restaurant: widget.restaurant,
          onCommentAdded: (comment) {
            setState(() {
              widget.restaurant.addComment(comment);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: Text(widget.restaurant.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCommentForm,
        backgroundColor: AppColors.main,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Header with restaurant info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: AppColors.main,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.restaurant.address,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    RestaurantTypeChip(type: widget.restaurant.type),
                    const SizedBox(width: 8),
                    StarsChip(rating: widget.restaurant.averageRate),
                  ],
                ),
              ],
            ),
          ),
          // Comments list
          Expanded(
            child: widget.restaurant.comments.isEmpty
                ? const Center(child: Text('No comments yet'))
                : ListView.builder(
                    itemCount: widget.restaurant.comments.length,
                    itemBuilder: (context, index) {
                      final comment = widget.restaurant.comments[index];
                      return CommentTile(comment: comment);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(comment.feedback),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${comment.star}'),
            const Icon(Icons.star, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
