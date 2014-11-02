#!/usr/bin/env ruby

path = ARGV[0]

outlines = open(path).read
  .scan(/ml\*(\d+)/).flatten
  .map { |n| "http://www.nicovideo.jp/mylist/#{n}?rss=atom" }
  .map { |url| %Q{<outline text="#{url}" title="#{url}" xmlUrl="#{url}" htmlUrl="#{url}" />} }
  .join("\n    ")

puts DATA.read.sub(/%{outlines}/, outlines)

__END__
<?xml version="1.0" encoding="utf-8"?>
<opml version="2.0">
  <head><title>mylist feeds</title></head>
  <body>
    %{outlines}
  </body>
</opml>
