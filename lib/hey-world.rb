# frozen_string_literal: true

require "digest"
require "jekyll"

module HeyWorld
  class Error < StandardError; end
  VERSION = "0.3.2"

  class FingerprintGenerator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      fingerprints = {}

      # Collect CSS from both theme and site (site overrides theme)
      roots = []
      roots << site.theme.root if site.theme
      roots << site.source

      roots.each do |root|
        css_dir = File.join(root, "assets", "css")
        next unless Dir.exist?(css_dir)

        Dir.glob(File.join(css_dir, "**", "*.css")).each do |file|
          relative_path = file.sub(root, "")
          digest = Digest::MD5.hexdigest(File.read(file))[0..7]
          fingerprints[relative_path] = digest
        end
      end

      site.data["fingerprints"] = fingerprints
      Jekyll.logger.info "HeyWorld:", "Generated #{fingerprints.size} CSS fingerprints"
    end
  end

  module FingerprintFilter
    def fingerprint(path)
      site = @context.registers[:site]
      if site.data["fingerprints"] && site.data["fingerprints"][path]
        "#{path}?v=#{site.data["fingerprints"][path]}"
      else
        # Fallback: compute on the fly
        file = File.join(site.source, path)
        if File.exist?(file)
          digest = Digest::MD5.hexdigest(File.read(file))[0..7]
          "#{path}?v=#{digest}"
        else
          path
        end
      end
    end
  end
end

Liquid::Template.register_filter(HeyWorld::FingerprintFilter)
