# require modules here
require "yaml"
require 'pry'

def load_library(path)
  #load raw file
  file=YAML.load_file(path)
  #setup restructured hash with initial empty hashes
  dictionary={:get_meaning=>{}, :get_emoticon=>{}}
  file.each do |emotion_name,emoticon_array|
    #:get_meaning will map Japanese emoticon to emotion - which is the emotion_name. And that is the key.
    dictionary[:get_meaning][emoticon_array[1]] = emotion_name
    #:get_emoticon will map the Western emoticon (which is in emoticon_array[0] to Japanese emoticon (which is in emoticon_array[1]
    dictionary[:get_emoticon][emoticon_array[0]] = emoticon_array[1]
  end
  dictionary
  #binding.pry
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

def get_japanese_emoticon(path,western_emoticon)
  dictionary = load_library(path)
  sorry_message = "Sorry, that emoticon was not found"
  if dictionary[:get_emoticon].include?(western_emoticon)
    return dictionary[:get_emoticon][western_emoticon]
  else
    p sorry_message
  end
end

#main starts
#===========
path_from_main = './lib/emoticons.yml'
p get_japanese_emoticon(path_from_main,":)")
p get_english_meaning(path_from_main,get_japanese_emoticon(path_from_main,":)"))
get_japanese_emoticon(path_from_main,"Basri")
#===========