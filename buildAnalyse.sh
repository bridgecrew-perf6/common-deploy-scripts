#!/bin/bash

cd initial
export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain test --domain-owner ${{ secrets.AWS_ACCOUNT_ID }} --query authorizationToken --output text`
bash ./gradlew -Pbuild_target=SNAPSHOT clean build jacocoTestReport spotlessApply spotbugsMain
bash ./gradlew -Pbuild_target=SNAPSHOT sonarqube showSonarQubeLink --info