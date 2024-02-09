import 'package:tobeto_mobil/constants/image_text.dart';
import 'package:tobeto_mobil/dummy_education_data.dart';
import 'package:tobeto_mobil/models/firebase_models/application_model.dart';
import 'package:tobeto_mobil/models/catalog_model.dart';
import 'package:tobeto_mobil/models/education/education_model.dart';
import 'package:tobeto_mobil/models/education/enums/education_status.dart';
import 'package:tobeto_mobil/models/firebase_models/exam_model.dart';
import 'package:tobeto_mobil/models/survey_model.dart';
import 'package:tobeto_mobil/models/review_model.dart';

final List<EducationModel> educationModelData = [
  EducationModel(
    id: "1",
    userId: "1",
    title: "Ders 1",
    category: "Genel",
    thumbnail: ders1,
    startDate: "1/1/1",
    endDate: "1/1/1",
    creator: "Enocta",
    status: EducationStatus.started,
    content: [
      module1Data,
      softSkill1Data,
      virtualClass3Data,
      ...dummyEducationData,
    ],
  ),
  EducationModel(
    id: "2",
    userId: "2",
    title: "Ders 2",
    category: "Genel",
    thumbnail: ders1,
    startDate: "1/1/1",
    endDate: "1/1/1",
    creator: "Enocta",
    status: EducationStatus.started,
    content: [
      module1Data,
      softSkill1Data,
      virtualClass3Data,
      ...dummyEducationData,
    ],
  ),
  EducationModel(
    id: "3",
    userId: "3",
    title: "Ders 3",
    category: "Genel",
    thumbnail: ders1,
    startDate: "1/1/1",
    endDate: "1/1/1",
    creator: "Enocta",
    status: EducationStatus.started,
    content: [
      module1Data,
      softSkill1Data,
      virtualClass3Data,
      ...dummyEducationData,
    ],
  ),
];

final List<SurveyModel> surveyModelData = [
  SurveyModel(id: "1"),
  SurveyModel(id: "2"),
  SurveyModel(id: "3"),
  SurveyModel(id: "4"),
  SurveyModel(id: "5"),
];


final List<CatalogModel> catalogModelData = [
  CatalogModel(
    id: "1",
    title: "Dinle, Anla, İfade Et: Etkili İletişim Gelişim Yolculuğu",
    totalDuration: "4s 14dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog1,
  ),
  CatalogModel(
    id: "2",
    title: "Sürdürülebilir Bir Dünya için Bireysel Farkındalık",
    totalDuration: "40dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog2,
  ),
  CatalogModel(
    id: "3",
    title: "Hibrit Yaşamda Duyguyu Düzenleme",
    totalDuration: "53dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog1,
  ),
  CatalogModel(
    id: "4",
    title: "Web Sayfası Tasarımı Nasıl Oluşturulur? - HTML ",
    totalDuration: "2s 14dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog2,
  ),
  CatalogModel(
    id: "5",
    title: "Programlamanın Tarihçesi ve Gelişimi",
    totalDuration: "1s",
    trainer: "Gürkan İlişen",
    thumbnail: catalog2,
  ),
  CatalogModel(
    id: "1",
    title: "Dinle, Anla, İfade Et: Etkili İletişim Gelişim Yolculuğu",
    totalDuration: "4s 14dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog1,
  ),
  CatalogModel(
    id: "2",
    title: "Sürdürülebilir Bir Dünya için Bireysel Farkındalık",
    totalDuration: "40dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog2,
  ),
  CatalogModel(
    id: "3",
    title: "Hibrit Yaşamda Duyguyu Düzenleme",
    totalDuration: "53dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog1,
  ),
  CatalogModel(
    id: "4",
    title: "Web Sayfası Tasarımı Nasıl Oluşturulur? - HTML ",
    totalDuration: "2s 14dk",
    trainer: "Gürkan İlişen",
    thumbnail: catalog2,
  ),
  CatalogModel(
    id: "5",
    title: "Programlamanın Tarihçesi ve Gelişimi",
    totalDuration: "1s",
    trainer: "Gürkan İlişen",
    thumbnail: catalog2,
  ),
];

final List<ReviewModel> reviewModelData = [
  ReviewModel(id: "1", title: "Tobeto İşte Başarı Modeli"),
  ReviewModel(id: "2", title: "Front End"),
  ReviewModel(id: "3", title: "Back End"),
  ReviewModel(id: "4", title: "Full Stack"),
  ReviewModel(id: "5", title: "SQL"),
];
