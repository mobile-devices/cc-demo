module WebShell
  def self.load_prerequisites(options={})
    require 'java'

    $:.push(File.expand_path("../../vendor/swt/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/tilt/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/rack/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/rack-protection/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/sinatra/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/therubyrhino/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/multi_json/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/execjs/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/coffee-script-source/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/coffee-script/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/sprockets/lib", __FILE__))
    $:.push(File.expand_path("../../vendor/hike/lib", __FILE__))

    require 'swt'
  end
end
