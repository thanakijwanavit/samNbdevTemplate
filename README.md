# Template for sam nbdev
> Summary description here.


## Install

`pip install aws-sam-cli nbdev pynamodb-dax`

to configure aws credentials run `brew install awscli` then `aws configure`
you can put the IAM user keys in

## How to use

1. fill in all the notebooks in the folder nbs
  * put `#export` on top of any cells you want to export and `#default_exp filename` on top of the notebook (see example`get.ipynb`)
  * put `#hide` on top of the cells you dont want to include in python package
  * run `make build`

2. edit sam template 
  * [template](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-resource-function.html) as necessary, file `template.yaml`
  * test your sam template using `make test`

3. put library to install with pip into `layerRequirements.txt` or `samRequirements.txt`



4. only for the first run:
  * run `sam build` then `sam deploy --guided`
  * run `make test`
  
5. editing the app router
  * edit the file `app/app.py`
  * put this on the top line `from src.<your nb name> import <your lambda function in nbdev>`
  * dont forget to put `#export` on top of the cells you want to include in the product
  
6. (optional) to deploy using github action, edit the `deploy.yml` file as appropriate
  `in most cases you should only edit the last line`

7. go to [cloudformation](https://ap-southeast-1.console.aws.amazon.com/cloudformation) console to see the result


