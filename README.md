
# Connext router provision with AWS Cloudformation. 

> This repository was created for help the community provision the Connext router via AWS infrastructure.

## Feature


 - Automatic to provision VPC.
 - Automatic to provision public/private subnet.
 - Automatic to provision public/private router table.
 - Automatic to provision NAT gateway.
 - Automatic to provision remote/router instance.
 - Automatic to install/run router container. 
 - Automatic to provision security group. (Firewall)
 - Automatic to create monitoring dashboard. (Cloudwatch Dashboard)
 - Support alarm system. (AWS SNS via email)

## Guideline

 1. Log in to AWS console https://console.aws.amazon.com. (If you don't have an account yet please register the new account first.)
 2. Create new key-pair (https://ap-southeast-1.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-1#KeyPairs:) and then save the .pem file to secure location. We need .pem to ssh to remote/router server.
 3. Download "cloudformation.yaml" script and change the 3 parameters below.
	 - [ ] KeyName, Input your key-pair name. 
	 - [ ] Email, Your email for receiving an email alert.
	 - [ ] PrivateKey, Your private key wallet. (You can get them from Metamask wallet)
	 ![enter image description here](https://user-images.githubusercontent.com/5087734/170765553-bac4e72f-51d9-4228-b87d-2d1df2a5d1b3.png)
 4. Go to cloudformation menu.(https://ap-southeast-1.console.aws.amazon.com/cloudformation/home?region=ap-southeast-1#/) Create a new stack and select upload a template file with your "cloudformation.yaml" and then fill your stack name. (Wait for 5 mins everything will come up for you)
 ![enter image description here](https://user-images.githubusercontent.com/5087734/170765560-6367d335-a491-49c1-b0e4-7947f2ff39f6.png)
 5. Go to your email and Confirm subscription email from SNS alarm system.
 ![enter image description here](https://user-images.githubusercontent.com/5087734/170765568-07340c50-3497-4fba-8313-b9f6232bb498.png)
 
 6. Wait to cloudformation install complete go to EC2 instance for ssh to your remote server after you need to ssh again to your router node with private ip address (Your router node can't access from public ip address). Verify your route container with the command line. 
	 ```
	 docker logs --tail 100 router
	 ```
 7. If you need to remove all of the resource please go to cloudformation menu and then remove your stack. (All of the resource will delete automatically)

## Monitory and Alarm
Go to cloudwatch dashboard for monitor your router server.
![enter image description here](https://user-images.githubusercontent.com/5087734/170767422-7f047050-83b0-498b-bdfb-454dd77f660b.png)
If your server have any issue system will send email alert to your email automatically.
![enter image description here](https://user-images.githubusercontent.com/5087734/170767509-c885b53c-1fe9-4de0-ab9c-14b4ceb81979.png)

 
Hope your enjoy to provision Connext router and don't forget to add liquidity and keep bridge. 
See you next time.

 **Autor**
 
POR | ContributionDAO

pongchai#2968 

 
