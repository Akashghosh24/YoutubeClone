Build and Deploy a Modern YouTube Clone Application in React JS with Material UI 5

This Demo is used to create a Youtube Clone that will just have an interface different from youtube however it will redirect the videos and play like usual. 

The Source Code is written in Java Script. Hence we will build a pipeline that builds the Java Script and deploys the artifact 
to App Services.
Note: The Agent Machine/ Local Machine where build will be done should contain Node JS and NPM latest version. Also if using ubuntu , make sure it's 22.04(latest).
Please note: Not all Ubuntu and Node JS versions are compatible , therefore check the version of Node JS and Ubuntu before running.

Information about React JS and the App Building.
We need to understand the React JS application directory structure.
my-react-app
├── README.md
├── node_modules
├── package.json
├── .gitignore
├── public
└── src

1. To Build the React JS app, we need package.json as it contains dependencies that will create node_modules directory.
2. Then We run npm install: Installs the dependencies listed in package.json using npm. This creates a node_modules directory with all the dependencies.
3. Then we run npm run build -Builds the React application

So First we will perform the Local build and perform the same via CI-CD.
Local Build:
clone the repository locally:
git clone https://github.com/Akashghosh24/YoutubeClone.git

#Navigate into the directory where package.json is present
cd YoutubeClone

npm install
Now run the build:
npm run build


This will create a folder name build which will contain the build file

to Host it locally, run:
 npm install -g serve
 serve -s build

This will host the website on local port 3000. Make sure NSG allows if running on VM. Access the website as
http://<PublicIP of LinuxVM>:3000

Now the same thing we need to do on Azure DevOps pipeline via CI-CD

Infra Deployment:

To Perform the Deployment We need:

1. App Service. Once App Service is created , create two environment variables > App Settings > 
WEBSITE_DYNAMIC_CACHE=0
WEBSITE_LOCAL_CACHE_OPTION=never

2. Self Hosted Agent- Running Linux Ubuntu 22 and NPM and Node JS latest 
3. Service Connection between Azure Subscription and Azure Devops with Name - az-script-service-principal

To Build Pipeline we will use YAML pipeline file.


Now Deploy the Infrastructure using the infra.sh file.
Make Sure the Self Hosted Agent has dependencies Installed Node JS is installed.

Login to Azure Devops.
Create New Project
Clone the Repository in Azure Repos> Azure Repos > Import Repository

Once Repository is created Make sure, Agent Pool Machine and Service Connections are in Place before we create Pipeline.
To Create Pipeline. Pipeline >New Pipeline> 
Where is your code > Azure Repos
Select the Repository
It will automatically select configure the pipelien from the YAML file.
Review Your Pipeline and run.
Once All the Pipeline codes are run, then Youtube clone will be available at the App Service URL

