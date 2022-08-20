---
extends: _layouts.post
title: Doctrine entities in Twig templates
author: Cristian Radulescu
description: In a Symfony2 project, Doctrine entities can be used inside Twig templateswith the help of Twig extensions
date: 2013-01-30
section: content
categories: []
---
In a Symfony2 project, Doctrine entities can be used inside Twig templates with the help of Twig extensions.

The example works with the standard Symfony2 installation and the AcmeDemoBundle, and it is supposed to add a set of links on one of the demo pages. Each link represents a color, while the HEX code for that color is displayed when the link is clicked. The colors are retrieved from the database.

The example is using Twig functions, but an alternative which is using global variables is also presented.

### The Doctrine entity:

```php
// src/Acme/DemoBundle/Entity/Color.php
namespace Acme\DemoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
  * @ORM\Entity
  * @ORM\Table(name="color")
  */
class Color
{
  /**
    * @ORM\Id
    * @ORM\Column(type="integer")
    * @ORM\GeneratedValue(strategy="AUTO")
    */
  protected $id;

  /**
    * @ORM\Column(type="string", length=100)
    */
  protected $name;

  /**
    * @ORM\Column(type="string", length=8)
    */
  protected $hex;

  /**
    * Get id
    *
    * @return integer
    */
  public function getId()
  {
    return $this->id;
  }

  /**
    * Set name
    *
    * @param string $name
    * @return Color
    */
  public function setName($name)
  {
    $this->name = $name;

    return $this;
  }

  /**
    * Get name
    *
    * @return string
    */
  public function getName()
  {
    return $this->name;
  }

  /**
    * Set hex
    *
    * @param string $hex
    * @return Color
    */
  public function setHex($hex)
  {
    $this->hex = $hex;

    return $this;
  }

  /**
    * Get hex
    *
    * @return string
    */
  public function getHex()
  {
    return $this->hex;
  }
}
``` 

This entity has a basic structure which should store the name and HEX code for a color.

### The Twig extension:

```php 
// src/Acme/DemoBundle/Twig/Extension/ColorExtension.php
namespace Acme\DemoBundle\Twig\Extension;

/**
  * Custom Twig extension used to retrieve the colors.
  */
class ColorExtension extends \Twig_Extension
{
  /**
    * @var EntityManager
    */
  protected $em;

  public function __construct($em)
  {
    $this->em = $em;
  }

  public function getName()
  {
    return 'color_extension';
  }

  public function getFunctions()
  {
    return array(
      'get_colors' => new \Twig_Function_Method($this, 'getColors')
    );
  }

  public function getColors()
  {
    return $this->em->getRepository('AcmeDemoBundle:Color')->findAll();
  }
}
``` 

The following list contains the most important remarks related to the Twig extension:
* The string returned by the "getName" &nbsp;method - "color_extension" will be used to register the extension;
* The "getColors" method is the one which returns the entities, using the EntityManager;
* In order to have access to the EntityManager, the Twig extension needs to be registered by specifying that the EntityManager service (identified as "doctrine.orm.entity_manager") will be passed as argument;
* The key "get_colors" from the array returned by the "getFunctions" method is the actual Twig function name which needs to be called in the Twig template to return the entities.

### Twig extension registration:
In order to register the Twig extension the following piece of code needs to be added to src/Acme/DemoBundle/Resources/config/services.xml:

```xml 
<service id="twig.extension.acme.demo_bundle.color_extension" class="Acme\DemoBundle\Twig\Extension\ColorExtension">
  <tag name="twig.extension" />
  <argument type="service" id="doctrine.orm.entity_manager" />
</service>
``` 

As previously mentioned, the "color_extension" string is used in the service id and the EntityManager service is sent as parameter for the Twig extension.

Everything should be set by now, the only thing that needs to be done is to call the "get_colors" function inside a Twig template. Here's an example:

```html 
{% set colors = get_colors() 
{% for color in colors 
  <a href="javascript:alert('{{color.hex}}'); return false;">{{color.name}}</a>
{% endfor 
``` 

### The global variables alternative.
Update the Twig extension (src/Acme/DemoBundle/Twig/Extension/ColorExtension.php) with the following code:

```php 
public function getGlobals()
{
  return array('colors' => $this->getColors());
}
``` 

This means that the "colors" key will become a global variable and can be used in a Twig template.

```html 
{% for color in colors %}
  <a href="javascript:alert('{{color.hex}}'); return false;">{{color.name}}</a>
{% endfor %}
``` 
