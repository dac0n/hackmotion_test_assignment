import 'package:flutter/material.dart';
import '../models/swing_model.dart';
import '../repositories/swing_repository.dart';
import 'inspection_screen.dart';

class HomeScreen extends StatefulWidget {
  final SwingRepository swingRepository;

  const HomeScreen({Key? key, required this.swingRepository}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Swing>> _futureSwings;
  List<Swing> _swings = [];

  @override
  void initState() {
    super.initState();
    _futureSwings = widget.swingRepository.getSwings();
  }

  void _deleteSwing(int index) {
    setState(() {
      _swings.removeAt(index);
    });
  }

  void _navigateToSwing(int index) {
    if (index >= 0 && index < _swings.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InspectionScreen(
            swing: _swings[index],
            index: index,
            totalSwings: _swings.length,
            onDelete: _deleteSwing,
            onNavigate: _navigateToSwing,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<List<Swing>>(
        future: _futureSwings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No swings available'));
          } else {
            _swings = snapshot.data!;
            return ListView.builder(
              itemCount: _swings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Swing ${index + 1}'),
                  onTap: () {
                    _navigateToSwing(index);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
