import 'package:dartz/dartz.dart';
import 'package:promina/features/Home/data/models/GalleryModel.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/home_repository.dart';

class GetMyGalleryUseCase {
  final HomeRepository homeRepository;

  GetMyGalleryUseCase({required this.homeRepository});

  Future<Either<Failure, GalleryModel>> call() async {
    return homeRepository.getMyGallery();
  }
}
