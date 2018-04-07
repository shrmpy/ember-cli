Gather ember-cli dependencies together into a image 
======

This starts with the Alpine tag of [Node](https://registry.hub.docker.com/_/node/) base image, and follows the install steps from
 [Ember-CLI](https://ember-cli.com/) 


Quickstart
------

Create a new application named `tutorial-quickstart` underneath the subdirectory called `test`:

```
    docker run --network=host -ti --rm -v $(pwd)/test:/app shrmpy/ember ember new tutorial-quickstart
```

Then start the dev server to browse it (localhost:4200):

```
    docker run --network=host -ti --rm -v $(pwd)/test:/app -w /app/tutorial-quickstart shrmpy/ember ember serve
```


Create a route for scientists:

```
    docker run --network=host -ti --rm -v $(pwd)/test:/app -w /app/tutorial-quickstart shrmpy/ember ember generate route scientists
```


Create a component for the people list:

```
    docker run --network=host -ti --rm -v $(pwd)/test:/app -w /app/tutorial-quickstart shrmpy/ember ember generate component people-list
```


