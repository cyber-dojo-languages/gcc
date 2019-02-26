FROM gcc:latest
LABEL maintainer=jon@jaggersoft.com

# gcov format changed in gcc-8 so cant yet do [pip install gcovr]
RUN apt-get update \
 && apt-get install --yes python-pip \
 && pip install git+https://github.com/gcovr/gcovr.git
