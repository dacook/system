Tried signing my git commits, but can't seem to get it to work.

https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/telling-git-about-your-signing-key

```
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
gpg --armor --export 4164EF84B4DD3F53 | pbcopy
# added to GitHub
```

It sounds like git should automatically pick it up based on email address. But it didn't 
```
git ci -a -m "update todo"
git show --format:raw
# no key
```
So I tried adding it manually
```
git config --global user.signingkey 4164EF84B4DD3F53
```
But still no key in the commit. 

I give up.
