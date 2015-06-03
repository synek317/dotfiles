#!/usr/bin/env ruby

#source: http://gee-bee.github.io/manage-your-dotfiles-with-ease/

require 'fileutils'
require 'pathname'

# Recursively link files from source to target directory
def linkify source_path, target_path
  Dir.glob( File.join(source_path, '*'), File::FNM_DOTMATCH ).each do |src_fn_path|
    src_pn = Pathname.new src_fn_path
    next if %w(. ..).include? src_pn.basename.to_s
    if src_pn.directory?
      FileUtils.mkdir_p File.join(target_path, src_pn.basename)
      linkify File.join(source_path, src_pn.basename), File.join(target_path, src_pn.basename)
    else
      target = File.join(target_path, src_pn.basename)
      puts "Creating link #{target} -> #{src_pn}"
      FileUtils.ln_s src_pn, target, force: true
    end
  end
end
linkify File.join( File.expand_path(File.dirname(__FILE__)), 'home' ), ENV['HOME']