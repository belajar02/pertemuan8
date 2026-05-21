import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pertemuan9Page extends StatefulWidget {
  const Pertemuan9Page({super.key});

  @override
  State<Pertemuan9Page> createState() =>
      _Pertemuan9PageState();
}

class _Pertemuan9PageState
    extends State<Pertemuan9Page> {

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  String tanggal = "Belum memilih tanggal";
  String waktu = "Belum memilih waktu";

  Future<void> pilihTanggal() async {

    DateTime? pickedDate =
    await showDatePicker(

      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2020),

      lastDate: DateTime(2030),

    );

    if (pickedDate != null) {

      setState(() {

        selectedDate = pickedDate;

        tanggal = DateFormat(
          'dd MMMM yyyy',
        ).format(selectedDate!);

      });
    }
  }

  Future<void> pilihWaktu() async {

    TimeOfDay? pickedTime =
    await showTimePicker(

      context: context,

      initialTime: TimeOfDay.now(),

    );

    if (pickedTime != null) {

      setState(() {

        selectedTime = pickedTime;

        waktu =
            "${pickedTime.hour}:${pickedTime.minute}";
      });
    }
  }

  void simpanData() {

    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20),
          ),

          title: const Row(
            children: [

              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),

              SizedBox(width: 10),

              Text("Berhasil"),
            ],
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const Text(
                "Jadwal berhasil disimpan:",
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
                      "📅 Tanggal : $tanggal",
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "⏰ Waktu : $waktu",
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
          "Date & Time Picker",
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
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      "Pilih Jadwal",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                        FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 20),

                Divider(
                  color: Colors.deepPurple.shade200,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Tanggal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton.icon(

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.deepPurple,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 15,
                      ),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                    ),

                    onPressed: pilihTanggal,

                    icon: const Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),

                    label: const Text(
                      "Pilih Tanggal",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  tanggal,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Waktu",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton.icon(

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.deepPurple,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 15,
                      ),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                    ),

                    onPressed: pilihWaktu,

                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),

                    label: const Text(
                      "Pilih Waktu",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  waktu,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton.icon(

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.green,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                    ),

                    onPressed: simpanData,

                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),

                    label: const Text(
                      "Simpan Jadwal",
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