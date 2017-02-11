# frozen_string_literal: true
module PostsHelper
  def mini_breadcrumb post
    #post.topic.category.name + ' < ' + post.topic&.name
    top = post.topic
    kat = top.category
    (link_to kat.name, category_path(kat)) + mini_separator + (
    link_to top.name, (category_path(kat) + '/' + top.topic_slug))
    #hack chryste panie jaka chamówa, przepraszam
  end

  def mini_separator
    '<span style="color: #ccc"> / </span>'
  end
end
