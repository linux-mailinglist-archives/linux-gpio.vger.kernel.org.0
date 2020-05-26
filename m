Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057B21E1AB7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 07:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbgEZFbG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 01:31:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:44373 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgEZFbG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 May 2020 01:31:06 -0400
IronPort-SDR: UcOiYit5vwPcYejUbooLQtZHjW5W6YesYOkoKiyPLuBbCPAh/kNz227Inoqci56GYkJtGXZ1gM
 63PTC9P9ii+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 22:31:04 -0700
IronPort-SDR: dWWHTvsa8k8pLT/IzNazSmMKzIJdRFv0x/vDXPGxfYNVun2/2lUlQPI0MYNPZLYWQGqb5io9A8
 S+siaTfa51iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,436,1583222400"; 
   d="scan'208";a="375597964"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 25 May 2020 22:31:01 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 26 May 2020 08:31:01 +0300
Date:   Tue, 26 May 2020 08:31:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
Message-ID: <20200526053101.GD247495@lahna.fi.intel.com>
References: <20200525190845.60959-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200525190845.60959-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 10:08:45PM +0300, Andy Shevchenko wrote:
> ACPI table on Intel Galileo Gen 2 has wrong pin number for IRQ resource
> of one of the I²C GPIO expanders. Since we know what that number is and
> luckily have GPIO bases fixed for SoC's controllers, we may use a simple
> DMI quirk to match the platform and retrieve GpioInt() pin on it for
> the expander in question.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: did everything in the driver (Mika)
>  drivers/gpio/gpio-pca953x.c | 65 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 1fca8dd7824f..0d30f19782a2 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/bitmap.h>
> +#include <linux/dmi.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -107,6 +108,62 @@ static const struct i2c_device_id pca953x_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, pca953x_id);
>  
> +#ifdef CONFIG_GPIO_PCA953X_IRQ
> +static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
> +	{
> +		/*
> +		 * On Intel Galileo Gen 2 board the IRQ pin of one of
> +		 * the I²C GPIO expanders, which has GpioInt() resource,
> +		 * is provided as an absolute number instead of being
> +		 * relative. Since first controller (gpio-sch.c) and
> +		 * second (gpio-dwapb.c) are at the fixed bases, we may
> +		 * safely refer to the number in the global space to get
> +		 * an IRQ out of it.
> +		 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GalileoGen2"),
> +		},
> +	},
> +	{}
> +};
> +
> +#ifdef CONFIG_ACPI
> +static acpi_status pca953x_acpi_get_pin(struct acpi_resource *ares, void *data)
> +{
> +	struct acpi_resource_gpio *agpio;
> +	int *pin = data;
> +
> +	if (!acpi_gpio_get_irq_resource(ares, &agpio))
> +		return AE_OK;
> +
> +	*pin = agpio->pin_table[0];
> +	return AE_CTRL_TERMINATE;
> +}
> +
> +static int pca953x_acpi_find_pin(acpi_handle handle)
> +{
> +	int p = -ENOENT;
> +
> +	acpi_walk_resources(handle, METHOD_NAME__CRS, pca953x_acpi_get_pin, &p);
> +	return p;
> +}
> +#else
> +static inline int pca953x_acpi_find_pin(acpi_handle handle) { return -ENXIO; }
> +#endif
> +
> +static int pca953x_acpi_get_irq(struct device *dev)
> +{
> +	int pin;
> +
> +	pin = pca953x_acpi_find_pin(ACPI_HANDLE(dev));
> +	if (pin < 0)
> +		return pin;
> +
> +	dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> +	return gpiod_to_irq(gpio_to_desc(pin));

You need to request the GPIO as well, I missed that from my example.
Sorry about that.

Otherwise looks good.
