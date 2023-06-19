import 'package:flutter/material.dart';

void main() => runApp(MusicStreamingApp());

class MusicStreamingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '음악 스트리밍 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.orangeAccent,
        fontFamily: 'Roboto',
      ),
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  List<String> melonChart = [
    '인기차트 곡',
    'POP',
    '회원님 취향인 곡',
  ];

  int currentSongIndex = -1;

  void togglePlay(int index) {
    setState(() {
      if (currentSongIndex == index) {
        // 현재 재생 중인 곡을 선택한 경우
        currentSongIndex = -1;
      } else {
        // 다른 곡을 선택한 경우
        currentSongIndex = index;
      }
    });
  }

  void playPrevious() {
    if (currentSongIndex > 0) {
      setState(() {
        currentSongIndex--;
      });
    }
  }

  void playNext() {
    if (currentSongIndex < melonChart.length - 1) {
      setState(() {
        currentSongIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('음악 플레이어'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '현재 재생 중인 곡',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.music_note,
              size: 100,
              color: currentSongIndex != -1 ? Colors.green : Colors.grey,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: playPrevious,
                  icon: Icon(Icons.skip_previous),
                ),
                ElevatedButton(
                  onPressed: () => togglePlay(currentSongIndex),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    primary:
                    currentSongIndex != -1 ? Colors.red : Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    currentSongIndex != -1 ? '일시 정지' : '재생',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: playNext,
                  icon: Icon(Icons.skip_next),
                ),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: melonChart.length,
                itemBuilder: (context, index) {
                  final song = melonChart[index];
                  return ListTile(
                    title: Text(
                      song,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => togglePlay(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

