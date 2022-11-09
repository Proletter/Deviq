variable "subscription_id" {
  type        = string
  description = "subscription id of the deployment sub"
  default     = "83749931-cacf-4843-9d28-fef648d664c3"
}

variable "client_secret" {
  type        = string
  description = "client secret of the 'terraform' spn"
  default     = "PP28Q~R1HUXrDdS4wyUyBj4C2B1XjIYV5e9j5cLu"
}


variable "tenant_id" {
  type        = string
  description = "Tenant id of the deployment sub"
  default     = "3880a7f9-be04-4218-81d6-f6d53d594651"
}

variable "client_id" {
  type        = string
  description = "client id of the service principal"
  default     = "8833229a-b007-4897-887e-2e8f27bb80d5"
}

variable "web_app_name" {
  type        = string
  description = "web app name"
  default     = "candidate1WebApp"
}

variable "app_service_plan" {
  type        = string
  description = "app service plan name"
  default     = "candidate1appserviceplan"
}
variable "sku" {
  type        = string
  description = "sku type for the app service plan"
  default     = "P1v2"

}


variable "repository_url" {
  type        = string
  description = "repo url"
  default     = "https://github.com/Azure-Samples/nodejs-docs-hello-world"

}

variable "resource_group" {
  type        = string
  description = "name of the provided resource group"
  default     = "RG_CandidateReview"
}

variable "branch" {
  type        = string
  description = "repo branch"
  default     = "master"

}

variable "server" {
  type        = string
  description = "server name for the deployed mssql server"
  default     = "candidatesqlserver"
}

variable "database" {
  type        = string
  description = "database name for the deployed database"
  default     = "candidatesqldatabase"
}