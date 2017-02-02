module LocaleHelper
  def locale_link(loc)
    link_to controller: '/locale', action: 'set', id: loc do
      tag 'img', src: "http://l10n.xwiki.org/xwiki/bin/download/L10N/Flags/#{loc}.png", class: 'locale-flag'
    end
  end
end
