// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../theme_provider.dart';

class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({super.key});

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  
  @override
  Widget build(BuildContext context) {
  var isLight = context.watch<ThemeProvider>().getIsLight();
    return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Shimmer.fromColors(
                baseColor: !isLight ?  Colors.grey[800]! :Colors.grey[300]!,
                highlightColor: !isLight ? Colors.grey[600]! :Colors.grey[300]!,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 100,
              height: 30,
              child: Shimmer.fromColors(
                baseColor: !isLight ? Colors.grey[800]! :Colors.grey[300]!,
                highlightColor: !isLight ? Colors.grey[600]! :Colors.grey[300]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 50),
             SizedBox(
                  width: 100,
                  height: 30,
                  child: Shimmer.fromColors(
                    baseColor: !isLight ? Colors.grey[800]!:Colors.grey[300]!,
                    highlightColor:
                        !isLight ?  Colors.grey[600]!:Colors.grey[300]!,
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: Shimmer.fromColors(
                    baseColor: !isLight ?  Colors.grey[800]! :Colors.grey[300]!,
                    highlightColor:
                        !isLight ? Colors.grey[600]! :Colors.grey[300]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 155,
              height: 30,
              child: Shimmer.fromColors(
                baseColor: !isLight ?  Colors.grey[800]!:Colors.grey[300]!,
                highlightColor: !isLight ?  Colors.grey[600]!:Colors.grey[300]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ],
    ),
  );
  }
}
