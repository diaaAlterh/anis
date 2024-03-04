import 'package:anis/features/home/data/api/home_apis.dart';
import 'package:anis/features/home/data/models/company_info_model.dart';
import 'package:anis/features/home/data/models/slider_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _sliderController = BehaviorSubject<SliderModel>();

  Stream<SliderModel> get sliderStream => _sliderController.stream;

  final _companyInfoController = BehaviorSubject<CompanyInfoModel>();

  Stream<CompanyInfoModel> get companyInfoStream => _companyInfoController.stream;
  final scrollOffsetController = PublishSubject<double>();

  HomeApis apis = HomeApis();

  getSlider() async {
    try {
      final sliderModel = await apis.getSlider();
      _sliderController.sink.add(sliderModel);
    } catch (error) {
      _sliderController.sink.addError(error);
    }
  }

  getCompanyInfo() async {
    try {
      final sliderModel = await apis.getCompanyInfo();
      _companyInfoController.sink.add(sliderModel);
    } catch (error) {
      _companyInfoController.sink.addError(error);
    }
  }
}

HomeBloc homeBloc = HomeBloc();
