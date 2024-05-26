import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackmotion_test_assignment/screens/inspection_screen.dart';
import 'package:hackmotion_test_assignment/bloc/swing_bloc.dart';
import 'package:hackmotion_test_assignment/bloc/swing_state.dart';
import 'package:hackmotion_test_assignment/utils/swing_processor.dart';
import 'package:path/path.dart' as p;

class HomeScreen extends StatefulWidget {
  final SwingProcessor swingProcessor;

  const HomeScreen({Key? key, required this.swingProcessor}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late SwingBloc _swingBloc;

  @override
  void initState() {
    super.initState();
    _swingBloc = SwingBloc(swingProcessor: widget.swingProcessor);
    _swingBloc.loadSwings();
  }

  void _deleteSwing(int index) {
    setState(() {
      (_swingBloc.state as SwingsLoaded).swings.removeAt(index);
    });
  }

  void _navigateToSwing(int index) {
    final swings = (_swingBloc.state as SwingsLoaded).swings;
    if (index >= 0 && index < swings.length) {
      Navigator.push(
        context,
        _createRoute(index, AnimationDirection.defaultDirection),
      );
    }
  }

  Route _createRoute(int index, AnimationDirection direction) {
    final swings = (_swingBloc.state as SwingsLoaded).swings;
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => InspectionScreen(
        swing: swings[index],
        index: index,
        totalSwings: swings.length,
        onDelete: _deleteSwing,
        onNavigate: (newIndex) {
          if (newIndex < index) {
            Navigator.pushReplacement(
              context,
              _createRoute(newIndex, AnimationDirection.leftToRight),
            );
          } else {
            Navigator.pushReplacement(
              context,
              _createRoute(newIndex, AnimationDirection.rightToLeft),
            );
          }
        },
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;
        Offset beginOffset;

        switch (direction) {
          case AnimationDirection.leftToRight:
            beginOffset = const Offset(-1.0, 0.0);
            break;
          case AnimationDirection.rightToLeft:
            beginOffset = const Offset(1.0, 0.0);
            break;
          case AnimationDirection.defaultDirection:
          default:
            beginOffset = Offset.zero;
            break;
        }

        final tween = Tween(
          begin: beginOffset,
          end: Offset.zero,
        ).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<SwingBloc, SwingState>(
        bloc: _swingBloc,
        builder: (context, state) {
          if (state is SwingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SwingsError) {
            return const Center(child: Text('Failed to load swings.'));
          } else if (state is SwingsLoaded) {
            final swings = state.swings;
            if (swings.isEmpty) {
              return const Center(
                  child: Text('No swings available. Golf time, maybe?'));
            } else {
              return ListView.builder(
                itemCount: swings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Swing ${p.basename(swings[index].filePath)}'),
                    onTap: () => _navigateToSwing(index),
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('Unknown state.'));
          }
        },
      ),
    );
  }
}

enum AnimationDirection {
  leftToRight,
  rightToLeft,
  defaultDirection,
}
