import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import 'doa_kegiatan_screen.dart';
import 'doa_tidur_screen.dart';
import 'doa_perlindungan_screen.dart';
import 'doa_ampunan_screen.dart';
import 'doa_ampunan_perlindungan_screen.dart';

void main() {
  runApp(const AppDoa());
}

/////////////data cadangan//////////////////////////
const List<Map<String, String>> backupCities = [
  {'id': '1', 'nama': 'Jakarta', 'tz': 'WIB'},
  {'id': '2', 'nama': 'Kota Bogor', 'tz': 'WIB'},
  {'id': '3', 'nama': 'Surabaya', 'tz': 'WIB'},
  {'id': '4', 'nama': 'Bandung', 'tz': 'WIB'},
  {'id': '5', 'nama': 'Medan', 'tz': 'WIB'},
  {'id': '6', 'nama': 'Yogyakarta', 'tz': 'WIB'},
  {'id': '7', 'nama': 'Makassar', 'tz': 'WITA'},
  {'id': '8', 'nama': 'Denpasar', 'tz': 'WITA'},
  {'id': '9', 'nama': 'Balikpapan', 'tz': 'WITA'},
  {'id': '10', 'nama': 'Jayapura', 'tz': 'WIT'},
  {'id': '11', 'nama': 'Ambon', 'tz': 'WIT'},
];

const Map<String, List<Map<String, String>>> backupPrayers = {
  'jakarta': [
    {'name': 'Subuh', 'time': '04:43'}, {'name': 'Zuhur', 'time': '11:59'},
    {'name': 'Asar', 'time': '15:20'}, {'name': 'Magrib', 'time': '17:53'}, {'name': 'Isya', 'time': '19:05'},
  ],
  'kota bogor': [
    {'name': 'Subuh', 'time': '04:45'}, {'name': 'Zuhur', 'time': '12:01'},
    {'name': 'Asar', 'time': '15:22'}, {'name': 'Magrib', 'time': '17:55'}, {'name': 'Isya', 'time': '19:07'},
  ],
  'surabaya': [
    {'name': 'Subuh', 'time': '04:20'}, {'name': 'Zuhur', 'time': '11:36'},
    {'name': 'Asar', 'time': '14:56'}, {'name': 'Magrib', 'time': '17:29'}, {'name': 'Isya', 'time': '18:42'},
  ],
  'bandung': [
    {'name': 'Subuh', 'time': '04:40'}, {'name': 'Zuhur', 'time': '11:56'},
    {'name': 'Asar', 'time': '15:17'}, {'name': 'Magrib', 'time': '17:51'}, {'name': 'Isya', 'time': '19:03'},
  ],
  'medan': [
    {'name': 'Subuh', 'time': '04:54'}, {'name': 'Zuhur', 'time': '12:23'},
    {'name': 'Asar', 'time': '15:47'}, {'name': 'Magrib', 'time': '18:31'}, {'name': 'Isya', 'time': '19:44'},
  ],
  'yogyakarta': [
    {'name': 'Subuh', 'time': '04:33'}, {'name': 'Zuhur', 'time': '11:49'},
    {'name': 'Asar', 'time': '15:09'}, {'name': 'Magrib', 'time': '17:42'}, {'name': 'Isya', 'time': '18:55'},
  ],
  'makassar': [
    {'name': 'Subuh', 'time': '04:41'}, {'name': 'Zuhur', 'time': '11:57'},
    {'name': 'Asar', 'time': '15:19'}, {'name': 'Magrib', 'time': '17:51'}, {'name': 'Isya', 'time': '19:04'},
  ],
  'denpasar': [
    {'name': 'Subuh', 'time': '04:56'}, {'name': 'Zuhur', 'time': '12:12'},
    {'name': 'Asar', 'time': '15:32'}, {'name': 'Magrib', 'time': '18:04'}, {'name': 'Isya', 'time': '19:17'},
  ],
  'balikpapan': [
    {'name': 'Subuh', 'time': '04:43'}, {'name': 'Zuhur', 'time': '12:05'},
    {'name': 'Asar', 'time': '15:28'}, {'name': 'Magrib', 'time': '18:10'}, {'name': 'Isya', 'time': '19:22'},
  ],
  'jayapura': [
    {'name': 'Subuh', 'time': '04:11'}, {'name': 'Zuhur', 'time': '11:34'},
    {'name': 'Asar', 'time': '14:56'}, {'name': 'Magrib', 'time': '17:36'}, {'name': 'Isya', 'time': '18:49'},
  ],
  'ambon': [
    {'name': 'Subuh', 'time': '04:59'}, {'name': 'Zuhur', 'time': '12:24'},
    {'name': 'Asar', 'time': '15:46'}, {'name': 'Magrib', 'time': '18:24'}, {'name': 'Isya', 'time': '19:37'},
  ],
};

/////////////////////////////////////////////model database doa
class SolatTime {
  final String name;
  final String time;
  bool isOn;
  SolatTime({required this.name, required this.time, this.isOn = true});
}

class DoaItem {
  final IconData icon;
  final String title;
  final Widget targetScreen; 
  const DoaItem({required this.icon, required this.title, required this.targetScreen});
}

class CityModel {
  final String id;
  final String name;
  final String timezone; // Menyimpan data zona asli kota tersebut

  const CityModel({required this.id, required this.name, required this.timezone});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    String namaKota = json['nama'] ?? '';
    // Otomatis deteksi zona waktu berdasarkan nama jika dari API
    String tz = json['tz'] ?? _detectTimezone(namaKota);
    return CityModel(id: json['id'] ?? '', name: namaKota, timezone: tz);
  }

  static String _detectTimezone(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('makassar') || lower.contains('denpasar') || lower.contains('bali') || 
        lower.contains('balikpapan') || lower.contains('samarinda') || lower.contains('manado') || 
        lower.contains('kupang') || lower.contains('lombok') || lower.contains('gorontalo') || lower.contains('palu')) {
      return 'WITA';
    }
    if (lower.contains('jayapura') || lower.contains('ambon') || lower.contains('papua') || 
        lower.contains('maluku') || lower.contains('ternate') || lower.contains('sorong') || lower.contains('manokwari')) {
      return 'WIT';
    }
    return 'WIB'; // Default wilayah bagian barat
  }
}

// Model untuk menyimpan doa ke database lokal (SharedPreferences)
class DoaPribadi {
  String id;
  String judul;
  String arab;
  String arti;

  DoaPribadi({required this.id, required this.judul, required this.arab, required this.arti});

  Map<String, dynamic> toJson() => {'id': id, 'judul': judul, 'arab': arab, 'arti': arti};
  factory DoaPribadi.fromJson(Map<String, dynamic> json) => DoaPribadi(
    id: json['id'], judul: json['judul'], arab: json['arab'], arti: json['arti']
  );
}


// Service//////////////////////////////////////////////////
/////////////////////////////////////////////////////
////////////////////////////////////////


class PrayerTimeService {
  static Future<List<CityModel>> fetchAllCities() async {
    final uri = Uri.parse('https://ibnux.github.io/jam-sholat/kota.json');
    final res = await http.get(uri).timeout(const Duration(seconds: 6));
    if (res.statusCode != 200) throw Exception();

    final List<dynamic> decoded = jsonDecode(res.body);
    return decoded.map((item) => CityModel.fromJson(item)).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  static Future<List<SolatTime>> fetchPrayerTimes(String cityName) async {
    final cleanName = cityName.replaceAll('Kota ', '').replaceAll('Kab. ', '');
    final uri = Uri.parse(
      'https://api.aladhan.com/v1/timingsByCity?city=$cleanName&country=Indonesia&method=11',
    );
    final res = await http.get(uri).timeout(const Duration(seconds: 6));
    if (res.statusCode != 200) throw Exception();

    final data   = jsonDecode(res.body)['data']['timings'] as Map<String, dynamic>;
    const keys   = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
    const labels = ['Subuh', 'Zuhur', 'Asar', 'Magrib', 'Isya'];

    return List.generate(keys.length, (i) => SolatTime(
      name: labels[i],
      time: (data[keys[i]] as String).split(' ').first,
    ));
  }
}


class AppDoa extends StatelessWidget {
  const AppDoa({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'E-DOA',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF0EFEB),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1D9E75)),
    ),
    home: const MainNavigator(),
  );
}

// Navigasi Bawah Sesuai Permintaan
class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});
  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  void _pindahKeDoa() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(onNavigateToMyDoa: _pindahKeDoa),
          const KoleksiDoaScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF0EFEB),
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF6E5343), // Warna Coklat Khas
        unselectedItemColor: const Color(0xFF1A1A1A).withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: 'Home'),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: _selectedIndex == 1 ? const Color(0xFF6E5343) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.menu_book, color: _selectedIndex == 1 ? Colors.white : const Color(0xFF1A1A1A).withOpacity(0.5), size: 20),
                  if (_selectedIndex == 1) const SizedBox(width: 8),
                  if (_selectedIndex == 1) const Text('Doa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ), 
            label: 'Doa'
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback onNavigateToMyDoa;
  const HomeScreen({super.key, required this.onNavigateToMyDoa});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _kBg       = Color(0xFFF0EFEB);
  static const _kCard     = Color(0xFFFFFFFF);
  static const _kText     = Color(0xFF1A1A1A);
  static const _kMuted    = Color(0xFF888888);
  static const _kHint     = Color(0xFFBBBBBB);
  static const _kDivider  = Color(0xFFE5E5E5);
  static const _kGreen    = Color(0xFF1D9E75);

  final List<DoaItem> _doas = const [
    DoaItem(icon: Icons.wb_sunny_outlined, title: 'Doa sebelum memulai kegiatan dan setelahnya', targetScreen: DoaKegiatanScreen()),
    DoaItem(icon: Icons.bedtime_outlined, title: 'Doa ketika mau tidur', targetScreen: DoaTidurScreen()),
    DoaItem(icon: Icons.security_outlined, title: 'Doa meminta perlindungan kepada Allah', targetScreen: DoaPerlindunganScreen()),
    DoaItem(icon: Icons.favorite_border, title: 'Doa meminta ampunan kepada Allah', targetScreen: DoaAmpunanScreen()),
    DoaItem(icon: Icons.volunteer_activism_outlined, title: 'Doa meminta ampunan dan perlindungan kepada Allah', targetScreen: DoaAmpunanPerlindunganScreen()),
  ];

  List<CityModel> _cities = [];
  CityModel? _selectedCity;
  List<SolatTime> _times = [];
  
  // State manajemen Zona Waktu
  final List<String> _timezones = ['WIB', 'WITA', 'WIT'];
  String _selectedTimezone = 'WIB';

  bool _loadingCities = true;
  bool _loadingTimes = false;
  String? _error;
  bool _isOfflineMode = false;

  // Controller & Timer Baru Untuk Scroll dan Waktu
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _reminderKey = GlobalKey();
  Timer? _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initData();
    // Nyalakan timer jam realtime
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() => _currentTime = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  // Menghitung Sisa Waktu Solat
  Map<String, String> _getNextPrayerInfo() {
    if (_times.isEmpty) return {'name': '-', 'countdown': '--:--:--'};

    DateTime now = _currentTime;
    DateTime? nextTime;
    String nextName = "-";

    for (var t in _times) {
      String adjTime = _getAdjustedTime(t.time, _selectedCity?.timezone ?? 'WIB', _selectedTimezone);
      List<String> parts = adjTime.split(':');
      if (parts.length == 2) {
        DateTime pt = DateTime(now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
        if (pt.isAfter(now)) {
          nextTime = pt;
          nextName = t.name;
          break;
        }
      }
    }

    if (nextTime == null) {
      String adjTime = _getAdjustedTime(_times[0].time, _selectedCity?.timezone ?? 'WIB', _selectedTimezone);
      List<String> parts = adjTime.split(':');
      nextTime = DateTime(now.year, now.month, now.day + 1, int.parse(parts[0]), int.parse(parts[1]));
      nextName = _times[0].name;
    }

    Duration diff = nextTime.difference(now);
    String h = diff.inHours.toString().padLeft(2, '0');
    String m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    String s = (diff.inSeconds % 60).toString().padLeft(2, '0');

    return {
      'name': 'Azan ${nextName.toLowerCase()}',
      'countdown': '-$h:$m:$s'
    };
  }

  // Fungsi untuk menghitung pergeseran waktu secara dinamis
  String _getAdjustedTime(String baseTime, String fromTz, String toTz) {
    try {
      final parts = baseTime.split(':');
      if (parts.length != 2) return baseTime;
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      int getOffset(String tz) {
        if (tz == 'WITA') return 8;
        if (tz == 'WIT') return 9;
        return 7; // WIB
      }

      int diff = getOffset(toTz) - getOffset(fromTz);
      hour = (hour + diff) % 24;
      if (hour < 0) hour += 24;

      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return baseTime;
    }
  }

  // Load Awal (Cek Online -> Cache Lokal -> Kode Cadangan)
  Future<void> _initData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Ambil preferensi zona waktu terakhir yang disimpan user
    _selectedTimezone = prefs.getString('user_tz') ?? 'WIB';

    try {
      final cityList = await PrayerTimeService.fetchAllCities();
      final String encoded = jsonEncode(cityList.map((c) => {'id': c.id, 'nama': c.name, 'tz': c.timezone}).toList());
      await prefs.setString('cached_cities2', encoded);

      setState(() {
        _cities = cityList;
        _loadingCities = false;
        _isOfflineMode = false;
        _selectedCity = cityList.firstWhere((c) => c.name.toLowerCase().contains('jakarta'), orElse: () => cityList.first);
        _selectedTimezone = _selectedCity!.timezone; // Sesuaikan dengan zona asli kota terpilih
      });
    } catch (_) {
      final String? cachedStr = prefs.getString('cached_cities2');
      List<CityModel> cityList = [];

      if (cachedStr != null) {
        final List<dynamic> decoded = jsonDecode(cachedStr);
        cityList = decoded.map((item) => CityModel.fromJson(item)).toList();
      } else {
        // Ambil dari 11 Kota Utama Cadangan di atas
        cityList = backupCities.map((item) => CityModel.fromJson(item)).toList();
      }
      
      setState(() {
        _cities = cityList;
        _loadingCities = false;
        _isOfflineMode = true;
        _selectedCity = cityList.firstWhere((c) => c.name.toLowerCase().contains('jakarta'), orElse: () => cityList.first);
      });
    }
    _loadPrayerTimes();
  }

  // Load Jadwal Sholat (Online -> Cache Lokal -> Kode Cadangan)
  Future<void> _loadPrayerTimes() async {
    if (_selectedCity == null) return;
    setState(() { _loadingTimes = true; _error = null; });
    
    final prefs = await SharedPreferences.getInstance();
    final String cityNameKey = _selectedCity!.name.toLowerCase().replaceAll('kota ', '').replaceAll('kab. ', '');
    final String cacheKey = 'cached_prayer_v2_$cityNameKey';

    try {
      final result = await PrayerTimeService.fetchPrayerTimes(_selectedCity!.name);
      final String encoded = jsonEncode(result.map((t) => {'name': t.name, 'time': t.time}).toList());
      await prefs.setString(cacheKey, encoded);

      setState(() {
        _times = result;
        _isOfflineMode = false;
      });
    } catch (_) {
      final String? cachedStr = prefs.getString(cacheKey);
      List<SolatTime> localTimes = [];

      if (cachedStr != null) {
        final List<dynamic> decoded = jsonDecode(cachedStr);
        localTimes = decoded.map((item) => SolatTime(name: item['name'] ?? '', time: item['time'] ?? '')).toList();
      } else {
        // Cari dari data static cadangan berdasarkan nama kota kunci
        final backupList = backupPrayers[cityNameKey] ?? backupPrayers['jakarta']!;
        localTimes = backupList.map((item) => SolatTime(name: item['name'] ?? '', time: item['time'] ?? '')).toList();
      }

      setState(() {
        _times = localTimes;
        _isOfflineMode = true;
      });
    } finally {
      setState(() => _loadingTimes = false);
    }
  }

  Widget _sectionLabel(String t) => Padding(
    padding: const EdgeInsets.only(left: 2, bottom: 10),
    child: Text(t.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: _kHint, letterSpacing: 1.2)),
  );

  Widget _divider() => const Divider(height: 0.5, thickness: 0.5, color: _kDivider);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: _kBg,
    body: SafeArea(
      child: SingleChildScrollView(
        controller: _scrollController, // Dipasang controller buat scroll otomatis
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 28),
            _sectionLabel('kumpulan Doa sehari2'),
            ..._doas.map((d) => Padding(padding: const EdgeInsets.only(bottom: 8), child: _DoaCard(item: d))),
            
            // Tombol Pintasan "Koleksi Doa Ku" di bawah list doa harian
            GestureDetector(
              onTap: widget.onNavigateToMyDoa, // Langsung pindah ke halaman Database
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.black.withOpacity(0.07), width: 0.5)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(children: [
                  Container(
                    width: 38, height: 38, 
                    decoration: BoxDecoration(color: const Color(0xFFAAAAAA), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.bookmark, color: Colors.white, size: 20), // Tambahan ICON
                  ),
                  const SizedBox(width: 13),
                  Container(width: 0.5, height: 30, color: Colors.black.withOpacity(0.12)),
                  const SizedBox(width: 13),
                  const Expanded(child: Text("koleksi doa ku", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A), height: 1.45))),
                  const SizedBox(width: 8),
                ]),
              ),
            ),

            const SizedBox(height: 28),
            Container(key: _reminderKey), // Anchor buat lokasi Scroll
            _sectionLabel('Solat reminder'),
            _reminderCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ),
  );

  // HEADER BARU DENGAN JAM RAKSASA & COUNTDOWN (Kode Asli Lu Tidak Dihapus, Hanya Di-Upgrade UI-nya)
  Widget _header() {
    final nextPrayer = _getNextPrayerInfo();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Container(
            width: 58, height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFE4E3DE),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black.withOpacity(0.08), width: 0.5),
            ),
            alignment: Alignment.center,
            child: const Text('</>', style: TextStyle(fontFamily: 'Courier', fontSize: 17, fontWeight: FontWeight.w700, color: _kText)),
          ),
          const SizedBox(width: 14),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('E-Doa', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: _kText)),
            SizedBox(height: 3),
            Text('-Kumpulan Doa sehari²-', style: TextStyle(fontSize: 11, color: _kMuted)),
          ]),
        ]),
        Row(
          children: [
            Container(width: 4, height: 75, color: Colors.black), // Garis Hitam Tebal
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${_currentTime.day}/${_currentTime.month}/${_currentTime.year}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: _kText)),
                Text(
                  '${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}', 
                  style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w400, color: _kText, height: 1.0, letterSpacing: -1.5)
                ),
                Text(nextPrayer['name']!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: _kText)),
                Text(nextPrayer['countdown']!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: _kText)),
                const SizedBox(height: 2),
                GestureDetector(
                  onTap: () {
                    // Fitur Scroll Otomatis ke Menu Solat
                    if (_reminderKey.currentContext != null) {
                      Scrollable.ensureVisible(_reminderKey.currentContext!, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
                    }
                  },
                  child: const Text('Sesuaikan lokasi? klik ini', style: TextStyle(fontSize: 9, color: Colors.blue, decoration: TextDecoration.underline, fontWeight: FontWeight.w600)),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _reminderCard() => Container(
    decoration: BoxDecoration(
      color: _kCard,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.black.withOpacity(0.07), width: 0.5),
    ),
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: const [
              Icon(Icons.notifications_outlined, size: 17, color: _kText),
              SizedBox(width: 8),
              Text('Reminder waktu solat', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _kText)),
            ]),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: _isOfflineMode ? Colors.amber.shade100 : Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _isOfflineMode ? 'OFFLINE' : 'ONLINE',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: _isOfflineMode ? Colors.amber.shade900 : _kGreen),
              ),
            )
          ],
        ),
      ),
      _divider(),

      // INPUT OPSIONAL DUA: KOTA & ZONA WAKTU
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // DROPDOWN 1: PILIH KOTA INDONESIA
          const Text('Pilih Kota/Kabupaten:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _kMuted)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: _kBg, borderRadius: BorderRadius.circular(10)),
            child: _loadingCities 
                ? const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 1.5, color: _kText))))
                : DropdownButtonHideUnderline(
                    child: DropdownButton<CityModel>(
                      value: _selectedCity,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down, color: _kText),
                      dropdownColor: _kCard,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _kText),
                      items: _cities.map((CityModel city) => DropdownMenuItem<CityModel>(value: city, child: Text(city.name))).toList(),
                      onChanged: (CityModel? newCity) async {
                        if (newCity != null && newCity != _selectedCity) {
                          setState(() { 
                            _selectedCity = newCity; 
                            _selectedTimezone = newCity.timezone; // Otomatis samakan zona ke kota barunya
                          });
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('user_tz', _selectedTimezone);
                          _loadPrayerTimes();
                        }
                      },
                    ),
                  ),
          ),
          
          const SizedBox(height: 12),
          
          // DROPDOWN 2: PILIH ZONA WAKTU (WIB/WITA/WIT)
          const Text('Pilih Format Zona Waktu:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _kMuted)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: _kBg, borderRadius: BorderRadius.circular(10)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedTimezone,
                isExpanded: true,
                icon: const Icon(Icons.access_time, size: 16, color: _kText),
                dropdownColor: _kCard,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _kText),
                items: _timezones.map((String tz) => DropdownMenuItem<String>(value: tz, child: Text(tz))).toList(),
                onChanged: (String? newTz) async {
                  if (newTz != null) {
                    setState(() { _selectedTimezone = newTz; });
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('user_tz', newTz); // Simpan pilihan zona waktu ke lokal HP
                  }
                },
              ),
            ),
          ),
        ]),
      ),
      _divider(),
      _prayerList(),
    ]),
  );

  Widget _prayerList() {
    if (_loadingTimes || _loadingCities) {
      return const Padding(padding: EdgeInsets.symmetric(vertical: 28), child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: _kGreen)));
    }

    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(child: Text(_error!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: _kMuted))),
      );
    }

    return Column(children: List.generate(_times.length, (i) => Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(_times[i].name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _kText)),
            const SizedBox(height: 2),
            
            // KODE SAKTI: Waktu digeser otomatis berdasarkan dropdown pilihan zona waktu!
            Text(
              '${_getAdjustedTime(_times[i].time, _selectedCity?.timezone ?? 'WIB', _selectedTimezone)} $_selectedTimezone',
              style: const TextStyle(fontSize: 11, color: _kGreen, fontWeight: FontWeight.bold),
            ),
          ]),
          GestureDetector(
            onTap: () => setState(() => _times[i].isOn = !_times[i].isOn),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 36, height: 21,
              decoration: BoxDecoration(color: _times[i].isOn ? _kGreen : const Color(0xFFD1D1D1), borderRadius: BorderRadius.circular(11)),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: _times[i].isOn ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(margin: const EdgeInsets.all(3), width: 15, height: 15, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 1))])),
              ),
            ),
          ),
        ]),
      ),
      if (i < _times.length - 1) _divider(),
    ])));
  }
}

class _DoaCard extends StatefulWidget {
  final DoaItem item;
  const _DoaCard({required this.item});
  @override
  State<_DoaCard> createState() => _DoaCardState();
}

class _DoaCardState extends State<_DoaCard> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: (_) => setState(() => _pressed = true),
    onTapUp:   (_) => setState(() => _pressed = false),
    onTapCancel: () => setState(() => _pressed = false),
    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => widget.item.targetScreen)); },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      decoration: BoxDecoration(color: _pressed ? const Color(0xFFF7F6F2) : Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.black.withOpacity(0.07), width: 0.5)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(children: [
        Container(width: 38, height: 38, decoration: BoxDecoration(color: const Color(0xFFF0EFEB), borderRadius: BorderRadius.circular(10)), child: Icon(widget.item.icon, size: 20, color: const Color(0xFF1A1A1A))),
        const SizedBox(width: 13),
        Container(width: 0.5, height: 30, color: Colors.black.withOpacity(0.12)),
        const SizedBox(width: 13),
        Expanded(child: Text(widget.item.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A), height: 1.45))),
        const SizedBox(width: 8),
        const Icon(Icons.chevron_right, size: 18, color: Color(0xFFBBBBBB)),
      ]),
    ),
  );
}

/////////////halamankoleksidoa

class KoleksiDoaScreen extends StatefulWidget {
  const KoleksiDoaScreen({super.key});

  @override
  State<KoleksiDoaScreen> createState() => _KoleksiDoaScreenState();
}

class _KoleksiDoaScreenState extends State<KoleksiDoaScreen> {
  List<DoaPribadi> _listDoa = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('koleksi_doa_pribadi');
    if (data != null) {
      final List decoded = jsonDecode(data);
      setState(() {
        _listDoa = decoded.map((e) => DoaPribadi.fromJson(e)).toList();
      });
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('koleksi_doa_pribadi', jsonEncode(_listDoa.map((e) => e.toJson()).toList()));
    setState(() {});
  }

  void _hapusDoa(String id) {
    _listDoa.removeWhere((d) => d.id == id);
    _saveData();
  }

  // Tampilan Form Tambah/Edit (Sesuai Screenshot "Tambah Doa Pribadi")
  void _bukaFormDoa({DoaPribadi? doaExisting}) {
    final judulCtrl = TextEditingController(text: doaExisting?.judul ?? '');
    final arabCtrl = TextEditingController(text: doaExisting?.arab ?? '');
    final artiCtrl = TextEditingController(text: doaExisting?.arti ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (c) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(c).viewInsets.bottom, left: 24, right: 24, top: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Tambah Doa Pribadi', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A1A))),
            const SizedBox(height: 24),
            TextField(
              controller: judulCtrl,
              decoration: InputDecoration(labelText: 'Judul Doa', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: arabCtrl,
              maxLines: null,
              textDirection: TextDirection.rtl, // Agar bahasa Arab rapi dari kanan ke kiri
              decoration: InputDecoration(labelText: 'Teks Arab', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: artiCtrl,
              maxLines: null,
              decoration: InputDecoration(labelText: 'Arti / Terjemahan', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                if (judulCtrl.text.isEmpty) return;
                
                if (doaExisting == null) {
                  _listDoa.add(DoaPribadi(id: DateTime.now().toString(), judul: judulCtrl.text, arab: arabCtrl.text, arti: artiCtrl.text));
                } else {
                  doaExisting.judul = judulCtrl.text;
                  doaExisting.arab = arabCtrl.text;
                  doaExisting.arti = artiCtrl.text;
                }
                _saveData();
                Navigator.pop(c);
              },
              child: const Text('Simpan Doa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EFEB), // Warna cream/abu khas dari tema E-DOA
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Kumpulan Doa', style: TextStyle(color: Color(0xFF6E5343), fontWeight: FontWeight.bold, fontSize: 24)),
            Text('${_listDoa.length} Doa Tersimpan', style: const TextStyle(color: Color(0xFF888888), fontSize: 12)),
          ],
        ),
      ),
      body: _listDoa.isEmpty 
          ? const Center(child: Text("Belum ada doa yang tersimpan.\nTekan + Tambah Doa", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: _listDoa.length,
              itemBuilder: (context, index) {
                final doa = _listDoa[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: const Color(0xFF6E5343), borderRadius: BorderRadius.circular(12)),
                            child: const Icon(Icons.menu_book, color: Colors.white, size: 20),
                          ),
                          const SizedBox(width: 14),
                          Expanded(child: Text(doa.judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xFF1A1A1A)))),
                          IconButton(icon: const Icon(Icons.edit, color: Color(0xFF6E5343), size: 20), onPressed: () => _bukaFormDoa(doaExisting: doa)),
                          IconButton(icon: const Icon(Icons.delete, color: Colors.redAccent, size: 20), onPressed: () => _hapusDoa(doa.id)),
                        ],
                      ),
                      if (doa.arab.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(doa.arab, textAlign: TextAlign.right, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black, height: 1.8)),
                        ),
                      ],
                      if (doa.arti.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Text(doa.arti, style: const TextStyle(fontStyle: FontStyle.italic, color: Color(0xFF707070), fontSize: 14, height: 1.5)),
                      ],
                    ],
                  ),
                );
              },
            ),
      // Floating button "Tambah Doa" di posisi sesuai desain
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6E5343),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Tambah Doa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        onPressed: () => _bukaFormDoa(),
      ),
    );
  }
}