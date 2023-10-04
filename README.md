Create the database used by the RTE system.

# Installation and Setup
1. If you have access to this project you most probably have done [Installation, Setup and Environment Configuration](https://brightedgeeservices.atlassian.net/wiki/spaces/DE/overview).  If not, follow these steps first.
1. Set environment variables in IDE and virtual environment
    1. Local Dvelopment environment
        1. Add to the `%SCRIPTS_DIR%\venv_rte-db_setup_custom.bat` file.
            ```
            SET MYSQL_DB_NAME=rte_01
            SET MYSQL_HOST=localhost
            SET MYSQL_INSTALLER_PWD=N0tS0S3curePassw0rd
            SET MYSQL_INSTALLER_USERID=rtinstall
            SET MYSQL_PWD=N0tS0S3curePassw0rd
            SET MYSQL_ROOT_PWD=%MYSQL_PWD%
           ```
        1. Add to the pytest environment vairaibles in your IDE.  In PyCharm you will have to add it fear each and every test.
            ```
            MYSQL_DB_NAME=rte_01
            MYSQL_HOST=localhost
            MYSQL_INSTALLER_PWD=N0tS0S3curePassw0rd
            MYSQL_INSTALLER_USERID=rtinstall
            MYSQL_PWD=N0tS0S3curePassw0rd
            MYSQL_ROOT_PWD=%MYSQL_PWD%
            MYSQL_TCP_PORT_RTE=50001
            PROJECT_DIR=%PROJECTS_BASE_DIR%\RTE\rte-db
           ``` 
    1. Quality Assurance Environment
    1. Production Environment 
   
1. In a command window:
    ```commandline
    vi rte-db
    ```
