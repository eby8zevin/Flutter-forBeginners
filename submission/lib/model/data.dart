class Data {
  String name;
  String detail;
  String skill;
  String link;
  String image;

  Data(
      {required this.name,
      required this.detail,
      required this.skill,
      required this.link,
      required this.image});
}

var data = [
  Data(
      name: "JavaScript",
      detail:
          "JavaScript adalah bahasa pemrograman tingkat tinggi yang merupakan salah satu teknologi inti dari World Wide Web. Ini digunakan sebagai bahasa pemrograman sisi klien oleh 97,8 persen dari semua situs web. JavaScript pada awalnya hanya digunakan untuk mengembangkan browser web, tetapi sekarang digunakan untuk penerapan situs web sisi server dan juga aplikasi browser non-web.",
      skill: "HTML dan CSS untuk menentukan konten dan tata letak halaman web.",
      link: "https://www.javascript.com/",
      image:
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg"),
  Data(
      name: "Python",
      detail:
          "Python adalah salah satu bahasa pemrograman yang paling populer saat ini dan mudah dipelajari oleh pemula karena keterbacaannya. Ini adalah bahasa pemrograman sumber terbuka gratis dengan modul dukungan ekstensif dan pengembangan komunitas, integrasi yang mudah dengan layanan web, struktur data yang mudah digunakan, dan aplikasi desktop berbasis GUI. Ini adalah bahasa pemrograman populer untuk machine learning dan aplikasi deep learning.",
      skill: "Pemecahan masalah, pemikiran abstrak.",
      link: "https://www.python.org/",
      image:
          "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg")
];
