One Album A Day
==================

Since I've been using Google Music Unlimited I've been wanting to listen to a new album each day, picking it from the Suggested albums. I also wanted to improve my Rails-fu, testing out Rails 4 and introducing TDD in my developer habits. This simple project (as simple as it gets, so far it's just one model, authentication aside) keeps track of the album of the day, with the basic CRUD and some nifty styling. The album artworks are retrieved with the Deezer API. I might endup adding other sources in the future.

Dependencies
--------------------
Ruby 2
Rails 4
Sass
Compass
Haml
RSpec
Capybara

Testing suite
--------------------
I'm using RSpec for functional tests and Capybara coupled with Poltergeist for integration testing.
Remember to install phantomjs to run the tests:
```brew install phantomjs```
Then
```bundle exec rspec```

MIT License
--------------------
	Copyright (c) 2013 Andrea Mazzini. All rights reserved.

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the "Software"),
	to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.