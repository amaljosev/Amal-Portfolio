import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/models/appbar_menu.dart';
import 'package:amalportfolio/screens/models/projects_apps_model.dart';
import 'package:amalportfolio/screens/models/projects_model.dart';
import 'package:amalportfolio/screens/models/services_model.dart';
import 'package:amalportfolio/screens/models/skills_model.dart';
import 'package:amalportfolio/screens/models/social_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' as io;
import 'package:universal_html/html.dart' as html;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  final serviceCtrl = TextEditingController();
  final timelineCtrl = TextEditingController();
  final detailsCtrl = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    nameCtrl.text = '';
    emailCtrl.text = '';
    numberCtrl.text = '';
    serviceCtrl.text = '';
    timelineCtrl.text = '';
    detailsCtrl.text = '';
  }

  List<AppbarMenu> menu = [
    AppbarMenu(index: 0, title: 'Home', style: Appstyles.appbarHoverTextStyle),
    AppbarMenu(index: 1, title: 'Services', style: Appstyles.appbarTextStyle),
    AppbarMenu(index: 2, title: 'About Me', style: Appstyles.appbarTextStyle),
    AppbarMenu(index: 3, title: 'Portfolio', style: Appstyles.appbarTextStyle),
    AppbarMenu(index: 4, title: 'Contact', style: Appstyles.appbarTextStyle),
  ];
  List<SocialModel> social = [
    SocialModel(
        icon: FontAwesomeIcons.instagram,
        url: 'https://www.instagram.com/amaljose._/'),
    SocialModel(
        icon: FontAwesomeIcons.github, url: 'https://github.com/amaljosev'),
    SocialModel(
        icon: FontAwesomeIcons.facebook,
        url: 'https://www.facebook.com/athuljamal.vattakkunnel'),
    SocialModel(
        icon: FontAwesomeIcons.linkedin,
        url: 'https://www.linkedin.com/in/amaljosev/'),
  ];
  List<double> webScrollHeights = [
    0.65,
    0.52,
    0.5,
    0.5,
    1.0,
  ];
  List<double> tabScrollHeights = [
    0.5,
    0.55,
    0.8,
    0.8,
    1.0,
  ];
  List<double> mobScrollHeights = [
    1.0,
    1.2,
    1.6,
    1.7,
    1.7,
  ];

  RxList<bool> isHoverd = List.filled(5, false).obs;

  List<ServicesModel> myServices = [
    ServicesModel(
        title: 'Mobile App Development',
        icon: FontAwesomeIcons.android,
        description:
            '''Skilled in building high-quality mobile apps with Flutter, I create smooth and responsive apps for both iOS and Android. From clean design to strong performance, I focus on delivering user-friendly experiences that bring ideas to life and meet your needs.'''),
    ServicesModel(
        title: 'UI/UX Desingning',
        icon: FontAwesomeIcons.figma,
        description:
            '''With a focus on creating intuitive and visually engaging designs, I use Figma to craft user experiences that are both beautiful and easy to navigate. My goal is to design interfaces that resonate with users, blending functionality with creativity to enhance each interaction.'''),
    ServicesModel(
        title: 'Web App Development',
        icon: FontAwesomeIcons.globe,
        description:
            '''Building dynamic, responsive websites using Flutter, I bring ideas to life on the web with smooth performance and a cohesive design. From layout to deployment, I create web experiences that work seamlessly across devices, offering a consistent and engaging user experience.'''),
  ];
  List<SkillsModel> mySkills = [
    SkillsModel(title: 'Flutter', icon: FontAwesomeIcons.dev),
    SkillsModel(title: 'Android', icon: FontAwesomeIcons.android),
    SkillsModel(title: 'iOS', icon: FontAwesomeIcons.apple),
    SkillsModel(title: 'Dart', icon: FontAwesomeIcons.code),
    SkillsModel(title: 'C programming', icon: FontAwesomeIcons.c),
    SkillsModel(title: 'Python', icon: FontAwesomeIcons.python),
    SkillsModel(title: 'Django REST Framework', icon: FontAwesomeIcons.code),
    SkillsModel(title: 'git', icon: FontAwesomeIcons.git),
    SkillsModel(title: 'gitHub', icon: FontAwesomeIcons.github),
    SkillsModel(title: 'SQFite', icon: FontAwesomeIcons.database),
    SkillsModel(title: 'Hive', icon: FontAwesomeIcons.database),
    SkillsModel(title: 'Bloc', icon: FontAwesomeIcons.cube),
    SkillsModel(title: 'GetX', icon: FontAwesomeIcons.g),
    SkillsModel(title: 'Debugging', icon: FontAwesomeIcons.bug),
    SkillsModel(title: 'Figma', icon: FontAwesomeIcons.figma),
    SkillsModel(title: 'Firebase', icon: FontAwesomeIcons.file),
  ];
  List<TabSkillsModel> skills = [
    TabSkillsModel(title: 'Flutter', progress: 0.9),
    TabSkillsModel(title: 'Dart', progress: 0.9),
    TabSkillsModel(title: 'Python', progress: 0.8),
    TabSkillsModel(title: 'C and Java', progress: 0.5),
    TabSkillsModel(title: 'REST', progress: 0.6),
    TabSkillsModel(title: 'Git', progress: 0.7),
    TabSkillsModel(title: 'SQFite', progress: 0.8),
    TabSkillsModel(title: 'Hive', progress: 0.8),
    TabSkillsModel(title: 'Firebase', progress: 0.8),
    TabSkillsModel(title: 'Bloc', progress: 0.8),
    TabSkillsModel(title: 'GetX', progress: 0.8),
    TabSkillsModel(title: 'Figma', progress: 0.7),
  ];

  void scrollLeft(ScrollController scrollController) {
    scrollController.animateTo(
      scrollController.position.pixels - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void scrollRight(ScrollController scrollController) {
    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void scrollToSection(
      {required ScrollController scrollController,
      required int index,
      required double pixel}) {
    final double offset = (index * pixel).clamp(
      0,
      scrollController.position.maxScrollExtent,
    );

    scrollController.animateTo(
      offset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void menuScroll(
      {required ScrollController scrollController,
      required double pixel,
      required int duration}) {
    scrollController.animateTo(
      pixel,
      duration: Duration(milliseconds: duration),
      curve: Curves.easeIn,
    );
  }

  List<ProjectsAppsModel> myApps = [
    ProjectsAppsModel(
        title: 'HabitsOn',
        icon: 'assets/images/projects/habitson_icon.png',
        templates: [
          'assets/images/projects/1.png',
          'assets/images/projects/2.png',
          'assets/images/projects/3.png',
          'assets/images/projects/4.png',
          'assets/images/projects/5.png',
          'assets/images/projects/6.png',
          'assets/images/projects/7.png',
          'assets/images/projects/8.png',
        ],
        link: 'https://www.amazon.com/dp/B0D383VPMK/ref=apps_sf_sta'),
    ProjectsAppsModel(
        title: 'Edu Plan',
        icon: 'assets/images/projects/appIcon.png',
        templates: [
          'assets/images/projects/01.png',
          'assets/images/projects/02.png',
          'assets/images/projects/03.png',
          'assets/images/projects/04.png',
          'assets/images/projects/e1.png',
          'assets/images/projects/e2.png',
          'assets/images/projects/e3.png',
          'assets/images/projects/e4.png',
          'assets/images/projects/e5.png',
          'assets/images/projects/e6.png',
          'assets/images/projects/e7.png',
          'assets/images/projects/e8.png',
          'assets/images/projects/e9.png',
          'assets/images/projects/e10.png',
          'assets/images/projects/e11.png',
        ],
        link: 'https://www.amazon.com/gp/product/B0CP4GCR1B'),
    ProjectsAppsModel(
        title: 'Netflix',
        icon: 'assets/images/projects/N.png',
        templates: [
          'assets/images/projects/n1.png',
          'assets/images/projects/n2.png',
          'assets/images/projects/n3.png',
          'assets/images/projects/n4.png',
          'assets/images/projects/n5.png',
        ],
        link: 'https://github.com/amaljosev/Netflix_clone'),
  ];
  List<ProjectsModel> mobApps = [
    ProjectsModel(
        link: 'https://www.amazon.com/dp/B0D383VPMK/ref=apps_sf_sta',
        title: 'HabitsOn',
        template: 'assets/images/projects/habitson_template.png'),
    ProjectsModel(
        link: 'https://www.amazon.com/gp/product/B0CP4GCR1B',
        title: 'Edu Plan',
        template: 'assets/images/projects/secondapp.png'),
    ProjectsModel(
        link: 'https://github.com/amaljosev/Netflix_clone',
        title: 'Netflix',
        template: 'assets/images/projects/netflix-tambanil.png'),
  ];
  List<ProjectsModel> webApps = [
    ProjectsModel(
        link: 'https://github.com/amaljosev/Amal-portfolio-flutter',
        title: 'My Portfolio',
        template: 'assets/images/projects/personal_portfolio_template.png'),
    ProjectsModel(
        link: 'https://github.com/amaljosev/Netflix_clone',
        title: 'Netflix',
        template: 'assets/images/projects/netflix-tambanil.png'),
  ];
  List<ProjectsModel> desktopApps = [
    ProjectsModel(
        link: 'https://github.com/amaljosev/Amal-portfolio-flutter',
        title: 'My Portfolio',
        template: 'assets/images/projects/personal_portfolio_template.png'),
  ];
  Future<void> openExternalWeb(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> openMail() async {
    await launchUrl(Uri.parse('mailto:amaljvattakkunnel@gmail.com'));
  }

  Future<void> downloadPdf() async {
    if (UniversalPlatform.isWeb) {
      await _downloadPdfWeb();
    } else if (UniversalPlatform.isAndroid ||
        UniversalPlatform.isIOS ||
        UniversalPlatform.isWindows ||
        UniversalPlatform.isLinux ||
        UniversalPlatform.isMacOS) {
      await _downloadPdfMobileDesktop();
    } else {
      log("Platform not supported for downloading.");
    }
  }

  Future<void> _downloadPdfWeb() async {
    final ByteData data =
        await rootBundle.load('assets/pdf/Amal_Flutter_Developer.pdf');
    final Uint8List pdfBytes = data.buffer.asUint8List();

    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..setAttribute("download", "Amal_Flutter_Developer.pdf")
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  Future<void> _downloadPdfMobileDesktop() async {
    final ByteData data =
        await rootBundle.load('assets/pdf/Amal_Flutter_Developer.pdf');
    final List<int> bytes = data.buffer.asUint8List();

    final Directory tempDir = await getTemporaryDirectory();
    final io.File file = io.File('${tempDir.path}/Amal_Flutter_Developer.pdf');

    await file.writeAsBytes(bytes, flush: true);
    OpenFilex.open(file.path);
  }

  RxBool isLoading = false.obs;

  Future<bool> sendDataToGoogleSheet({
    required String date,
    required String name,
    required String email,
    required String mobNumber,
    required String service,
    required String timeline,
    required String details,
  }) async {
    isLoading.value = true;
    const url =
        'https://script.google.com/macros/s/AKfycbySPYqkw2WTTiMc0tytjv9t7yOjBc5Xn_FKMxX4GunEJqtAiNIRxXhLTi3I4nk9OzYf/exec';
    final Map<String, String> requestBody = {
      'Date': date,
      'Name': name,
      'Email': email,
      'MobNumber': mobNumber,
      'Service': service,
      'Timeline': timeline,
      'Details': details,
    };
    final body = jsonEncode(requestBody);
    try {
      final uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: body,
      );
      if (response.statusCode == 200) {
        log('Data sent successfully: ${response.body}');
        nameCtrl.text = '';
        emailCtrl.text = '';
        numberCtrl.text = '';
        serviceCtrl.text = '';
        timelineCtrl.text = '';
        detailsCtrl.text = '';
        isLoading.value = false;
        return true;
      } else {
        log('Error sending data: ${response.statusCode}, ${response.body}');
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      log('Error: $e');
      isLoading.value = false;
      return false;
    }
  }
}
