require 'coffee-script'
require 'json'

namespace :assets do
  desc "compile assets -- assets:dev will not minify and concat -- assets:prod minifies and concats"
  task :compile_js do
    source = "#{File.dirname(__FILE__)}/app/assets/javascripts/coffee/"
    javascripts = "#{File.dirname(__FILE__)}/public/javascripts/"

    `mkdir ./javascripts`
    Dir.foreach(source) do |cf|
      `cp #{source}#{cf} ./javascripts` unless File.directory? ("#{source}#{cf}")
      unless cf == '.' || cf == '..'
        `coffee -c -m ./javascripts/#{cf}`
      end
    end

    `mv ./javascripts ./public`
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
    public_assets = [public_css, public_images]

    if File.exists?("#{public_js}")
      `rm -rf #{public_js}`
    end

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
    css = "#{File.dirname(__FILE__)}/app/assets/stylesheets/"
    scss = "#{File.dirname(__FILE__)}/app/assets/stylesheets/scss/"
    coffee = "#{File.dirname(__FILE__)}/app/assets/javascripts/coffee/"

    Dir.foreach(javascripts) do |file|
      unless file == '.' || file == '..' || File.directory?("#{javascripts}#{file}")
        js = File.read("#{javascripts}#{file}")
        open "#{File.dirname(__FILE__)}/public/javascripts/#{file}", "w" do |f|
          f.puts js
        end
      end
    end

    `mkdir ./public/javascripts/coffee`
    Dir.foreach(coffee) do |file|
      unless file == '.' || file == '..' || File.directory?("#{coffee}#{file}")
        cf = File.read("#{coffee}#{file}")
        open "#{File.dirname(__FILE__)}/public/javascripts/coffee/#{file}", "w" do |f|
          f.puts cf
        end
      end
    end

    Dir.foreach(css) do |file|
      unless file == '.' || file == '..' || File.directory?("#{css}#{file}")
        styles = File.read("#{css}#{file}")
        open "#{File.dirname(__FILE__)}/public/stylesheets/#{file}", "w" do |f|
          f.puts styles
        end
      end
    end

    Dir.foreach(scss) do |file|
      unless file == '.' || file == '..' || File.directory?("#{scss}#{file}")
        styles = File.read("#{scss}#{file}")
        open "#{File.dirname(__FILE__)}/public/stylesheets/#{file}", "w" do |f|
          f.puts styles
        end
      end
    end
  end

  task dev: [:clean, :compile_js, :compile_css, :dev_assets] do

  end

  task prod: [:clean, :compile_js, :compile_css, :uglify] do
  end
end