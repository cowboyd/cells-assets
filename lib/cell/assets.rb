require 'cells'
require 'cell/assets/version'
    
module Cell
  module Assets

    def inherited(cls)
      super
      cls.extend(Cell::Assets)
    end
    
    def assets(glob)
      [].tap do |matches|
        self.view_paths.each do |path|
          base = "#{path}/#{cell_name}"
          Dir.glob("#{base}/#{glob}").sort.each do |entry|
            match = "#{base}/#{File.basename(entry)}"
            matches << match
            yield match, File.read(File.expand_path(match)) if block_given?
          end
        end
      end
    end
    
    Cell::Rails.extend(self)
  end
end
