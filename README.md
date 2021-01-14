# jekyll-lazy-gist-embedding
Embed your [GitHub gists](https://docs.github.com/en/free-pro-team@latest/github/writing-on-github/creating-gists) into your Jekyll posts and pages, just by including the gist url.

Totally copied from https://github.com/takuti/jekyll-lazy-tweet-embedding and made to work with gists.

Just put a standard gist URL like https://gist.github.com/jaygooby/7e24a1e112ce3953812624b8be94e686 in your post, and it will expand into a gist embed.

Works with markdown and html posts.

## Usage
Copy `lazy_gist_embedding.rb` into the **_plugins** directory and Jekyll will automatically expand the gist into an embed.

Under the hood, it fetches the `.js` embed code, for instance https://gist.github.com/jaygooby/7e24a1e112ce3953812624b8be94e686 becomes https://gist.github.com/jaygooby/7e24a1e112ce3953812624b8be94e686.js and then is injected into your post with `<script>` tags.
