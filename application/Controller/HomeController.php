<?php

/**
 * CodeMommy Mirrors.mom
 * @author  Candison November <www.kandisheng.com>
 */

namespace Controller;

use CodeMommy\WebPHP\Config;

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
        $this->option['title'] = '';
        $this->option['keywords'] = '';
        $this->option['description'] = '';
        $this->data['projects'] = Config::get('project');
        return $this->template('home/index');
    }

    /**
     * @return bool
     */
    public function about()
    {
        $this->option['title'] = 'About Mirrors.mom';
        $this->option['keywords'] = 'About Mirrors.mom,';
        $this->option['description'] = 'About Mirrors.mom.';
        return $this->template('home/about');
    }
}