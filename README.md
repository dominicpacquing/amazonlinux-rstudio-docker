### Rstudio with Shiny docker image

Purpose of this image is to be used as test bed before creating actual AmazonLinux AMI

### Building the image

    docker build -t rstudio-local:1 . 

### Usage

Rstudio is exposed at 8787 while Shiny server is exposed at 3838

    docker run -p 3838:3838 -p 8787:8787 rstudio-local:1
    
 