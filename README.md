
# Connext router provision with AWS Cloudformation. 

> This repository was created for help the community provision the Connext router via AWS infrastructure

**Feature**

 - Automatic to provision VPC.
 - Automatic to provision public/private subnet.
 - Automatic to provision public/private router table.
 - Automatic to provision NAT gateway.
 - Automatic to provision remote/router instance.
 - Automatic to install/run router container. 
 - Automatic to provision security group. (Firewall)
 - Automatic to create monitoring dashboard. (Cloudwatch Dashboard)
 - Support alarm system. (AWS SNS via email)

**Guideline**

 1. Log in to AWS console https://console.aws.amazon.com/. (If you don't have an account yet please register the account first)
 2. Create new key-pair https://ap-southeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-1#KeyPairs: and then save the .pem file to secure location. We need .pem to ssh to remote/router server.
 3. Download "cloudformation.yaml" script and change the 3 parameters below.
	 - [ ] KeyName, Input your key-pair name. 
	 - [ ] Email, Your email for receiving an email alert.
	 - [ ] PrivateKey, Your private key wallet. (You can get them from Metamask wallet)
	 ![](https://photos.app.goo.gl/8GZg82iCmVyeKcwb8)

 
