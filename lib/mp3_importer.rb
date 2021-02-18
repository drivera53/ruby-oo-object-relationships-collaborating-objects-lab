require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        array = Dir.entries(path)
        mp3_files = array.select do |file|
            file.end_with?(".mp3")
        end
        return mp3_files
    end

    def import
        list_of_filenames = self.files
        list_of_filenames.each do |filename| 
        Song.new_by_filename(filename)
      end
    end
end 

#binding.pry