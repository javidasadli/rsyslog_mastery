# https://www.rsyslog.com/log-normalization-for-different-formats/
# https://www.liblognorm.com/files/manual/configuration.html#field-types
# https://www.liblognorm.com/download/
# yum install liblognorm
# yum install rsyslog-mmnormalize
# <133>1 2020-04-11T11:28:51.990206-04:00 rsyslog-client forward_tcp514 1000 - [version="5" environment="PROD" class="security_01"] message
version=2
rule=JSONNORM:%[{"type":"literal", "text":"<"},
                {"type":"number"},
                {"type":"literal", "text":">"},
                {"type":"number"},
                {"type":"whitespace"},
                {"type":"date-rfc5424"},
                {"type":"whitespace"},
                {"type":"word", "name":"rsyslog_host"},
                {"type":"whitespace"},
                {"type":"word", "name":"rsyslog_app"},
                {"type":"whitespace"},
                {"type":"word", "name":"rsyslog_procid"},
                {"type":"whitespace"},
                {"type":"word", "name":"rsyslog_msgid"},
                {"type":"whitespace"},
                {"type":"literal", "text":"[version="},
                {"type":"literal", "text":"\"5\""},
                {"type":"whitespace"},
                {"type":"word", "name":"environment="},
                {"type":"string", "matching.mode":"lazy", "matching.permitted":[{"class":"alnum"}],"name":"rsyslog_env"},
                {"type":"whitespace"},
                {"type":"literal", "matching.mode":"lazy", "matching.permitted":[{"class":"alnum"},{"chars":"_"}],"name":"rsyslog_class"},
                {"type":"literal", "text":"]"},
                {"type":"rest", "name":"rsyslog_message"}
]%