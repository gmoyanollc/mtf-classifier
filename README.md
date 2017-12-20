**mtf-classifier** extracts USMTF message data components represented in MIL-STD-6040 XML-MTF XML Schema files.  

XML representations for the military messaging standard are organized conceptually into subset XML Schema files for increased portability and re-use.

XSL-3 Requirement
----------------
**mtf-classifier** implements [XSLT version 3] (https://www.w3.org/TR/xslt-30/) instructions to complete XML Schema transformations.  

[Saxonica] (https://www.saxonica.com) Saxon-EE may be required to run **mtf-classifier** transformations.

How to get started
------------------
1. [git-clone] (https://git-scm.com) this repository to a folder for projects.  

  * A requirement is the PKI-enabled [SoftwareForge] (https://software.forge.mil) [Forge Source Code Management Client] (https://software.forge.mil/sf/projects/git-gerrit):

    ```
      cd projects
      bash forgeSCMC.sh git clone -b mtf-classifier https://gmoyano@svn.forge.mil/gerrit/p/soi-messaging mtf-classifier
    ```
    Expected result:

    ```
      .
      `-- mtf-classifier
          |-- documentation
	      |   `-- css
	      `-- src
    ```
2. Test the configuration for Ant and Saxon: 

    ``` 
      cd mtf-classifier
      ant test-config -lib [path-to-saxon-ee-jar-file]
    ```
    Expected result:

    ```
      ...
      BUILD SUCCESSFUL
      ...
    ```    
3. Run and transform an XML Schema folder by providing its folder path as a value to the Ant Property 'xml-to-validate.dir':

    Example command-line:

    ```
      ant -Dmtf-6040.schema.main.dir=" [path-to-XML-MTF-message-schema-files] " -lib [path-to-saxon-ee-jar-file]
    ```
    Expected result:

    ```
      ...
      BUILD SUCCESSFUL
      ...
    ```

Feedback
--------
If you feel like the component is missing a feature or has a defect, contact me or create an [issue] (https://github.com/gmoyanollc/mtf-classifier/issues). 

When creating a new issue, please provide a comprehensive description of your concern. Especially for fixing bugs it is crucial that I can reproduce your problem. For this reason, entire debug logs, source or most preferably little demo projects attached to the issue are very much appreciated. Of course, patches are welcome, too.

To-Do
-----
 
 * implement the namespaces specified in mtfClassGraph.xml in the transformation instructions
 * redescribe mtfClassGraph.xml to contain the prefix for a class as an attribute 
 * classify*.xsl may be refactored into transformation instructions that support all classes
    * transformation parameter may direct the default and target namespace
    
Authoritative Sources 
---------------------
Entire work is maintained at [SoftwareForge] (https://software.forge.mil):
 
  * Project: [USMC - TSOA Development] (https://software.forge.mil/sf/projects/magtf_c2)
  * Git repository: [soi-messaging] (https://gmoyano@svn.forge.mil/gerrit/p/soi-messaging)
  * Branch: _mtf-classifier_
  
The [GitHub repository] (https://github.com/gmoyanollc/mtf-classifier) only exists for public information.

This work is derived from authoritative MIL-STD-6040 USMTF XML work maintained on Software Forge.mil at project [ MTF XML ]. A subset of the work is also on GitHub at [ Mil-OSS/MTFXML ] .

A version of the MIL-STD-6040 USMTF description and specification is available at US Department of Defense [Quick Search ASSIST] (http://quicksearch.dla.mil/qsDocDetails.aspx?ident_number=214270).

_updated: 2017/Dec_
_initial post: 2016/06/06_
[George Moyano] (https://onename.com/gmoyano)
