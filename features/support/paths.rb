module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    
    case page_name
  
    when /the home\s?page/
      '/'
    when /the search page/
      '/'
    when /the document page for id (.+)/ 
      catalog_path($1)
    when /the edit page for id (.+)/ 
      edit_catalog_path($1)
    when /the catalog index page/
      catalog_index_path
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /the edit document page for (.*)$/i
      edit_catalog_path($1)
    when /the show document page for (.*)$/i
      catalog_path($1)
    when /the file list page for (.*)$/i
      asset_file_assets_path($1)
    when /the file asset (.*)$/i
      file_asset_path($1)
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
      
  end

end

World(NavigationHelpers)
