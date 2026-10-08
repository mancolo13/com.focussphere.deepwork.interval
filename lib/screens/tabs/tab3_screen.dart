import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final logs = [
      {'title': 'Architecture Review', 'dur': '50 min', 'tag': 'Coding', 'time': '10:00 - 10:50 AM', 'color': Colors.purpleAccent},
      {'title': 'Flutter Widget Tree Redesign', 'dur': '50 min', 'tag': 'Development', 'time': '11:15 - 12:05 PM', 'color': Colors.blueAccent},
      {'title': 'Documentation & API Refactor', 'dur': '25 min', 'tag': 'Writing', 'time': '02:00 - 02:25 PM', 'color': Colors.tealAccent},
      {'title': 'Code Review & Sprint Planning', 'dur': '25 min', 'tag': 'Management', 'time': '04:30 - 04:55 PM', 'color': Colors.orangeAccent},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Session Log'), actions: [IconButton(icon: const Icon(Icons.add, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final log in logs) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Container(width: 4, height: 48, decoration: BoxDecoration(color: log['color'] as Color, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(log['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 4),
                      Text('${log['tag']} • ${log['time']}', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: (log['color'] as Color).withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
                    child: Text(log['dur'] as String, style: TextStyle(color: log['color'] as Color, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
