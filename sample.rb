require './function_parser'

function_name = 'extern int sample_2_SAMPLE(float f, int i, char* str, int str_size);'
p function_name
p FunctionParser.new.parse(function_name)