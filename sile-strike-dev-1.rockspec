rockspec_format = "3.0"
package = "sile-strike"
version = "dev-1"

source = {
   url = "git+https://github.com/ctrlcctrlv/sile-strike.git",
   tag = "master"
}

description = {
   summary = "Strikethrough command for SILE",
   detailed = [[A simple package which adds a strikethrough command, \strike.]],
   license = "Apache 2",
   homepage = "https://github.com/ctrlcctrlv/sile-strike",
   issues_url = "https://github.com/ctrlcctrlv/sile-strike/issues",
   maintainer = "Fredrick Brennan <copypaste@kittens.ph>",
   labels = { "sile", "typesetting" }
}

dependencies = {
   "lua >= 5.1"
}

build = {
   type = "builtin",
   modules = {
      ["sile.packages.strike"] = "packages/strike.lua"
   }
}
