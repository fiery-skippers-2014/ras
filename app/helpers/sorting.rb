helpers do
  def persist(array)
    @moments = array
  end

  def check_primaries(search_tag)
    if Primary.find_by_title(search_tag)
      tag = Tag.find_by_description(search_tag)
      ap tag.photos
      moments = tag.photos
    else
      scraper = Scraper::Client.new(search_tag)
      populate_database(scraper.data)
      Primary.create(title: search_tag)
      tag = Tag.find_by_description(search_tag)
      moments = tag.photos
    end
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
          #ids neeed to come from db to avoid "nil"s
          Moment.create(
            tag_id: Tag.find_by_description(tag).id,
            photo_id: Photo.find_by_url(photo[:url]).id
            )
        end
      end
    end
  end
end
