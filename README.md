# Dokku Env Converter

A simple bash script to convert PHP `.env` file from package [vlucas/phpdotenv](https://github.com/vlucas/phpdotenv) to inlined variables for Dokku.

Basically, this script removes the comments (`#`) of the `.env` file, inlines it and adds `dokku config:set` to create the environement variables in Dokku.

## Installation

### Install globally

1. Add execution rights to the script:
    ```bash
    $ chmod +x dokku-env-converter.sh
    ```
2. Create an alias in your `.bash_profile` or in your `.zshrc` file:
    ```bash
    alias dokku-env-converter='~/path/to/dokku-env-converter/dokku-env-converter.sh'
    ```

## Example

### Go to your PHP repository that contains the `.env` file:

`.env` file example:

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=database_name
DB_USERNAME=root
DB_PASSWORD=root
```

### Launch script:

```bash
$ dokku-env-converter app_name
```

### Results:

```bash
dokku config:set app_name DB_CONNECTION=mysql DB_HOST=127.0.0.1 DB_PORT=3306 DB_DATABASE=database_name DB_USERNAME=root DB_PASSWORD=root
```

### Add environment variables in Dokku:

Then, just copy and paste the results in your Dokku server.