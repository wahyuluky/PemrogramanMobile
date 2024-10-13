import 'package:get/get.dart';

import '../modules/HomepageA/bindings/homepage_a_binding.dart';
import '../modules/HomepageA/views/homepage_a_view.dart';
import '../modules/HomepageU/bindings/homepage_u_binding.dart';
import '../modules/HomepageU/views/homepage_u_view.dart';
import '../modules/Modul/bindings/modul_binding.dart';
import '../modules/Modul/views/modul_view.dart';
import '../modules/OtpPage/bindings/otp_page_binding.dart';
import '../modules/OtpPage/views/otp_page_view.dart';
import '../modules/Quiz/bindings/quiz_binding.dart';
import '../modules/Quiz/views/quiz_view.dart';
import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifRegistrasi/bindings/notif_registrasi_binding.dart';
import '../modules/notifRegistrasi/views/notif_registrasi_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/photo/bindings/photo_binding.dart';
import '../modules/photo/views/photo_view.dart';
import '../modules/presensi/bindings/presensi_binding.dart';
import '../modules/presensi/views/presensi_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/registrasi/bindings/registrasi_binding.dart';
import '../modules/registrasi/views/registrasi_view.dart';
import '../modules/schedule/bindings/schedule_binding.dart';
import '../modules/schedule/views/schedule_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/struktur/bindings/struktur_binding.dart';
import '../modules/struktur/views/struktur_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRASI,
      page: () => RegistrasiView(),
      binding: RegistrasiBinding(),
    ),
    GetPage(
      name: _Paths.NOTIF_REGISTRASI,
      page: () => const NotifRegistrasiView(),
      binding: NotifRegistrasiBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_A,
      page: () => HomepageAView(),
      binding: HomepageABinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_U,
      page: () => const HomepageUView(),
      binding: HomepageUBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.OTP_PAGE,
      page: () => OtpPageView(),
      binding: OtpPageBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO,
      page: () => PhotoView(),
      binding: PhotoBinding(),
    ),
    GetPage(
      name: _Paths.MODUL,
      page: () => ModulView(),
      binding: ModulBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.PRESENSI,
      page: () => PresensiView(),
      binding: PresensiBinding(),
    ),
    GetPage(
      name: _Paths.STRUKTUR,
      page: () => StrukturView(),
      binding: StrukturBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => BiodataView(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),
  ];
}
