Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EF4296349
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 19:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505991AbgJVRCi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 13:02:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:21291 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505941AbgJVRCh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 13:02:37 -0400
IronPort-SDR: CfgvTi+4lwPjGuLtKYpcfargFor1FB53HmTFF/BMdIqZjVy6GlBH2kW9raT+Sn2bxAdcxbTemF
 G/xNGghoh+2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="231754601"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="231754601"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 10:02:20 -0700
IronPort-SDR: FiVhTs7tc8asWciFKE1+5ikskvfFuONFuSNuRqs7zk6FhGbXBBNIcez4oWRbwtG3efknAuZSpk
 8UI4pNngsC9Q==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="348831852"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 10:02:17 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kVdzj-00DQuP-S1; Thu, 22 Oct 2020 20:03:19 +0300
Date:   Thu, 22 Oct 2020 20:03:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, Linus@black.fi.intel.com,
        Walleij@black.fi.intel.com, linus.walleij@linaro.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/3] gpiolib: acpi: Respect bias settings for
 GpioInt() resource
Message-ID: <20201022170319.GJ4077@smile.fi.intel.com>
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 07:58:45PM +0300, Andy Shevchenko wrote:
> In some cases the GpioInt() resource is coming with bias settings
> which may affect system functioning. Respect bias settings for
> GpioInt() resource by calling acpi_gpio_update_gpiod_*flags() API
> in acpi_dev_gpio_irq_get().
> 
> Reported-by: Jamie McClymont <jamie@kwiius.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> v2: preserved ordering of IRQ map (Hans, Mika), added Rb tag (Mika)

Missed comment as per v1:

This one highly depends on Intel pin control driver changes (for now [1],
but might be more), so it's probably not supposed to be backported (at least
right now).

[1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/

>  drivers/gpio/gpiolib-acpi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 834a12f3219e..3a39e8a93226 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -942,6 +942,7 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  
>  		if (info.gpioint && idx++ == index) {
>  			unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
> +			enum gpiod_flags dflags = GPIOD_ASIS;
>  			char label[32];
>  			int irq;
>  
> @@ -952,8 +953,11 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  			if (irq < 0)
>  				return irq;
>  
> +			acpi_gpio_update_gpiod_flags(&dflags, &info);
> +			acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
> +
>  			snprintf(label, sizeof(label), "GpioInt() %d", index);
> -			ret = gpiod_configure_flags(desc, label, lflags, info.flags);
> +			ret = gpiod_configure_flags(desc, label, lflags, dflags);
>  			if (ret < 0)
>  				return ret;
>  
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


