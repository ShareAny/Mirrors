<?php

/**
 * CodeMommy CacheDream
 * @author Candison November <www.kandisheng.com>
 */

namespace Base;

use BaconQrCode\Common\ErrorCorrectionLevel;
use BaconQrCode\Renderer\Image\Png;
use BaconQrCode\Writer;

/**
 * Class QRCode
 * @package Core
 */
class QRCode extends Png
{
    private $text = null;

    /**
     * QRCode constructor.
     */
    public function __construct()
    {
        $this->text = 'Hello World';
        $this->setWidth(500);
        $this->setHeight(500);
        $this->setMargin(0);
    }

    /**
     * @param $text
     *
     * @return void
     */
    public function setText($text)
    {
        $this->text = $text;
    }

    /**
     * @param void
     *
     * @return void
     */
    public function showInBrowser()
    {
        $writer = new Writer($this);
        $writer->writeString($this->text, 'UTF-8', ErrorCorrectionLevel::L);
        $imageStream = $this->getByteStream();
        header('Content-type: image/png');
        echo $imageStream;
    }

    /**
     * @param $filename
     *
     * @return void
     */
    public function saveToFile($filename)
    {
        $writer = new Writer($this);
        $writer->writeFile($this->text, $filename, 'UTF-8', ErrorCorrectionLevel::L);
    }
}