#
# Core
#

variable "MY_CORE_SET_DEBUG"{
  default = "NONE"
}
variable "MY_CORE_SET_VERBOSE"{
  default = "ALL"
}
variable "MY_CORE_PATH_BL64"{
  default = "/opt/bl64"
}
variable "MY_CORE_PATH_INST64"{
  default = "/opt/inst64"
}
variable "MY_CORE_PATH_SO64"{
  default = "/opt/sysop64"
}

#
# Component
#

variable "TAG"{
  default = "latest"
}

variable "MY_CADDY_CFG_BASEIMAGE"{
  default = "ghcr.io/automation64/base/alpine-3.21-base:latest"
}
variable "MY_CADDY_CFG_PORT"{
  default = ":8080"
}

group "default"{
  targets = [
    "file_server"
  ]
}

target "file_server"{
  tags = [
    "caddy-file-server:${TAG}"
  ]
  context = "file-server"
  dockerfile = "Dockerfile"
  args = {
    MY_CORE_SET_DEBUG = MY_CORE_SET_DEBUG
    MY_CORE_SET_VERBOSE = MY_CORE_SET_VERBOSE
    MY_CORE_PATH_INST64 = MY_CORE_PATH_INST64
    MY_CORE_PATH_SO64 = MY_CORE_PATH_SO64

    MY_CADDY_CFG_BASEIMAGE = MY_CADDY_CFG_BASEIMAGE
    MY_CADDY_CFG_PORT = MY_CADDY_CFG_PORT
  }
}
