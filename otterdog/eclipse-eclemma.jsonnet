local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-eclemma') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/technology.eclemma",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Eclipse EclEmma is a Java code coverage tool for the Eclipse IDE.",
    name: "Eclipse EclEmma",
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
      topics+: [
        "coverage",
        "eclipse-plugin",
        "java"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('update.eclemma.org') {
      description: "website https://update.eclemma.org",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_issues: false,
      has_projects: false,
      has_wiki: false,
      homepage: "https://update.eclemma.org",
      web_commit_signoff_required: false,
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
