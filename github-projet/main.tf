resource "github_repository" "terraform-project" {
  name        = "repo-terraform-project"
  description = "Infra Automation using terraform"
  visibility  = "public"
  auto_init   = true

}

output "repo_url" {
  value = github_repository.terraform-project.html_url
}