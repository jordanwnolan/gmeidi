require 'coffee-script'

namespace :assets do
  desc "compile assets -- assets:dev will not minify and concat -- assets:prod minifies and concats"
  task :compile_js do
    source = "#{File.dirname(__FILE__)}/app/assets/javascripts/coffee/"
    javascripts = "#{File.dirname(__FILE__)}/app/assets/javascripts/"

    Dir.foreach(source) do |cf|
      unless cf == '.' || cf == '..'
        js = CoffeeScript.compile File.read("#{source}#{cf}")
        open "#{javascripts}#{cf.gsub('.coffee', '.js')}", 'w' do |f|
          f.puts js
        end
      end
    end

    vendors = "#{File.dirname(__FILE__)}/app/assets/javascripts/vendor/"
    Dir.foreach(vendors) do |file|
      unless file == '.' || file == '..'
        js = File.read("#{vendors}#{file}")
        open "#{javascripts}#{file}", 'w' do |f|
          f.puts js
        end
      end
    end
  end

  task :compile_css do
    source = "#{File.dirname(__FILE__)}/app/assets/stylesheets/scss"
    css = "#{File.dirname(__FILE__)}/app/assets/stylesheets"

    Dir.foreach(source) do |file|
      unless file == '.' || file == '..'
        input = "#{source}/#{file}"
        output = "#{css}/#{file.gsub('.scss', '.css')}"
        `sass "#{input}" "#{output}"`
      end
    end
  end

  task :clean do
    public_js = "#{File.dirname(__FILE__)}/public/javascripts/"
    public_css = "#{File.dirname(__FILE__)}/public/stylesheets/"
    public_images = "#{File.dirname(__FILE__)}/public/images/"
    public_assets = [public_js, public_css, public_images]

    public_assets.each do |assets|
      Dir.foreach(assets) do |file|
        unless file == '.' || file == '..'
          File.delete("#{assets}#{file}")
        end
      end
    end

    app_js = "#{File.dirname(__FILE__)}/app/assets/javascripts/"
    app_css = "#{File.dirname(__FILE__)}/app/assets/stylesheets/"
    do_not_touch_files = ['application.js']

    app_assets = [app_js, app_css]

    app_assets.each do |assets|
      Dir.foreach(assets) do |file|
        unless file == '.' || file == '..' || do_not_touch_files.include?(file) || File.directory?("#{assets}#{file}")
          File.delete("#{assets}#{file}")
        end
      end
    end
  end

  task :uglify do

  end

  task :dev_assets do
    javascripts = "#{File.dirname(__FILE__)}/app/assets/javascripts/"
    css = "#{File.dirname(__FILE__)}/app/assets/stylesheets"

    Dir.foreach(javascripts) do |file|
      unless file == '.' || file == '..' || File.directory?("#{javascripts}#{file}")
        js = File.read("#{javascripts}#{file}")
        open "#{File.dirname(__FILE__)}/public/javascripts/#{file}", "w" do |f|
          f.puts js
        end
      end
    end

    Dir.foreach(css) do |file|
      unless file == '.' || file == '..' || File.directory?("#{css}#{file}")
        css = File.read("#{css}#{file}")
        open "#{File.dirname(__FILE__)}/public/css/#{file}", "w" do |f|
          f.puts css
        end
      end
    end
  end

  task dev: [:clean, :compile_js, :compile_css, :dev_assets] do

  end

  task prod: [:clean, :compile_js, :compile_css, :uglify] do
  end
end