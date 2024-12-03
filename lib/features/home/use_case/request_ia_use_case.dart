import 'package:firebase_vertexai/firebase_vertexai.dart';

abstract class RequestIaUseCase {
  Future<String> call(String ansewer);
}

class RequestAnsewerIAImplementation implements RequestIaUseCase {
  @override
  Future<String> call(String ansewer) async {
    final model =
        FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

    final content = [Content.text(ansewer)];

    final response = await model.generateContent(
      content,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        responseSchema: Schema.string(),
      ),
    );

    print(response.text);

    return response.text!;
  }
}
