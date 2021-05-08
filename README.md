# Template for sam nbdev
> Summary description here.


## Install

`pip install aws-sam-cli nbdev pynamodb-dax`

to configure aws credentials run `brew install awscli` then `aws configure`
you can put the IAM user keys in

## How to use

1. fill in all the notebooks, create if needed
2. put `#export` on top of any cells you want to export and `#default_exp filename` on top of the notebook (see example`get.ipynb`)
3. run `make build`
4. edit sam [template](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-resource-function.html) as necessary
5. put requirements into `layer/requirements.txt` and run `cd layer&& bash lambdaLayer.sh`
6. go back to the root directory and run `sam build` then `sam deploy --guided`
7. (optional) to deploy using github action, edit the `deploy.yml` file as appropriate
