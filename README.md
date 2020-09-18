# laravel-sampleapp
Laravel sample "Hello World" project with CI/CD pipeline.


Set up secrets in your workspace: 
GKE_PROJECT with the name of the project and 
GKE_SA_KEY with the Base64 encoded JSON service account key.

Change the values for the GKE_ZONE, GKE_CLUSTER, IMAGE, and DEPLOYMENT_NAME environment variables if needed in google.yml.

Change the values for the MYSQL_USER, MYSQL_DATABASE, MYSQL_PASSWORD, and MYSQL_ROOT_PASSWORD environment variables if needed in dockerfile.
