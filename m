Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C6534A247
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 08:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhCZHAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 03:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhCZG7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 02:59:48 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920E2C0613AA
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 23:59:48 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e14so454975plj.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 23:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g5purIWKW/Zco4vUYmYxRlM/RRRp9t0t4bDctzrCQdk=;
        b=VGOrbWo/1WCZLDrKaJcRfrWVJm5S9IR9fNVC5kNDMlRDkZLhAkfXtNzv80Jny9XfkV
         3QEIO5eFiHd4JDWeqOSvJDjYeTLngJIaqLxzzmQ8fNYfXiZDi7k8QuFu9QaAgtYm55Oq
         0zRtVkqDmF9kEEskqbjkU7acXgbv4QtZNUs+02LbSd8RLdo7I3ZhfhsYgZeO/cW5ILBg
         HFPiVusClW4hhE/SQ6zatetFL2V5oAG6rPzzzAF4705shaWWMgVGtUPoGhpJrKxterBG
         WMlUWOwIYRSp7/i61ZNKGp6FwMzXbQ9E0zus+GiSfJhWpHmSuryY9CCCOBviNooEMDr1
         PEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g5purIWKW/Zco4vUYmYxRlM/RRRp9t0t4bDctzrCQdk=;
        b=VcpT3nNn0u3M+I6ESmldUNvuY//1garyqMcShatTGbKCW6IhR3dSMJuv+cTv9biquX
         CMa8Pc2eIBEYP4JuQByUldLbN+99yHWJuVf+dcr9acCStwQ3e+ln+iXkOdj85e8CLSl5
         RwQz9KLPcaQ0oDOne7i2Yq2lE5ey+HNnU1vV30C4eqcDOQyjBML/RwOr+oaMAqCy9YwX
         5XD7M66SaalSwX92GUVW1LLTVTe/qCZ1nb/eIDw1eYONhHmqkOlVZkvzfF8cZjcNp5mD
         0P9GdBedIVmNj4RWa0/aOiBFU0rAoKOXqtY7bmnuhFCLSrjSuLnPIyCuZjHRcL9eq/Q8
         qNJA==
X-Gm-Message-State: AOAM530PKFi8yL4OFiS8nV4kvgZAkHg124ZFDOyRvtbMgXBZgj57SXhK
        n22zM8Ro0lJk/uQvfMTXUV4Adg==
X-Google-Smtp-Source: ABdhPJybUlqAkKSqE05y5lL6n3kSWx4CGg/ybdTdyOZIY9GlBkn3v2wcRSxEnYLul1hQQBB0fpaGuQ==
X-Received: by 2002:a17:903:22c7:b029:e6:faf5:eb3a with SMTP id y7-20020a17090322c7b02900e6faf5eb3amr13150715plg.23.1616741988034;
        Thu, 25 Mar 2021 23:59:48 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:2ebd:6e43:456a:1075])
        by smtp.gmail.com with ESMTPSA id f14sm8346174pfk.92.2021.03.25.23.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 23:59:47 -0700 (PDT)
Date:   Thu, 25 Mar 2021 23:59:44 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     linux-gpio@vger.kernel.org, andy.shevchenko@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        geert+renesas@glider.be
Subject: Re: [RFC gpio/for-next 2/2] gpio: gpio-mux-input: add generic gpio
 input multiplexer
Message-ID: <20210326065944.GA834818@x1>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210325122832.119147-3-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325122832.119147-3-sandberg@mailfence.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 25, 2021 at 02:28:32PM +0200, Mauri Sandberg wrote:
> Suppport for a general GPIO multiplexer. To drive the multiplexer a
> mux-controller is needed. The output pin of the multiplexer is a GPIO
> pin
> 
> Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>

Thanks for posting the RFC so we can take a look at the code and discuss
how it works.

> ---
>  drivers/gpio/Kconfig          |  11 +++
>  drivers/gpio/Makefile         |   1 +
>  drivers/gpio/gpio-mux-input.c | 143 ++++++++++++++++++++++++++++++++++
>  3 files changed, 155 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mux-input.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c70f46e80a3b..41062d8f7d93 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1641,4 +1641,15 @@ config GPIO_MOCKUP
>  
>  endmenu
>  
> +comment "Other GPIO expanders"
> +
> +config GPIO_MUX_INPUT
> +	tristate "General GPIO input multiplexer"
> +	select MULTIPLEXER
> +	select MUX_GPIO
> +	depends on OF_GPIO
> +	help
> +	  Say yes here to enable support for generic GPIO input multiplexer. This
> +	  needs a multiplexer controller to drive the select pins.
> +
>  endif
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 35e3b6026665..00f7576ce23f 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -105,6 +105,7 @@ obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
>  obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
>  obj-$(CONFIG_GPIO_MSIC)			+= gpio-msic.o
>  obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
> +obj-$(CONFIG_GPIO_MUX_INPUT)		+= gpio-mux-input.o
>  obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
>  obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
>  obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o

This does not apply to mainline. I've added it manually to my
drivers/gpio/Makefile but something to fix in v2.

> diff --git a/drivers/gpio/gpio-mux-input.c b/drivers/gpio/gpio-mux-input.c
> new file mode 100644
> index 000000000000..ec0c7acbab2f
> --- /dev/null
> +++ b/drivers/gpio/gpio-mux-input.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  A generic GPIO input multiplexer driver
> + *
> + *  Copyright (C) 2021 Mauri Sandberg <sandberg@mailfence.com>
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/mux/consumer.h>
> +
> +struct gpio_mux_input {
> +	struct device		*parent;
> +	struct gpio_chip	gpio_chip;
> +	struct mux_control	*mux_control;
> +	struct gpio_desc	*mux_pin;
> +};
> +
> +static struct gpio_mux_input *gpio_to_mux(struct gpio_chip *gc)
> +{
> +	return container_of(gc, struct gpio_mux_input, gpio_chip);
> +}
> +
> +static int gpio_mux_input_direction_input(struct gpio_chip *gc,
> +				       unsigned int offset)
> +{
> +	return 0;
> +}
> +
> +static int gpio_mux_input_direction_output(struct gpio_chip *gc,
> +					unsigned int offset, int val)
> +{
> +	return -EINVAL;
> +}
> +
> +static int gpio_mux_input_get_value(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpio_mux_input *mux;
> +	int ret;
> +
> +	mux = gpio_to_mux(gc);
> +	ret = mux_control_select(mux->mux_control, offset);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpiod_get_value(mux->mux_pin);

I'm not too familiar with how mux_control works but does there need to
be locking here?

Or is not possible for mux_pin to change to another offset before if
gpiod_get_value() if gpio_mux_input_get_value() runs concurrently?

> +	mux_control_deselect(mux->mux_control);
> +	return ret;
> +}
> +
> +static void gpio_mux_input_set_value(struct gpio_chip *gc,
> +				  unsigned int offset, int val)
> +{
> +	/* not supported */

I'm not sure but maybe it is better not to define gc->set in the probe?

> +}
> +
> +static int gpio_mux_input_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct gpio_mux_input *mux;
> +	struct gpio_chip *gc;
> +	struct mux_control *mc;
> +	struct gpio_desc *pin;
> +	int err;
> +
> +	mux = kzalloc(sizeof(struct gpio_mux_input), GFP_KERNEL);
> +	if (mux == NULL)
> +		return -ENOMEM;
> +
> +	mc = mux_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(mc)) {
> +		err = (int) PTR_ERR(mc);
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "unable to get mux-control: %d\n",
> +				err);
> +		goto err_free_mux;
> +	}
> +
> +	mux->mux_control = mc;
> +	pin = gpiod_get(&pdev->dev, "pin",  GPIOD_IN);
> +	if (IS_ERR(pin)) {
> +		err = (int) PTR_ERR(pin);
> +		dev_err(&pdev->dev, "unable to claim pin GPIOs: %d\n", err);
> +		goto err_free_mc;
> +	}
> +
> +	mux->mux_pin = pin;
> +	mux->parent = &pdev->dev;
> +
> +	gc = &mux->gpio_chip;
> +	gc->direction_input  = gpio_mux_input_direction_input;
> +	gc->direction_output = gpio_mux_input_direction_output;
> +	gc->get = gpio_mux_input_get_value;
> +	gc->set = gpio_mux_input_set_value;
> +	gc->can_sleep = 1;
> +
> +	gc->base = -1;
> +	gc->ngpio = mux_control_states(mc);
> +	gc->label = dev_name(mux->parent);
> +	gc->parent = mux->parent;
> +	gc->owner = THIS_MODULE;
> +	gc->of_node = np;
> +
> +	err = gpiochip_add(&mux->gpio_chip);
> +	if (err) {
> +		dev_err(&pdev->dev, "unable to add gpio chip, err=%d\n", err);
> +		goto err_free_pin;
> +	}
> +
> +	platform_set_drvdata(pdev, mux);
> +	return 0;
> +
> +err_free_pin:
> +	gpiod_put(pin);
> +err_free_mc:
> +	mux_control_put(mc);
> +err_free_mux:
> +	kfree(mux);
> +	return err;
> +}
> +
> +static const struct of_device_id gpio_mux_input_id[] = {
> +	{
> +		.compatible = "gpio-mux-input",
> +		.data = NULL,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, gpio_mux_input_id);
> +
> +static struct platform_driver gpio_mux_input_driver = {
> +	.driver	= {
> +		.name		= "gpio-mux-input",
> +		.owner		= THIS_MODULE,
> +		.of_match_table = gpio_mux_input_id,
> +	},
> +	.probe	= gpio_mux_input_probe,
> +};
> +module_platform_driver(gpio_mux_input_driver);

I believe you need to add:

  MODULE_AUTHOR("...");
  MODULE_DESCRIPTION("...");
  MODULE_LICENSE("GPL");

My build failed with:

  ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-mux-input.o
  LZMA    arch/arm/boot/compressed/piggy_data
  make[1]: *** [scripts/Makefile.modpost:132: Module.symvers] Error 1
  make[1]: *** Deleting file 'Module.symvers'
  make: *** [Makefile:1442: modules] Error 2
  make: *** Waiting for unfinished jobs....
  AS      arch/arm/boot/compressed/piggy.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready

I added those lines and it compiled successfully.


-Drew
