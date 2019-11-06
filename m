Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1976FF17B5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 14:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfKFNyl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 08:54:41 -0500
Received: from mga07.intel.com ([134.134.136.100]:45290 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbfKFNyl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 08:54:41 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 05:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; 
   d="scan'208";a="212777308"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 06 Nov 2019 05:54:38 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 06 Nov 2019 15:54:37 +0200
Date:   Wed, 6 Nov 2019 15:54:36 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 4/7] gpio: merrifield: Add GPIO <-> pin mapping ranges
 via callback
Message-ID: <20191106135436.GR2552@lahna.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191105203557.78562-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105203557.78562-5-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:35:54PM +0200, Andy Shevchenko wrote:
> When IRQ chip is instantiated via GPIO library flow, the few functions,
> in particular the ACPI event registration mechanism, on some of ACPI based
> platforms expect that the pin ranges are initialized to that point.
> 
> Add GPIO <-> pin mapping ranges via callback in the GPIO library flow.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

One minor comment below.

> ---
>  drivers/gpio/gpio-merrifield.c | 43 ++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index 3302125e5265..e96d8e517e26 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -393,14 +393,36 @@ static const char *mrfld_gpio_get_pinctrl_dev_name(struct mrfld_gpio *priv)
>  	return name;
>  }
>  
> -static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +static int mrfld_gpio_add_pin_ranges(struct gpio_chip *chip)
>  {
> +	struct mrfld_gpio *priv = gpiochip_get_data(chip);
>  	const struct mrfld_gpio_pinrange *range;
>  	const char *pinctrl_dev_name;
> +	unsigned int i;
> +	int retval;
> +
> +	pinctrl_dev_name = mrfld_gpio_get_pinctrl_dev_name(priv);
> +	for (i = 0; i < ARRAY_SIZE(mrfld_gpio_ranges); i++) {
> +		range = &mrfld_gpio_ranges[i];
> +		retval = gpiochip_add_pin_range(&priv->chip,
> +						pinctrl_dev_name,
> +						range->gpio_base,
> +						range->pin_base,
> +						range->npins);

IMHO the below looks slightly better:

		ret = gpiochip_add_pin_range(&priv->chip, pinctrl_dev_name,
					     range->gpio_base, range->pin_base,
					     range->npins);

> +		if (retval) {
> +			dev_err(priv->dev, "failed to add GPIO pin range\n");
> +			return retval;
> +		}
> +	}
> +
> +	return 0;
> +}
