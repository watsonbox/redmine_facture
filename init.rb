require 'enumeration_patch'
require 'enumerations_controller_patch'

Redmine::Plugin.register :redmine_facture do
  name 'Redmine Facture plugin'
  author 'Howard Wilson'
  description 'Redmine plugin to support Facture integration'
  version '0.0.1'
  url 'https://github.com/watsonbox/redmine_facture'
  author_url 'https://github.com/watsonbox'

  Rails.configuration.to_prepare do
    Enumeration.send(:include, EnumerationPatch)
    EnumerationsController.send(:include, EnumerationsControllerPatch)
  end
end
