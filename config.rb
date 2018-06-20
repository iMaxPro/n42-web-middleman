# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :livereload

# Syntaxhighlighting
activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

#rss feed
Time.zone = "Berlin"

activate :external_pipeline,
  name: :webpack,
  command: build? ?  "yarn run build" : "yarn run start",
  source: ".tmp/dist/source",
  latency: 1


activate :blog do |blog|
  blog.prefix = "blog"
  blog.sources = "articles/{year}-{month}-{day}-{title}/post.html"
  blog.layout = "article_layout"
  blog.permalink = "/{year}/{month}/{day}/{title}.html"
  # blog.paginate = true
  # blog.page_link = "p{num}"
  # blog.per_page = 2
end


# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
