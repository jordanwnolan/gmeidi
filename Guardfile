# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %(app lib config test spec feature)

## Uncomment to clear the screen before every task
# clearing :on

guard 'rake', :task => 'assets:dev' do
  watch(%r{^app/assets/javascripts/coffee/.+\.coffee})
  watch(%r{^app/assets/stylesheets/scss/.+\.scss})
end
