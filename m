Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEA73CB38C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 09:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhGPHyS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 03:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbhGPHyS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 03:54:18 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F3AC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 00:51:23 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r11so10974776wro.9
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=75hkuBoWS0vHJJzS2VgnET8y1i2k9hSa3LBfcENdXNE=;
        b=IACJF3oamyYJKyHVKKuIo/tOKQo2eNT4+6VJNapd37DO/T4wzAQhnnf5kjrlzAGbpl
         ItKOQHOoLV7ABATBQpiU/J7lR0nhpce41v0Fi/5sQ2wIdLv2PvSP9L2j3jIvn95Qu6by
         1fq1QfPpY4nmw+YgC5T9D5Aq3NW9MSi79I3upyj2Rmopj/ItQ8RJOLKa51lf6rMIfw5r
         465pcxcGsY5RIlOphtu5k/k0+2C4w3k2hNZFqryuCaYFm3xwFP7oftE/k3Uj7yfkDP7v
         uwdWU2jL8gL0Xra4JG7mqAgVrhiVZLEUN2CSgJJnZQ/NEXFfTnC/oI63EQboC/uCRaDh
         XYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=75hkuBoWS0vHJJzS2VgnET8y1i2k9hSa3LBfcENdXNE=;
        b=KsA0a98p5sRKF7gny7i4So1OK/CvA9AxwkdcBp6QhBUUrHbi8lxF4ZTiBewWyaoN/B
         ePTYKY7byWSDuPP3plQ7NNzRl8EngJmusdVizKtubcxLKvrVruJln+kOtr7BhGYERGD2
         8wBNpkR8YKtGogZc2JMXvkE4IUSTIp6wLHRodLzxDdK0+HYLOn0uW7acSg2kwTu4OJJT
         /3xd3gypW7JMUolOkBI7LVEiZXg62PRBBaCblFCLnDo44rRjSkeextCpeiM7/FGE85dD
         gZAJH885Yiftu4mLiZ5UfUg4ka5YpW5UzzprQ1ER6fArX5XzIxl2gzadSR97BDpYp+RX
         nhUQ==
X-Gm-Message-State: AOAM5334Bm+UqbnptrEAOC5slhN1UzpYxitwmUukCR1NEv9JJSIQ6Ss1
        sguiyDHzD5TcyROrYmZkltTG6Q==
X-Google-Smtp-Source: ABdhPJyYkCv/M75rt2/Jdzn8hQJLR21YJoYAPwfbuJZyNViAqFSzHnmN2vHdylezaNC5LUwoKRaQWw==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr10240122wrw.81.1626421882154;
        Fri, 16 Jul 2021 00:51:22 -0700 (PDT)
Received: from google.com ([31.124.24.141])
        by smtp.gmail.com with ESMTPSA id f130sm8758156wmf.23.2021.07.16.00.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 00:51:21 -0700 (PDT)
Date:   Fri, 16 Jul 2021 08:51:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
        Dirk Opfer <dirk@opfer-online.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors
Message-ID: <YPE6d4WWYAWgnsCH@google.com>
References: <20210715151625.394960-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210715151625.394960-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 15 Jul 2021, Linus Walleij wrote:

> The Tosa device (Sharp SL-6000) has a mishmash driver set-up
> for the Toshiba TC6393xb MFD that includes a battery charger
> and touchscreen and has some kind of relationship to the SoC
> sound driver for the AC97 codec. Other devices define a chip
> like this but seem only half-implemented, not really handling
> battery charging etc.
> 
> This patch switches the Toshiba MFD device to provide GPIO
> descriptors to the battery charger and SoC codec. As a result
> some descriptors need to be moved out of the Tosa boardfile
> and new one added: all SoC GPIO resources to these drivers
> now comes from the main boardfile, while the MFD provide
> GPIOs for its portions.
> 
> As a result we can request one GPIO from our own GPIO chip
> and drop two hairy callbacks into the board file.
> 
> This platform badly needs to have its drivers split up and
> converted to device tree probing to handle this quite complex
> relationship in an orderly manner. I just do my best in solving
> the GPIO descriptor part of the puzzle. Please don't ask me
> to fix everything that is wrong with these driver to todays
> standards, I am just trying to fix one aspect. I do try to
> use modern devres resource management and handle deferred
> probe using new functions where appropriate.
> 
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Dirk Opfer <dirk@opfer-online.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Dmitry/Dirk: it'd be great if you could test this patch on
> the Tosa and try to help me iron out any bugs.
> 
> Merging strategy: please provide ACKs and I will attempt
> to merge this through the SoC tree.
> ---
>  arch/arm/mach-pxa/eseries.c           |   2 -
>  arch/arm/mach-pxa/include/mach/tosa.h |  18 ---
>  arch/arm/mach-pxa/tosa.c              |  68 +++-------
>  drivers/mfd/tc6393xb.c                | 147 ++++++++++++++++------
>  drivers/power/supply/tosa_battery.c   | 171 ++++++++++++++++----------
>  include/linux/mfd/tc6393xb.h          |   1 -
>  sound/soc/pxa/tosa.c                  |  20 ++-
>  7 files changed, 246 insertions(+), 181 deletions(-)

[...]

> diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
> index 3d5b14c60e20..72ac471cb0f5 100644
> --- a/drivers/mfd/tc6393xb.c
> +++ b/drivers/mfd/tc6393xb.c
> @@ -22,6 +22,8 @@
>  #include <linux/mfd/tmio.h>
>  #include <linux/mfd/tc6393xb.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h> /* Provides GPIO lines to children */
> +#include <linux/gpio/consumer.h> /* Requesting own GPIOs */

Are these comments really necessary?

>  #include <linux/slab.h>
>  
>  #define SCR_REVID	0x08		/* b Revision ID	*/
> @@ -87,8 +89,10 @@
>  
>  struct tc6393xb {
>  	void __iomem		*scr;
> +	struct device		*dev;
>  
>  	struct gpio_chip	gpio;
> +	struct gpio_desc	*vcc_on;
>  
>  	struct clk		*clk; /* 3,6 Mhz */
>  
> @@ -497,17 +501,110 @@ static int tc6393xb_gpio_direction_output(struct gpio_chip *chip,
>  	return 0;
>  }
>  
> -static int tc6393xb_register_gpio(struct tc6393xb *tc6393xb, int gpio_base)
> +/*
> + * TC6393XB GPIOs as used on TOSA, the only user of this chip. If you add more

Missing an "are" for clarity?

> + * platforms using this chip, rewrite things to use device tree and register GPIO

Not sure we should be dictating extension methods in this way.

What if DT is deprecated by the time this is expanded?

> + * resources there.
> + */
> +#define TOSA_GC_NAME			"tc6393xb"

Please use the name string in-place.

> +#define TOSA_GPIO_TG_ON			0
> +#define TOSA_GPIO_L_MUTE		1
> +#define TOSA_GPIO_BL_C20MA		3
> +#define TOSA_GPIO_CARD_VCC_ON		4
> +#define TOSA_GPIO_CHARGE_OFF		6
> +#define TOSA_GPIO_CHARGE_OFF_JC		7
> +#define TOSA_GPIO_BAT0_V_ON		9
> +#define TOSA_GPIO_BAT1_V_ON		10
> +#define TOSA_GPIO_BU_CHRG_ON		11
> +#define TOSA_GPIO_BAT_SW_ON		12
> +#define TOSA_GPIO_BAT0_TH_ON		14
> +#define TOSA_GPIO_BAT1_TH_ON		15

Okay, I have to ask - what are 5, 8 and 13?

> +static struct gpiod_lookup_table tosa_lcd_gpio_lookup = {
> +	.dev_id = "spi2.0",
> +	.table = {
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_TG_ON, "tg #pwr", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table tosa_lcd_bl_gpio_lookup = {
> +	.dev_id = "i2c-tosa-bl",
> +	.table = {
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BL_C20MA, "backlight", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table tosa_audio_gpio_lookup = {
> +	.dev_id = "tosa-audio",
> +	.table = {
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_L_MUTE, NULL, GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};

Are these structures going to be peppered all over the kernel now?

Maybe a helper can be added to make these single line entries one line
each?

> +static struct gpiod_lookup_table tosa_battery_gpio_lookup = {
> +	.dev_id = "wm97xx-battery",
> +	.table = {
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_CHARGE_OFF,
> +			    "main charge off", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_CHARGE_OFF_JC,
> +			    "jacket charge off", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT0_V_ON,
> +			    "main battery", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT1_V_ON,
> +			    "jacket battery", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BU_CHRG_ON,
> +			    "backup battery", GPIO_ACTIVE_HIGH),
> +		/* BAT1 and BAT0 thermistors appear to be swapped */
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT1_TH_ON,
> +			    "main battery temp", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT0_TH_ON,
> +			    "jacket battery temp", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT_SW_ON,
> +			    "battery switch", GPIO_ACTIVE_HIGH),

These are soooo close to being <100 chars.

What does Checkpatch currently warn on?  Is it 100 or 120?

> +		{ },
> +	},
> +};
> +
> +static struct gpiod_lookup_table *tc6393xb_gpio_lookups[] = {
> +	&tosa_lcd_gpio_lookup,
> +	&tosa_lcd_bl_gpio_lookup,
> +	&tosa_audio_gpio_lookup,
> +	&tosa_battery_gpio_lookup,
> +};
> +
> +static int tc6393xb_register_gpio(struct tc6393xb *tc6393xb)
>  {
> -	tc6393xb->gpio.label = "tc6393xb";
> -	tc6393xb->gpio.base = gpio_base;
> -	tc6393xb->gpio.ngpio = 16;
> -	tc6393xb->gpio.set = tc6393xb_gpio_set;
> -	tc6393xb->gpio.get = tc6393xb_gpio_get;
> -	tc6393xb->gpio.direction_input = tc6393xb_gpio_direction_input;
> -	tc6393xb->gpio.direction_output = tc6393xb_gpio_direction_output;
> -
> -	return gpiochip_add_data(&tc6393xb->gpio, tc6393xb);
> +	struct gpio_chip *gc = &tc6393xb->gpio;
> +	struct device *dev = tc6393xb->dev;
> +	int ret;
> +
> +	gc->label = TOSA_GC_NAME;
> +	gc->base = -1; /* Dynamic allocation */

Global define?

> +	gc->ngpio = 16;
> +	gc->set = tc6393xb_gpio_set;
> +	gc->get = tc6393xb_gpio_get;
> +	gc->direction_input = tc6393xb_gpio_direction_input;
> +	gc->direction_output = tc6393xb_gpio_direction_output;
> +
> +	ret = devm_gpiochip_add_data(dev, gc, tc6393xb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add GPIO chip\n");
> +
> +	/* Register descriptor look-ups for consumers */
> +	gpiod_add_lookup_tables(tc6393xb_gpio_lookups, ARRAY_SIZE(tc6393xb_gpio_lookups));
> +
> +	/* Request some of our own GPIOs */
> +	tc6393xb->vcc_on = gpiochip_request_own_desc(gc, TOSA_GPIO_CARD_VCC_ON, "VCC ON",
> +						     GPIO_ACTIVE_HIGH, GPIOD_OUT_HIGH);
> +	if (IS_ERR(tc6393xb->vcc_on))
> +		return dev_err_probe(dev, PTR_ERR(tc6393xb->vcc_on),
> +				     "failed to request VCC ON GPIO\n");
> +

So much more code to do the same thing?

> +	return 0;
>  }
>  
>  /*--------------------------------------------------------------------------*/
> @@ -617,6 +714,7 @@ static int tc6393xb_probe(struct platform_device *dev)
>  		ret = -ENOMEM;
>  		goto err_kzalloc;
>  	}
> +	tc6393xb->dev = &dev->dev;

That confused me at first.

Please consider changing the platform_device to pdev (separately).

>  	raw_spin_lock_init(&tc6393xb->lock);
>  
> @@ -676,22 +774,12 @@ static int tc6393xb_probe(struct platform_device *dev)
>  			tmio_ioread8(tc6393xb->scr + SCR_REVID),
>  			(unsigned long) iomem->start, tc6393xb->irq);
>  
> -	tc6393xb->gpio.base = -1;
> -
> -	if (tcpd->gpio_base >= 0) {
> -		ret = tc6393xb_register_gpio(tc6393xb, tcpd->gpio_base);
> -		if (ret)
> -			goto err_gpio_add;
> -	}
> +	ret = tc6393xb_register_gpio(tc6393xb);
> +	if (ret)
> +		goto err_gpio_add;
>  
>  	tc6393xb_attach_irq(dev);
>  
> -	if (tcpd->setup) {
> -		ret = tcpd->setup(dev);
> -		if (ret)
> -			goto err_setup;
> -	}
> -
>  	tc6393xb_cells[TC6393XB_CELL_NAND].platform_data = tcpd->nand_data;
>  	tc6393xb_cells[TC6393XB_CELL_NAND].pdata_size =
>  						sizeof(*tcpd->nand_data);
> @@ -705,15 +793,8 @@ static int tc6393xb_probe(struct platform_device *dev)
>  	if (!ret)
>  		return 0;
>  
> -	if (tcpd->teardown)
> -		tcpd->teardown(dev);
> -
> -err_setup:
>  	tc6393xb_detach_irq(dev);
> -
>  err_gpio_add:
> -	if (tc6393xb->gpio.base != -1)
> -		gpiochip_remove(&tc6393xb->gpio);
>  	tcpd->disable(dev);
>  err_enable:
>  	clk_disable_unprepare(tc6393xb->clk);
> @@ -738,14 +819,8 @@ static int tc6393xb_remove(struct platform_device *dev)
>  
>  	mfd_remove_devices(&dev->dev);
>  
> -	if (tcpd->teardown)
> -		tcpd->teardown(dev);
> -
>  	tc6393xb_detach_irq(dev);
>  
> -	if (tc6393xb->gpio.base != -1)
> -		gpiochip_remove(&tc6393xb->gpio);
> -

Taking away all of these lines is nice.

>  	ret = tcpd->disable(dev);
>  	clk_disable_unprepare(tc6393xb->clk);
>  	iounmap(tc6393xb->scr);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
