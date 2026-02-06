FROM rocker/rstudio:4.4.2

COPY clean_data.R /home/rstudio/clean_data.R
COPY renv.lock /home/rstudio/renv.lock
COPY renv /home/rstudio/renv

USER root
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"
RUN R -e "renv::restore()"
USER rstudio