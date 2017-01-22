module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def ember_component(tag, name, attrs = {})
    attrs.merge!(services)

    content_tag(tag, '', data: {
      component: name, attrs: attrs.to_json
    })
  end

  def services
    {
      session: {
        currentUser: current_user.as_ember_json.merge({
          admin: current_user.admin?
        })
      }
    }
  end
end
