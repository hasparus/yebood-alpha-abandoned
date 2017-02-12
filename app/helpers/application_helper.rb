# frozen_string_literal: true
module ApplicationHelper
  include LocaleHelper

  def flash_class(level)
    case level.to_sym
      # allow either standard rails flash category symbols...
    when :notice then 'info'
    when :success then 'success'
    when :alert then 'warning'
    when :error then 'danger'
      # ... or bootstrap class symbols
    when :info then 'info'
    when :warning then 'warning'
    when :danger then 'danger'
      # and default to being alarming
    else 'danger'
    end
  end

  def page_title
    @title || controller_name.gsub(/Controller/, '').humanize
  end

  def markdown text
    options = {
        safe_links_only: true,
        prettify: true
    }
    markdown = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(options),
        {
          lax_spacing: true,
          superscript: true,
          quote: true,
          autolink: true,
          tables: true,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          disable_indented_code_blocks: true
        }
    )

    markdown.render(text).html_safe
  end

  class AssetHash
    # TODO: Dodawanie ikon z poziomu administratora.
    # todo Pamietaj o screditsowaniu Pixel Buddhy

    @paths = {
      1 => 'megaphone',
      2 => 'newspaper',
      3 => 'mortarboard',
      4 => 'bowling',
      5 => 'rocket'
    }

    class << self
      def [](key)
        @paths[key] || 'placeholder'
      end

      def []=(_key, _value)
        raise 'Not implemented yet.'
      end
    end
  end
end
