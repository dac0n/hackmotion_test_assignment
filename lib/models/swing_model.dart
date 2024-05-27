const flexionExtensionKey = 'HFA_crWrFlexEx';
const ulnarRadialKey = 'HFA_crWrRadUln';

class Swing {
  final String captureType;
  final SwingParameters parameters;
  String filePath;

  Swing({
    required this.captureType,
    required this.parameters,
    this.filePath = '',
  });

  factory Swing.fromJson(Map<String, dynamic> json) {
    return Swing(
      captureType: json['captureType'],
      parameters: SwingParameters(
        flexionExtension: List<double>.from(
            json['parameters'][flexionExtensionKey]['values']),
        ulnarRadial:
            List<double>.from(json['parameters'][ulnarRadialKey]['values']),
      ),
    );
  }
}

class SwingParameters {
  final List<double> flexionExtension;
  final List<double> ulnarRadial;

  SwingParameters({
    required this.flexionExtension,
    required this.ulnarRadial,
  });
}
