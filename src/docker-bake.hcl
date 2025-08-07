#
# Core
#

variable "GO64_CORE__SET_DEBUG"{
  default = "NONE"
}
variable "GO64_CORE__SET_VERBOSE"{
  default = "ALL"
}
variable "GO64_CORE__PATH_BL64"{
  default = "/opt/bl64"
}
variable "GO64_CORE__PATH_INST64"{
  default = "/opt/inst64"
}
variable "GO64_CORE__PATH_SO64"{
  default = "/opt/sysop64"
}

#
# Component
#

variable "TAG"{
  default = "latest"
}

variable "GO64_DOCKER_CADDY_FILE__CFG_BASEIMAGE"{
  default = "ghcr.io/automation64/base/alpine-3.21-base:latest"
}
variable "GO64_DOCKER_CADDY_FILE__CFG_PORT"{
  default = ":8080"
}

group "default"{
  targets = [
    "file"
  ]
}

target "file"{
  tags = [
    "file:${TAG}"
  ]
  context = "src/file"
  dockerfile = "Dockerfile"
  args = {
    GO64_CORE__SET_DEBUG = GO64_CORE__SET_DEBUG
    GO64_CORE__SET_VERBOSE = GO64_CORE__SET_VERBOSE
    GO64_CORE__PATH_INST64 = GO64_CORE__PATH_INST64
    GO64_CORE__PATH_SO64 = GO64_CORE__PATH_SO64
    GO64_DOCKER_CADDY_FILE__CFG_BASEIMAGE = GO64_DOCKER_CADDY_FILE__CFG_BASEIMAGE

    GO64_DOCKER_CADDY_FILE__CFG_PORT = GO64_DOCKER_CADDY_FILE__CFG_PORT
  }
}
