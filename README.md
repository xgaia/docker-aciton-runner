# docker-action-runner

## Configure

Copy environment template file

```bash
cp env.template .env
```

Edit it

| Variable       | description                                                | example                         |
| -------------- | ---------------------------------------------------------- | ------------------------------- |
| `ORGANIZATION` | The GitHub organisation (username/repo)                    | `xgaia/myrepo`                  |
| `ACTION_TOKEN` | The GitHub Action token, get it during runner registration | `XXXXXXXXXXXXXXXXXXXXXXXXXXXXX` |
| `LABELS`       | Labels for the runner (optional, comma separated)          | `docker,foo`                    |

## Run

```bash
docker-compose up -d
```
