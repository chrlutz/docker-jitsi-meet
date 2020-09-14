# About this fork

This fork is aimed as a proof of concept to show how we could put an
additional docker-container running apache httpd on top of the
container stack, to use httpd's auth features.

At the moment of this writing, there is no solution for Single Sign On
provided by the jitsi maintainers. Another issue is, that the display-name
in Jitsi could always be edited by the user and we want to prevent that for
authorized users in order to ensure there are real names shown in the meeting
room. With this approach, both issues should be addressed:

The idea is to use httpd's auth features (which e.g. also contains kerberos/SAML
SSO support) in order to sign-in on jitsi. For each successfully logged in
user & meeting-room combination, a JWT-token is automaticall created and injected to
the Jitsi-URL. Jitsi has the ability to prevent editing of display-name for
JWT authorized users, so our user could no longer adjust it's display name

Restriction: The display name needs to be derived from the information we get from 
Apache httpd, which is in this case just the uniq "user-id" and not the prettier
natural form of the name.

The setup in this repository demonstrates this idea using httpd's basic auth.
Look at the file my-htpasswd to see the names of the example users. The corresponding
passwords are equal to the user names.

## Installation-Instruction for this poc

very similar to the original repo:

* `cp env.example .env`
* `./gen-passwords.sh`
* `docker-compose build; docker-compose up -d;` # creates the CONFIG-folder (as configured in .env)
* `./my-adjust-config.sh` # config adjustments for our jwt usage
* `docker-compose build; docker-compose stop; docker-compose rm -f; docker-compose up -d;` # rebuid & restart


Installation
============

# Jitsi Meet on Docker

![](resources/jitsi-docker.png)

[Jitsi](https://jitsi.org/) is a set of Open Source projects that allows you to easily build and deploy secure videoconferencing solutions.

[Jitsi Meet](https://jitsi.org/jitsi-meet/) is a fully encrypted, 100% Open Source video conferencing solution that you can use all day, every day, for free — with no account needed.

This repository contains the necessary tools to run a Jitsi Meet stack on [Docker](https://www.docker.com) using [Docker Compose](https://docs.docker.com/compose/).

## Installation

The installation manual is available [here](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-docker).

## TODO

* Support container replicas (where applicable).
* TURN server.

