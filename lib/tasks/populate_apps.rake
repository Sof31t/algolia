namespace :apps do
  desc "Populate apps"
  task populate: :environment do
    # If you want to clear indexes, use the following task => rake algoliasearch:clear_indexes
    # Do not forget to delete data locally, we use delete_all instead of destroy_all
    # to avoid callbacks ans so to avoid doing a http call for each row delete
    App.delete_all
    file = File.read('./db/data/data.json')
    apps = JSON.parse(file)
    lines_count = apps.count
    puts "*** #{lines_count} objects to migrate ***"

    errors = []

    progressbar = ProgressBar.create(
      format: "[%c/#{lines_count}] %a %b\u{15E7}%i %p%% %t %e",
      progress_mark: ' ',
      remainder_mark: "\u{FF65}",
      total: lines_count
    )

    apps.each do |row|
        app = App.new(data: row)

        unless app.valid?
          errors << [row, app.errors.messages]
        end
        progressbar.increment
        app.save
      end

    if errors.present?
      puts "We got errors with these apps: #{errors.inspect}"
    else
      puts "Yay ! Everything went good ᕦ(ò_óˇ)ᕤ"
    end
  end
end
