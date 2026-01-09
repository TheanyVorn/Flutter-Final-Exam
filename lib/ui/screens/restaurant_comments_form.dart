import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../../models/comment.dart';

class RestaurantCommentsForm extends StatefulWidget {
  final Restaurant restaurant;
  final Function(Comment) onCommentAdded;

  const RestaurantCommentsForm({
    super.key,
    required this.restaurant,
    required this.onCommentAdded,
  });

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  final _feedbackController = TextEditingController();
  int _rating = 5;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _submitComment() {
    if (_feedbackController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a comment')));
      return;
    }

    final comment = Comment(feedback: _feedbackController.text, star: _rating);

    widget.onCommentAdded(comment);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add a Comment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _feedbackController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Write your feedback...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Rating: '),
              const SizedBox(width: 8),
              Expanded(
                child: Slider(
                  value: _rating.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: _rating.toString(),
                  onChanged: (value) {
                    setState(() {
                      _rating = value.toInt();
                    });
                  },
                ),
              ),
              Text('$_rating'),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitComment,
            child: const Text('Submit Comment'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
