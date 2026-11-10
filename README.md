# service-code

A tiny Flask service for the DevOps CSK CI/CD workshop. Steps and hints:
https://github.com/kohanyirobert/csk-w10-cicd

| file | what it is |
|---|---|
| `app.py` | answers `GET /` with a greeting, on port 8080 |
| `test_app.py` | the tests |
| `pyproject.toml`, `uv.lock` | dependencies and the **version**, the image tag |
| `.github/workflows/pr.yml` | runs on pull requests: does nothing yet |
| `.github/workflows/main.yml` | runs on pushes to `main`: does nothing yet |

Missing, on purpose: the `Dockerfile`, and everything the workflows should do.

```bash
uv run python -m unittest -v   # the tests
uv run app.py                  # then: curl localhost:8080
uv version                     # the version
uv version --bump minor        # 1.0.0 -> 1.1.0
```
