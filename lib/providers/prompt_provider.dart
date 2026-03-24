import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromptState {
  final String subject;
  final Set<String> lighting;
  final Set<String> mood;
  final Set<String> environment;
  final Set<String> color;
  final Set<String> texture;
  final Set<String> composition;
  final Set<String> camera;
  final Set<String> microDetails;
  final Set<String> styleAnchors;

  PromptState({
    this.subject = '',
    this.lighting = const {},
    this.mood = const {},
    this.environment = const {},
    this.color = const {},
    this.texture = const {},
    this.composition = const {},
    this.camera = const {},
    this.microDetails = const {},
    this.styleAnchors = const {},
  });

  PromptState copyWith({
    String? subject,
    Set<String>? lighting,
    Set<String>? mood,
    Set<String>? environment,
    Set<String>? color,
    Set<String>? texture,
    Set<String>? composition,
    Set<String>? camera,
    Set<String>? microDetails,
    Set<String>? styleAnchors,
  }) {
    return PromptState(
      subject: subject ?? this.subject,
      lighting: lighting ?? this.lighting,
      mood: mood ?? this.mood,
      environment: environment ?? this.environment,
      color: color ?? this.color,
      texture: texture ?? this.texture,
      composition: composition ?? this.composition,
      camera: camera ?? this.camera,
      microDetails: microDetails ?? this.microDetails,
      styleAnchors: styleAnchors ?? this.styleAnchors,
    );
  }

  String generateEnglishPrompt() {
    final parts = <String>[];
    if (subject.isNotEmpty) parts.add(subject);
    if (environment.isNotEmpty) parts.add("in ${environment.join(', ')}");
    if (mood.isNotEmpty) parts.add("with a ${mood.join(', ')} atmosphere");
    if (lighting.isNotEmpty) parts.add("lit by ${lighting.join(', ')}");
    if (camera.isNotEmpty) parts.add("shot with ${camera.join(', ')}");
    if (color.isNotEmpty) parts.add("featuring ${color.join(', ')} color palette");
    if (texture.isNotEmpty) parts.add("and ${texture.join(', ')} texture");
    if (composition.isNotEmpty) parts.add("composed in ${composition.join(', ')}");
    if (microDetails.isNotEmpty) parts.add("subtle details such as ${microDetails.join(', ')}");
    if (styleAnchors.isNotEmpty) parts.add("in the style of ${styleAnchors.join(', ')}");
    return parts.join(', ');
  }

  String generateChinesePrompt() {
    final parts = <String>[];
    if (subject.isNotEmpty) parts.add(subject);
    if (environment.isNotEmpty) parts.add("位於 ${environment.join('、')}");
    if (mood.isNotEmpty) parts.add("呈現 ${mood.join('、')} 氛圍");
    if (lighting.isNotEmpty) parts.add("使用 ${lighting.join('、')}");
    if (camera.isNotEmpty) parts.add("以 ${camera.join('、')} 拍攝");
    if (color.isNotEmpty || texture.isNotEmpty) {
      final ct = [...color, ...texture].join('、');
      parts.add("畫面帶有 $ct");
    }
    if (composition.isNotEmpty) parts.add("構圖為 ${composition.join('、')}");
    if (microDetails.isNotEmpty) parts.add("加入 ${microDetails.join('、')} 等微細節");
    if (styleAnchors.isNotEmpty) parts.add("整體風格偏向 ${styleAnchors.join('、')}");
    return parts.join('，');
  }
}

class PromptNotifier extends Notifier<PromptState> {
  @override
  PromptState build() {
    return PromptState();
  }

  void updateSubject(String subject) {
    state = state.copyWith(subject: subject);
  }

  void toggleItem(String category, String item) {
    Set<String> toggle(Set<String> current) {
      final next = Set<String>.from(current);
      if (next.contains(item)) {
        next.remove(item);
      } else {
        next.add(item);
      }
      return next;
    }

    switch (category) {
      case '光線': state = state.copyWith(lighting: toggle(state.lighting)); break;
      case '氛圍': state = state.copyWith(mood: toggle(state.mood)); break;
      case '環境': state = state.copyWith(environment: toggle(state.environment)); break;
      case '色彩': state = state.copyWith(color: toggle(state.color)); break;
      case '材質': state = state.copyWith(texture: toggle(state.texture)); break;
      case '構圖': state = state.copyWith(composition: toggle(state.composition)); break;
      case '相機': state = state.copyWith(camera: toggle(state.camera)); break;
      case '微細節': state = state.copyWith(microDetails: toggle(state.microDetails)); break;
      case '風格': state = state.copyWith(styleAnchors: toggle(state.styleAnchors)); break;
    }
  }

  void clearAll() {
    state = PromptState();
  }
}

final promptProvider = NotifierProvider<PromptNotifier, PromptState>(PromptNotifier.new);
