#!ruby
require 'date'
require 'yaml'
require 'optparse'

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
    
    unless File.exist?(@full_path_file_name)

      msg =  "blog_post_file_name " + @blog_post_file_name + "\n"
      msg += "file_path " + @file_location + "\n"
      msg += "full_path_file_name " + @full_path_file_name + "\n"
      print_msg(msg)
      
      new_file = File.new(@full_path_file_name,"w")
      new_file.puts "---"
      new_file.puts "layout: post"
      new_file.puts "title:  " + blog_title.remove_dashes_replace_with_spaces_regex
      new_file.puts "---"
      new_file.close

      #File.open(@full_path_file__name) do |f|
       # f.each do |line|
       #  puts line
       #end
      #end

    #if success print file contents with message
    else
      msg = "file already exists for " + @blog_post_file_name
      print_msg(msg)
      exit
    end
  end

  def generate_file_name(blog_title)
    #YEAR-MONTH-DAY-title.MARKUP
    @blog_title = blog_title
    @file_name = Date.today.strftime("%Y-%m-%d")
    @file_name += "-" + @blog_title + ".md"
  end

  def print_file_name(file_name)
    print "\n"
  end

  def print_file_location
    print "file_location: " + @file_location
    print "\n"
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

if options[:verbose] == true
   print "\noptions[:verbose] = " +  options[:verbose].to_s
   print "\n@blog_title = "
   print @blog_title
   print "\n"
end


### next steps:
### - pass title into Blog Create
### - generate title
### - create a new file in the posts directory
### - add notes to README
### - add blog post "why I built this?"





