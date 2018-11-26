FROM julia:1.0

MAINTAINER AtsushiSakai

RUN apt-get update \
    && apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o DPkg::Options::="--force-confold" \
    && apt-get install -y \
	build-essential \
	wget \
	unzip \
	gfortran \
    #vim \
    && apt-get clean

COPY json_server.jl json_server.jl

# install package
RUN julia -e 'using Pkg;Pkg.add("HTTP")'
RUN julia -e 'using Pkg;Pkg.add("JSON")'

# open port
EXPOSE 8000

# server run
ENTRYPOINT ["julia","json_server.jl"]

