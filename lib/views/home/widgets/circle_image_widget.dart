import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleImageWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  const CircleImageWidget({super.key, this.url, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 120.w,
      height: height ?? 120.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(url ??
                  "https://d3design.vn/uploads/Anh_Bia_Food_menu_web_banner_social_media_banner_template_Free_Psd.jpg"))),
    );
  }
}
