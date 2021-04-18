namespace :paperclip do
  task :migrate => :environment do

    query = <<~SQL
      NOT EXISTS (
        SELECT * FROM active_storage_blobs AS blobs
        INNER JOIN active_storage_attachments AS attachments ON attachments.blob_id = blobs.id
        WHERE record_type = ? AND record_id = roastings.id
      )
    SQL

    Roasting.where.not("image_file_name" => nil).where(query, Roasting.name).find_each do |r|
      ActiveRecord::Base.transaction do
        blob = ActiveStorage::Blob.create_after_upload!(
          io: File.open(Rails.public_path.to_s + r.image.url.split("?").first),
          filename: r.image_file_name,
          content_type: r.image_content_type
        )
        blob.attachments.create(name: 'image', record_type: 'Roasting', record_id: r.id)
      end
    end

   end
 end
