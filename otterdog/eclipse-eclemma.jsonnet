local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-eclemma') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/technology.eclemma",
    default_repository_permission: "none",
    dependabot_alerts_enabled_for_new_repositories: false,
    dependabot_security_updates_enabled_for_new_repositories: false,
    dependency_graph_enabled_for_new_repositories: false,
    description: "Eclipse EclEmma is a Java code coverage tool for the Eclipse IDE.",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_private_repositories: false,
    members_can_create_public_repositories: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse EclEmma",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/eclemma/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('eclemma') {
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: ":waning_crescent_moon:　Java Code Coverage for Eclipse IDE",
      has_issues: false,
      homepage: "https://www.eclemma.org",
      secret_scanning: "enabled",
      secret_scanning_push_protection: "enabled",
      topics+: [
        "coverage",
        "eclipse-plugin",
        "java"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('update.eclemma.org') {
      description: "website https://update.eclemma.org",
      homepage: "https://update.eclemma.org",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_issues: false,
      has_wiki: false,
      has_projects: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
