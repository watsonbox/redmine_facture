# redmine_facture

A [Redmine](https://github.com/redmine/redmine) plugin to enable [Facture](https://github.com/watsonbox/facture) to import time entries.

Most of these changes are just Redmine enhancements which I will submit to the core repo in due course:

* The time entry activities API (enumerations) includes custom fields, as projects do, for example. Back in 2009 custom fields for enumerations were added, but were never exposed in the API (http://www.redmine.org/issues/4077). This allows Facture to support different billing prices for different activities.

* The time entry activities API (enumerations) returns project-level overrides. When activities are overridden by a project, new enumeration records are created with a `project_id`. Passing a `project_id` parameter to the API replaces system-level activities with these where they exist. This allows Facture to match up time entry activities and their custom fields, since the time entries API does return project-level activity.


## Todo

* JSONP must be enabled in Administration -> Settings -> Authentication so that Facture can make cross-domain requests. Could this be enabled as part of the plugin? Same for REST web service support?