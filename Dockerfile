FROM python:3.11-bullseye

WORKDIR /app

# Required for Validators #
RUN apt-get update && apt-get install -y jq npm 
RUN npm install pm2 -g && pm2 update
###########################

RUN git clone https://github.com/RogueTensor/bitagent_subnet

WORKDIR /app/bitagent_subnet

RUN python -m pip install -r requirements.txt
RUN python -m pip install -e .
RUN python -m pip uninstall uvloop -y # b/c it causes issues with threading/loops

