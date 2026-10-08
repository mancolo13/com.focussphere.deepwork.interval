import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatefulWidget {
  const Tab2Screen({super.key});
  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}
class _Tab2ScreenState extends State<Tab2Screen> {
  final sounds = [
    {'name': 'Deep Binaural 40Hz', 'desc': 'Gamma waves for laser focus', 'icon': Icons.headphones, 'val': 0.75, 'active': true},
    {'name': 'Gentle Rain on Leaves', 'desc': 'Natural pink noise ambience', 'icon': Icons.water_drop, 'val': 0.60, 'active': true},
    {'name': 'Coffee Shop Murmur', 'desc': 'Mild background cafe chatter', 'icon': Icons.local_cafe, 'val': 0.30, 'active': false},
    {'name': 'Space White Noise', 'desc': 'Continuous frequency mask', 'icon': Icons.blur_on, 'val': 0.0, 'active': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Soundscapes'), actions: [IconButton(icon: const Icon(Icons.audiotrack, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Active Audio Mixer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (int i = 0; i < sounds.length; i++) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: AppTheme.primary.withValues(alpha: 0.2), child: Icon(sounds[i]['icon'] as IconData, color: AppTheme.primary)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(sounds[i]['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text(sounds[i]['desc'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                        ]),
                      ),
                      Switch(
                        value: sounds[i]['active'] as bool,
                        activeColor: AppTheme.primary,
                        onChanged: (val) => setState(() => sounds[i]['active'] = val),
                      ),
                    ],
                  ),
                  if (sounds[i]['active'] as bool) ...[
                    Slider(
                      value: sounds[i]['val'] as double,
                      activeColor: AppTheme.primary,
                      onChanged: (val) => setState(() => sounds[i]['val'] = val),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
