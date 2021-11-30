import boto3
import os
from flask import Flask, jsonify


#Get s3 bucket configmap env
s3bucket=os.environ.get('s3-url-configmap')
s3bucket=str(s3bucket)
print("bucket is:", s3bucket)
#Get s3 configs  from kubenetes secret config
aws_access_key_id1=os.environ.get('s3-creds-access')
aws_secret_access_key1=os.environ.get('s3-creds-secret')

client = boto3.client('s3',
			aws_access_key_id=aws_access_key_id1,
                	aws_secret_access_key=aws_secret_access_key1
			)
response = client.list_objects(
                Bucket=s3bucket
)

#flask app to host http site.
app = Flask(__name__)
@app.route("/")
def s3_inf():
    return jsonify({"Message": response})
if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)
