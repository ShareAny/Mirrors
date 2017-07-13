<?php

/**
 * CodeMommy CacheDream
 * @author Candison November <www.kandisheng.com>
 */

namespace Controller;

use CodeMommy\ConfigPHP\Config;

/**
 * Class HomeController
 * @package Controller
 */
class HomeController extends BaseController
{
    /**
     * HomeController constructor.
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @return bool
     */
    public function index()
    {
        $this->data['projects'] = Config::get('project');
        return $this->template('home/index');
    }

    /**
     * @return bool
     */
    public function about()
    {
        return $this->template('home/about');
    }
}