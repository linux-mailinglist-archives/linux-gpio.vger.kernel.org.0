Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4612327C2D8
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgI2Kx4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:53:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:30544 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgI2Kx4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 06:53:56 -0400
IronPort-SDR: EP82BQyv+DnDNTeQTNNPMxgcUwVD+c3XqSplVbiFpjvvPINGPqdOordqyrzx4jIDW76gp/ffzw
 Ag77G24wvBWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="246896455"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="246896455"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 03:53:55 -0700
IronPort-SDR: ZU6ZW8i/DMjyN8TV/lLiN+rHyNn3eHgO4T+hj/ucuVvOEn3/095lbF0LfedWdpJju72rTI8Sj2
 j0fiCnftsVRw==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="293625510"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 03:53:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kNDGV-002lzN-Um; Tue, 29 Sep 2020 13:53:47 +0300
Date:   Tue, 29 Sep 2020 13:53:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 08/10] gpio: mockup: pass the chip label as device
 property
Message-ID: <20200929105347.GG3956970@smile.fi.intel.com>
References: <20200929101004.20288-1-brgl@bgdev.pl>
 <20200929101004.20288-9-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929101004.20288-9-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 12:10:02PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> While we do check the "chip-name" property in probe(), we never actually
> use it. Let's pass the chip label to the driver using device properties
> as we'll want to allow users to define their own once dynamically
> created chips are supported.
> 
> The property is renamed to "chip-label" to not cause any confusion with
> the actual chip name which is of the form: "gpiochipX".
> 
> If the "chip-label" property is missing, let's do what most devices in
> drivers/gpio/ do and use dev_name().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-mockup.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 856ba5da1e8c..1466f480aacd 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -429,21 +429,14 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>  	if (rv)
>  		return rv;
>  
> -	rv = device_property_read_string(dev, "chip-name", &name);
> +	rv = device_property_read_string(dev, "chip-label", &name);
>  	if (rv)
> -		name = NULL;
> +		name = dev_name(dev);
>  
>  	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)
>  		return -ENOMEM;
>  
> -	if (!name) {
> -		name = devm_kasprintf(dev, GFP_KERNEL,
> -				      "%s-%c", pdev->name, pdev->id + 'A');
> -		if (!name)
> -			return -ENOMEM;
> -	}
> -
>  	mutex_init(&chip->lock);
>  
>  	gc = &chip->gc;
> @@ -523,6 +516,7 @@ static int __init gpio_mockup_init(void)
>  	int i, prop, num_chips, err = 0, base;
>  	struct platform_device_info pdevinfo;
>  	struct platform_device *pdev;
> +	char chip_label[32];
>  	u16 ngpio;
>  
>  	if ((gpio_mockup_num_ranges < 2) ||
> @@ -556,6 +550,11 @@ static int __init gpio_mockup_init(void)
>  		memset(&pdevinfo, 0, sizeof(pdevinfo));
>  		prop = 0;
>  
> +		snprintf(chip_label, sizeof(chip_label),
> +			 "gpio-mockup-%c", i + 'A');
> +		properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
> +							   chip_label);
> +
>  		base = gpio_mockup_range_base(i);
>  		if (base >= 0)
>  			properties[prop++] = PROPERTY_ENTRY_U32("gpio-base",
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


