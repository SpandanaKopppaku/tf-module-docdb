
locals{
    DOCDB_USER  = jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["DOCDB_USERNAME"]
    DOCDB_PASS  = jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["DOCDB_PASSWORD"]


}