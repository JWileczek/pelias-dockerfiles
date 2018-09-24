FROM pelias/baseimage

RUN git clone https://github.com/pelias/schema.git /code/pelias/schema

WORKDIR /code/pelias/schema

RUN git checkout es5-compat-new

# install npm dependencies
RUN npm install

