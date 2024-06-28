import 'package:flutter/material.dart';

class ComicCard extends StatelessWidget {
  final Map<String, dynamic> comic;

  const ComicCard({required this.comic});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(
              '${comic['thumbnail']['path']}.${comic['thumbnail']['extension']}',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(1),
              ],
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comic['title'],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Issue Number: ${comic['issueNumber']}',
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text(
                comic['description'] != null && comic['description'].isNotEmpty
                    ? comic['description']
                    : 'No description available.',
                style: TextStyle(fontSize: 14.0, color: Colors.white),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
