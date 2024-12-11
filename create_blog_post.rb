#!ruby
require 'date'
require 'yaml'
require 'optparse'
require 'titlecaser'

options = {}
parse_options = OptionParser.new do |parser|
   parser.banner = "
Usage: create_blog_post.rb [options] title.

Generates a new blog file in the Posts directory a local Jekyll install in the format of #YEAR-MONTH-DAY-title.md
"
   parser.on("-v", "--[no-]verbose", "Run verbosely") do |v|
     options[:verbose] = v
     print parser.banner
     print "\n"
   end

   if ARGV.empty?
     print "no 'blogtitle' option specified as a parameter\n" + parser.banner + "\n"
     exit
   end
end.parse!

@verbose = options[:verbose]

@blog_title = parse_options.join("-")

@config_file = '/Users/brian/bin/local_config.yml'

@blog_post_vars = YAML.load(File.read(@config_file))
@file_location = @blog_post_vars['JEKYLL_POSTS_FOLDER']         

class BlogPost
  attr_accessor :file_location, :file_name, :blog_title

  def initialize(file_location,blog_title)
    @file_location = file_location
    @blog_title = blog_title

    unless Dir.exist?(@file_location)
      msg = "Posts directory" + @file_location + " doesn't exist."
      print_msg(msg)
      exit
    end
  end

  def create_blog_post
    @blog_post_file_name = generate_file_name(blog_title)
    @full_path_file_name = @file_location + @blog_post_file_name
    @formatted_blog_title =  format_blog_title(blog_title)
    unless File.exist?(@full_path_file_name)
      new_file = File.new(@full_path_file_name,"w")
      new_file.puts "---"
      new_file.puts "layout: post"
      new_file.puts "title:  " + @formatted_blog_title
      new_file.puts "published:  false"
      new_file.puts "---"
      new_file.close
    else
      msg = "file already exists for " + @blog_post_file_name
      print_msg(msg)
      exit
    end
    if File.exist?(@full_path_file_name)
      msg = "Success! Post created."  + "\n"
      msg += read_blog_post(@full_path_file_name)
      msg += @blog_post_file_name.prepend('_posts/')
      print_msg(msg)
    else
      msg = "Blog post" + @formatted_blog_title + " not created"
      print_msg(msg)
      exit
    end
  end

  def read_blog_post(blog_file)
    contents = File.read(blog_file)
  end
 
  def format_blog_title(blog_title)
   blog_title = blog_title.gsub("-"," ")
   Titlecaser::TitleCase.new(blog_title).convert
  end

  def generate_file_name(blog_title)
    @blog_title = blog_title
    @file_name = Date.today.strftime("%Y-%m-%d")
    @file_name += "-" + @blog_title + ".md"
  end

  private
     def print_msg(msg)
       print "\n\n"
       print "============================================="
       print "\n\n"
       print msg 
       print "\n\n"
       print "============================================="
       print "\n\n"       
     end
end

blog_post = BlogPost.new(@file_location, @blog_title)
blog_post.create_blog_post

#if @verbose == true
#   print "\noptions[:verbose] = " +  options[:verbose].to_s
#   print "\n"
#end






