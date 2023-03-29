How to launch multiple EC2 instances in one go using Simple and Easy Terraform Code

 

Overview:

Infrastructure as Code tools like Terraform can be used to Build, change, and destroy AWS infrastructure, especially when dealing with multiple resources in a complex cloud infrastructure. 
In this blog, we will learn how Terraform can simplify your life by launching multiple instances in one go.

Prerequisites
Before we get started ensure that you have the following in place:
●	An AWS account
●	Terraform - This tutorial will use Terraform v1.4.2 on an Ubuntu Linux machine.
●	A code editor - Make sure you have a code editor that can support HCL (Terraform language). Hint: Try out Visual Studio (VS) Code.
Steps to launch multiple EC2 Instances using Terraform Configuration files:
Step 1:Open the terminal on Visual Studio code and create a folder named terraform-ec2-demo in the home directory and then change(cd) the working directory to that folder.
This folder will contain all the configuration files you'll be working with to launch ec2 instances.

 

Step 2: Now we need to set up our AWS User secret and access keys on our local machine. Also, this avoids exposing our aws credentials in the terraform code.
For this, you must have configured AWS CLI on your machine.


mudasir@linux:~/terraform-ec2-demo$ aws configure
AWS Access Key ID [None]: ***************XBKG
AWS Secret Access Key [None]: ***************************Csoz
Default region name [None]: us-east-1
Default output format [None]: 


Step 3: Preparing the Terraform Configuration files.

●	First of all, we will create a provider.tf file inside the ~/terraform-ec2-demo   directory.
●	The provider.tf file allows you to define the provider that will help you connect to the correct cloud services.
●	The below code will deploy the resources in the 'us-east-1' region.
●	'aws' is the name of the provider.
 

Now in order to let Terraform know about the added provider we need to run terraform init command to initialize the plugins and providers which are required to work with AWS resources that need to be provisioned.
After the command runs successfully you will see a message displayed on the Terminal stating: Terraform has been successfully initialized.

 

We can also run terraform validate command to validate the code in the providers.tf file.

 

Now let's create another file named ec2.tf that will define all the resources you wish to launch or manage with terraform.
Open the editor and copy-paste the below configuration into the ec2.tf inside the ~/terraform-ec2-demo directory.

 

Lets’s go through the various terms used in the above code:

●	aws_instance : is used to create the EC2 instances in the AWS console
●	ami: Allows you to launch instances containing all the required softwares and operating systems. In our case, we are using Amazon Linux AMI, and can be copied from the AWS console under launch an instance wizard:
         
     


●	Instance_type: This allows you to Select an instance type that meets your computing, memory, networking, or storage needs.
●	count = 5 signifies that five resources of the same kind will be provisioned.
●	tags: Tags allow you to define the specific resource with a label, which is further beneficial for cost calculations.

Step 4: Running Terraform commands to Launch multiple AWS EC2 instances.
●	Since we have already applied terraform init command to initialize the plugins and providers, so our 2nd command would be Terraform plan command. This gives us an overview of which resources will be provisioned in your infrastructure.

                              terraform plan

●	The terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.
●	The below output shows that Terraform will perform the following actions such as creating resource -aws_instance with the mentioned ami and so on and so forth.
●	At the end of the  output you would see something like this:
                             Plan: 5 to add, 0 to change, 0 to destroy

 


●	Finally, to launch multiple instances in the AWS console, we will run the terraform apply command.
●	The terraform apply command executes the actions proposed in a Terraform plan.
●	Terraform apply command reads all the code in the configuration file such as ec2.tf and then uses the provider in provider.tf file, it connects to the AWS account and launches the ec2 instances.

 

As seen in the above output five resources have been successfully added.

Step 5:Verifying the AWS EC2 instances on AWS Console:
●	Login to your AWS account. After you log in to the AWS console go to the  EC2 dashboard and check the instances(running) section as shown below:
 

You can also view the detailed view of all the five Instances such as Name, Instance ID, Instance type, and AZ.
 

Destroy
The terraform destroy command terminates resources managed by your Terraform project. This command is the inverse of terraform apply in that it terminates all the resources specified in your Terraform state. It does not destroy resources running elsewhere that are not managed by the current Terraform project.
Conclusion
In this tutorial, we learned how to launch multiple AWS EC2 instances using Terraform and terraform count functionality.

Thanks

