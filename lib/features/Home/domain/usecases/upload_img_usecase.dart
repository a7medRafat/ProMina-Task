import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/UploadModel.dart';
import '../repositories/home_repository.dart';

 class UploadImgUseCase {
  final HomeRepository homeRepository;

  UploadImgUseCase({required this.homeRepository});

  Future<Either<Failure, UploadModel>> call({required File? image}) async {
    return homeRepository.uploadImg(image: image);
  }
}
