# require modules here
require "yaml"


def load_library(path)
  file=YAML.load_file(path)
  dictionary={:get_meaning=>{}, :get_emoticon=>{}}
  file.each do |key,emoticon_array|
    dictionary[:get_meaning][emoticon_array[1]] = key
    dictionary[:get_emoticon][emoticon_array[0]] = emoticon_array[1]
  end
  p dictionary
  dictionary
end

def get_japanese_emoticon(path,western_emoticon)
  dictionary = load_library(path)
  sorry_message = "Sorry, that emoticon was not found"
  if dictionary[:get_emoticon].include?(western_emoticon)
    return dictionary[:get_emoticon][western_emoticon]
  else
    p sorry_message
  end
end

def get_english_meaning(path,japanese_emoticon)
  dictionary = load_library(path)
  sorry_message = "Sorry, that emoticon was not found"
  if dictionary[:get_meaning].include?(japanese_emoticon)
    return dictionary[:get_meaning][japanese_emoticon]
  else
    p sorry_message
  end
end

#p get_japanese_emoticon("angel")
#p get_japanese_emoticon("wink")
path_from_main = './lib/emoticons.yml'
#load_library(path_from_main)
p get_japanese_emoticon(path_from_main,":)")
p get_english_meaning(path_from_main,get_japanese_emoticon(path_from_main,":)"))
