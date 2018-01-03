module ApplicationHelper
  def gravatar_for(chef, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: chef.chefname, class: "img-circle")
  end

  def fct txt
  	origine = txt
  	mot = origine.truncate_words 1, omission:"" #LE MOT A ENLEVER
  	ok = origine.remove mot
  end
end
