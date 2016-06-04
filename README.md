# Parse Services

This is an experimental docker app to initiate a self-hosted parse-server with useful functions such as manual backup.

## Installation

  - Create your .env file

```

# parse configs
PARSE_SERVER_APPLICATION_ID=APP_ID1
PARSE_SERVER_MASTER_KEY=PARSE_SERVER_MASTER_KEY1
PARSE_SERVER_CLIENT_KEY=PARSE_SERVER_CLIENT_KEY1
PARSE_SERVER_JAVASCRIPT_KEY=PARSE_SERVER_JAVASCRIPT_KEY1
PARSE_SERVER_REST_API_KEY=PARSE_SERVER_REST_API_KEY1
PARSE_SERVER_WEBHOOK_KEY=PARSE_SERVER_WEBHOOK_KEY1

# parse-server configs
APP_ID=PARSE_SERVER_APPLICATION_ID
MASTER_KEY=PARSE_SERVER_MASTER_KEY
CLIENT_KEY=PARSE_SERVER_CLIENT_KEY
REST_API_KEY=PARSE_SERVER_REST_API_KEY
JAVASCRIPT_KEY=PARSE_SERVER_JAVASCRIPT_KEY

# parse-dashboard configs
PARSE_DASHBOARD_MASTER_KEY=PARSE_SERVER_MASTER_KEY
PARSE_DASHBOARD_APP_ID=PARSE_SERVER_APPLICATION_ID
PARSE_DASHBOARD_USER_ID=user
PARSE_DASHBOARD_USER_PASSWORD=password
PARSE_DASHBOARD_SERVER_URL=http://192.168.99.100:1337/parse

# AWS configs for backup & restore
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=
S3_BUCKET_NAME=

```

  - Restore, Restart and Compose up ( for the first time ) !
```
$ docker-compose up restore && docker-compose restart
```

  - Start !
```
$ docker-compose up -d parse-server parse-dashboard mongo
```

## Backup and Restore

#### Backup
```
$ docker-compose up backup
```
This will backup data specified in PATHS_TO_BACKUP to s3://{S3_BUCKET_NAME}/{backup_data_with_timestamp}

#### Restore
```
$ docker-compose up restore
```
This will restore data in s3://{S3_BUCKET_NAME}/{backup_data_with_timestamp} to PATHS_TO_BACKUP
