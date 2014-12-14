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

  task :uglify do

  end

  task :dev_assets do

  end

  task dev: [:compile_js, :compile_css, :dev_assets] do

  end

  task prod: [:compile_js, :compile_css, :uglify] do
  end
end