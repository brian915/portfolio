## My Resume/About Me/Contact Pages

**[BrianRunk.net](https://brianrunk.net)**

### a standard, static Jekyll site hosted on Github Pages.

### useful links:

- https://jekyllrb.com/
- https://jekyllrb.com/docs/
- https://jekyllrb.com/docs/github-pages/
- https://docs.github.com/en/pages
- https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll


### 2024 update commands

> gh repo clone brian915/portfolio
>
> cd portfolio
>
> git status
>
> rbenv version
>
> rbenv install 3.2.3
>
> rbenv global 3.2.3
>
> bundle update jekyll 
>
> bundle install
>
> bundle exec jekyll serve
>
> brew upgrade rbenv

### when in doubt, remove versions from Gemfile

> run bundle install
and
> bundle update

> `bundle exec jekyll serve --livereload`

### when updating a long neglected gh-pages branch
> git switch gh-pages
>
> git merge -s recursive -X theirs origin main
>
> git push
>
> git switch main

### Create Blog Post Script
> create_blog_post.rb
Usage: create_blog_post.rb [options] title.
Generates a new blog file in the Posts directory a local Jekyll install in the format of #YEAR-MONTH-DAY-title.md

Uses a YAML file to configure local settings.
> local_config.yml

I use this for global configurations across multiple scripts in ~/bin/.
A copy is kept here for reference or possible local configuration.

# FORMAT CONTENT
# EXPLAIN WHY I CREATED MY OWN IF THIS ALREADY EXISTS