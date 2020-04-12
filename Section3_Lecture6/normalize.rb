# https://www.rsyslog.com/log-normalization-for-different-formats/
# https://www.liblognorm.com/files/manual/configuration.html#field-types
# https://www.liblognorm.com/download/
# yum install liblognorm
# yum install rsyslog-mmnormalize
# <133>1 2020-04-11T11:28:51.990206-04:00 rsyslog-client forward_tcp514 1000 - [version="5" environment="PROD" class="security_01"] This is message
# rule=:%<field_name>:<fielt_type>{<parameter>}%
version=2
rule=:<%rsyslog_priority:number%>1 %rsyslog_time:date-rfc5424% %rsyslog_host:word% %rsyslog_app:word% %rsyslog_procid:word% %rsyslog_msgid:word% [version="5" environment=%rsyslog_env:op-quoted-string% class=%rsyslog_class:op-quoted-string%] %rsyslog_msg:rest%