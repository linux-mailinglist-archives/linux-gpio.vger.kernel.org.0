Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3245A2AF537
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgKKPl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:41:28 -0500
Received: from mga02.intel.com ([134.134.136.20]:27857 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbgKKPl2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:41:28 -0500
IronPort-SDR: bFtomjY0OLeJkdah8FrPxEjOyNFuajTYl7H+Jt/lX07e+q/nAaVEKB3v9J9mVQOx24XeleWo77
 wiVfVRIf1tSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157178124"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="157178124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:41:26 -0800
IronPort-SDR: lDWUl4EG2pX3oane6hj1VumsQjJfRM9ktavn2JzPeD9RTFNC7L9wkhpuB05ytUir4QfJViuqEp
 85Bp001Ts9NA==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="473894704"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:41:24 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:41:21 +0200
Date:   Wed, 11 Nov 2020 17:41:21 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v5 11/17] gpiolib: acpi: Take into account debounce
 settings
Message-ID: <20201111154121.GF2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-12-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-12-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:26PM +0200, Andy Shevchenko wrote:
> We didn't take into account the debounce settings supplied by ACPI.
> This change is targeting the mentioned gap.
> 
> Reported-by: Coiby Xu <coiby.xu@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-acpi.c | 18 ++++++++++++++++++
>  drivers/gpio/gpiolib-acpi.h |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index c127b410a7a2..6cbad96be866 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -299,6 +299,10 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
>  		return AE_OK;
>  	}
>  
> +	ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
> +	if (ret)
> +		goto fail_free_desc;
> +
>  	ret = gpiochip_lock_as_irq(chip, pin);
>  	if (ret) {
>  		dev_err(chip->parent,
> @@ -664,6 +668,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
>  		lookup->desc = acpi_get_gpiod(agpio->resource_source.string_ptr,
>  					      agpio->pin_table[pin_index]);
>  		lookup->info.pin_config = agpio->pin_config;
> +		lookup->info.debounce = agpio->debounce_timeout;
>  		lookup->info.gpioint = gpioint;
>  
>  		/*
> @@ -961,6 +966,10 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  			if (ret < 0)
>  				return ret;
>  
> +			ret = gpio_set_debounce_timeout(desc, info.debounce);
> +			if (ret)
> +				return ret;
> +
>  			irq_flags = acpi_dev_get_irq_type(info.triggering,
>  							  info.polarity);
>  
> @@ -1048,6 +1057,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  		if (!found) {
>  			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
>  			const char *label = "ACPI:OpRegion";
> +			int ret;
>  
>  			desc = gpiochip_request_own_desc(chip, pin, label,
>  							 GPIO_ACTIVE_HIGH,
> @@ -1058,6 +1068,14 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  				goto out;
>  			}
>  
> +			ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
> +			if (ret) {
> +				status = AE_ERROR;
> +				gpiochip_free_own_desc(desc);
> +				mutex_unlock(&achip->conn_lock);

Nit: I think you can set status outside of the critical section.

Otherwise looks good,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
