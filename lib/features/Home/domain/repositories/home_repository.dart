import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:promina/core/error_handeller/failures.dart';
import 'package:promina/features/Home/data/models/GalleryModel.dart';
import 'package:promina/features/Home/data/models/UploadModel.dart';

abstract class HomeRepository {
  Future<Either<Failure, UploadModel>> uploadImg({required File? image});

  Future<Either<Failure, GalleryModel>> getMyGallery();
}
