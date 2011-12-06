require 'spec_helper'

# Run these remotely so our jruby_home, gem_home, etc are all setup
remote_describe "rake tasks" do

  it "should work" do
    output = rake('integ:sanity_check --trace')
    puts "!!!!!!!!!!!!!!!!!!"
    puts "OUTPUT IS |#{output}|"
    puts jruby_binary
    puts "#{jruby_binary} --help"
    puts "#{jruby_binary} -S gem list"
    puts "#{jruby_binary} -S rake --help"
    puts "Rakefile is #{rakefile}"
    puts "!!!!!!!!!!!!!!!!!!"
    output.should include('sanity check passed')
  end

  def rake(cmd)
    `#{jruby_binary} -S rake -f #{rakefile} #{cmd} 2>&1`
  end

  def rakefile
    "#{File.dirname(__FILE__)}/../apps/rails3.1/basic/Rakefile"
  end

end

