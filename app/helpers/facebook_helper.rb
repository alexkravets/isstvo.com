module FacebookHelper
  def facebook_like_button_count_for(url)
    content_tag :div, "", class: "fb-like",
                          "data-href" => url,
                          "data-layout" => "button_count",
                          "data-action" => "like",
                          "data-show-faces" => "false",
                          "data-share" => "false"
  end

  def facebook_comments_for(url, numposts = 10)
    content_tag :div, "", class: "fb-comments",
                          "data-href" => url,
                          "data-numposts" => numposts,
                          "data-width" => "100%"
  end
end
