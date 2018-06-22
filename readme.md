drone-github-webhook
========================


HAH. This repo is no longer necessary. This is how you do a drone webhook for github with token as a secret. The trick is you can apparently use the token as a password, and can rename it appropriately for the webhook plugin as such:
```
  notify:
    secrets:
      - source: github_token
        target: webhook_password
    image: plugins/webhook
    pull: true
    username: jacobrosenthal
    urls:
      - https://api.github.com/repos/${DRONE_REPO_OWNER}/${DRONE_REPO_NAME}/issues/${DRONE_PULL_REQUEST}/comments
    template: "file:/drone/src/template.json" #note this file needs to have /r/n not expanded line breaks
    when:
      status: [ success ]
    debug: true

```

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
