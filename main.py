import boto3

"""
    AWS Lambda handler function to update and retrieve visit count.
"""


# Initialize DynamoDB resource and table
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitcount')



def lambda_handler(event, context):
    
    # Fetch the current visit count from DynamoDB
    try:
        response = table.get_item(Key={'appname': 'ResumeApp'})

        # Extract the load count and increment it
        current_count = int(response["Item"]["loadcount"])
        new_count = str(current_count + 1)

        # Update the load count in the database
        table.update_item(
            Key={'appname': 'ResumeApp'},
            UpdateExpression='SET loadcount = :c',
            ExpressionAttributeValues={':c': new_count},
            ReturnValues='UPDATED_NEW'
        )

        # Return the updated count
        return {
            'body': new_count
        }
    except Exception as e:

        print(f"Error updating count: {e}")
        return {
            'statusCode': 500,
            'body': {'error': str(e)}
        }