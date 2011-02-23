require 'spec_helper'

describe Cell::Assets do

  it "can be queried with a dir glob" do
    Dir.should_receive(:glob).twice.with("/mock/cells/A/*.js").and_return(["one.js", "two.js"])
    File.should_receive(:read).with("/mock/cells/A/one.js").and_return("foo = 'bar'")
    File.should_receive(:read).with("/mock/cells/A/two.js").and_return("bar = 'baz'")
    mock_cell(:A).tap do |cell|
     cell.assets("*.js").should == ["/mock/cells/A/one.js","/mock/cells/A/two.js"]
     files = {}
     cell.assets("*.js") do |name, content|
       files[name] = content
     end
     files.should == {
       "/mock/cells/A/one.js" => "foo = 'bar'",
       "/mock/cells/A/two.js" => "bar = 'baz'"
     }
   end
  end

  it "are returned in alphabetic sort order" do
    Dir.should_receive(:glob).with("/mock/cells/A/*.js").and_return(["two.js", "one.js"])
    mock_cell(:A).tap do |cell|
      cell.assets("*.js").should == ["/mock/cells/A/one.js", "/mock/cells/A/two.js"]
    end
  end

  def mock_cell(name, &body)
    Class.new(Cell::Rails).tap do |cell|
      mc = class << cell;self;end
      mc.send(:define_method, :to_s) do
        "#{name}"
      end
      mc.send(:define_method, :cell_name) do
        "#{name}"
      end
      def cell.view_paths
        ["/mock/cells"]
      end
      # @cells[name.to_s] = cell
      cell.class_eval(&body) if block_given?
    end
  end

end
