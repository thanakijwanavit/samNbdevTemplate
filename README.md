# Template for sam nbdev
> Summary description here.


## Install

`pip install aws-sam-cli 'nbdev<2' pynamodb-dax`

to configure aws credentials run `brew install awscli` then `aws configure`
you can put the IAM user keys in

## How to use

1. fill in all the notebooks in the folder nbs
  * put `#export` on top of any cells you want to export and `#default_exp filename` on top of the notebook (see example`get.ipynb`)
  * put `#hide` on top of the cells you dont want to include in python package
  * run `make build` to update code in `src`

2. edit sam template 
  * [template](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-resource-function.html) as necessary, file `template.yaml`
  * test your sam template using `make test`

3. add required libraries list to `layerRequirements.txt` or `samRequirements.txt`

4. only for the first run:
  * create a new s3 bucket or use an existing bucket, place the uri in sam.toml
  * for example `s3_bucket = "aws-sam-cli-managed-default-samclisourcebucket-jx3h3o6mj7ty"`
  * set the region as appropriate in sam.toml
  * run `sam build` then `sam deploy --guided`
  * run `make test`
  
5. editing the app router
  * edit the file `app/app.py`
  * put this on the top line `from src.<your nb name> import <your lambda function in nbdev>`
  * dont forget to put `#export` on top of the cells you want to include in the product
  
6. (optional) to deploy using github action, edit the `deploy.yml` file as appropriate
  `in most cases you should only edit the stack prefix `
  * edit stack prefix (line 75)
  
7. to get github action to work properly, you need to add the required variables including
  * DOCKER_HUB_ACCESS_TOKEN
  * DOCKER_HUB_USERNAME
  * PROD_AWS_ACCESS_KEY_ID
  * PROD_AWS_SECRET_ACCESS_KEY

8. go to [cloudformation](https://ap-southeast-1.console.aws.amazon.com/cloudformation) console to see the result



# Known problems

* if you can't build the layer with error such as version number not available, put in previous library version in requirements.txt

* if build error during deployment, you need to manually delete the stack in console or cli `aws cloudformation delete-stack --stack-name <stackname>`