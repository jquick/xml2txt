#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'time'
#ARGV[1] = "error.xml"
#ARGV[0] = "test.txt"

def parse
	puts 'parsing: ' + File.basename(ARGV[1])
	doc = Nokogiri::XML(File.open(ARGV[1])) do |config|
	config.noerror
	end	
	messages = doc.css('message')
	output(messages)
end 

def output(messages)
	out = File.new(ARGV[0], 'w')
	messages.each do |m|
		out.print timestamp(m), " "
		out.print nickname(m), " "
		out.puts m.inner_text
	end
end

def nickname(message)
  nick = message["alias"] || message["sender"]
	nick.gsub!(/ /,'')
	"<#{nick}>"
end

def timestamp(message)
	"[" + Time.parse(message["time"]).strftime("%Y-%m-%d %H:%M:%S") + "]"
end

parse



