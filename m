Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C9F302622
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 15:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbhAYOMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 09:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbhAYOLq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 09:11:46 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B2DC0613D6
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 06:10:49 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c128so11137276wme.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 06:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zH0NEkG3AkFr4jGffOltirP3sm6e4qzdbWMUDm6pzLE=;
        b=SRebwxQ7TFksC5IwMikzJ5HEz185i6km8QLqy2tzc21KOY3W+dnsTINsjvyumQSmG0
         1QoGHJp+x3n3QwXEWYFCqsvWd0DqduPME/tlSPj20Z4++oqUQczekiSN7TKBZI5cuYjY
         IX1ziQ4Ock3gmA2IOv8sS2v/0V/nz8w+f0qVH9mZlTROxDpWGCwfnRgQPslEKVD3Rbiw
         f8jZFun5gdlTwzzuoW4ewllgKY6skqeU71ZUekohbSCxEa3f+LqLWCjjwSgB/IdR1gS3
         MR2dVPZrRXaUVPLWXp/fesDG41ubLtiMBHtvEzTapz9FVU5L4KohQ1/xPocjQwQkPeEz
         3k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zH0NEkG3AkFr4jGffOltirP3sm6e4qzdbWMUDm6pzLE=;
        b=O4XMMgzXGrzk13qeAmYt7nL3NbU0TJGFd2HruHEsDrYPV4dJmAX9zqel/TrBZxh20Q
         j0tl+IpLm79RHvdpRGAwPzGf7VlTmh+muyBf/I2d3dI4w0wPglwrJ9UAyS5LX4dxn1eR
         Hjr369R52rbCGhuRFJCUtQIRVTlvyA0uPZ6lty++GNNjSywnpx6lky+gMUrWVl4khFQ+
         aa6s936X1R0zHq/mLzGQf1mGWG6m/Krr0YA1IHEFlnvJx+Nfvak4w5Egtu4LlQkNoaSb
         RFnNlLp3P00rPl/1E4aBT5skCWfARwSofU//dYRvnCUohvaMyLdefzTL4uGR8OufPXL2
         OlWA==
X-Gm-Message-State: AOAM5327bwBN/LF+jllpdur7ERoWRb5QHQNZjK6xDZMXc4XW9nm/VxCv
        h0cgS1l1qb1lL37wynl1EDU8qw==
X-Google-Smtp-Source: ABdhPJwDKlHKaDAHOAQGGiwPTDUBPbAjrqMLjsiY/cakhRnPFVmktcVug0+lIuO6y9u8Wgnv9logFQ==
X-Received: by 2002:a1c:e255:: with SMTP id z82mr340638wmg.60.1611583847665;
        Mon, 25 Jan 2021 06:10:47 -0800 (PST)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id c18sm41394036wmk.0.2021.01.25.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:10:46 -0800 (PST)
Date:   Mon, 25 Jan 2021 14:10:44 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 09/17] mfd: Support for ROHM BD71815 PMIC core
Message-ID: <20210125141044.GZ4903@dell>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <14480ca837005aecd7053202c2347e36ad29faee.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14480ca837005aecd7053202c2347e36ad29faee.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 19 Jan 2021, Matti Vaittinen wrote:

> Add core support for ROHM BD71815 Power Management IC.
> 
> The IC integrates regulators, a battery charger with a coulomb counter,
> a real-time clock (RTC), clock gate and general-purpose outputs (GPO).
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changes since v1:
>   - Used BIT() for better readability
>   - removed some unused definitions
> 
>  drivers/mfd/Kconfig              |  15 +-
>  drivers/mfd/rohm-bd71828.c       | 416 +++++++++++++++++++++--
>  include/linux/mfd/rohm-bd71815.h | 561 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd71828.h |   3 +
>  4 files changed, 952 insertions(+), 43 deletions(-)
>  create mode 100644 include/linux/mfd/rohm-bd71815.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index bdfce7b15621..59bfacb91898 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1984,19 +1984,20 @@ config MFD_ROHM_BD70528
>  	  charger.
>  
>  config MFD_ROHM_BD71828
> -	tristate "ROHM BD71828 Power Management IC"
> +	tristate "ROHM BD71828 and BD71815 Power Management IC"
>  	depends on I2C=y
>  	depends on OF
>  	select REGMAP_I2C
>  	select REGMAP_IRQ
>  	select MFD_CORE
>  	help
> -	  Select this option to get support for the ROHM BD71828 Power
> -	  Management IC. BD71828GW is a single-chip power management IC for
> -	  battery-powered portable devices. The IC integrates 7 buck
> -	  converters, 7 LDOs, and a 1500 mA single-cell linear charger.
> -	  Also included is a Coulomb counter, a real-time clock (RTC), and
> -	  a 32.768 kHz clock gate.
> +	  Select this option to get support for the ROHM BD71828 and BD71815
> +	  Power Management ICs. BD71828GW and BD71815AGW are single-chip power
> +	  management ICs mainly for battery-powered portable devices.
> +	  The BD71828 integrates 7 buck converters and 7 LDOs. The BD71815
> +	  has 5 bucks, 7 LDOs, and a boost for driving LEDs. Both ICs provide
> +	  also a single-cell linear charger, a Coulomb counter, a real-time
> +	  clock (RTC), GPIOs and a 32.768 kHz clock gate.
>  
>  config MFD_STM32_LPTIMER
>  	tristate "Support for STM32 Low-Power Timer"
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index 210261d026f2..28b82477ce4c 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -2,7 +2,7 @@
>  //
>  // Copyright (C) 2019 ROHM Semiconductors
>  //
> -// ROHM BD71828 PMIC driver
> +// ROHM BD71828/BD71815 PMIC driver
>  
>  #include <linux/gpio_keys.h>
>  #include <linux/i2c.h>
> @@ -11,7 +11,9 @@
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
>  #include <linux/mfd/core.h>
> +#include <linux/mfd/rohm-bd71815.h>
>  #include <linux/mfd/rohm-bd71828.h>
> +#include <linux/mfd/rohm-generic.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/regmap.h>
> @@ -29,12 +31,102 @@ static struct gpio_keys_platform_data bd71828_powerkey_data = {
>  	.name = "bd71828-pwrkey",
>  };
>  
> -static const struct resource rtc_irqs[] = {
> +static const struct resource bd71815_rtc_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd71815-rtc-alm-0"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd71815-rtc-alm-1"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd71815-rtc-alm-2"),
> +};
> +
> +static const struct resource bd71828_rtc_irqs[] = {
>  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
>  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
>  	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
>  };
>  
> +static struct resource bd71815_power_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_RMV, "bd71815-dcin-rmv"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_OUT, "bd71815-clps-out"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_IN, "bd71815-clps-in"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_RES, "bd71815-dcin-ovp-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_OVP_DET, "bd71815-dcin-ovp-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_RES, "bd71815-dcin-mon-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_MON_DET, "bd71815-dcin-mon-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_RES, "bd71815-vsys-uv-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_UV_DET, "bd71815-vsys-uv-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_RES, "bd71815-vsys-low-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_LOW_DET, "bd71815-vsys-low-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-mon-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_VSYS_MON_RES, "bd71815-vsys-mon-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TEMP, "bd71815-chg-wdg-temp"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_WDG_TIME, "bd71815-chg-wdg"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_RES, "bd71815-rechg-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RECHARGE_DET, "bd71815-rechg-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_RANGED_TEMP_TRANSITION,
> +			     "bd71815-ranged-temp-transit"),

The new line limit is 100.  Feel free to run these out.

> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_CHG_STATE_TRANSITION,
> +			     "bd71815-chg-state-change"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_TEMP_NORMAL,
> +			     "bd71815-bat-temp-normal"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_TEMP_ERANGE,
> +			     "bd71815-bat-temp-erange"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_REMOVED, "bd71815-bat-rmv"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_DETECTED, "bd71815-bat-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_THERM_REMOVED, "bd71815-therm-rmv"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_THERM_DETECTED, "bd71815-therm-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_DEAD, "bd71815-bat-dead"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_SHORTC_RES,
> +			     "bd71815-bat-short-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_SHORTC_DET,
> +			     "bd71815-bat-short-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_LOW_VOLT_RES,
> +			     "bd71815-bat-low-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_LOW_VOLT_DET,
> +			     "bd71815-bat-low-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_VOLT_RES,
> +			     "bd71815-bat-over-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_VOLT_DET,
> +			     "bd71815-bat-over-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_MON_RES, "bd71815-bat-mon-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_MON_DET, "bd71815-bat-mon-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_CC_MON1, "bd71815-bat-cc-mon1"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_CC_MON2, "bd71815-bat-cc-mon2"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_CC_MON3, "bd71815-bat-cc-mon3"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_1_RES,
> +			     "bd71815-bat-oc1-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_1_DET,
> +			     "bd71815-bat-oc1-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_2_RES,
> +			     "bd71815-bat-oc2-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_2_DET,
> +			     "bd71815-bat-oc2-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_3_RES,
> +			     "bd71815-bat-oc3-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_BAT_OVER_CURR_3_DET,
> +			     "bd71815-bat-oc3-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_LOW_RES,
> +			     "bd71815-bat-low-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_LOW_DET,
> +			     "bd71815-bat-low-det"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_HI_RES, "bd71815-bat-hi-res"),
> +	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_HI_DET, "bd71815-bat-hi-det"),
> +};

[...]

> +static const struct regmap_irq bd71815_irqs[] = {

[...]

> +	REGMAP_IRQ_REG(BD71815_INT_TEMP_CHIP_OVER_VF_DET, 10,
> +		       BD71815_INT_TEMP_CHIP_OVER_VF_DET_MASK),

As above.

> +	/* RTC Alarm */
> +	REGMAP_IRQ_REG(BD71815_INT_RTC0, 11, BD71815_INT_RTC0_MASK),
> +	REGMAP_IRQ_REG(BD71815_INT_RTC1, 11, BD71815_INT_RTC1_MASK),
> +	REGMAP_IRQ_REG(BD71815_INT_RTC2, 11, BD71815_INT_RTC2_MASK),
> +};

[...]

> +static int set_clk_mode(struct device *dev, struct regmap *regmap,
> +			int clkmode_reg)
> +{
> +	int ret;
> +	const char *mode;
> +
> +	ret = of_property_read_string_index(dev->of_node, "rohm,clkout-mode", 0,
> +					    &mode);
> +	if (ret) {
> +		if (ret == -EINVAL)
> +			return 0;
> +		return ret;
> +	}
> +	if (!strncmp(mode, "open-drain", 10)) {
> +		dev_dbg(dev, "configuring clk32kout as open-drain");

Do you *really* need these?

> +		ret = regmap_update_bits(regmap, clkmode_reg, OUT32K_MODE,
> +					 OUT32K_MODE_OPEN_DRAIN);
> +	} else if (!strncmp(mode, "cmos", 4)) {
> +		dev_dbg(dev, "configuring clk32kout as cmos");
> +		ret = regmap_update_bits(regmap, clkmode_reg, OUT32K_MODE,
> +					 OUT32K_MODE_CMOS);
> +	} else {
> +		dev_err(dev, "bad clk32kout mode configuration");
> +		return -EINVAL;
> +	}
> +	return ret;
> +}
> +
>  static int bd71828_i2c_probe(struct i2c_client *i2c)
>  {
> -	struct rohm_regmap_dev *chip;
>  	struct regmap_irq_chip_data *irq_data;
>  	int ret;
> +	struct regmap *regmap;
> +	const struct regmap_config *regmap_config;
> +	struct regmap_irq_chip *irqchip;
> +	unsigned int chip_type;
> +	struct mfd_cell *mfd;
> +	int cells;
> +	int button_irq;
> +	int clkmode_reg;
>  
>  	if (!i2c->irq) {
>  		dev_err(&i2c->dev, "No IRQ configured\n");
>  		return -EINVAL;
>  	}
>  
> -	chip = devm_kzalloc(&i2c->dev, sizeof(*chip), GFP_KERNEL);
> -	if (!chip)
> -		return -ENOMEM;
> -
> -	dev_set_drvdata(&i2c->dev, chip);
> +	chip_type = (unsigned int)(uintptr_t)
> +		    of_device_get_match_data(&i2c->dev);
> +	switch (chip_type) {
> +	case ROHM_CHIP_TYPE_BD71828:
> +		mfd = bd71828_mfd_cells;
> +		cells = ARRAY_SIZE(bd71828_mfd_cells);
> +		regmap_config = &bd71828_regmap;
> +		irqchip = &bd71828_irq_chip;
> +		clkmode_reg = BD71815_REG_OUT32K;
> +		button_irq = BD71828_INT_SHORTPUSH;
> +		dev_info(&i2c->dev, "BD71828 found\n");
> +		break;
> +	case ROHM_CHIP_TYPE_BD71815:
> +		mfd = bd71815_mfd_cells;
> +		cells = ARRAY_SIZE(bd71815_mfd_cells);
> +		regmap_config = &bd71815_regmap;
> +		irqchip = &bd71815_irq_chip;
> +		clkmode_reg = BD71828_REG_OUT32K;
> +		/*
> +		 * If BD71817 support is needed we should be able to handle it
> +		 * with proper DT configs + BD71815 drivers + power-button.
> +		 * BD71815 data-sheet does not list the power-button IRQ so we
> +		 * don't use it.
> +		 */
> +		button_irq = 0;
> +		dev_info(&i2c->dev, "BD71815 found\n");

Again, are these *really* useful to you and/or your users?

Besides, this device not *found* i.e. scanned/read and instantiated,
it has simply been matched from the local DTB.  It can still be
wrong.  You can probably omit them.

[...]

> diff --git a/include/linux/mfd/rohm-bd71815.h b/include/linux/mfd/rohm-bd71815.h
> new file mode 100644
> index 000000000000..8ee5874a5b73
> --- /dev/null
> +++ b/include/linux/mfd/rohm-bd71815.h
> @@ -0,0 +1,561 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright 2014 Embest Technology Co. Ltd. Inc.

Jeeze!  Is this for the Amiga?

> + * Author: yanglsh@embest-tech.com
> + *
> + * 2020, 2021 Heavily modified by:

You should probably add a proper copyright.

> + *	 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> + */
> +
> +#ifndef _MFD_BD71815_H
> +#define _MFD_BD71815_H
> +
> +#include <linux/regmap.h>

[...]

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
