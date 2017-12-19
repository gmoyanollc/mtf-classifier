mtf-classifier
==============
The purpose of [mtf-classifier] (https://github.com/gmoyanollc/mtf-classifier) is to extract and organize conceptually related MIL-STD-6040 USMTF XML-MTF data components for re-use.

mtf-classifier produces a subset XML Schema file from MIL-STD-6040 USMTF XML-MTF message XML Schema files.

XSL3 Requirement
----------------
The mtf-classifier transformations implement XSLT 3.0 instructions, such as the xsl:copy attribute 'select', and capabilities.  

As of 2016-Jun Saxonica Saxon-EE is required to run mtf-classifier transformations, since Saxon-EE is the only Java XSL transformer implementing XSL 3.0 capabilities.  Saxon-EE is a paid license.

Documentation
-------------
More information is available in the documentation folder.

How to get started
------------------
1. [git-clone] (https://git-scm.com) this repository to a folder for projects:

        cd dev-project
        git clone https://github.com/gmoyanollc/mtf-classifier
    
    Expected result:
    
        .
        `-- mtf-classifier
            |-- documentation
			|   `-- css
			`-- src
    
2. Test the configuration for Ant and Saxon:   

        cd mtf-classifier
        ant test-config -lib [path-to-saxon-ee-jar-file]
        
    Expected result:
    
        ...
        BUILD SUCCESSFUL
        ...
        
3. Run and transform an XML Schema folder by providing its folder path as a value to the Ant Property 'xml-to-validate.dir':

    Example command-line:
      
      ant -Dmtf-6040.schema.main.dir=" [path-to-XML-MTF-message-schema-files] " -lib [path-to-saxon-ee-jar-file]
      
    Expected result:
    
        ...
        BUILD SUCCESSFUL
        ...
        
Feedback
--------
If you feel like the component is missing a feature or has a defect, contact me or create an [issue] (https://github.com/gmoyanollc/niem-conformance-validator/issues). When creating a new issue, please provide a comprehensive description of your concern. Especially for fixing bugs it is crucial that I can reproduce your problem. For this reason, entire debug logs, source or most preferably little demo projects attached to the issue are very much appreciated. Of course, patches are welcome, too.

https://github.com/gmoyanollc

To-Do
-----
 
 * implement the namespaces specified in mtfClassGraph.xml in the transformation instructions
 * redescribe mtfClassGraph.xml to contain the prefix for a class as an attribute 
 * classify*.xsl may be refactored into transformation instructions that support all classes
    * transformation parameter may direct the default and target namespace
    
_updated: 2016/06/06_
