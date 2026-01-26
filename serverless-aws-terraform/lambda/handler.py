import json
import uuid
import boto3
import os
from datetime import datetime

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])

def lambda_handler(event, context):
    body = json.loads(event.get("body", "{}"))

    item = {
        "messageId": str(uuid.uuid4()),
        "name": body.get("name", ""),
        "email": body.get("email", ""),
        "message": body.get("message", ""),
        "createdAt": datetime.utcnow().isoformat()
    }

    table.put_item(Item=item)

    return {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Methods": "OPTIONS,POST"
        },
        "body": json.dumps({"message": "Message stored successfully"})
    }
