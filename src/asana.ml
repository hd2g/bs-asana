type attachments
type batch_api
type custom_field_settings
type custom_fields
type events
type jobs
type organization_exports
type portfolio_memberships
type portfolios
type project_memberships
type project_statuses
type projects
type resource
type sections
type stories
type tags
type tasks
type teams
type typeahead
type user_task_lists
type users
type webhooks
type workspace_memberships
type workspaces

module Resource = struct
  type t = resource

  external default_page_limit : int = "DEFAULT_PAGE_LIMIT" [@@bs.module "resource"]
end

module Projects = struct
  type t = projects
end
