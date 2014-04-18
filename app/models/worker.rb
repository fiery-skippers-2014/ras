class Worker
  include Sidekiq::Worker

  def perform(photos)

    photos.each do |photo|
      photo_object = Photo.create(
        title: photo["title"],
        url: photo["url"],
        photographer: photo["photographer"]
        )
          ap photo
      unless photo["tags"].nil?
        photo["tags"].each do |tag|
          tag_object = Tag.create(description: tag)

          Moment.create(
            tag_id: Tag.find_by_description(tag).id,
            photo_id: Photo.find_by_url(photo["url"]).id
            )

        end
      end
    end
  end
end