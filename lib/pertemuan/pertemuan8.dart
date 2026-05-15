import 'package:flutter/material.dart';

class Pertemuan8Page extends StatefulWidget {
  const Pertemuan8Page({super.key});

  @override
  State<Pertemuan8Page> createState() =>
      _Pertemuan8PageState();
}

class _Pertemuan8PageState
    extends State<Pertemuan8Page> {

  final TextEditingController universitasController =
  TextEditingController();

  final TextEditingController jurusanController =
  TextEditingController();

  String selectedJenjang = 'SMA/Sederajat';
  String selectedTahun = '2020';

  final List<String> universitasList = [

    'Institut Teknologi Bandung',
    'Universitas Indonesia',
    'Universitas Pamulang',
    'Universitas Gunadarma',
    'Universitas Bina Sarana',
    'Universitas Gadjah Mada',

  ];

  final List<String> jurusanList = [

    'Kedokteran',
    'Sistem Informasi',
    'Teknik Informatika',
    'Akuntansi',
    'Manajemen',

  ];

  List<String> jenjangList = [

    'SMA/Sederajat',
    'D3',
    'S1',
    'S2',
    'S3',

  ];

  List<String> tahunList = [

    '2020',
    '2021',
    '2022',
    '2023',
    '2024',

  ];

  void simpanData() {

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Row(
            children: [

              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 30,
              ),

              SizedBox(width: 10),

              Text(
                "Berhasil!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const Text(
                "Data mahasiswa berhasil disimpan:",
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius:
                  BorderRadius.circular(12),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      "🎓 Universitas : ${universitasController.text}",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "📘 Jurusan : ${jurusanController.text}",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "📈 Jenjang : $selectedJenjang",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "📅 Tahun Masuk : $selectedTahun",
                    ),

                  ],
                ),
              ),

            ],
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("OK"),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        title: const Text(
          "Form dengan AutoComplete dan Spinner",
        ),

        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Container(

            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius:
              BorderRadius.circular(20),

              boxShadow: [

                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),

              ],
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Row(
                  children: [

                    CircleAvatar(
                      backgroundColor:
                      Colors.deepPurple,

                      child: const Icon(
                        Icons.menu_book,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Informasi Mahasiswa",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 15),

                Divider(
                  color: Colors.deepPurple.shade200,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Universitas *",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Autocomplete<String>(

                  optionsBuilder:
                      (TextEditingValue textEditingValue) {

                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }

                    return universitasList.where(
                          (String item) {

                        return item
                            .toLowerCase()
                            .contains(
                          textEditingValue.text
                              .toLowerCase(),
                        );
                      },
                    );
                  },

                  onSelected: (String selection) {

                    universitasController.text =
                        selection;
                  },

                  fieldViewBuilder:
                      (context,
                      controller,
                      focusNode,
                      onEditingComplete) {

                    universitasController.text =
                        controller.text;

                    return TextField(

                      controller: controller,
                      focusNode: focusNode,

                      decoration: InputDecoration(

                        hintText: "Cari Universitas",

                        suffixIcon: const Icon(
                          Icons.search,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                const Text(
                  "Jurusan *",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Autocomplete<String>(

                  optionsBuilder:
                      (TextEditingValue textEditingValue) {

                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }

                    return jurusanList.where(
                          (String item) {

                        return item
                            .toLowerCase()
                            .contains(
                          textEditingValue.text
                              .toLowerCase(),
                        );
                      },
                    );
                  },

                  onSelected: (String selection) {

                    jurusanController.text =
                        selection;
                  },

                  fieldViewBuilder:
                      (context,
                      controller,
                      focusNode,
                      onEditingComplete) {

                    jurusanController.text =
                        controller.text;

                    return TextField(

                      controller: controller,
                      focusNode: focusNode,

                      decoration: InputDecoration(

                        hintText: "Cari Jurusan",

                        suffixIcon: const Icon(
                          Icons.search,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                const Text(
                  "Jenjang Pendidikan *",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                DropdownButtonFormField(

                  value: selectedJenjang,

                  items:
                  jenjangList.map((String item) {

                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );

                  }).toList(),

                  onChanged: (value) {

                    setState(() {
                      selectedJenjang = value!;
                    });

                  },

                  decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),

                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Tahun Masuk *",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                DropdownButtonFormField(

                  value: selectedTahun,

                  items:
                  tahunList.map((String item) {

                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );

                  }).toList(),

                  onChanged: (value) {

                    setState(() {
                      selectedTahun = value!;
                    });

                  },

                  decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),

                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton.icon(

                    style: ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.deepPurple,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                    ),

                    onPressed: simpanData,

                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),

                    label: const Text(
                      "Simpan Data",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}