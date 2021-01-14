require "open-uri"
require "json"

module Jekyll

  # convert tweet url to embedding html
  class LazyGistEmbedding
    def get_html(url)
      "<script>" + URI.open(url).read + "</script>"
    end

    def convert(line)
      r = /^(https?:\/\/gist\.github\.com\/[a-zA-Z0-9_]+\/[a-z0-9]+)$/
      r =~ line ? get_html($~[1] + ".js") : line
      # r =~ line ? get_html($~[1]) + ".js" : line
    end

    def embed(content)
      content.lines.collect {|line| convert(line) }.join
    end
  end

  # for markdown, extend oroginal parser's convert method
  module Converters
    class Markdown < Converter
      alias_method :gist_converter, :convert

      def convert(content)
        gist_converter(Jekyll::LazyGistEmbedding.new.embed(content))
      end
    end
  end

  # for html, extend converter as a plugin
  class EmbeddingGistIntoHTML < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.html$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      Jekyll::LazyGistEmbedding.new.embed(content)
    end
  end

end
