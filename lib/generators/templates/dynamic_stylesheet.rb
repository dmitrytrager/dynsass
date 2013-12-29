class DynamicStylesheet
  def initialize(options)
    @options = options
  end

  def stylesheet_file
    "#{Rails.env}_dyn_stylesheet.css"
  end

  def scss_file_path
    Rails.root.join('app', 'assets', 'stylesheets', "#{self.stylesheet_file}.scss")
  end

  def erb_filename
    'dyn_stylesheet.scss.erb'
  end

  def erb_file_path
    Rails.root.join('app', 'assets', 'stylesheets', 'sass', erb_filename)
  end

  def render_scss
    ERB.new(File.read(erb_file_path)).result(binding)
  end

  def compiled?
    if Rails.application.config.assets.compile
      File.exists?(self.scss_file_path) && !File.zero?(self.scss_file_path)
    else
      Rails.application.config.assets.digests[self.stylesheet_file].present?
    end
  end

  def precompile
    File.open(scss_file_path, 'w') { |f| f.write render_scss }
  end

  def compile
    precompile
    unless Rails.application.config.assets.compile
      env = Rails.application.assets.is_a?(Sprockets::Index) ? Rails.application.assets.instance_variable_get('@environment') : Rails.application.assets

      Sprockets::StaticCompiler.new(
        env,
        File.join(Rails.public_path, Rails.application.config.assets.prefix),
        [self.stylesheet_file],
        digest:   true,
        manifest: false
      ).compile

      Rails.application.config.assets.digests[self.stylesheet_file] = env[self.stylesheet_file].digest_path
    end

    Dir[self.scss_file_path.sub(/\d+.css.scss$/, '*')].each do |file|
      File.delete file unless file == self.scss_file_path.to_s
    end
  end
end
