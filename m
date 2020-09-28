Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57FA27AE8D
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 15:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgI1NCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 09:02:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:47478 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgI1NCT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 09:02:19 -0400
IronPort-SDR: QShKUJRrYzSbRtoQEooO6I/KJ/VQ1tL27Mv1jnuONYwNCu8h+OJI0f/u5gL2LcgMsKtPqHjm1M
 TQUmhLei2gGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="246728898"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="246728898"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 06:01:49 -0700
IronPort-SDR: zDeHxpc53tVzmjlt8pB3g+nWBQHagM2/zOsbPoOViv1T2QWj/v/OVeclZwqQeZGuS8bx+NaUwb
 His/+7TmLY3g==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="307328259"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 06:01:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kMsmi-002Z7q-6n; Mon, 28 Sep 2020 16:01:40 +0300
Date:   Mon, 28 Sep 2020 16:01:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 8/9] gpio: mockup: use the generic 'gpio-line-names'
 property
Message-ID: <20200928130140.GK3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-9-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928104155.7385-9-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 12:41:54PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> GPIO line names are currently created by the driver from the chip label.
> We'll want to support custom formats for line names (for instance: to
> name all lines the same) for user-space tests so create them in the
> module init function and pass them to the driver using the standard
> 'gpio-line-names' property.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-mockup.c | 70 +++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 5b2686f9e07d..47b7de6d5ab1 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -19,6 +19,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/string_helpers.h>
>  #include <linux/uaccess.h>
>  
>  #include "gpiolib.h"
> @@ -374,29 +375,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
>  	}
>  }
>  
> -static int gpio_mockup_name_lines(struct device *dev,
> -				  struct gpio_mockup_chip *chip)
> -{
> -	struct gpio_chip *gc = &chip->gc;
> -	char **names;
> -	int i;
> -
> -	names = devm_kcalloc(dev, gc->ngpio, sizeof(char *), GFP_KERNEL);
> -	if (!names)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < gc->ngpio; i++) {
> -		names[i] = devm_kasprintf(dev, GFP_KERNEL,
> -					  "%s-%d", gc->label, i);
> -		if (!names[i])
> -			return -ENOMEM;
> -	}
> -
> -	gc->names = (const char *const *)names;
> -
> -	return 0;
> -}
> -
>  static void gpio_mockup_dispose_mappings(void *data)
>  {
>  	struct gpio_mockup_chip *chip = data;
> @@ -464,12 +442,6 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>  	for (i = 0; i < gc->ngpio; i++)
>  		chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
>  
> -	if (device_property_read_bool(dev, "named-gpio-lines")) {
> -		rv = gpio_mockup_name_lines(dev, chip);
> -		if (rv)
> -			return rv;
> -	}
> -
>  	chip->irq_sim_domain = devm_irq_domain_create_sim(dev, NULL,
>  							  gc->ngpio);
>  	if (IS_ERR(chip->irq_sim_domain))
> @@ -510,6 +482,27 @@ static void gpio_mockup_unregister_pdevs(void)
>  	}
>  }
>  
> +static __init char **gpio_mockup_make_line_names(const char *label,
> +						 unsigned int num_lines)
> +{
> +	unsigned int i;
> +	char **names;
> +
> +	names = kcalloc(num_lines + 1, sizeof(char *), GFP_KERNEL);
> +	if (!names)
> +		return NULL;
> +
> +	for (i = 0; i < num_lines; i++) {
> +		names[i] = kasprintf(GFP_KERNEL, "%s-%u", label, i);
> +		if (!names[i]) {
> +			kfree_strarray(names, i);
> +			return NULL;
> +		}
> +	}
> +
> +	return names;
> +}
> +
>  static int __init gpio_mockup_init(void)
>  {
>  	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
> @@ -517,6 +510,7 @@ static int __init gpio_mockup_init(void)
>  	struct platform_device_info pdevinfo;
>  	struct platform_device *pdev;
>  	char chip_label[32];
> +	char **line_names;
>  	u16 ngpio;
>  
>  	if ((gpio_mockup_num_ranges < 2) ||
> @@ -549,6 +543,7 @@ static int __init gpio_mockup_init(void)
>  		memset(properties, 0, sizeof(properties));
>  		memset(&pdevinfo, 0, sizeof(pdevinfo));
>  		prop = 0;
> +		line_names = NULL;
>  
>  		snprintf(chip_label, sizeof(chip_label),
>  			 "gpio-mockup-%c", i + 'A');
> @@ -564,15 +559,26 @@ static int __init gpio_mockup_init(void)
>  				 : gpio_mockup_range_ngpio(i) - base;
>  		properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
>  
> -		if (gpio_mockup_named_lines)
> -			properties[prop++] = PROPERTY_ENTRY_BOOL(
> -						"named-gpio-lines");
> +		if (gpio_mockup_named_lines) {
> +			line_names = gpio_mockup_make_line_names(chip_label,
> +								 ngpio);
> +			if (!line_names) {
> +				platform_driver_unregister(&gpio_mockup_driver);
> +				gpio_mockup_unregister_pdevs();
> +				return -ENOMEM;
> +			}
> +
> +			properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
> +						"gpio-line-names",
> +						line_names, ngpio);
> +		}
>  
>  		pdevinfo.name = "gpio-mockup";
>  		pdevinfo.id = i;
>  		pdevinfo.properties = properties;
>  
>  		pdev = platform_device_register_full(&pdevinfo);
> +		kfree_strarray(line_names, ngpio);
>  		if (IS_ERR(pdev)) {
>  			pr_err("error registering device");
>  			platform_driver_unregister(&gpio_mockup_driver);
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


