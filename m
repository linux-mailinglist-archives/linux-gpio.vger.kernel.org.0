Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD67332AD42
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1572960AbhCBV3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1582022AbhCBUCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 15:02:00 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A18AC061756;
        Tue,  2 Mar 2021 12:01:18 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 1A7322223E;
        Tue,  2 Mar 2021 21:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614715275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0KW/FK8JYfP2NgbfURSSqrkgkLGVEKeSJfvl4xPN+Zk=;
        b=puDD5PjfnhmgTQdXwgjIVlzikBXCoF51Q9LK5M2KY8nBIaOzjZj7dnLNWtRG9LthC1tsXi
        ozBb7oGCHUnoeFVYnZqHnFXdg0UR+ZaTlYLcqs3++DB5QCpJJloSDUzivDQ4YDKhaHFwwc
        nFxIyhHJTcNMDtkkDlFXNtkYHIOgdMo=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 02 Mar 2021 21:01:15 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] pinctrl: add a pincontrol driver for BCM6328
In-Reply-To: <20210302191613.29476-3-noltari@gmail.com>
References: <20210302191613.29476-1-noltari@gmail.com>
 <20210302191613.29476-3-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c69dc0da70d69add1c5e4d64d04c25e9@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-02 20:16, schrieb Álvaro Fernández Rojas:
> Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins as
> GPIOs, as LEDs for the integrated LED controller, or various other
> functions. Its pincontrol mux registers also control other aspects, 
> like
> switching the second USB port between host and device mode.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  v2: switch to GPIO_REGMAP
> 
>  drivers/pinctrl/bcm/Kconfig           |  13 +
>  drivers/pinctrl/bcm/Makefile          |   1 +
>  drivers/pinctrl/bcm/pinctrl-bcm6328.c | 481 ++++++++++++++++++++++++++
>  3 files changed, 495 insertions(+)
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6328.c
> 
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index 0ed14de0134c..76728f097c25 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -29,6 +29,19 @@ config PINCTRL_BCM2835
>  	help
>  	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
> 
> +config PINCTRL_BCM6328
> +	bool "Broadcom BCM6328 GPIO driver"
> +	depends on OF_GPIO && (BMIPS_GENERIC || COMPILE_TEST)
> +	select GPIO_REGMAP
> +	select GPIOLIB_IRQCHIP
> +	select IRQ_DOMAIN_HIERARCHY
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF

select GPIO_REGMAP ?

> +	default BMIPS_GENERIC
> +	help
> +	   Say Y here to enable the Broadcom BCM6328 GPIO driver.
> +
>  config PINCTRL_IPROC_GPIO
>  	bool "Broadcom iProc GPIO (with PINCONF) driver"
>  	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
> diff --git a/drivers/pinctrl/bcm/Makefile 
> b/drivers/pinctrl/bcm/Makefile
> index 79d5e49fdd9a..7e7c6e25b26d 100644
> --- a/drivers/pinctrl/bcm/Makefile
> +++ b/drivers/pinctrl/bcm/Makefile
> @@ -3,6 +3,7 @@
> 
>  obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
>  obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
> +obj-$(CONFIG_PINCTRL_BCM6328)		+= pinctrl-bcm6328.o
>  obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
>  obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
>  obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6328.c
> b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
> new file mode 100644
> index 000000000000..f2b1a14e7903
> --- /dev/null
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm6328.c
[..]
> +static int bcm6328_reg_mask_xlate(struct gpio_regmap *gpio,
> +				  unsigned int base, unsigned int offset,
> +				  unsigned int *reg, unsigned int *mask)
> +{
> +	unsigned int line = offset % gpio->ngpio_per_reg;
> +	unsigned int stride = offset / gpio->ngpio_per_reg;
> +
> +	*reg = base - stride * gpio->reg_stride;
> +	*mask = BIT(line);
> +
> +	return 0;
> +}

How many registers are there? npgio_per_reg is 32 but so is ngpio.
So isn't there only one register? And thus, can you use the default
gpio_regmap_simple_xlat()?

[..]

> +static int bcm6328_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_regmap_config grc = {0};
> +	struct gpio_regmap *gr;
> +	struct bcm6328_pinctrl *pc;
> +	int err;
> +
> +	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
> +	if (!pc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pc);
> +	pc->dev = dev;
> +
> +	pc->regs = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(pc->regs))
> +		return PTR_ERR(pc->regs);
> +
> +	grc.parent = dev;
> +	grc.ngpio = BCM6328_NUM_GPIOS;
> +	grc.ngpio_per_reg = BCM6328_BANK_GPIOS;
> +	grc.regmap = pc->regs;
> +	grc.reg_dat_base = BCM6328_DATA_REG;
> +	grc.reg_dir_out_base = BCM6328_DIROUT_REG;
> +	grc.reg_mask_xlate = bcm6328_reg_mask_xlate;
> +	grc.reg_set_base = BCM6328_DATA_REG;
> +	grc.reg_stride = 4;
> +
> +	gr = devm_gpio_regmap_register(dev, &grc);
> +	err = PTR_ERR_OR_ZERO(gr);
> +	if (err) {
> +		dev_err(dev, "could not add GPIO chip\n");
> +		return err;
> +	}
> +
> +	pc->pctl_desc.name = MODULE_NAME;
> +	pc->pctl_desc.pins = bcm6328_pins;
> +	pc->pctl_desc.npins = ARRAY_SIZE(bcm6328_pins);
> +	pc->pctl_desc.pctlops = &bcm6328_pctl_ops;
> +	pc->pctl_desc.pmxops = &bcm6328_pmx_ops;
> +	pc->pctl_desc.owner = THIS_MODULE;
> +
> +	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
> +	if (IS_ERR(pc->pctl_dev)) {
> +		gpiochip_remove(&gr->gpio_chip);
> +		return PTR_ERR(pc->pctl_dev);
> +	}
> +
> +	pc->gpio_range.name = MODULE_NAME;
> +	pc->gpio_range.npins = BCM6328_NUM_GPIOS;
> +	pc->gpio_range.base = gr->gpio_chip.base;
> +	pc->gpio_range.gc = &gr->gpio_chip;
> +	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);

Ahh I see. What about adding a new function in gpio-regmap.c:
   gpio_regmap_pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range)?

gpio-regmap should have all the information to fill all the
required properties. I'm unsure whether gpio-regmap should also
allocate the gpio_range.

Maybe someone can come up with a better function name though.

-michael
