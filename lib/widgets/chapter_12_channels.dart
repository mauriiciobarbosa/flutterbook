import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelsSample extends StatefulWidget {
  @override
  _ChannelsSampleState createState() => _ChannelsSampleState();
}

class _ChannelsSampleState extends State<ChannelsSample> {
  static const _methodChannel =
      MethodChannel('platormchannel.mauricio.com/deviceinfo');
  String _deviceInfo = '';

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    String deviceInfo;

    try {
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } catch (e) {
      deviceInfo = 'Failed to get device info: ${e.toString()}.';
    }

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Channels'),
      ),
      body: SafeArea(
        child: ListTile(
          title: Text(
            'Device info:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            _deviceInfo,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
