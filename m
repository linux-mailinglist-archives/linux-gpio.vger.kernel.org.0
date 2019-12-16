Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E214120FF9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 17:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfLPQqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 11:46:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33387 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfLPQqq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 11:46:46 -0500
Received: by mail-wr1-f65.google.com with SMTP id b6so8146795wrq.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ab4nwpk2yisX3xF4ivobeAXNHO9OWkb9eKW4o4SL92I=;
        b=a55i569Q8FdTaCI/3sqzFir5uI6A1Pave8GwPF9d1kfsuKvHYBqBzeLsnJCLWEkFpD
         R/zM6UWdKuPKk/w151zqxZgwxvrpkniQP5f0KEJzVCswvpoa870avq8TuIMJ3QEYHIGA
         pUn5enc/eLmV3MNKUS+n3LQCw0OD1CkAOqAMG0naZRnpA1vh/oBYed497HEC1+2lq6oe
         vW8xiaWDgrm9i00nOong2NFp8HX1KOMskUnR2u0g7ZvCYzmX8Fu+jTiFfqrrGWFIfQXh
         51w3Qbvt6eC6M5oJcxMRp+FF3Sm0MIptTsMj2+QA7LHrWLDv77kpIAvpqJuMlBdXfctD
         bS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Ab4nwpk2yisX3xF4ivobeAXNHO9OWkb9eKW4o4SL92I=;
        b=tCG95yYsESIfSnQJzhprCHvQQl0VHotRpn4wFqdIY8nI/hDnZEx65gMktRpRZWHZda
         Vv8ZJmwoEBNni5BQF3pCXvbSOEvUtdkbV5QHFCqFFeQddZ/Wb3oKUHxH6LJL3K9cv2kW
         mwfGgcYt4G9weAH5w/vNLHEA3XCtfAiThgc7KdYe343fRurRSp1iEuGGgZ1h1iSdC+iE
         iS9adVqzstB77/5JcML1lXoP5IcMKF5PvKTDOdc6CsX6vbYPggddelcfD82WbjaFHHN0
         c4574xgGrVaFPUe5g2yd7dDFBuLDVgkFPFjmxrQGLAusGjR9KgNW4Z/DvJCS2UswDBcK
         +KzQ==
X-Gm-Message-State: APjAAAWcWjekkt16d63GOVeun9RVZ627fYFPCUxTWTMhLhRqg84KS2UX
        Oe18K4XIPYvf5hgXjVd0+/O1gg==
X-Google-Smtp-Source: APXvYqyaWExKJAgXJaOr3bERea4KHsa7HFSKBwiBfjzRxEiUVn0eS2GK1rRx3jZ6CCIsiseJHOClig==
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr31129765wrs.159.1576514803297;
        Mon, 16 Dec 2019 08:46:43 -0800 (PST)
Received: from dell ([185.17.149.202])
        by smtp.gmail.com with ESMTPSA id q11sm22108191wrp.24.2019.12.16.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 08:46:42 -0800 (PST)
Date:   Mon, 16 Dec 2019 16:46:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 05/15] mfd: bd71828: Support ROHM BD71828 PMIC - core
Message-ID: <20191216164641.GC18955@dell>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <252de5646fedfec7c575269843a47091fe199c79.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <252de5646fedfec7c575269843a47091fe199c79.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 11 Dec 2019, Matti Vaittinen wrote:

> BD71828GW is a single-chip power management IC for battery-powered portable
> devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA
> single-cell linear charger. Also included is a Coulomb counter, a real-time
> clock (RTC), 3 GPO/regulator control pins, HALL input and a 32.768 kHz
> clock gate.
> 
> Add MFD core driver providing interrupt controller facilities and i2c
> access to sub device drivers.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes since v5:
> - No changes
> 
>  drivers/mfd/Kconfig              |  15 ++
>  drivers/mfd/Makefile             |   2 +-
>  drivers/mfd/rohm-bd71828.c       | 319 +++++++++++++++++++++++
>  include/linux/mfd/rohm-bd71828.h | 425 +++++++++++++++++++++++++++++++
>  include/linux/mfd/rohm-generic.h |   1 +
>  5 files changed, 761 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mfd/rohm-bd71828.c
>  create mode 100644 include/linux/mfd/rohm-bd71828.h

Couple of small nits.  Once fixed, please apply my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 420900852166..c3c9432ef51c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1906,6 +1906,21 @@ config MFD_ROHM_BD70528
>  	  10 bits SAR ADC for battery temperature monitor and 1S battery
>  	  charger.
>  
> +config MFD_ROHM_BD71828
> +	tristate "ROHM BD71828 Power Management IC"
> +	depends on I2C=y
> +	depends on OF
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	select MFD_CORE
> +	help
> +	  Select this option to get support for the ROHM BD71828 Power
> +	  Management IC. BD71828GW is a single-chip power management IC for
> +	  battery-powered portable devices. The IC integrates 7 buck
> +	  converters, 7 LDOs, and a 1500 mA single-cell linear charger.
> +	  Also included is a Coulomb counter, a real-time clock (RTC), and
> +	  a 32.768 kHz clock gate.
> +
>  config MFD_STM32_LPTIMER
>  	tristate "Support for STM32 Low-Power Timer"
>  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index aed99f08739f..ca2d55c679c5 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -252,6 +252,6 @@ obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
>  obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
>  obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>  obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
> +obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
>  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
>  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
> -

Nit: This is an unrelated change and should not really be in this
patch.

> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> new file mode 100644
> index 000000000000..7f445d699fd9
> --- /dev/null
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (C) 2019 ROHM Semiconductors
> +//
> +// ROHM BD71828 PMIC driver
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/rohm-bd71828.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +static const struct resource rtc_irqs[] = {
> +	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
> +	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
> +	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
> +};
> +
> +static struct mfd_cell bd71828_mfd_cells[] = {
> +	{ .name = "bd71828-pmic", },
> +	{ .name = "bd71828-gpio", },
> +	{ .name = "bd71828-led", .of_compatible = "rohm,bd71828-leds" },
> +	/*
> +	 * We use BD71837 driver to drive the clock block. Only differences to
> +	 * BD70528 clock gate are the register address and mask.
> +	 */
> +	{ .name = "bd71828-clk", },
> +	{ .name = "bd71827-power", },
> +	{
> +		.name = "bd71828-rtc",
> +		.resources = rtc_irqs,
> +		.num_resources = ARRAY_SIZE(rtc_irqs),
> +	},
> +};
> +
> +static const struct regmap_range volatile_ranges[] = {
> +	{
> +		.range_min = BD71828_REG_PS_CTRL_1,
> +		.range_max = BD71828_REG_PS_CTRL_1,
> +	}, {
> +		.range_min = BD71828_REG_PS_CTRL_3,
> +		.range_max = BD71828_REG_PS_CTRL_3,
> +	}, {
> +		.range_min = BD71828_REG_RTC_SEC,
> +		.range_max = BD71828_REG_RTC_YEAR,
> +	}, {
> +		/*
> +		 * For now make all charger registers volatile because many
> +		 * needs to be and because the charger block is not that
> +		 * performance critical.
> +		 */
> +		.range_min = BD71828_REG_CHG_STATE,
> +		.range_max = BD71828_REG_CHG_FULL,
> +	}, {
> +		.range_min = BD71828_REG_INT_MAIN,
> +		.range_max = BD71828_REG_IO_STAT,
> +	},
> +};
> +
> +static const struct regmap_access_table volatile_regs = {
> +	.yes_ranges = &volatile_ranges[0],
> +	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
> +};
> +
> +static struct regmap_config bd71828_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.volatile_table = &volatile_regs,
> +	.max_register = BD71828_MAX_REGISTER,
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +/*
> + * Mapping of main IRQ register bits to sub-IRQ register offsets so that we can
> + * access corect sub-IRQ registers based on bits that are set in main IRQ
> + * register.
> + */
> +
> +static unsigned int bit0_offsets[] = {11};		/* RTC IRQ */
> +static unsigned int bit1_offsets[] = {10};		/* TEMP IRQ */
> +static unsigned int bit2_offsets[] = {6, 7, 8, 9};	/* BAT MON IRQ */
> +static unsigned int bit3_offsets[] = {5};		/* BAT IRQ */
> +static unsigned int bit4_offsets[] = {4};		/* CHG IRQ */
> +static unsigned int bit5_offsets[] = {3};		/* VSYS IRQ */
> +static unsigned int bit6_offsets[] = {1, 2};		/* DCIN IRQ */
> +static unsigned int bit7_offsets[] = {0};		/* BUCK IRQ */
> +
> +static struct regmap_irq_sub_irq_map bd71828_sub_irq_offsets[] = {
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit3_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit4_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit5_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit6_offsets),
> +	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
> +};
> +
> +static struct regmap_irq bd71828_irqs[] = {
> +	REGMAP_IRQ_REG(BD71828_INT_BUCK1_OCP, 0, BD71828_INT_BUCK1_OCP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BUCK2_OCP, 0, BD71828_INT_BUCK2_OCP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BUCK3_OCP, 0, BD71828_INT_BUCK3_OCP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BUCK4_OCP, 0, BD71828_INT_BUCK4_OCP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BUCK5_OCP, 0, BD71828_INT_BUCK5_OCP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BUCK6_OCP, 0, BD71828_INT_BUCK6_OCP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BUCK7_OCP, 0, BD71828_INT_BUCK7_OCP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_PGFAULT, 0, BD71828_INT_PGFAULT_MASK),
> +	/* DCIN1 interrupts */
> +	REGMAP_IRQ_REG(BD71828_INT_DCIN_DET, 1, BD71828_INT_DCIN_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_DCIN_RMV, 1, BD71828_INT_DCIN_RMV_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CLPS_OUT, 1, BD71828_INT_CLPS_OUT_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CLPS_IN, 1, BD71828_INT_CLPS_IN_MASK),
> +	/* DCIN2 interrupts */
> +	REGMAP_IRQ_REG(BD71828_INT_DCIN_MON_RES, 2,
> +		       BD71828_INT_DCIN_MON_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_DCIN_MON_DET, 2,
> +		       BD71828_INT_DCIN_MON_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_LONGPUSH, 2, BD71828_INT_LONGPUSH_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_MIDPUSH, 2, BD71828_INT_MIDPUSH_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_SHORTPUSH, 2, BD71828_INT_SHORTPUSH_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_PUSH, 2, BD71828_INT_PUSH_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_WDOG, 2, BD71828_INT_WDOG_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_SWRESET, 2, BD71828_INT_SWRESET_MASK),
> +	/* Vsys */
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_UV_RES, 3,
> +		       BD71828_INT_VSYS_UV_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_UV_DET, 3,
> +		       BD71828_INT_VSYS_UV_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_LOW_RES, 3,
> +		       BD71828_INT_VSYS_LOW_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_LOW_DET, 3,
> +		       BD71828_INT_VSYS_LOW_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_HALL_IN, 3,
> +		       BD71828_INT_VSYS_HALL_IN_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_HALL_TOGGLE, 3,
> +		       BD71828_INT_VSYS_HALL_TOGGLE_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_MON_RES, 3,
> +		       BD71828_INT_VSYS_MON_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_VSYS_MON_DET, 3,
> +		       BD71828_INT_VSYS_MON_DET_MASK),
> +	/* Charger */
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_DCIN_ILIM, 4,
> +		       BD71828_INT_CHG_DCIN_ILIM_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_TOPOFF_TO_DONE, 4,
> +		       BD71828_INT_CHG_TOPOFF_TO_DONE_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_WDG_TEMP, 4,
> +		       BD71828_INT_CHG_WDG_TEMP_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_WDG_TIME, 4,
> +		       BD71828_INT_CHG_WDG_TIME_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_RECHARGE_RES, 4,
> +		       BD71828_INT_CHG_RECHARGE_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_RECHARGE_DET, 4,
> +		       BD71828_INT_CHG_RECHARGE_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_RANGED_TEMP_TRANSITION, 4,
> +		       BD71828_INT_CHG_RANGED_TEMP_TRANSITION_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_CHG_STATE_TRANSITION, 4,
> +		       BD71828_INT_CHG_STATE_TRANSITION_MASK),
> +	/* Battery */
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_TEMP_NORMAL, 5,
> +		       BD71828_INT_BAT_TEMP_NORMAL_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_TEMP_ERANGE, 5,
> +		       BD71828_INT_BAT_TEMP_ERANGE_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_TEMP_WARN, 5,
> +		       BD71828_INT_BAT_TEMP_WARN_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_REMOVED, 5,
> +		       BD71828_INT_BAT_REMOVED_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_DETECTED, 5,
> +		       BD71828_INT_BAT_DETECTED_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_THERM_REMOVED, 5,
> +		       BD71828_INT_THERM_REMOVED_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_THERM_DETECTED, 5,
> +		       BD71828_INT_THERM_DETECTED_MASK),
> +	/* Battery Mon 1 */
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_DEAD, 6, BD71828_INT_BAT_DEAD_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_SHORTC_RES, 6,
> +		       BD71828_INT_BAT_SHORTC_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_SHORTC_DET, 6,
> +		       BD71828_INT_BAT_SHORTC_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_LOW_VOLT_RES, 6,
> +		       BD71828_INT_BAT_LOW_VOLT_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_LOW_VOLT_DET, 6,
> +		       BD71828_INT_BAT_LOW_VOLT_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_VOLT_RES, 6,
> +		       BD71828_INT_BAT_OVER_VOLT_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_VOLT_DET, 6,
> +		       BD71828_INT_BAT_OVER_VOLT_DET_MASK),
> +	/* Battery Mon 2 */
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_MON_RES, 7,
> +		       BD71828_INT_BAT_MON_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_MON_DET, 7,
> +		       BD71828_INT_BAT_MON_DET_MASK),
> +	/* Battery Mon 3 (Coulomb counter) */
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_CC_MON1, 8,
> +		       BD71828_INT_BAT_CC_MON1_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_CC_MON2, 8,
> +		       BD71828_INT_BAT_CC_MON2_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_CC_MON3, 8,
> +		       BD71828_INT_BAT_CC_MON3_MASK),
> +	/* Battery Mon 4 */
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_1_RES, 9,
> +		       BD71828_INT_BAT_OVER_CURR_1_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_1_DET, 9,
> +		       BD71828_INT_BAT_OVER_CURR_1_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_2_RES, 9,
> +		       BD71828_INT_BAT_OVER_CURR_2_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_2_DET, 9,
> +		       BD71828_INT_BAT_OVER_CURR_2_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_3_RES, 9,
> +		       BD71828_INT_BAT_OVER_CURR_3_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_BAT_OVER_CURR_3_DET, 9,
> +		       BD71828_INT_BAT_OVER_CURR_3_DET_MASK),
> +	/* Temperature */
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_LOW_RES, 10,
> +		       BD71828_INT_TEMP_BAT_LOW_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_LOW_DET, 10,
> +		       BD71828_INT_TEMP_BAT_LOW_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_HI_RES, 10,
> +		       BD71828_INT_TEMP_BAT_HI_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_BAT_HI_DET, 10,
> +		       BD71828_INT_TEMP_BAT_HI_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_125_RES, 10,
> +		       BD71828_INT_TEMP_CHIP_OVER_125_RES_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_125_DET, 10,
> +		       BD71828_INT_TEMP_CHIP_OVER_125_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_VF_DET, 10,
> +		       BD71828_INT_TEMP_CHIP_OVER_VF_DET_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_TEMP_CHIP_OVER_VF_RES, 10,
> +		       BD71828_INT_TEMP_CHIP_OVER_VF_RES_MASK),
> +	/* RTC Alarm */
> +	REGMAP_IRQ_REG(BD71828_INT_RTC0, 11, BD71828_INT_RTC0_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_RTC1, 11, BD71828_INT_RTC1_MASK),
> +	REGMAP_IRQ_REG(BD71828_INT_RTC2, 11, BD71828_INT_RTC2_MASK),
> +};
> +
> +static struct regmap_irq_chip bd71828_irq_chip = {
> +	.name = "bd71828_irq",
> +	.main_status = BD71828_REG_INT_MAIN,
> +	.irqs = &bd71828_irqs[0],
> +	.num_irqs = ARRAY_SIZE(bd71828_irqs),
> +	.status_base = BD71828_REG_INT_BUCK,
> +	.mask_base = BD71828_REG_INT_MASK_BUCK,
> +	.ack_base = BD71828_REG_INT_BUCK,
> +	.mask_invert = true,
> +	.init_ack_masked = true,
> +	.num_regs = 12,
> +	.num_main_regs = 1,
> +	.sub_reg_offsets = &bd71828_sub_irq_offsets[0],
> +	.num_main_status_bits = 8,
> +	.irq_reg_stride = 1,
> +};
> +
> +static int bd71828_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct rohm_regmap_dev *chip;
> +	struct regmap_irq_chip_data *irq_data;
> +	int ret;
> +
> +	if (!i2c->irq) {
> +		dev_err(&i2c->dev, "No IRQ configured\n");
> +		return -EINVAL;
> +	}
> +
> +	chip = devm_kzalloc(&i2c->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&i2c->dev, chip);
> +
> +	chip->regmap = devm_regmap_init_i2c(i2c, &bd71828_regmap);
> +	if (IS_ERR(chip->regmap)) {
> +		dev_err(&i2c->dev, "Failed to initialize Regmap\n");
> +		return PTR_ERR(chip->regmap);
> +	}
> +
> +	ret = devm_regmap_add_irq_chip(&i2c->dev, chip->regmap,
> +				       i2c->irq, IRQF_ONESHOT, 0,
> +				       &bd71828_irq_chip, &irq_data);
> +	if (ret) {
> +		dev_err(&i2c->dev, "Failed to add IRQ chip\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(&i2c->dev, "Registered %d IRQs for chip\n",
> +		bd71828_irq_chip.num_irqs);
> +
> +	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> +				   bd71828_mfd_cells,
> +				   ARRAY_SIZE(bd71828_mfd_cells), NULL, 0,
> +				   regmap_irq_get_domain(irq_data));
> +	if (ret)
> +		dev_err(&i2c->dev, "Failed to create subdevices\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id bd71828_of_match[] = {
> +	{ .compatible = "rohm,bd71828", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, bd71828_of_match);
> +
> +static struct i2c_driver bd71828_drv = {
> +	.driver = {
> +		.name = "rohm-bd71828",
> +		.of_match_table = bd71828_of_match,
> +	},
> +	.probe_new = &bd71828_i2c_probe,
> +};
> +

Nit: You can remove this line.

> +module_i2c_driver(bd71828_drv);
> +
> +MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
> +MODULE_DESCRIPTION("ROHM BD71828 Power Management IC driver");
> +MODULE_LICENSE("GPL");

This does not match the header.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
