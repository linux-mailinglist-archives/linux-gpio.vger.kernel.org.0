Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF8D1E5DCD
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 13:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388338AbgE1LEU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 07:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388339AbgE1LEU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 07:04:20 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EFAC05BD1E;
        Thu, 28 May 2020 04:04:19 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id EA6BF23E46;
        Thu, 28 May 2020 13:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590663857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jz5PJHH2h2A/8f24evk4T0wO6B2JhEYzejhlcN74ubc=;
        b=ggMqRKbcUpifdIRJX3TruE8OJ8w30ioCU4jsBlO1IqJ6dUVJ8ARlXwH44RuZboH0+Q01WJ
        jCijQsAMcjUnYcmI6nVRxGlWmddEENXDs8oPkI9S6vlX7q73IkQYGPJSk/bJp4oOGMWJzU
        E1c55GBP5Xrv1zbSt7CHs40PoDNT/hA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 28 May 2020 13:04:16 +0200
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 2/2] gpio: add a reusable generic gpio_chip using
 regmap
In-Reply-To: <20200528035841.16800-3-michael@walle.cc>
References: <20200528035841.16800-1-michael@walle.cc>
 <20200528035841.16800-3-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <002382bd764becfc10a2c2ac17f54fa7@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2020-05-28 05:58, schrieb Michael Walle:
> There are quite a lot simple GPIO controller which are using regmap to
> access the hardware. This driver tries to be a base to unify existing
> code into one place. This won't cover everything but it should be a 
> good
> starting point.
> 
> It does not implement its own irq_chip because there is already a
> generic one for regmap based devices. Instead, the irq_chip will be
> instantiated in the parent driver and its irq domain will be associate
> to this driver.
> 
> For now it consists of the usual registers, like set (and an optional
> clear) data register, an input register and direction registers.
> Out-of-the-box, it supports consecutive register mappings and mappings
> where the registers have gaps between them with a linear mapping 
> between
> GPIO offset and bit position. For weirder mappings the user can 
> register
> its own .xlate().
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/gpio/Kconfig        |   4 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-regmap.c  | 352 ++++++++++++++++++++++++++++++++++++
>  include/linux/gpio-regmap.h |  70 +++++++
>  4 files changed, 427 insertions(+)
>  create mode 100644 drivers/gpio/gpio-regmap.c
>  create mode 100644 include/linux/gpio-regmap.h
> 
[..]

> --- /dev/null
> +++ b/include/linux/gpio-regmap.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _LINUX_GPIO_REGMAP_H
> +#define _LINUX_GPIO_REGMAP_H
> +
> +struct gpio_regmap;
> +
> +#define GPIO_REGMAP_ADDR_ZERO ((unsigned long)(-1))
> +#define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
> +
> +/**
> + * struct gpio_regmap_config - Description of a generic regmap 
> gpio_chip.
> + *
> + * @parent:		The parent device
> + * @regmap:		The regmap used to access the registers
> + *			given, the name of the device is used
> + * @label:		(Optional) Descriptive name for GPIO controller.
> + *			If not given, the name of the device is used.
> + * @ngpio:		Number of GPIOs
> + * @names:		(Optional) Array of names for gpios
> + * @reg_dat_base:	(Optional) (in) register base address
> + * @reg_set_base:	(Optional) set register base address
> + * @reg_clr_base:	(Optional) clear register base address
> + * @reg_dir_in_base:	(Optional) in setting register base address
> + * @reg_dir_out_base:	(Optional) out setting register base address
> + * @reg_stride:		(Optional) May be set if the registers (of the
> + *			same type, dat, set, etc) are not consecutive.
> + * @ngpio_per_reg:	Number of GPIOs per register
> + * @irq_domain:		(Optional) IRQ domain if the controller is
> + *			interrupt-capable
> + * @reg_mask_xlate:     (Optional) Translates base address and GPIO
> + *			offset to a register/bitmask pair. If not
> + *			given the default gpio_regmap_simple_xlate()
> + *			is used.
> + *
> + * The reg_mask_xlate translates a given base address and GPIO offset 
> to
> + * register and mask pair. The base address is one of the given 
> reg_*_base.
> + *
> + * All base addresses may have the special value GPIO_REGMAP_ADDR_ZERO
> + * which forces the address to the value 0.
> + */
> +struct gpio_regmap_config {
> +	struct device *parent;
> +	struct regmap *regmap;
> +
> +	const char *label;
> +	int ngpio;

damn.. I shouldn't send patches early in the morning. I've forgot to 
actually
enable my GPIO driver before compiling. And of course.. it doesn't 
compile.

const char *const *names;

is missing here. So I have to send a v6 anyway. Let's wait what Linus 
and Bert
says about the location of the gpio-regmap.h header.

Sorry for the noise.

-michael

> +
> +	unsigned int reg_dat_base;
> +	unsigned int reg_set_base;
> +	unsigned int reg_clr_base;
> +	unsigned int reg_dir_in_base;
> +	unsigned int reg_dir_out_base;
> +	int reg_stride;
> +	int ngpio_per_reg;
> +	struct irq_domain *irq_domain;
> +
> +	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> +			      unsigned int offset, unsigned int *reg,
> +			      unsigned int *mask);
> +};
> +
> +struct gpio_regmap *gpio_regmap_register(const struct
> gpio_regmap_config *config);
> +void gpio_regmap_unregister(struct gpio_regmap *gpio);
> +struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
> +					      const struct gpio_regmap_config *config);
> +void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data);
> +void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
> +
> +#endif /* _LINUX_GPIO_REGMAP_H */
