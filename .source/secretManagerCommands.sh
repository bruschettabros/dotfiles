#Get a list of available secrets
list-secrets() {aws secretsmanager list-secrets --region eu-west-1| jq '.SecretList[].Name'}

#Get the ARN value for a secret
get-arn() {aws secretsmanager list-secrets --region eu-west-1 --filter Key="name",Values="$1" | jq '.SecretList[].ARN'}

#Retrieve a key value secret based on a provided ARN
get-key() {aws secretsmanager get-secret-value --secret-id $1 | jq}

#Pass a secret and get the key value
get-secret() {
    arn=$(get-arn $1 | tr -d '"')
    get-key $arn
}
