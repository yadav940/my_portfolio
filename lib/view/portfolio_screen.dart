
// --- MAIN PORTFOLIO SCREEN ---
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/experience.dart';
import 'package:flutter/widgets.dart';
import 'package:file_saver/file_saver.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  // --- MOCK DATA FROM RESUME ---
  static const String name = "Vinod Yadav";
  static const String title = "Senior Flutter Developer (7+ years)";
  static const String location = "Bangalore, India";
  static const String phone = "+919628030291";
  static const String email = "vinod.yadav940@gmail.com";
  static const String linkedin = "https://www.linkedin.com/in/yadav940/";
  static const String hackerrank = "https://www.hackerrank.com/yadav940";

  static const String aboutMe = "An in-depth understanding of Java, coroutines, Kotlin, Jetpack Compose, Flutter, and Android Studio. Solid knowledge of Dart, Swift, and Xcode. Proficient in native development tools and languages to build iOS and Android Apps using cross-platform technology. API/Web Service integrations (SOAP, REST, JSON, XML).";

  static final List<String> skills = [
    "Flutter", "Dart", "Java", "Kotlin", "Android", "iOS", "Bloc", "GetX",
    "Provider", "Clean Architecture", "MVVM", "Firebase", "SQLite", "Git", "BitBucket"
  ];

  static final List<Experience> experiences = [
    Experience(
      role: "Software Engineer on Mobile Applications",
      company: "Techmahindra Ltd",
      duration: "April 2022 - Present",
      description: "Support the entire application lifecycle (concept, design, test, release and support). Produce fully functional mobile applications writing clean code. Write unit and UI tests to identify malfunctions.",
    ),
    Experience(
      role: "Senior Flutter Developer",
      company: "Udama Tech Pvt. Ltd.",
      duration: "December 2021 - April 2022",
      description: "Troubleshoot and debug to optimize performance. Liaise with the Product development team to plan new features. Research and suggest new mobile products.",
    ),
    Experience(
      role: "Senior Software Engineer",
      company: "Mantra Labs",
      duration: "June 2021 - December 2021",
      description: "Gather specific requirements and suggest solutions. Write unit and UI tests to identify malfunctions.",
    ),
    Experience(
      role: "Software Developer",
      company: "Modistabox",
      duration: "December 2019 - May 2021",
      description: "Design pixel perfect UIs and build functionality of MODISTABOX android and iOS applications on flutter.",
    ),
    Experience(
      role: "Android Developer",
      company: "JNB Technologies Pvt Ltd",
      duration: "July 2018 - December 2019",
      description: "Worked on payment gateway & created UIs to allow users to complete the application process on the android app.",
    ),
  ];

  static final List<Project> projects = [
    Project(
        name: "Mahindra Finance Unified",
        company: "Tech Mahindra",
        description: "A digital platform that allows customers to apply for new loans. The app also provides customers with personalized offers and other services.",
        technologies: "Dart, Cubit, Clean Architecture, MVVM, Android Studio, Bitbucket",
        responsibilities: [
          "Develop and maintain cross-platform mobile application for Android and IOS flutter using dart.",
          "Involved in the analysis, design and development of the application.",
          "Designed, Developed, & modified projects using Agile methodologies.",
        ]
    ),
    Project(
        name: "Mahindra Finance Collection",
        company: "Tech Mahindra",
        description: "The Mahindra Finance mobile app is a digital platform that allows customers to access their loan payments.",
        technologies: "Dart, Cubit, Clean Architecture, MVVM, Android Studio, Bitbucket",
        responsibilities: [
          "Develop and maintain cross-platform mobile application for Android and IOS flutter using dart.",
          "Involved in the analysis, design and development of the application.",
          "Gathering requirement and involved in problem solving.",
        ]
    ),
    Project(
        name: "Darwish Holding (Fnac Qatar)",
        company: "Tech Mahindra",
        description: "Developed e-commerce app known as Fnac Qatar. It offers you the best in products, services, advice and support. Discover and shop online for mobiles, computers, smartwatches, cameras etc.",
        technologies: "Kotlin, MVVM, Android studio, Bitbucket, SourceTree",
        responsibilities: [
          "Designing, coding, build & deployment.",
          "Code Optimization and improved the app performance.",
          "Implemented and configured google analytics.",
        ]
    ),
  ];

  static final List<Certification> certifications = [
    Certification(
        name: "The Complete Flutter Development Bootcamp",
        date: "Jan 10, 2024",
        skills: "Flutter Bloc, Provider, Clean Framework, Dart",
        link: "http://ude.my/UC-e88b0463-8475-4ed2-966b-be0051a89925"
    ),
    Certification(
        name: "Flutter Bloc Essential Course",
        date: "Dec 3, 2022",
        skills: "Flutter Bloc, Dart",
        link: "http://ude.my/UC-b4808a0e-e8fb-4532-91ae-9f982550ef37"
    ),
    Certification(
        name: "Problem Solving (Intermediate)",
        date: "Nov 5, 2024",
        skills: "Data Structures, Algorithms",
        link: "https://www.hackerrank.com/certificates/d254545f4de4"
    ),
    Certification(
        name: "Java (Basic)",
        date: "Dec 7, 2024",
        skills: "Java, Classes, Data Structures, Inheritance",
        link: "https://www.hackerrank.com/certificates/1cb0cfd63648"
    ),
  ];


  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Could not launch the URL
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _downloadResume(context),
        icon: const Icon(Icons.download_rounded),
        label: const Text("Download CV"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 450.0,
            floating: false,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                name,
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: _buildHeader(context),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate(
                    [
                      _buildSectionTitle(context, "About Me"),
                      _buildAboutCard(context),
                      _buildSectionTitle(context, "Skills"),
                      _buildSkillsCard(context),
                      _buildSectionTitle(context, "Work Experience"),
                      ...experiences.map((exp) => _buildExperienceCard(exp, context)),
                      _buildSectionTitle(context, "Projects"),
                      ...projects.map((proj) => _buildProjectCard(proj, context)),
                      _buildSectionTitle(context, "Education"),
                      _buildEducationCard(context),
                      _buildSectionTitle(context, "Certifications"),
                      ...certifications.map((cert) => _buildCertificationCard(cert, context)),
                      const SizedBox(height: 40),
                    ]
                )
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade900, Theme.of(context).scaffoldBackgroundColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40), // Space for status bar
          CircleAvatar(
            radius: 50,
            backgroundImage: Image.asset('assets/profile_photo.png').image,
            backgroundColor: Colors.teal,
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 18, color: Color(0xff64FFDA))),
          const SizedBox(height: 4),
          Text(location, style: TextStyle(fontSize: 16, color: Theme.of(context).textTheme.bodyMedium?.color)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactIcon(Icons.phone, 'tel:$phone'),
              const SizedBox(width: 20),
              _buildContactIcon(Icons.email_outlined, 'mailto:$email'),
              const SizedBox(width: 20),
              _buildContactIcon(Icons.public, linkedin),
              const SizedBox(width: 20),
              _buildContactIcon(Icons.code, hackerrank),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContactIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: const Color(0xffCCD6F6), size: 24),
      onPressed: () => _launchURL(url),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff64FFDA)),
      ),
    );
  }

  Widget _buildAboutCard(BuildContext context){
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          aboutMe,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildSkillsCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: skills.map((skill) => Chip(label: Text(skill))).toList(),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(Experience exp, BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exp.role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffCCD6F6))),
            const SizedBox(height: 4),
            Text(exp.company, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff64FFDA))),
            const SizedBox(height: 4),
            Text(exp.duration, style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyMedium?.color)),
            const SizedBox(height: 12),
            Text(exp.description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(Project project, BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffCCD6F6))),
            const SizedBox(height: 4),
            Text(project.company, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff64FFDA))),
            const SizedBox(height: 12),
            Text(project.description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            Text("Technologies: ${project.technologies}", style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontStyle: FontStyle.italic)),
            const SizedBox(height: 12),
            const Text("Responsibilities:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffCCD6F6))),
            const SizedBox(height: 8),
            ...project.responsibilities.map((resp) => Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
              child: Text("• $resp", style: Theme.of(context).textTheme.bodyMedium),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("B.Tech (Computer Science and Engineering)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffCCD6F6))),
            const SizedBox(height: 4),
            const Text("Feroze Gandhi Institute of Engineering and Technology", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff64FFDA))),
            const SizedBox(height: 4),
            Text("2014 - 2018", style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyMedium?.color)),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationCard(Certification cert, BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: const Icon(Icons.school_outlined, color: Color(0xff64FFDA)),
        title: Text(cert.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xffCCD6F6))),
        subtitle: Text("${cert.skills}\n${cert.date}", style: Theme.of(context).textTheme.bodyMedium),
        trailing: const Icon(Icons.open_in_new, size: 20),
        onTap: () => _launchURL(cert.link),
        isThreeLine: true,
      ),
    );
  }

  Future<void> _downloadResume(BuildContext context) async {
    try {
      final ByteData data = await rootBundle.load('assets/Resume_vinod.pdf');
      final Uint8List bytes = data.buffer.asUint8List();

      await FileSaver.instance.saveFile(
        name: 'Resume_vinod',            // required
        bytes: bytes,                      // required for bytes approach
        fileExtension: 'pdf',             // renamed: use fileExtension
        mimeType: MimeType.pdf,           // or MimeType.other if pdf not supported
        includeExtension: true,           // optional, default true
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resume download initiated.'),
          backgroundColor: Colors.teal,
        ),
      );
    } catch (e) {
      print('Error downloading resume: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not download resume.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }





}