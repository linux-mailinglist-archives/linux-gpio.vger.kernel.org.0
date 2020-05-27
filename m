Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5B51E4000
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 13:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgE0L1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 07:27:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:39209 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbgE0L1w (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 07:27:52 -0400
IronPort-SDR: YL3JkITWj5jqM6B7N2t96ozt6q8JHs7hJLOfu/teYfwU/HBK2TKiZdi76Z2WP7sgsuZ4Wy60Di
 rokvD6ZSoJrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 04:27:52 -0700
IronPort-SDR: kt8pBOURmsU5kL4GDjAXMaO4iaI6RyyEkDnLYPJiqZ3670aA9BqZ7VzeI2nr6BmH/ymL6FbYFf
 WwcPskZll35Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="376000992"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 27 May 2020 04:27:50 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 27 May 2020 14:27:49 +0300
Date:   Wed, 27 May 2020 14:27:49 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
Message-ID: <20200527112749.GS247495@lahna.fi.intel.com>
References: <20200526171222.14835-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526171222.14835-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 08:12:22PM +0300, Andy Shevchenko wrote:
> ACPI table on Intel Galileo Gen 2 has wrong pin number for IRQ resource
> of one of the I²C GPIO expanders. Since we know what that number is and
> luckily have GPIO bases fixed for SoC's controllers, we may use a simple
> DMI quirk to match the platform and retrieve GpioInt() pin on it for
> the expander in question.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v3: used legacy API (Mika)
>  drivers/gpio/gpio-pca953x.c | 83 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 1fca8dd7824f..eeb91b27a52f 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -10,11 +10,13 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/bitmap.h>
> +#include <linux/dmi.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_data/pca953x.h>
> @@ -107,6 +109,79 @@ static const struct i2c_device_id pca953x_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, pca953x_id);
>  
> +#ifdef CONFIG_GPIO_PCA953X_IRQ
> +
> +#include <linux/gpio.h>
> +
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
> +static int pca953x_acpi_get_pin(struct acpi_resource *ares, void *data)
> +{
> +	struct acpi_resource_gpio *agpio;
> +	int *pin = data;
> +
> +	if (!acpi_gpio_get_irq_resource(ares, &agpio))
> +		return 1;
> +
> +	*pin = agpio->pin_table[0];

Writing it like below looks better IMHO:

	if (acpi_gpio_get_irq_resource(ares, &agpio))
		*pin = agpio->pin_table[0];
	return 1;


> +}
> +
> +static int pca953x_acpi_find_pin(struct device *dev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	LIST_HEAD(r);
> +	int pin = -ENOENT, ret;

Hmm, reverse christmas tree?

	struct acpi_device *adev = ACPI_COMPANION(dev);
	int pin = -ENOENT, ret;
	LIST_HEAD(r);

> +
> +	ret = acpi_dev_get_resources(adev, &r, pca953x_acpi_get_pin, &pin);
> +	acpi_dev_free_resource_list(&r);
> +	if (ret < 0)
> +		return ret;
> +
> +	return pin;

Or
	return ret < 0 ? ret : pin;

> +}
> +#else
> +static inline int pca953x_acpi_find_pin(struct device *dev) { return -ENXIO; }
> +#endif
> +
> +static int pca953x_acpi_get_irq(struct device *dev)
> +{
> +	int pin, ret;
> +
> +	pin = pca953x_acpi_find_pin(dev);
> +	if (pin < 0)
> +		return pin;

Since you don't actually check the error value you may also return
simply 0 here (invalid IRQ) and other places.

> +
> +	dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> +
> +	if (!gpio_is_valid(pin))
> +		return -EINVAL;
> +
> +	ret = gpio_request(pin, "pca953x interrupt");
> +	if (ret)
> +		return ret;
> +
> +	return gpio_to_irq(pin);
> +}
> +#endif
> +
>  static const struct acpi_device_id pca953x_acpi_ids[] = {
>  	{ "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
>  	{ }
> @@ -750,8 +825,16 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
>  	struct irq_chip *irq_chip = &chip->irq_chip;
>  	DECLARE_BITMAP(reg_direction, MAX_LINE);
>  	DECLARE_BITMAP(irq_stat, MAX_LINE);
> +	const struct dmi_system_id *id;
>  	int ret;
>  
> +	id = dmi_first_match(pca953x_dmi_acpi_irq_info);
> +	if (id) {

Also here since you don't actually use id for anything you can simplify
this like:

	if (dmi_check_system(pca953x_dmi_acpi_irq_info)) {
		ret = pca953x_acpi_get_irq(&client->dev);
		if (ret > 0)
			client->irq = ret;
	}

> +		ret = pca953x_acpi_get_irq(&client->dev);
> +		if (ret > 0)
> +			client->irq = ret;
> +	}
> +
>  	if (!client->irq)
>  		return 0;
>  
> -- 
> 2.26.2
