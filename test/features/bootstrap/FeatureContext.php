<?php

use Drupal\DKANExtension\Context\RawDKANContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDKANContext {

  /**
   * @Given I enter :schema into the JSONEditor
   */
  public function iEnterATestSchemaIntoTheJsoneditor($schema)
  {
    $selector = '#field-describedby-schema-add-more-wrapper';
    // Does the ace_editor exist in the dom?
    if (is_array($this->getSession()->evaluateScript("document.querySelector('$selector .ace_content');"))) {
      // Add the supplied schema into the dictionary field
      $this->getSession()->executeScript("document.querySelector('$selector').jsoneditor.set('$schema');");
    } else {
      throw new \Exception("jsoneditor not displayed");
    }
  }

}
