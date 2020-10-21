Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62255294AEA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 11:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438436AbgJUJ7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 05:59:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:9391 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438426AbgJUJ7C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 05:59:02 -0400
IronPort-SDR: aDDe3B98iSyYCCybIQXUB2S8efu/0McjNk6LkXKdh1BycfhmnXM6NFVmuDIarwx8sXMzwcPknA
 qzoUYvWergSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167461962"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="167461962"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:59:00 -0700
IronPort-SDR: KN11lU2paDASqvpgEv5HWdVBOOWTgkmUEjCm4Vxv7xbwvlTrhXAdqRO+9/CHsTQ13bOkC16Uzh
 wUZatotlMkTg==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="533466140"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:58:57 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 21 Oct 2020 12:58:54 +0300
Date:   Wed, 21 Oct 2020 12:58:54 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>
Subject: Re: [PATCH v1 1/3] gpiolib: acpi: Respect bias settings for
 GpioInt() resource
Message-ID: <20201021095854.GV2495@lahna.fi.intel.com>
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 04:31:52PM +0300, Andy Shevchenko wrote:
> In some cases the GpioInt() resource is coming with bias settings
> which may affect system functioning. Respect bias settings for
> GpioInt() resource by calling acpi_gpio_update_gpiod_*flags() API
> in acpi_dev_gpio_irq_get().
> 
> While at it, refactor to configure flags first and, only when succeeded,
> map the IRQ descriptor.
> 
> Reported-by: Jamie McClymont <jamie@kwiius.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> This one highly depends on Intel pin control driver changes (for now [1], but
> might be more), so it's probably not supposed to be backported (at least right
> now).
> 
> [1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/
> 
>  drivers/gpio/gpiolib-acpi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 834a12f3219e..52b961673f16 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -942,21 +942,25 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  
>  		if (info.gpioint && idx++ == index) {
>  			unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
> +			enum gpiod_flags dflags = info.flags;
>  			char label[32];
>  			int irq;
>  
>  			if (IS_ERR(desc))
>  				return PTR_ERR(desc);
>  
> -			irq = gpiod_to_irq(desc);
> -			if (irq < 0)
> -				return irq;
> +			acpi_gpio_update_gpiod_flags(&dflags, &info);
> +			acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
>  
>  			snprintf(label, sizeof(label), "GpioInt() %d", index);
> -			ret = gpiod_configure_flags(desc, label, lflags, info.flags);
> +			ret = gpiod_configure_flags(desc, label, lflags, dflags);
>  			if (ret < 0)
>  				return ret;
>  
> +			irq = gpiod_to_irq(desc);
> +			if (irq < 0)
> +				return irq;

Should the above be undone if the conversion here fails?

In any case looks good so,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
