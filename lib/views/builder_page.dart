import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/prompt_data.dart';
import '../providers/prompt_provider.dart';

class BuilderPage extends ConsumerStatefulWidget {
  const BuilderPage({super.key});

  @override
  ConsumerState<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends ConsumerState<BuilderPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final categories = PromptData.categories.keys.toList();
  bool showEnglish = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length + 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(promptProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prompt Builder'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(promptProvider.notifier).clearAll();
            },
            tooltip: 'Clear All',
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            const Tab(text: '主體'),
            ...categories.map((c) => Tab(text: c)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('主體 (Subject)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '描述畫面的主要個體或物件...',
                  ),
                  onChanged: (val) {
                    ref.read(promptProvider.notifier).updateSubject(val);
                  },
                  maxLines: 3,
                ),
              ],
            ),
          ),
          ...categories.map((category) {
            final options = PromptData.categories[category]!;
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: options.map((option) {
                    Set<String> currentSelected;
                    switch (category) {
                      case '光線': currentSelected = state.lighting; break;
                      case '氛圍': currentSelected = state.mood; break;
                      case '環境': currentSelected = state.environment; break;
                      case '色彩': currentSelected = state.color; break;
                      case '材質': currentSelected = state.texture; break;
                      case '構圖': currentSelected = state.composition; break;
                      case '相機': currentSelected = state.camera; break;
                      case '微細節': currentSelected = state.microDetails; break;
                      case '風格': currentSelected = state.styleAnchors; break;
                      default: currentSelected = {};
                    }
                    final isSelected = currentSelected.contains(option);
                    return FilterChip(
                      label: Text(option),
                      selected: isSelected,
                      onSelected: (_) {
                        ref.read(promptProvider.notifier).toggleItem(category, option);
                      },
                      selectedColor: Theme.of(context).colorScheme.primaryContainer,
                    );
                  }).toList(),
                )
              ],
            );
          }),
        ],
      ),
      bottomSheet: DraggableScrollableSheet(
        initialChildSize: 0.15,
        minChildSize: 0.15,
        maxChildSize: 0.4,
        expand: false,
        builder: (context, scrollController) {
          final prompt = showEnglish 
            ? state.generateEnglishPrompt() 
            : state.generateChinesePrompt();
            
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListView(
              controller: scrollController,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(128),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Prompt 預覽', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() => showEnglish = !showEnglish);
                          },
                          child: Text(showEnglish ? '中' : 'EN'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: prompt));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('已複製到剪貼簿')),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                SelectableText(
                  prompt.isEmpty ? '尚未輸入任何 Prompt...' : prompt,
                  style: const TextStyle(fontSize: 15, height: 1.5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
