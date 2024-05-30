part of 'gallery_cubit.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class UploadImageLoadingState extends GalleryState {}

class UploadImageErrorState extends GalleryState {
  final String error;

  UploadImageErrorState({required this.error});
}

class UploadImageSuccessState extends GalleryState {
  final UploadModel model;

  UploadImageSuccessState({required this.model});
}

class ImagePickedLoadingState extends GalleryState {}

class ImagePickedSuccessState extends GalleryState {}

class ImagePickedErrorState extends GalleryState {}

class SignOutSuccessState extends GalleryState {}

class GetGallerySuccessState extends GalleryState {
  final GalleryModel model;

  GetGallerySuccessState({required this.model});
}

class GetGalleryErrorState extends GalleryState {}

class GetGalleryLoadingState extends GalleryState {}


