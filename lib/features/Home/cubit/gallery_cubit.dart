import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:promina/core/go/go.dart';
import 'package:promina/core/shared_preferances/cache_helper.dart';
import 'package:promina/features/Auth/presentation/screens/login_screen.dart';
import 'package:promina/features/Home/data/models/GalleryModel.dart';
import 'package:promina/features/Home/data/models/UploadModel.dart';
import 'package:promina/features/Home/domain/usecases/get_my_gallery_usecase.dart';
import '../domain/usecases/upload_img_usecase.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  final UploadImgUseCase uploadImgUseCase;
  final GetMyGalleryUseCase myGalleryUseCase;

  GalleryCubit({required this.uploadImgUseCase, required this.myGalleryUseCase})
      : super(GalleryInitial());

  void uploadImg() async {
    emit(UploadImageLoadingState());
    final failureOrSuccess = await uploadImgUseCase.call(image: pickedImage);
    failureOrSuccess.fold(
        (failure) => emit(UploadImageErrorState(error: failure.getMessage())),
        (success) {
      emit(UploadImageSuccessState(model: success));
    });
  }

  File? pickedImage;

  Future<void> getImage({required ImageSource source}) async {
    emit(ImagePickedLoadingState());
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      emit(ImagePickedSuccessState());
    } else {
      emit(ImagePickedErrorState());
      print('no image selected');
    }
  }

  void getMyGallery() async {
    emit(GetGalleryLoadingState());
    final failureOrSuccess = await myGalleryUseCase.call();
    failureOrSuccess.fold(
      (failure) => emit(GetGalleryErrorState()),
      (success) => emit(GetGallerySuccessState(model: success)),
    );
  }

  void signOut(context) {
    CacheHelper.removeData(key: 'token');
    Go.goAndFinish(context, const LoginScreen());
    emit(SignOutSuccessState());
  }
}
