# CLOSED in favour of https://github.com/ThePrimeagen/ts-rust-zig-deez

See: https://github.com/novusnota/monkey-deez/issues/7#issue-1738235403

---

## Contributing

### @ThePrimeagen and @tjdevries

They maintain the repo with their own implementations of Monkey interpreters in TS, Rust, Zig and OCaml languages here: [repo](https://github.com/ThePrimeagen/ts-rust-zig-deez).

And this is a community-maintained repo, meaning that you can add your own implementations in anything you can make to work.

### Participating

For every language there would be one collective contribution folder (say, for TypeScript — `impl/typescript/`). It would be maintained NOT by any particular Code Owner, but by PRs and collective suggestions. @novusnota will be reviewing PRs daily, from 18:00 to 20:00 UTC+0.

If you wish to create your own implementation and maintain it yourself, do the following:

1. Start by `cp -r .github/LANG_TEMPLATE/ impl/langname-username`. Say, your langname is `C` and your username is `boreddad`, then the command is `cp -r .github/LANG_TEMPLATE/ impl/c-boreddad`.
2. Add your implementation: at the very least add the lexer.
3. Add yourself to CODEOWNERS file. For example: `/impl/c-boreddad/  @boreddad`.
4. Make a PR to this repo!

After that you'll be granted write access by @novusnota, but only to your implementation folder.

### Template structure

The folder `.github/LANG_TEMPLATE/` comes with:

```bash
├── .gitignore  # ignores OS-specific things and a bit more
├── Dockerfile  # for Docker builds
└── Makefile    # convenient commands runner (make <cmd>) under *NIX systems
```

There's also a convenient commands runner (`.\make.cmd <cmd>`) under Windows in the root of .github/, but it's completely optional and is only there if you really want to use it.

## Running

### Command names

General:

- `help` — outputs all the commands available, same as running the `make` or `make.cmd` without arguments

Without Docker:

- `clean`
- `fmt`
- `lint`
- `test` — should run all the available tests
- `ready` — should run fmt, lint ant test

Docker:

- `docker-build` — makes the build
- `docker-ready` — runs the build image and executes `fmt`, `lint`, `test` commands inside


### *NIX (Linux, macOS, etc.)

This assumes there is a `Makefile` in the root of the language directory.

```bash
# without docker
make clean
make fmt
make lint
make test
make ready  # runs fmt, lint and test

# docker, assuming there's a Dockerfile
make docker-build  # makes the build
make docker-ready  # runs fmt, lint and test in the built image
```

### Windows

This assumes there is a `make.cmd` (from `.github/make.cmd`) in the root of the language directory.

```batchfile
@rem without docker
.\make.cmd clean
.\make.cmd fmt
.\make.cmd lint
.\make.cmd test
.\make.cmd ready  @rem runs fmt, lint and test

@rem docker, assuming there's a Dockerfile
.\make.cmd docker-build  @rem makes the build
.\make.cmd docker-ready  @rem runs fmt, lint and test in the built image
```
