Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303DF43164E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 12:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhJRKm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 06:42:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:2882 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229590AbhJRKmz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 06:42:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="208324571"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="208324571"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 03:40:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="489364092"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 03:40:37 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mcQ42-0001m6-75;
        Mon, 18 Oct 2021 13:40:18 +0300
Date:   Mon, 18 Oct 2021 13:40:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH v7 5/8] gpio: sim: new testing module
Message-ID: <YW1PEvTyqdhiRYR6@smile.fi.intel.com>
References: <20211008081739.26807-1-brgl@bgdev.pl>
 <20211008081739.26807-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008081739.26807-6-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 08, 2021 at 10:17:36AM +0200, Bartosz Golaszewski wrote:
> Implement a new, modern GPIO testing module controlled by configfs
> attributes instead of module parameters. The goal of this driver is
> to provide a replacement for gpio-mockup that will be easily extensible
> with new features and doesn't require reloading the module to change
> the setup.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> [Andy: Initialize attribute allocated on the heap]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> [Colin: Fix dereference of free'd pointer config]
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Some nit-picks below, up to you to address.

...

> +	ret = gpio_sim_setup_sysfs(chip);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

return gpio_sim_...(chip); ?

...

> +

Redundant empty line.

> +CONFIGFS_ATTR_RO(gpio_sim_config_, dev_name);

...

> +

Ditto.

> +CONFIGFS_ATTR_RO(gpio_sim_config_, chip_name);

...

> +

Ditto.

> +CONFIGFS_ATTR(gpio_sim_config_, label);

...

> +

Ditto.

> +CONFIGFS_ATTR(gpio_sim_config_, num_lines);

...

> +

Ditto.

> +CONFIGFS_ATTR(gpio_sim_config_, line_names);

...

> +	fwnode = fwnode_create_software_node(properties, NULL);
> +	if (IS_ERR(fwnode))
> +		return PTR_ERR(fwnode);


> +	fwnode = dev_fwnode(&config->pdev->dev);
> +	platform_device_unregister(config->pdev);
> +	fwnode_remove_software_node(fwnode);

This seems correct, thank you for modifying the code.

...

> +	config->pdev = NULL;
> +	mutex_unlock(&config->lock);

mutex_destroy() ?
Or is it done in the upper level?

-- 
With Best Regards,
Andy Shevchenko


