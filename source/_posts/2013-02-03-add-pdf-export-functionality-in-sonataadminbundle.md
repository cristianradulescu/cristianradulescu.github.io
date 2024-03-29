---
extends: _layouts.post
title: Add PDF export functionality in SonataAdminBundle
author: Cristian Radulescu
description: By default SonataAdminBundle doesn t come with a PDF export functionality
date: 2013-02-03
section: content
categories: []
---
By default SonataAdminBundle doesn't come with a PDF export functionality. Since this is a nice feature to have in your application here's a way to add PDF export to the CRUD pages.

The example works with the standard Symfony2 installation and the AcmeDemoBundle. The PDF will be generated using [KnpSnappyBundle](https://github.com/KnpLabs/KnpSnappyBundle) (the installation process is not covered here).

### The Doctrine Entity:
See [Doctrine entities in Twig templates]({{ site.baseurl }}{% post_url 2013-01-30-doctrine-entities-in-twig-templates )

### The Color Admin class:
```php
// src/Acme/DemoBundle/Admin/ColorAdmin.php
namespace Acme\DemoBundle\Admin;

  use Sonata\AdminBundle\Admin\Admin;
  use Sonata\AdminBundle\Datagrid\ListMapper;
  use Sonata\AdminBundle\Datagrid\DatagridMapper;
  use Sonata\AdminBundle\Validator\ErrorElement;
  use Sonata\AdminBundle\Form\FormMapper;
  
  class ColorAdmin extends Admin
  {
    public $baseRouteName = 'color';
    public $baseRoutePattern = '/color';
  
    protected function configureFormFields(FormMapper $formMapper)
    {
      $formMapper
         ->add('name')
         ->add('hex');
    }
  
    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
      $datagridMapper
        ->add('name')
         ->add('hex');
    }
  
    protected function configureListFields(ListMapper $listMapper)
    {
      $listMapper
        ->addIdentifier('name')
        ->add('hex');
    }
  }
```

### Enable the PDF export link on list page
In order to add the PDF export option the "getExportFormats" method needs to be overridden in the ColorAdmin class:

```php 
public function getExportFormats()
{
  return array_merge(parent::getExportFormats(), array('pdf'));
}
```

The "pdf" options should now be displayed on the list page next to the default ones.

### Create custom service to handle PDF export
First the default export service (identified by "sonata.admin.exporter") needs to be overriden. Register the service in src/Acme/DemoBundle/Resources/config/services.xml and make it aware of the knpSnappyPdf. Also the template engine will be necessary.

```xml
<service id="sonata.admin.exporter" class="Acme\DemoBundle\Export\Exporter">
  <call method="setKnpSnappyPdf">
    <argument type="service" id="knp.snappy_pdf" />
  </call>
  <call method="setTemplateEngine">
    <argument type="service" id="templating" />
  </call>
</service>
``` 

Next extend the Sonata exporter class as defined in the overridden exporter service:

```php 
// src/Acme/DemoBundle/Export/Exporter.php
namespace Acme\DemoBundle\Export;

use Exporter\Source\SourceIteratorInterface;
use Symfony\Component\HttpFoundation\Response;
use Sonata\AdminBundle\Export\Exporter as BaseExporter;

class Exporter extends BaseExporter
{
  protected $knpSnappyPdf;
  protected $templateEngine;

  public function getResponse($format, $filename, SourceIteratorInterface $source)
  {
    if ('pdf' != $format) {
      return parent::getResponse($format, $filename, $source);
    }

    $html = $this->templateEngine->renderView('AcmeDemoBundle:Export:pdf.html.twig', array(
      'source' => $source
    ));
    $content = $this->knpSnappyPdf->getOutputFromHtml($html);

    return new Response($content, 200, array(
      'Content-Type' => 'application/pdf',
       'Content-Disposition' => sprintf('attachment; filename=%s', $filename)
    ));
  }

  public function setKnpSnappyPdf($service)
  {
    $this->knpSnappyPdf = $service;
  }

  public function setTemplateEngine($service)
  {
    $this->templateEngine = $service;
  }
}
``` 

The last step is to add the Twig template used to render the PDF content, as specified in the custom exporter service. For example:

```html 
<!-- src/Acme/DemoBundle/Resources/views/Export/pdf.html.pdf" -->
<table border="1">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>HEX</th>
  </tr>
  {% for elements in source 
    <tr>
      {% for element in elements %}
        <td>{{ element }}</td>
      {% endfor %}
    </tr>
  {% endfor 
</table>
``` 

Of course, there is room for improvement. You can do it "SonataAdmin" way with a custom PdfWriter class (similar with the built-in XlsWriter, CsvWriter or JsonWriter) to separate the PDF conversion code, instead of having the entire process in the custom Exporter class.
