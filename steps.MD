# MKDocs

https://github.com/athackst/mkdocs-simple-plugin
https://www.althack.dev/mkdocs-simple-plugin/latest/mkdocs_simple_plugin/plugin/


pip install mkdocs-simple-plugin

pip install mkdocs-material

mkdocs build
mkdocs gh-deploy
mkdocs serve

https://nikitaalexandrov3.github.io/ai-on-gke/infrastructure/


# Read the docs
 - connect repo
 - add readthedocs.yaml config
 - add requirements.txt with required plugins
 https://ai-on-gke.readthedocs.io/en/latest/tutorials-and-examples/inference-servers/maxdiffusion/#add-logging-health-check

 https://app.readthedocs.org/dashboard/

 docker build -t docsy .


# App Engine
Create app.yaml file

gcloud app deploy --project='double-freehold-445112-b1'
gcloud app browse --project=double-freehold-445112-b1

https://double-freehold-445112-b1.uc.r.appspot.com/


# Hugo + Docsy
brew install hugo
brew install go
brew install gcc
CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest
git clone https://github.com/google/docsy-example.git
hugo server