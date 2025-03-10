FROM public.ecr.aws/spacelift/runner-terraform:latest

WORKDIR /tmp

# Temporarily elevating permissions
USER root

RUN apk update && apk add aws-cli

# Back to the restricted "spacelift" user
USER spacelift
