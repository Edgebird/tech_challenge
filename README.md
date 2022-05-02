# Tech Challenge
This project utilizes docker and httpd/apache to display a single secure webpage with a defined html script. 

## How to Run
First make a clone of the github repository using 

'''
git clone https://github.com/Edgebird/tech_challenge.git
'''

After a local copy has been made. Navigate into the folder *tech_challenge*.

Once inside the folder run the following command.

'''
docker-compose up -d --build
'''

After the application has started enter [https://localhost:443](https://localhost:443)

## Why these products

### Docker
Docker was chosen as it is the container manager that I am most familiar with. By utilizing docker compose it will allow for the enviornment to instantiate with a single line. 

### Httpd/apache
Apache was selected as it is one of the most commonly used webservers currently. By being both opensource and a market leader it would be a safe and secure choice.
