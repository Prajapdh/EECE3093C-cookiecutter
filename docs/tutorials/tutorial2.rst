.. _tutorial2:

==================================
Create a Cookiecutter From Scratch
==================================

In this tutorial, we will walk through the process of creating a Cookiecutter template named cookiecutter-website-simple. This template will be used to generate simple, bare-bones websites.


Step 1: Name Your Cookiecutter
------------------------------

Create the directory for your cookiecutter and cd into it:

.. code-block:: bash

    $ mkdir cookiecutter-website-simple
    $ cd cookiecutter-website-simple/

Step 2: Create cookiecutter.json
----------------------------------

`cookiecutter.json` is a JSON file that contains fields which can be referenced in the cookiecutter template. For each, default value is defined and user will be prompted for input during cookiecutter execution. Only mandatory field is `project_slug` and it should comply with package naming conventions defined in `PEP8 Naming Conventions <https://www.python.org/dev/peps/pep-0008/#package-and-module-names>`_ .

.. code-block:: json

    {
      "project_name": "Cookiecutter Website Simple",
      "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_') }}",
      "author": "Anonymous"
    }


Step 3: Create project_slug Directory
---------------------------------------

Create a directory called `{{ cookiecutter.repo_name }}`.

This value will be replaced with the repository name of projects generated from this Cookiecutter template. Note: If you are using this template to create a GitHub repository, the repository name will typically match the repo_name. However, if you are not using this template specifically for GitHub, or if you want to customize the repository name separately, you can replace repo_name with your desired repository name.
Some templates have a prompt for "project_slug", "project_name", "repo_name", or a combination of these. Note: All these essentially expect the same repository name. The prompts asked to you are only a reflection of how individual templates were set up.

Step 4: Create index.html
--------------------------

Inside of `{{ cookiecutter.repo_name }}`, create `index.html` with following content:

.. code-block:: html

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <title>{{ cookiecutter.project_name }}</title>
        </head>

        <body>
            <h1>{{ cookiecutter.project_name }}</h1>
            <p>by {{ cookiecutter.author }}</p>
        </body>
    </html>

Step 5: Pack cookiecutter into ZIP
----------------------------------
There are many ways to run Cookiecutter templates, and they are described in details in `Usage chapter <https://cookiecutter.readthedocs.io/en/latest/usage.html#grab-a-cookiecutter-template>`_. In this tutorial we are going to ZIP cookiecutter and then run it for testing.

By running following command `cookiecutter.zip` will get generated which can be used to run cookiecutter. Script will generate `cookiecutter.zip` ZIP file and echo full path to the file.

.. code-block:: bash

   $ (SOURCE_DIR=$(basename $PWD) ZIP=cookiecutter.zip && # Set variables
   pushd .. && # Set parent directory as working directory
   zip -r $ZIP $SOURCE_DIR --exclude $SOURCE_DIR/$ZIP --quiet && # ZIP cookiecutter
   mv $ZIP $SOURCE_DIR/$ZIP && # Move ZIP to original directory
   popd && # Restore original work directory
   echo  "Cookiecutter full path: $PWD/$ZIP")

Step 6: Run cookiecutter
------------------------
Set your work directory to whatever directory you would like to run cookiecutter at. Use cookiecutter full path and run the following command:

.. code-block:: bash

   $ cookiecutter <replace with Cookiecutter full path>

You can expect similar output:

.. code-block:: bash

   $ cookiecutter /Users/admin/cookiecutter-website-simple/cookiecutter.zip
   project_name [Cookiecutter Website Simple]: Test web
   project_slug [test_web]:
   author [Anonymous]: Cookiecutter Developer

Resulting directory should be inside your work directory with a name that matches `project_slug` you defined. Inside that directory there should be `index.html` with generated source:

.. code-block:: html

    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
            <title>Test web</title>
        </head>

        <body>
            <h1>Test web</h1>
            <p>by Cookiecutter Developer</p>
        </body>
    </html>
