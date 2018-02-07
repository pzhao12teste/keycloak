#!/bin/bash -e

if [ $1 == "old" ]; then
    mvn test -B -f testsuite/integration
    mvn test -B -f testsuite/jetty
    mvn test -B -f testsuite/tomcat6
    mvn test -B -f testsuite/tomcat7
    mvn test -B -f testsuite/tomcat8
fi

if [ $1 == "group1" ]; then
    cd testsuite/integration-arquillian/tests/base
    mvn test -B -Dtest=org.keycloak.testsuite.ad*.**.*Test
fi

if [ $1 == "group2" ]; then
    cd testsuite/integration-arquillian/tests/base
    mvn test -B -Dtest=org.keycloak.testsuite.ac*.**.*Test,org.keycloak.testsuite.b*.**.*Test,org.keycloak.testsuite.cli*.**.*Test,org.keycloak.testsuite.co*.**.*Test
fi

if [ $1 == "group3" ]; then
    cd testsuite/integration-arquillian/tests/base
    mvn test -B -Dtest=org.keycloak.testsuite.d*.**.*Test,org.keycloak.testsuite.e*.**.*Test,org.keycloak.testsuite.f*.**.*Test,org.keycloak.testsuite.i*.**.*Test
fi

if [ $1 == "group4" ]; then
    cd testsuite/integration-arquillian/tests/base
    mvn test -B -Dtest=org.keycloak.testsuite.k*.**.*Test,org.keycloak.testsuite.m*.**.*Test,org.keycloak.testsuite.o*.**.*Test
fi

if [ $1 == "adapter" ]; then
    cd testsuite/integration-arquillian/tests/other/adapters
    mvn test -B
fi

if [ $1 == "console" ]; then
    cd testsuite/integration-arquillian/tests/other/console
    mvn test -B
fi

