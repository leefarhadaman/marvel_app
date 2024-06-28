import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marvel App Home',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        elevation: 0, // Remove shadow
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // Dark color at the top
              Color(0xFF1C1C1C), // Slightly lighter color at the bottom
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildCategoryCard(context, 'Characters', '/characters',
                      'https://imgs.search.brave.com/O39LkakWFsKLou-qjHflVE5tn8EAG1muKZtZOACnKF4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJjYXZlLmNv/bS93cC93cDI0OTE2/MTEuanBn'),
                  _buildCategoryCard(context, 'Comics', '/comics',
                      'https://imgs.search.brave.com/Ti2fTXtm0UjyfbTxuPLQoKJBdsCyuwz_VSvz5EVRJyQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/QTFuTnB3RkE1WUwu/anBn'),
                  _buildCategoryCard(context, 'Creators', '/creators',
                      'https://imgs.search.brave.com/4RDg4q6I758kJEU-deZJR-DR2F89swLM7SEDaB8Q2Mk/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9sdW1p/ZXJlLWEuYWthbWFp/aGQubmV0L3YxL2lt/YWdlcy9tYXJ2ZWxo/cS1nYW1lY2F0ZWdv/cnktc3VwZXItaGVy/b19iYjIzNGEzMS5q/cGVn'),
                  _buildCategoryCard(context, 'Events', '/events',
                      'https://imgs.search.brave.com/IDwBvfKPmXnfyKVIFZ-lzrpjydVNxdrO0Q1sHusZxQI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zMjk4/Mi5wY2RuLmNvL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDIyLzAy/L21hcnZlbC1ldmVu/dHMtY292ZXItY29s/bGFnZS5qcGcub3B0/aW1hbC5qcGc'),
                  _buildCategoryCard(context, 'Series', '/series',
                      'https://imgs.search.brave.com/zvs4tsFRY2aAEXm7xAqj9QAoY4e9KmBVQrzAmxYNJfM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMxLmNvbGxpZGVy/aW1hZ2VzLmNvbS93/b3JkcHJlc3Mvd3At/Y29udGVudC91cGxv/YWRzLzIwMjEvMDkv/bWFydmVsLXdoYXQt/aWYtZXBpc29kZS01/LWNhc3QuanBn'),
                  _buildCategoryCard(context, 'Stories', '/stories',
                      'https://imgs.search.brave.com/n5l7EcFTelGJy2L314KywKXTsZS8vQE4boyksCEiiOo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFkNExNQytET0wu/anBn'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made by ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'dev.faru',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String route,
      String imageUrl) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                colorBlendMode: BlendMode.dstATop,
                color: Colors.black.withOpacity(0.6),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
