#!/bin/bash

#############################################################
## 	             Preparing the harbor.cfg file             ##
##             using input parameters (variables)          ##
#############################################################

if [ ${HARBORHOSTNAME} ]; then sed -i '/hostname = reg.mydomain.com/c\hostname = '${HARBORHOSTNAME}'' harbor.cfg; fi
if [ ${UI_URL_PROTOCOL} ]; then sed -i '/ui_url_protocol = http/c\ui_url_protocol = '${UI_URL_PROTOCOL}'' harbor.cfg; fi
if [ ${EMAIL_IDENTITY} ]; then sed -i '/email_identity =/c\email_identity = '${EMAIL_IDENTITY}'' harbor.cfg; fi 
if [ ${EMAIL_SERVER} ]; then sed -i '/email_server = smtp.mydomain.com/c\email_server = '${EMAIL_SERVER}'' harbor.cfg; fi 
if [ ${EMAIL_SERVER_PORT} ]; then sed -i '/email_server_port = 25/c\email_server_port = '${EMAIL_SERVER_PORT}'' harbor.cfg; fi 
if [ ${EMAIL_USERNAME} ]; then sed -i '/email_username = sample_admin@mydomain.com/c\email_username = '${EMAIL_USERNAME}'' harbor.cfg; fi 
if [ ${EMAIL_PASSWORD} ]; then sed -i '/email_password = abc/c\email_password = '${EMAIL_PASSWORD}'' harbor.cfg; fi 
if [ ${EMAIL_FROM} ]; then sed -i '/email_from = admin <sample_admin@mydomain.com>/c\email_from = '${EMAIL_FROM}'' harbor.cfg; fi 
if [ ${EMAIL_SSL} ]; then sed -i '/email_ssl = false/c\email_ssl = '${EMAIL_SSL}'' harbor.cfg; fi 
if [ ${HARBOR_ADMIN_PASSWORD} ]; then sed -i '/harbor_admin_password = Harbor12345/c\harbor_admin_password = '${HARBOR_ADMIN_PASSWORD}'' harbor.cfg; fi
if [ ${AUTH_MODE} ]; then sed -i '/auth_mode = db_auth/c\auth_mode = '${AUTH_MODE}'' harbor.cfg; fi
if [ ${LDAP_URL} ]; then sed -i '/ldap_url = ldaps://ldap.mydomain.com/c\ldap_url = '${LDAP_URL}'' harbor.cfg; fi
if [ ${LDAP_BASEDN} ]; then sed -i '/ldap_basedn = ou=people,dc=mydomain,dc=com/c\ldap_basedn = '${LDAP_BASEDN}'' harbor.cfg; fi
if [ ${LDAP_UID} ]; then sed -i '/ldap_uid = uid/c\ldap_uid = '${LDAP_UID}'' harbor.cfg; fi
if [ ${LDAP_SCOPE} ]; then sed -i '/ldap_scope = 3/c\ldap_scope = '${LDAP_SCOPE}'' harbor.cfg; fi
if [ ${DB_PASSWORD} ]; then sed -i '/db_password = root123/c\db_password = '${DB_PASSWORD}'' harbor.cfg; fi
if [ ${SELF_REGISTRATION} ]; then sed -i '/self_registration = on/c\self_registration = '${SELF_REGISTRATION}'' harbor.cfg; fi
if [ ${USE_COMPRESSED_JS} ]; then sed -i '/use_compressed_js = on/c\use_compressed_js = '${USE_COMPRESSED_JS}'' harbor.cfg; fi
if [ ${MAX_JOB_WORKERS} ]; then sed -i '/max_job_workers = 3/c\max_job_workers = '${MAX_JOB_WORKERS}'' harbor.cfg; fi
if [ ${TOKEN_EXPIRATION} ]; then sed -i '/token_expiration = 30/c\token_expiration = '${TOKEN_EXPIRATION}'' harbor.cfg; fi
if [ ${VERIFY_REMOTE_CERT} ]; then sed -i '/verify_remote_cert = on/c\verify_remote_cert = '${VERIFY_REMOTE_CERT}'' harbor.cfg; fi
if [ ${CUSTOMIZE_CRT} ]; then sed -i '/customize_crt = on/c\customize_crt = '${CUSTOMIZE_CRT}'' harbor.cfg; fi
if [ ${CRT_COUNTRY} ]; then sed -i '/crt_country = CN/c\crt_country = '${CRT_COUNTRY}'' harbor.cfg; fi
if [ ${CRT_STATE} ]; then sed -i '/crt_state = State/c\crt_state = '${CRT_STATE}'' harbor.cfg; fi
if [ ${CRT_LOCATION} ]; then sed -i '/crt_location = CN/c\crt_location = '${CRT_LOCATION}'' harbor.cfg; fi
if [ ${CRT_ORGANIZATION} ]; then sed -i '/crt_organization = organization/c\crt_organization = '${CRT_ORGANIZATION}'' harbor.cfg; fi
if [ ${CRT_ORGANIZATIONALUNIT} ]; then sed -i '/crt_organizationalunit = organizational unit/c\crt_organizationalunit = '${CRT_ORGANIZATIONALUNIT}'' harbor.cfg; fi
if [ ${CRT_COMMONNAME} ]; then sed -i '/crt_commonname = example.com/c\crt_commonname = '${CRT_COMMONNAME}'' harbor.cfg; fi
if [ ${CRT_EMAIL} ]; then sed -i '/crt_email = example@example.com/c\crt_email = '${CRT_EMAIL}'' harbor.cfg; fi
if [ ${PROJECT_CREATION_RESTRICTION} ]; then sed -i '/project_creation_restriction = everyone/c\project_creation_restriction '${PROJECT_CREATION_RESTRICTION}'' harbor.cfg; fi
#if [ ${SSL_CERT} ]; then sed -i '/ssl_cert = \/data\/cert\/server.crt/c\ssl_cert = '${SSL_CERT}'' harbor.cfg; fi
#if [ ${SSL_CERT_KEY} ]; then sed -i '/ssl_cert_key = \/data\/cert\/server.key/c\ssl_cert_key = '${SSL_CERT_KEY}'' harbor.cfg; fi


mkdir -p /data/cert
echo ${SSL_CERT} > /data/cert/server.crt
echo ${SSL_CERT_KEY} > /data/cert/server.key




#############################################################
## 	             Preparing the config files                ##
##             using the standard prepare script           ##
#############################################################

./prepare






#############################################################
## 	             Poupulating the to-be volumes             ##
##      to be exported to the application containers       ##
#############################################################


if [ ! -d "/config-adminserver" ]; then
  mkdir /config-adminserver
fi

if [ ! -d "/config-db" ]; then
  mkdir /config-db
fi

if [ ! -d "/config-jobservice" ]; then
  mkdir /config-jobservice
fi

if [ ! -d "/config-log" ]; then
  mkdir /config-log
fi

if [ ! -d "/config-nginx" ]; then
  mkdir /config-nginx
fi

if [ ! -d "/config-registry" ]; then
  mkdir /config-registry
fi

if [ ! -d "/config-ui" ]; then
  mkdir /config-ui
fi


cp -R ./common/config/adminserver/* /config-adminserver
cp -R ./common/config/db/* /config-db
cp -R ./common/config/jobservice/* /config-jobservice
cp -R ./common/config/log/* /config-log
cp -R ./common/config/nginx/* /config-nginx
cp -R ./common/config/registry/* /config-registry
cp -R ./common/config/ui/* /config-ui

cp /harbor/entrypointdb.sh /config-db/entrypointdb.sh
cp /harbor/entrypointui.sh /config-ui/entrypointui.sh
cp /harbor/entrypointjobservice.sh /config-jobservice/entrypointjobservice.sh
cp /harbor/entrypointadminserver.sh /config-adminserver/entrypointadminserver.sh


chmod +x /config-db/entrypointdb.sh \
		 /config-ui/entrypointui.sh \
		 /config-jobservice/entrypointjobservice.sh \
     /config-adminserver/entrypointadminserver.sh
