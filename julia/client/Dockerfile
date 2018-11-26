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

COPY json_client.jl json_client.jl

# install package
RUN julia -e 'using Pkg;Pkg.add("HTTP")'
RUN julia -e 'using Pkg;Pkg.add("JSON")'

# server run
ENTRYPOINT ["julia","json_client.jl"]

