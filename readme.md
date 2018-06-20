drone-github-webhook
========================

I found the webhook impossible to configure, between trying to get the secret into the authorization header and then generating dynamic data, formatting it as json and sending it over to github I dont think that plugin works. It turns out escaping printf in awk in yaml via golang and handlebars is basically impossible.

Instead a one line curl script based on the [tutorial](http://readme.drone.io/plugins/creating-custom-plugins-bash/)

Usage
```Dockerfile
  notify:
    secrets: [ github_token ]
    image: jacobrosenthal/webhook
    pull: true
    url: https://api.github.com/repos/${DRONE_REPO_OWNER}/${DRONE_REPO_NAME}/issues/${DRONE_PULL_REQUEST}/comments
    json: "/drone/src/template.json"
    when:
      status: [ success ]
```
