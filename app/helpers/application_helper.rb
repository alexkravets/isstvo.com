module ApplicationHelper
  def include_meta_tags
    display_meta_tags({
      site:        @settings[:general][:website_title],
      title:       @settings[:general][:website_tagline],
      description: @settings[:general][:website_description],
      canonical:   @settings[:general][:website_url],
      og: { site_name:   @settings[:general][:website_title],
            url:         @settings[:general][:website_url],
            title:       @settings[:general][:website_tagline],
            description: @settings[:general][:website_description],
            image:       @settings[:general][:website_logo_url],
            type:        'website' }
    })
  end

  def sidebar_image_tag
    image_url = @settings[:general][:sidebar_image_url].presence
    if image_url
      image_tag(image_url, alt: @settings[:general][:website_tagline])
    else
      ""
    end
  end

  def sidebar_tagline
    (@settings[:general][:sidebar_tagline].presence || "").html_safe
  end

  def social_links
    links = @settings[:general][:social_links] || []
    links.reject! { |l| l.empty? }

    social_icons_map = {
      'facebook.com' => 'facebook',
      'vk.com' => 'vk',
      'twitter.com' => 'twitter',
      'behance.net' => 'behance',
      'github.com' => 'github',
      'pinterest.com' => 'pinterest',
      'instagram.com' => 'instagram',
      'youtube.com' => 'youtube-play',
      'linkedin.com' => 'linkedin',
      'medium.com' => 'medium',
      'vimeo.com' => 'vimeo',
      'slack.com' => 'slack',
      'dribbble.com' => 'dribbble',
      'soundcloud.com' => 'soundcloud'
    }
    social_icons_domains = social_icons_map.keys

    html = links.collect do |l|
      key = social_icons_domains.select { |domain| l.include?(domain) }.first
      icon = social_icons_map[key]

      link_to l, target: '_blank' do
        fa_stacked_icon("#{icon} inverse", base: 'circle', class: 'fa-1x')
      end
    end
    .join("")

    html.html_safe
  end
end
