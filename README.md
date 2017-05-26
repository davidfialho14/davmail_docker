# Davmail with Docker #

Repository containing the configuration files to build an image for the Davmail service

# Setup and Deployment Instructions #
_Running some of these commands may need to be run with sudo_

The setup is composed of the following steps:

1. Install docker engine (see [Install docker on Ubuntu 16.04](www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04))

1. Clone this project (requires **git** to be installed)

        git clone git@bitbucket.org:davidfialho/davmail_docker.git davmail

1. Build the image
      
        cd davmail
        docker build -t davmail .

1. Set the exchange server URL
    
        echo "URL=<EXCHANGE_URL>" > url
        
    The variable <EXCHANGE_URL> must be replaced with the actual URL.
        
        e.g. echo "URL=http://example.com/ews/exchange.asmx" > url
        
1. Create and run the container
    
    First make sure the runner.sh script is executable
         
        chmod +x runner.sh
    
    Then run the script
         
        ./runner.sh

# How To Modify the Exchange Server URL #
Modifying the exchange server URL is very simple, just edit the _url_ file next to the _runner.sh_ script. 

In the initial setup the command `echo "URL=<EXCHANGE_URL>" > url` was used to define the URL of the exchange server. Just replace this URL with the new URL. You can use any text editor to perform the modification or run the following command inside the project folder:

        sed -i "s|<OLD_URL>|<NEW_URL>|" url
        
After modifying the URL for the change to take effect just stop the current container and create a new one. This can be accomplished with following commands:

        docker stop davmail
        ./runner.sh


# Contacts #
If you run into any issues fill free to contact me by email at fialho.david@protonmail.com
