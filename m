Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011E932AD2B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383627AbhCBV1m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:27:42 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:49543 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575242AbhCBSLh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 13:11:37 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 66C772223E;
        Tue,  2 Mar 2021 19:10:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614708650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zxTVEd9o2rzNQDwI6+kbn+AvO3O5hKuFjcZldnfOCTw=;
        b=BripCNgaJh41mQMmrSbNsRL3iMntRdtfi6P/to/2/oWfA8yXgyWkQKx4LiqFGye0btJIBs
        /sfcPSzFnUCAQrPktDxTNO/GTH8TAf8IqUF4e24XtdFLoqIocnWUwIknrUMoi1ff0Y+DLt
        O3PgkbgA4WNa1sCAoK7HTJLSwbEt2vA=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 02 Mar 2021 19:10:50 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: regmap: move struct gpio_regmap definition
In-Reply-To: <20210302180601.12082-1-noltari@gmail.com>
References: <20210302180601.12082-1-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <b4a344af55ad238a554c56e31b1b87ed@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2021-03-02 19:06, schrieb Álvaro Fernández Rojas:
> struct gpio_regmap should be declared in gpio/regmap.h.
> This way other drivers can access the structure data when registering a 
> gpio
> regmap controller.

The intention was really to keep this private to the gpio-regmap
driver. Why do you need to access to the properties?

-michael

> Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using 
> regmap")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 20 ------------------
>  include/linux/gpio/regmap.h | 41 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 5412cb3b0b2a..23b0a8572f53 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -11,26 +11,6 @@
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> 
> -struct gpio_regmap {
> -	struct device *parent;
> -	struct regmap *regmap;
> -	struct gpio_chip gpio_chip;
> -
> -	int reg_stride;
> -	int ngpio_per_reg;
> -	unsigned int reg_dat_base;
> -	unsigned int reg_set_base;
> -	unsigned int reg_clr_base;
> -	unsigned int reg_dir_in_base;
> -	unsigned int reg_dir_out_base;
> -
> -	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> -			      unsigned int offset, unsigned int *reg,
> -			      unsigned int *mask);
> -
> -	void *driver_data;
> -};
> -
>  static unsigned int gpio_regmap_addr(unsigned int addr)
>  {
>  	if (addr == GPIO_REGMAP_ADDR_ZERO)
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index ad76f3d0a6ba..ce2fc6e9b62b 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -4,13 +4,52 @@
>  #define _LINUX_GPIO_REGMAP_H
> 
>  struct device;
> -struct gpio_regmap;
>  struct irq_domain;
>  struct regmap;
> 
>  #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
>  #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
> 
> +/**
> + * struct gpio_regmap - GPIO regmap controller
> + * @parent:		The parent device
> + * @regmap:		The regmap used to access the registers
> + *			given, the name of the device is used
> + * @gpio_chip:		GPIO chip controller
> + * @ngpio_per_reg:	Number of GPIOs per register
> + * @reg_stride:		(Optional) May be set if the registers (of the
> + *			same type, dat, set, etc) are not consecutive.
> + * @reg_dat_base:	(Optional) (in) register base address
> + * @reg_set_base:	(Optional) set register base address
> + * @reg_clr_base:	(Optional) clear register base address
> + * @reg_dir_in_base:	(Optional) in setting register base address
> + * @reg_dir_out_base:	(Optional) out setting register base address
> + * @reg_mask_xlate:     (Optional) Translates base address and GPIO
> + *			offset to a register/bitmask pair. If not
> + *			given the default gpio_regmap_simple_xlate()
> + *			is used.
> + * @driver_data:	(Optional) driver-private data
> + */
> +struct gpio_regmap {
> +	struct device *parent;
> +	struct regmap *regmap;
> +	struct gpio_chip gpio_chip;
> +
> +	int reg_stride;
> +	int ngpio_per_reg;
> +	unsigned int reg_dat_base;
> +	unsigned int reg_set_base;
> +	unsigned int reg_clr_base;
> +	unsigned int reg_dir_in_base;
> +	unsigned int reg_dir_out_base;
> +
> +	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> +			      unsigned int offset, unsigned int *reg,
> +			      unsigned int *mask);
> +
> +	void *driver_data;
> +};
> +
>  /**
>   * struct gpio_regmap_config - Description of a generic regmap 
> gpio_chip.
>   * @parent:		The parent device
