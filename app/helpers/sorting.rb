helpers do

  def check_primaries(search_tag)
    if Primary.find_by_title(search_tag)
      tag = Tag.find_by_description(search_tag)
      moments = tag.photos.map {|photo| photo.url}
    else
      initial_scraper = Scraper::Client.new(search_tag,10)
      populate_database(initial_scraper.data)

      Primary.create(title: search_tag)
      tag = Tag.find_by_description(search_tag)
      moments = tag.photos.map {|photo| photo.url}

      final_scraper = Scraper::Client.new(search_tag,100)
      Worker.perform_async(final_scraper.data)
    end
    return moments
  end

  def populate_database(photos)

      photos.each do |photo|
        photo_object = Photo.create(
          title: photo[:title],
          url: photo[:url],
          photographer: photo[:photographer]
          )
        ap photo
        unless photo[:tags].empty?
          photo[:tags].each do |tag|
            tag_object = Tag.create(description: tag)
            Moment.create(
              tag_id: Tag.find_by_description(tag).id,
              photo_id: Photo.find_by_url(photo[:url]).id
              )
          end
        end
      end
    end
end
