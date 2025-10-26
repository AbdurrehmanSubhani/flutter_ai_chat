import 'package:flutter_dotenv/flutter_dotenv.dart';

var openaiApiKey = dotenv.get('OPENAI_API_KEY');
const openaiChatModel = 'gpt-5-mini';
