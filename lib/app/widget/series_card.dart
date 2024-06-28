import 'package:flutter/material.dart';

class SeriesCard extends StatelessWidget {
  final Map<String, dynamic> series;

  SeriesCard({required this.series});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200.0, // Adjust height based on design
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: series['thumbnail'] != null
                  ? DecorationImage(
                image: NetworkImage(
                  '${series['thumbnail']['path']}.${series['thumbnail']['extension']}',
                ),
                fit: BoxFit.cover,
              )
                  : null, // Handle cases where thumbnail is null
            ),
            child: series['thumbnail'] == null
                ? Center(
              child: Text(
                'No Image Available',
                style: TextStyle(color: Colors.white),
              ),
            )
                : null, // Placeholder if no thumbnail
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                series['title'] ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
