import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productivity Analytics'), actions: [IconButton(icon: const Icon(Icons.insights, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              const Text('Weekly Deep Work Hours', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final d in [
                    {'day': 'M', 'h': 3.5}, {'day': 'T', 'h': 4.8}, {'day': 'W', 'h': 5.2},
                    {'day': 'T', 'h': 3.8}, {'day': 'F', 'h': 4.5}, {'day': 'S', 'h': 2.0}, {'day': 'S', 'h': 1.5}
                  ]) ...[
                    Column(children: [
                      Text('${d['h']}h', style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                      const SizedBox(height: 4),
                      Container(width: 24, height: (d['h'] as double) * 20, decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(6))),
                      const SizedBox(height: 6),
                      Text(d['day'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                  ],
                ],
              ),
            ]),
          ),
          const SizedBox(height: 16),
          _insightTile('Prime Focus Window', '10:00 AM - 12:30 PM (68% of deep work completed)', Icons.wb_sunny, Colors.amber),
          const SizedBox(height: 12),
          _insightTile('Average Session Length', '42.5 Minutes (Optimal cognitive endurance)', Icons.hourglass_top, Colors.cyan),
          const SizedBox(height: 12),
          _insightTile('Weekly Goal Progress', '25.3 / 30.0 Hours Completed (84%)', Icons.check_circle, Colors.greenAccent),
        ],
      ),
    );
  }
  Widget _insightTile(String title, String desc, IconData icon, Color c) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        CircleAvatar(backgroundColor: c.withValues(alpha: 0.15), child: Icon(icon, color: c)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(desc, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        ])),
      ]),
    );
  }
}
