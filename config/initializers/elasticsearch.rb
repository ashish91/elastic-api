config = {
  host: 'localhost',
  port: '9200',
  user: 'elastic',
  password: '8pVSZ70a5gmgO+W-thRU',
  scheme: 'https',
  transport_options: { ssl: { verify: false}}
}

if File.exists?("config/elasticsearch.yml")
  config.merge!(YAML.load_file("config/elasticsearch.yml")[Rails.env].deep_symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
