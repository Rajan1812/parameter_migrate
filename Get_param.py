import boto3
response = client.describe_parameters()
for i in range(0,len(response['Parameters'])):
  print(response['Parameters'][i]['Name'])
