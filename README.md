
# Cell Assets

Cells encapsulate display components. The brilliant part about them is that everything you need to
actually render a bit of view is contained in one place, not crapped about your app. 

But controller and templates aren't the only thing that it takes to make a cell a cell. There's the
other things like javascript and CSS that contribute to how the cell ultimately looks and behaves. 

If you feel like those things should also be packaged with the cell then cell assets is for you. All 
it does is let you get at other things which should be private data of the cell (like how it behaves)

Let's say I've got some cell:

    class MyCell < Cell::Rails
      def hello
        render
      end
    end

that has a directory structure like:

    my/hello.html.erb
      /init.js
      /dragndrop.js
      /mycell.css
      /icon.png

and I want to get all the javascript associated with it:

    MyCell.assets("*.js") #=> ['dragndrop.js','init.js']


if you pass it a block it will give you the content of each asset. For example,
let's just read the init code:

    MyCell.assets("init.js") do |content|
      # content contains in init.js
    end

matching assets are always returned in alphabetically sorted order so that 
you don't run into ordering problems when using different operating systems.

# Why?

We use this as part of system that loads cells in isolation and so it is important
that each cell be aware of all the bits that it needs to run. Perhaps this will be
useful to other folks in the future. What you do with cell assets is your business,
but the point is that the cell's assets are *it's* business and ain't nobody else's
    