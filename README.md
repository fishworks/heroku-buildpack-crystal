# Heroku Buildpack: Crystal

This is an unofficial [Heroku buildpack](https://devcenter.heroku.com/articles/buildpacks) for Crystal apps, powered by [shards](https://github.com/crystal-lang/shards), the dependency manager for Crystal.

There are no restrictions around what software can be used (as long as it can be compiled using `shards build heroku`). Web processes must bind to `$PORT`, and only the HTTP protocol is permitted for incoming connections.

In your `shard.yml`, you must specify a `heroku` target for this buildpack to build:

```
$ cat shard.yml
name: example-crystal
version: 0.1.0
authors:
  - Matthew Fisher <mfisher@fishworks.io>
targets:
  heroku:
    main: src/main.cr
crystal: 0.20.1
license: Apache-2.0
```

For an example application, see the [example-crystal app](https://github.com/fishworks/example-crystal).

## See it in Action

Deploying a Crystal application couldn't be easier:

```
$ ls
LICENSE   README.md shard.yml src
$ heroku create --buildpack https://github.com/fishworks/heroku-buildpack-crystal
$ git push heroku master
...
-----> Crystal app detected
-----> Installing crystal-0.20.1
-----> Installing shards-0.7.1
-----> Running `shards build heroku`
       Building: heroku
-----> Discovering process types
       Procfile declares types -> (none)
```

A `shard.yml` file must be present at the root of your application's repository.

## Crystal Versions

Specific versions of the Crystal runtime can be specified by setting the `CRYSTAL_VERSION` environment variable:

```
$ heroku config:set CRYSTAL_VERSION=0.20.1
```

Here is a list of supported Crystal versions:

 - 0.8.*
 - 0.9.*
 - 0.10.*
 - 0.11.*
 - 0.12.*
 - 0.13.*
 - 0.14.*
 - 0.15.*
 - 0.16.*
 - 0.17.*
 - 0.18.*
 - 0.19.*
 - 0.20.*

You can also specify the shards version by setting SHARDS_VERSION, e.g.

```
$ heroku config:set SHARDS_VERSION=0.7.1
```

## Testing

To test a change to this buildpack, write a unit test in `tests/run` that asserts your change and
run `make test` to ensure the change works as intended and does not break backwards compatibility.
