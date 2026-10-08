import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}
class _Tab1ScreenState extends State<Tab1Screen> {
  int _seconds = 1500; // 25 min
  bool _running = false;
  int _selectedMode = 0;
  final _modes = ['25m Focus', '50m Deep', '5m Short Break', '15m Long Break'];

  @override
  Widget build(BuildContext context) {
    final mins = (_seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (_seconds % 60).toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(title: const Text('FocusSphere • Deep Work'), actions: [IconButton(icon: const Icon(Icons.star_rounded, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Mode Selectors
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_modes.length, (i) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(_modes[i]),
                    selected: _selectedMode == i,
                    selectedColor: AppTheme.primary,
                    onSelected: (val) => setState(() {
                      _selectedMode = i;
                      if (i == 0) _seconds = 1500;
                      if (i == 1) _seconds = 3000;
                      if (i == 2) _seconds = 300;
                      if (i == 3) _seconds = 900;
                    }),
                  ),
                )),
              ),
            ),
            const SizedBox(height: 24),
            // Glowing Focus Dial
            Container(
              width: 240, height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [AppTheme.primary.withValues(alpha: 0.25), Colors.transparent]),
                border: Border.all(color: AppTheme.primary, width: 6),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$mins:$secs', style: const TextStyle(fontSize: 52, fontWeight: FontWeight.w900, letterSpacing: -1)),
                    const Text('SESSION IN PROGRESS', style: TextStyle(color: AppTheme.primary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() => _running = !_running),
                  icon: Icon(_running ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 28),
                  label: Text(_running ? 'Pause Session' : 'Start Focus', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(width: 12),
                IconButton.filledTonal(
                  onPressed: () => setState(() => _seconds = 1500),
                  icon: const Icon(Icons.refresh_rounded),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(children: [Text('🔥 4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text('Streak Today', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12))]),
                  Column(children: [Text('⏱ 140m', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text('Total Focus', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12))]),
                  Column(children: [Text('⚡ 94%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent)), Text('Efficiency', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12))]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
