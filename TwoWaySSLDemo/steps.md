keytool -genkeypair -keyalg RSA -alias client-cert -keystore client.jks -storepass password -validity 360 -keysize 2048
keytool -importkeystore -srckeystore client.jks -destkeystore client.jks -deststoretype pkcs12

keytool -exportcert -alias client-cert -keystore client.jks -file client.cer


the trust_osb.jks from one-way demo

keytool -importcert -alias client-cert -keystore trust_osb.jks -file client.cer

keytool -v -list -keystore trust_osb.jks -alias client-cert

for debug:
EXTRA_JAVA_PROPERTIES="-Dssl.debug=true -Dweblogic.StdoutDebugEnabled=true"
export EXTRA_JAVA_PROPERTIES