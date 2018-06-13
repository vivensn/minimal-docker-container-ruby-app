# minimal-docker-container-ruby-app
Build a Minimal Docker Container for a Ruby app
* Part One: Application
   * The application is very simple, it prints a greeting for the person with the entered name
* Part Two: Creating the Docker Image
   * Add an 'onbuild' Dockerfile to use the official Docker image for Ruby
   * Note: Using official Docker images for Ruby is great and all, but there’s one very big drawback. They are HUGE. The Ruby image is roughly 1.6 GB.
   
* Part Three: How About Create a Tiny Ruby Docker Image?
    * Build a small image using `Alpine Linux`, a very tiny Linux distribution. It’s built on `BusyBox`, and it includes only the minimum files needed to boot and run the operating system.
    * `Alpine Linux` uses its own package manager called `apk`
    * Updating the repositories is done via `apk update`, while upgrading the installed packages is done via `apk upgrade`.
    * Itis good to always have a couple of useful binaries installed: `curl`, `wget`, and `bash`. Installation of packages in Alpine Linux is done with the `apk add <package-name>` command.
    * Install the latest `Ruby` distribution and `ruby-bundler`. The Ruby distribution is the language itself, while ruby-bundler is Bundler wrapped in an apk package.
    * Include our tiny Checker application in this container, so that every time we create a new container it’s available to us. First, we need to create a new directory and copy the files of the application in the directory. The last step is to bundle the application.
* Part Four: Ready to launch
    * Add the `CMD` instruction to provide a default command that will launch our application - `CMD ["executable", "param"]`
    * Eg: `CMD ["ruby","greeting.rb"]`
* Part Five: Build the image
    * Command: `docker build -t <your_user_name>/<app name> .`
    * Eg: `docker build -t vivens/greetingapp .`
* Part Six: Run the application in the docker container
    * Use the `docker run` command
    * Eg: `docker run vivens/greetingapp`
* Conclusion
    * This is really cool; for more information checkout the [CODESHIP blog post](https://blog.codeship.com/build-minimal-docker-container-ruby-apps/) that I used as a reference.

    
    
    

   

