Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B644C161A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 16:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241896AbiBWPFZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 10:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233002AbiBWPFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 10:05:25 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC02B8227;
        Wed, 23 Feb 2022 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628697; x=1677164697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p6T80Q6t2JVMAGcj3I/l/BnCtus7KUGSBHpl347V5qo=;
  b=gEJM+JjCmhGUtFKwN0mUYmf8j19/NgsHM9K88QeeDrlmyDqLsApss1g8
   Ms/frG20adP7ObrG3W5tvwMWYHmIFd/18l3XRnuOCUfFV0qngt3iyS2c9
   kIm6Akfofns4iXGz1y4x8SEexZuJnTt8MwL/lNIH7WcNTZxidkKHJPNMu
   lMjHalBqvG+e6P4l7LYhJtlNvNZPNIj84pM7Iofe72YTr1yDnlr3HighC
   IigeYoG913P8YgkcyA6M5mhu86m4izypaISg4pJQmT16JBrPZTaLQe7JT
   OZGw9T6/VVDQ2kNyByiHvbh32OU5JfgPGnqW68E74whCqI2YEfIEHpUjh
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="249564636"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="249564636"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:04:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="776698479"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:04:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMtBU-007T58-Qn;
        Wed, 23 Feb 2022 17:04:04 +0200
Date:   Wed, 23 Feb 2022 17:04:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/5] platform/x86: x86-android-tablets: Lenovo Yoga
 Tablet 2 830/1050 sound support
Message-ID: <YhZM5BOIckEAez4k@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223133153.730337-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 02:31:53PM +0100, Hans de Goede wrote:
> The ACPI tables for the codec setup on the Lenovo Yoga Tablet 2 830/1050
> miss 2 things compared to their Windows (Lenovo Yoga Tablet 2 1051)
> counterparts:
> 
> 1. There is no CLKE ACPI method to enable output of the 32KHz PMU clock on
>    pin 6 of the SUS GPIO controller
> 
> 2. The GPIOs used by the codec are not listed in the fwnode for the codec
> 
> Add pinctrl code to set the SUS6 pin mux manually and a gpio-lookup table
> for the GPIOs to work around both issues.

With or without an addressed nit-pick,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/x86-android-tablets.c | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index c3d2b30dbe26..f446be72e539 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -23,12 +23,15 @@
>  #include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/machine.h>
>  #include <linux/platform_data/lp855x.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/power/bq24190_charger.h>
>  #include <linux/rmi.h>
>  #include <linux/serdev.h>
> +#include <linux/spi/spi.h>
>  #include <linux/string.h>
>  /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
>  #include "../../gpio/gpiolib.h"
> @@ -801,8 +804,22 @@ static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_int3496_gpios = {
>  	},
>  };
>  
> +#define LENOVO_YOGA_TAB2_830_1050_CODEC_NAME "spi-10WM5102:00"
> +
> +static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_codec_gpios = {
> +	.dev_id = LENOVO_YOGA_TAB2_830_1050_CODEC_NAME,
> +	.table = {
> +		GPIO_LOOKUP("gpio_crystalcove", 3, "reset", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("INT33FC:01", 23, "wlf,ldoena", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("arizona", 2, "wlf,spkvdd-ena", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("arizona", 4, "wlf,micd-pol", GPIO_ACTIVE_LOW),
> +		{ }
> +	},
> +};
> +
>  static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
>  	&lenovo_yoga_tab2_830_1050_int3496_gpios,
> +	&lenovo_yoga_tab2_830_1050_codec_gpios,
>  	NULL
>  };
>  
> @@ -866,6 +883,49 @@ static int __init lenovo_yoga_tab2_830_1050_init_display(void)
>  	return 0;
>  }
>  
> +/* SUS (INT33FC:02) pin 6 needs to be configured as pmu_clk for the audio codec */
> +static const struct pinctrl_map lenovo_yoga_tab2_830_1050_codec_pinctrl_map =

> +	PIN_MAP_MUX_GROUP(LENOVO_YOGA_TAB2_830_1050_CODEC_NAME, "codec_32khz_clk",
> +			  "INT33FC:02", "pmu_clk2_grp", "pmu_clk");

To avoid typos in messages you may define "codec_32khz_clk" and reuse in all (three?)
cases.

> +static struct pinctrl *lenovo_yoga_tab2_830_1050_codec_pinctrl;
> +
> +static int __init lenovo_yoga_tab2_830_1050_init_codec(void)
> +{
> +	struct device *codec_dev;
> +	struct pinctrl *pinctrl;
> +	int ret;
> +
> +	codec_dev = bus_find_device_by_name(&spi_bus_type, NULL,
> +					    LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
> +	if (!codec_dev) {
> +		pr_err("error cannot find %s device\n", LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
> +		return -ENODEV;
> +	}
> +
> +	ret = pinctrl_register_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map, 1);
> +	if (ret)
> +		goto err_put_device;
> +
> +	pinctrl = pinctrl_get_select(codec_dev, "codec_32khz_clk");
> +	if (IS_ERR(pinctrl)) {
> +		ret = dev_err_probe(codec_dev, PTR_ERR(pinctrl), "selecting codec_32khz_clk\n");
> +		goto err_unregister_mappings;
> +	}
> +
> +	/* We're done with the codec_dev now */
> +	put_device(codec_dev);
> +
> +	lenovo_yoga_tab2_830_1050_codec_pinctrl = pinctrl;
> +	return 0;
> +
> +err_unregister_mappings:
> +	pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
> +err_put_device:
> +	put_device(codec_dev);
> +	return ret;
> +}
> +
>  /*
>   * These tablet's DSDT does not set acpi_gbl_reduced_hardware, so acpi_power_off
>   * gets used as pm_power_off handler. This causes "poweroff" on these tablets
> @@ -886,6 +946,10 @@ static int __init lenovo_yoga_tab2_830_1050_init(void)
>  	if (ret)
>  		return ret;
>  
> +	ret = lenovo_yoga_tab2_830_1050_init_codec();
> +	if (ret)
> +		return ret;
> +
>  	pm_power_off = lenovo_yoga_tab2_830_1050_power_off;
>  	return 0;
>  }
> @@ -893,6 +957,11 @@ static int __init lenovo_yoga_tab2_830_1050_init(void)
>  static void lenovo_yoga_tab2_830_1050_exit(void)
>  {
>  	pm_power_off = NULL; /* Just turn poweroff into halt on module unload */
> +
> +	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
> +		pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
> +		pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
> +	}
>  }
>  
>  /* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


