username="smoyer"
# --- Install packages we need ---
package 'git'
package 'kupfer'
package 'tree'
package 'mercurial'
package 'maven'
package 'libncurses5-dev'
package 'exuberant-ctags'
gem_package 'rake'


execute "create src folder in home " do
  user "#{username}"
  cwd "/home/#{username}"
  command "[ -d src ] || mkdir src"
end




