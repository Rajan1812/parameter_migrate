python Get_param.py > param.txt

#CLI doesn't treat parameter string values that begin with http:// or https:// differently from other strings.
aws configure set cli_follow_urlparam false  

for i in `cat param.txt`
do
    value=`aws ssm get-parameter --name $i | grep "Value" | cut -d'"' -f4`
    p_name=$i
    aws ssm put-parameter --name $p_name --type String --value $value --region <Destination_region>
done
