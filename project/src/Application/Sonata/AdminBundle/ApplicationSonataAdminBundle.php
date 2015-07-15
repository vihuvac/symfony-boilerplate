<?php

/**
 * This file is part of the <name> project.
 *
 * (c) <yourname> <youremail>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Application\Sonata\AdminBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

/**
 * @author <yourname> <youremail>
 */
class ApplicationSonataAdminBundle extends Bundle
{
    /**
     * {@inheritdoc}
     */
    public function getParent()
    {
        return "SonataAdminBundle";
    }
}
