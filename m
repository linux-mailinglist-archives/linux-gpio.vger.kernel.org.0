Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4E938AE58
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 14:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbhETMfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 08:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236250AbhETMfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 08:35:15 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A58EC061359;
        Thu, 20 May 2021 04:42:57 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id C76E82224A;
        Thu, 20 May 2021 13:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621510974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=laQkl76GgvzyrBRdNUW0HfGHzeX9yJiMLdDxt+nksGs=;
        b=f/cbfz/WtsW6H+gjb3KC7RqH9Rqlfhh4lGZl9r+9dGil5gi8NeIjKYIk01w1l5MYHJbBgh
        9JCb70+fYTUdEVTwooVkPQnDI9kjxIIqFsv5RVTNJKEdzrY/Tdsv/BVt+SaAb0cUf+gwa9
        umIH6/1q5YZ+ZkIJMwKDyA9bUGN1alM=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 May 2021 13:42:54 +0200
From:   Michael Walle <michael@walle.cc>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH 1/2] gpio: regmap: Support few IC specific operations
In-Reply-To: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7d6f71e0a79e6ccd2a9f69be189993a9@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

Am 2021-05-20 13:28, schrieb Matti Vaittinen:
> The set_config and init_valid_mask GPIO operations are usually very IC
> specific. Allow IC drivers to provide these custom operations at
> gpio-regmap registration.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 49 +++++++++++++++++++++++++++++++++++++
>  include/linux/gpio/regmap.h | 13 ++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 134cedf151a7..315285cacd3f 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -27,6 +27,10 @@ struct gpio_regmap {
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
>  			      unsigned int *mask);
> +	int (*set_config)(struct regmap *regmap, void *drvdata,
> +			  unsigned int offset, unsigned long config);
> +	int (*init_valid_mask)(struct regmap *regmap, void *drvdata,
> +				unsigned long *valid_mask, unsigned int ngpios);

Maybe we should also make the first argument a "struct gpio_regmap"
and provide a new gpio_regmap_get_regmap(struct gpio_regmap). Thus
having a similar api as for the reg_mask_xlate(). Andy?

> 
>  	void *driver_data;
>  };
> @@ -39,6 +43,43 @@ static unsigned int gpio_regmap_addr(unsigned int 
> addr)
>  	return addr;
>  }
> 
> +static int regmap_gpio_init_valid_mask(struct gpio_chip *gc,
> +					unsigned long *valid_mask,
> +					unsigned int ngpios)
> +{
> +	struct gpio_regmap *gpio;
> +	void *drvdata;
> +
> +	gpio = gpiochip_get_data(gc);
> +
> +	if (!gpio->init_valid_mask) {
> +		WARN_ON(!gpio->init_valid_mask);
> +		return -EINVAL;
> +	}

Why not the following?

if (!gpio->init_valid_mask)
     return 0;

Thus copying the behavior of gpiolib.

> +
> +	drvdata = gpio_regmap_get_drvdata(gpio);
> +
> +	return gpio->init_valid_mask(gpio->regmap, drvdata, valid_mask, 
> ngpios);
> +}
> +
> +static int gpio_regmap_set_config(struct gpio_chip *gc, unsigned int 
> offset,
> +				  unsigned long config)
> +{
> +	struct gpio_regmap *gpio;
> +	void *drvdata;
> +
> +	gpio = gpiochip_get_data(gc);
> +
> +	if (!gpio->set_config) {
> +		WARN_ON(!gpio->set_config);
> +		return -EINVAL;
> +	}

same here, return -ENOTSUPP.

> +
> +	drvdata = gpio_regmap_get_drvdata(gpio);
> +
> +	return gpio->set_config(gpio->regmap, drvdata, offset, config);
> +}
> +
>  static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
>  				    unsigned int base, unsigned int offset,
>  				    unsigned int *reg, unsigned int *mask)
> @@ -235,6 +276,8 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
>  	gpio->reg_clr_base = config->reg_clr_base;
>  	gpio->reg_dir_in_base = config->reg_dir_in_base;
>  	gpio->reg_dir_out_base = config->reg_dir_out_base;
> +	gpio->set_config = config->set_config;
> +	gpio->init_valid_mask = config->init_valid_mask;
> 
>  	/* if not set, assume there is only one register */
>  	if (!gpio->ngpio_per_reg)
> @@ -253,6 +296,10 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
>  	chip->ngpio = config->ngpio;
>  	chip->names = config->names;
>  	chip->label = config->label ?: dev_name(config->parent);
> +	if (gpio->set_config)
> +		chip->set_config = gpio_regmap_set_config;
> +	if (gpio->init_valid_mask)
> +		chip->init_valid_mask = regmap_gpio_init_valid_mask;
> 
>  #if defined(CONFIG_OF_GPIO)
>  	/* gpiolib will use of_node of the parent if chip->of_node is NULL */
> @@ -280,6 +327,8 @@ struct gpio_regmap *gpio_regmap_register(const
> struct gpio_regmap_config *config
>  		chip->direction_output = gpio_regmap_direction_output;
>  	}
> 
> +	gpio_regmap_set_drvdata(gpio, config->drvdata);

I'm wondering if we need the gpio_regmap_set_drvdata() anymore or if
we can just drop it entirely.

> +
>  	ret = gpiochip_add_data(chip, gpio);
>  	if (ret < 0)
>  		goto err_free_gpio;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index 334dd928042b..c382a3caefc3 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -33,10 +33,18 @@ struct regmap;
>   * @ngpio_per_reg:	Number of GPIOs per register
>   * @irq_domain:		(Optional) IRQ domain if the controller is
>   *			interrupt-capable
> + * @drvdata:		(Optional) Pointer to IC specific data which is
> + *			not used by gpio-remap but is provided "as is" to
> + *			the driver callback(s).
> + *
>   * @reg_mask_xlate:     (Optional) Translates base address and GPIO
>   *			offset to a register/bitmask pair. If not
>   *			given the default gpio_regmap_simple_xlate()
>   *			is used.
> + * @set_config:		(Optional) hook for all kinds of settings. Uses
> + *			the same packed config format as generic pinconf.
> + * @init_valid_mask:	(Optional) routine to initialize @valid_mask, to
> + *			be used if not all GPIOs are valid.
>   *
>   * The ->reg_mask_xlate translates a given base address and GPIO 
> offset to
>   * register and mask pair. The base address is one of the given 
> register
> @@ -74,10 +82,15 @@ struct gpio_regmap_config {
>  	int reg_stride;
>  	int ngpio_per_reg;
>  	struct irq_domain *irq_domain;
> +	void *drvdata;
> 
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
>  			      unsigned int *mask);
> +	int (*set_config)(struct regmap *regmap, void *drvdata,
> +			  unsigned int offset, unsigned long config);
> +	int (*init_valid_mask)(struct regmap *regmap, void *drvdata,
> +				unsigned long *valid_mask, unsigned int ngpios);
>  };
> 
>  struct gpio_regmap *gpio_regmap_register(const struct
> gpio_regmap_config *config);
> 
> base-commit: d07f6ca923ea0927a1024dfccafc5b53b61cfecc
> --
> 2.25.4

-michael
