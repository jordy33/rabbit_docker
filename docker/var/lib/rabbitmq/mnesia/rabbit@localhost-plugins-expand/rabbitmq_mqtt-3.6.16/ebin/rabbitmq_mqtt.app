{application, 'rabbitmq_mqtt', [
	{description, "RabbitMQ MQTT Adapter"},
	{vsn, "3.6.16"},
	{id, ""},
	{modules, ['rabbit_mqtt','rabbit_mqtt_collector','rabbit_mqtt_connection_sup','rabbit_mqtt_frame','rabbit_mqtt_processor','rabbit_mqtt_reader','rabbit_mqtt_retained_msg_store','rabbit_mqtt_retained_msg_store_dets','rabbit_mqtt_retained_msg_store_ets','rabbit_mqtt_retained_msg_store_noop','rabbit_mqtt_retainer','rabbit_mqtt_retainer_sup','rabbit_mqtt_sup','rabbit_mqtt_util','rabbit_mqtt_vhost_event_handler']},
	{registered, [rabbitmq_mqtt_sup]},
	{applications, [kernel,stdlib,ranch,rabbit_common,rabbit,amqp_client]},
	{mod, {rabbit_mqtt, []}},
	{env, [
	    {default_user, <<"guest">>},
	    {default_pass, <<"guest">>},
	    {ssl_cert_login,false},
	    %% To satisfy an unfortunate expectation from popular MQTT clients.
	    {allow_anonymous, true},
	    {vhost, <<"/">>},
	    {exchange, <<"amq.topic">>},
	    {subscription_ttl, 86400000}, %% 24 hours
	    {retained_message_store, rabbit_mqtt_retained_msg_store_dets},
	    %% only used by DETS store
	    {retained_message_store_dets_sync_interval, 2000},
	    {prefetch, 10},
	    {ssl_listeners, []},
	    {num_ssl_acceptors, 1},
	    {tcp_listeners, [1883]},
	    {num_tcp_acceptors, 10},
	    {tcp_listen_options, [{backlog,   128},
	                          {nodelay,   true}]}
	  ]}
]}.