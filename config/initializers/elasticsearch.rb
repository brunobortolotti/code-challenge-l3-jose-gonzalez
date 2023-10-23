require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new hosts: [{
                                                          host: 'localhost',
                                                          port: '9200',
                                                          user: 'elastic',
                                                          password: 'Yeaf1IfIhKEgmTSE1HwY'
                                                        }],
                                                        log: true,
                                                        transport_options: { request: { timeout: 5 } }
