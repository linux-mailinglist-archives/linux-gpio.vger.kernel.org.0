Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7578A387430
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 10:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347552AbhERIks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 04:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242786AbhERIkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 04:40:43 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3632C061573;
        Tue, 18 May 2021 01:39:23 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 295CA2224B;
        Tue, 18 May 2021 10:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621327161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wN0B4yaF1WgJIn6AazhTXeaQAJgd9QwuhScgIP3JPig=;
        b=W7b3wCMRCC72RnHy19toWuAE0OyvC1yLqiBEuGMw1sko1O8bL+Y9dPLdMp1tOLShcNbhRh
        ouSdgYVJewMtatpzPXd3OBAhJdWrUa/sdhY9+zjXbCcd6s6dCXG8xXrBGYMzRzky8y2cdo
        ffr7ke+rRR4ESpybksIKM3BR72SUytI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 May 2021 10:39:20 +0200
From:   Michael Walle <michael@walle.cc>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] gpio: regmap: Add configurable dir/value order
In-Reply-To: <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
References: <cover.1621279162.git.sander@svanheule.net>
 <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <675e36df5aaa1e1be3a1a77289a0a952@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2021-05-17 21:28, schrieb Sander Vanheule:
> GPIO chips may not support setting the output value when a pin is
> configured as an input, although the current implementation assumes 
> this
> is always possible.
> 
> Add support for setting pin direction before value. The order defaults
> to setting the value first, but this can be reversed by setting the
> regmap_config.no_set_on_input flag, similar to the corresponding flag 
> in
> the gpio-mmio driver.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  drivers/gpio/gpio-regmap.c  | 20 +++++++++++++++++---
>  include/linux/gpio/regmap.h |  3 +++
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 134cedf151a7..1cdb20f8f8b4 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -170,14 +170,25 @@ static int gpio_regmap_direction_input(struct
> gpio_chip *chip,
>  	return gpio_regmap_set_direction(chip, offset, false);
>  }
> 
> -static int gpio_regmap_direction_output(struct gpio_chip *chip,
> -					unsigned int offset, int value)
> +static int gpio_regmap_dir_out_val_first(struct gpio_chip *chip,
> +					 unsigned int offset, int value)

Can we leave the name as is? TBH I find these two similar names
super confusing. Maybe its just me, though.

>  {
>  	gpio_regmap_set(chip, offset, value);
> 
>  	return gpio_regmap_set_direction(chip, offset, true);
>  }
> 
> +static int gpio_regmap_dir_out_dir_first(struct gpio_chip *chip,
> +					 unsigned int offset, int value)
> +{
> +	int err;

use ret for consistency here

> +
> +	err = gpio_regmap_set_direction(chip, offset, true);
> +	gpio_regmap_set(chip, offset, value);
> +
> +	return err;
> +}
> +

Instead of adding a new one, we can also just check no_set_on_input
in gpio_regmap_direction_output(), which I'd prefer.

static int gpio_regmap_direction_output(struct gpio_chip *chip,
					unsigned int offset, int value)
{
	struct gpio_regmap *gpio = gpiochip_get_data(chip);
	int ret;

	if (gpio->no_set_on_input) {
		/* some smart comment here, also mention gliches */
		ret = gpio_regmap_set_direction(chip, offset, true);
		gpio_regmap_set(chip, offset, value);
	} else {
		gpio_regmap_set(chip, offset, value);
		ret = gpio_regmap_set_direction(chip, offset, true);
	}

	return ret;
}

>  void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
>  {
>  	gpio->driver_data = data;
> @@ -277,7 +288,10 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
>  	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
>  		chip->get_direction = gio_regmap_get_direction;
>  		chip->direction_input = gpio_regmap_direction_input;
> -		chip->direction_output = gpio_regmap_direction_output;
> +		if (config->no_set_on_input)
> +			chip->direction_output = gpio_regmap_dir_out_dir_first;
> +		else
> +			chip->direction_output = gpio_regmap_dir_out_val_first;
>  	}
> 
>  	ret = gpiochip_add_data(chip, gpio);
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index 334dd928042b..2a732f8f23be 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -30,6 +30,8 @@ struct regmap;
>   * @reg_dir_out_base:	(Optional) out setting register base address
>   * @reg_stride:		(Optional) May be set if the registers (of the
>   *			same type, dat, set, etc) are not consecutive.
> + * @no_set_on_input:	Set if output value can only be set when the 
> direction
> + *			is configured as output.

set_direction_first ?

>   * @ngpio_per_reg:	Number of GPIOs per register
>   * @irq_domain:		(Optional) IRQ domain if the controller is
>   *			interrupt-capable
> @@ -73,6 +75,7 @@ struct gpio_regmap_config {
>  	unsigned int reg_dir_out_base;
>  	int reg_stride;
>  	int ngpio_per_reg;
> +	bool no_set_on_input;
>  	struct irq_domain *irq_domain;
> 
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,

-michael
