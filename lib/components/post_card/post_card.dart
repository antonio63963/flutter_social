import 'package:flutter/material.dart';
import 'package:social/utils/extensiions.dart';
import 'package:social/utils/styles.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String date;
  final String text;
  final String? avatar;

  const PostCard({
    super.key,
    required this.userName,
    required this.date,
    required this.text,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: avatar != null
                        ? Image.network(avatar!)
                        : Text(
                            userName.capitalize().substring(0, 2),
                            style: Styles.avatarText,
                          ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        userName,
                        style: Styles.cardTitle,
                      ),
                      Text(
                        date,
                        style: Styles.cardSubtitle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Text(
                        text,
                        style: Styles.cardText,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Color.fromRGBO(255, 255, 255, .8),
                              Color.fromRGBO(255, 255, 255, 0)
                            ],
                            stops: [0, 0.6, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
