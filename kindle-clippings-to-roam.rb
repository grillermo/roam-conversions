require 'clipboard'

def tokenize(clipping)
  clipping_lines = clipping.split(/\n/)
  first_line     = clipping_lines.first
  second_line    = clipping_lines[1]
  rest           = clipping_lines[2..-1]

  {
    author:   first_line .split('(').last.gsub(')',''),
    title:    first_line .split('(').first.strip,
    position: second_line.split('|')[0,2].map(&:strip).join(', ').strip,
    date:     second_line.split('|').last.split(',')[1].strip,
    content:  rest.join("\n").strip
  }
end

def template(clipping)
end

def convert_clippings_to_roam()
  raw_text          = Clipboard.paste
  clippings         = raw_text.split(/^==========/)
  tokenized_commits = clippings.map(&method(:tokenize))

  roam_text         = # TODO

  Clipboard.copy roam_text
end
