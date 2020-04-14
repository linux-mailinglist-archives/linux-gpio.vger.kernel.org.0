Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E751A8715
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407519AbgDNRJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:09:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:48324 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407566AbgDNRJg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:09:36 -0400
IronPort-SDR: 6mBEyOKVda9NyUNz2ZlYKPiS6lvBozqEDpflJYj+oHP/kOF9vGsKaAjCeMEG2IN8O7FC6q2Vht
 ycXoCOqCOdVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:09:35 -0700
IronPort-SDR: 5AIfgOUvd8UvlvuCZCCAm90mtFkrEnCv8mUFyZEuBTYbD/KzyHNJlBJYVb4aqHbfD+tShrdJEX
 Rnnmkmh/38mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="298761048"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2020 10:09:32 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOP42-000ZiJ-Nw; Tue, 14 Apr 2020 20:09:34 +0300
Date:   Tue, 14 Apr 2020 20:09:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
Message-ID: <20200414170934.GA34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 02:58:26PM -0500, Pierre-Louis Bossart wrote:
> The GPIOs are used e.g. on HifiBerry DAC+ HATs to control the LED
> (GPIO3) and the choice of the 44.1 (GPIO6) or 48 (GPIO3) kHz
> oscillator (when present).
> 
> Enable basic gpio_chip to get/set values and get/set
> directions. Tested with GPIO_LIB from sys/class/gpio, the LED turns
> on/off as desired.


One question, can this use existing GPIO infrastructure, like bgpio_init()?
Ah, I see, that one operates over MMIO, while we would need something based on
regmap API.

Bartosz, do we have plans to have bgpio_regmap_init() or alike?

...

> +static int pcm512x_gpio_get_direction(struct gpio_chip *chip,
> +				      unsigned int offset)
> +{
> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(pcm512x->regmap, PCM512x_GPIO_EN, &val);
> +	if (ret < 0)
> +		return ret;

> +	val = (val >> offset) & 1;
> +
> +	/* val is 0 for input, 1 for output, return inverted */
> +	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;

This better to read as simple conditional, like

	if (val & BIT(offset))
		return ..._OUT;
	return ..._IN;

> +}

...

> +static int pcm512x_gpio_direction_output(struct gpio_chip *chip,
> +					 unsigned int offset,
> +					 int value)
> +{
> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
> +	unsigned int reg;
> +	int ret;
> +
> +	/* select Register GPIOx output for OUTPUT_x (1..6) */
> +	reg = PCM512x_GPIO_OUTPUT_1 + offset;

> +	ret = regmap_update_bits(pcm512x->regmap, reg, 0x0f, 0x02);

Magic numbers detected.

> +	if (ret < 0)

Drop unnecessary ' < 0' parts where it makes sense, like here.

> +		return ret;
> +

> +	/* enable output x */

(1)

> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_EN,
> +				 BIT(offset), BIT(offset));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set value */

(2)

With this (1)->(2) ordering it may be a glitch. So, first set value (if
hardware allows you, otherwise it seems like a broken one), and then switch
it to output.

> +	return regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
> +				  BIT(offset), value << offset);

You are using many times BIT(offset) mask above, perhaps
	int mask = BIT(offset);

Also, more robust is to use ternary here: 'value ? BIT(offset) : 0'.
Rationale: think what happen with value != 1 (theoretical possibility in the
future).

> +}

...

> +static int pcm512x_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{

> +	return (val >> offset) & 1;

Don't forget to use BIT() macro.

	return !!(val & BIT(offset));

> +}

...

> +static void pcm512x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			     int value)
> +{
> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
> +	int ret;
> +
> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
> +				 BIT(offset), value << offset);

value ? BIT(offset) : 0

> +	if (ret < 0)

> +		pr_debug("%s: regmap_update_bits failed: %d\n", __func__, ret);

No __func__ in debug messages.
Use dev_dbg() when we have struct device available.

> +}

...

> +static const struct gpio_chip template_chip = {

Give better name, please. E.g. pcm512x_gpio_chip.

> +	.label			= "pcm512x-gpio",
> +	.names			= pcm512x_gpio_names,
> +	.owner			= THIS_MODULE,
> +	.get_direction		= pcm512x_gpio_get_direction,
> +	.direction_input	= pcm512x_gpio_direction_input,
> +	.direction_output	= pcm512x_gpio_direction_output,
> +	.get			= pcm512x_gpio_get,
> +	.set			= pcm512x_gpio_set,
> +	.base			= -1, /* let gpiolib select the base */
> +	.ngpio			= ARRAY_SIZE(pcm512x_gpio_names),
> +};

...

> +	/* expose 6 GPIO pins, numbered from 1 to 6 */
> +	pcm512x->chip = template_chip;
> +	pcm512x->chip.parent = dev;
> +
> +	ret = devm_gpiochip_add_data(dev, &pcm512x->chip, pcm512x);

> +	if (ret != 0) {

if (ret)

> +		dev_err(dev, "Failed to register gpio chip: %d\n", ret);
> +		goto err;
> +	}

-- 
With Best Regards,
Andy Shevchenko


