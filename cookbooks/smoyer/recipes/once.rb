username="smoyer"
# --- Install packages we need ---
package 'git'
package 'kupfer'
package 'tree'
package 'mercurial'
package 'libncurses5-dev'
gem_package 'rake'


execute "create src folder in home " do
  user "#{username}"
  cwd "/home/#{username}"
  command "[ -d src ] || mkdir src"
end

bash "download and install dotfiles" do 
  user "#{username}"
  cwd "/home/#{username}/src"
  code <<-EOB 
    [ -d dotfiles ] || git clone https://github.com/SteveMoyer/dotfiles.git
    cd dotfiles
    rake install
  EOB
end 
bash "install vim from source" do 
  user "root"
  cwd "/home/#{username}/src"
  code <<-EOH
          [ -d vim ] || hg clone https://vim.googlecode.com/hg/ vim	
          cd vim/src
          hg update default
          make
    make install
  EOH

end 
