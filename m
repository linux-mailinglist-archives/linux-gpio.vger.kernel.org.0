Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7355EDEA01
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 12:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfJUKqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 06:46:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32795 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbfJUKqS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 06:46:18 -0400
Received: by mail-wr1-f68.google.com with SMTP id s1so4611822wro.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fBo1+HCeMV1YXAlWKCtAuQFnV7KnLzFAUah7I6NP9lI=;
        b=X877r9tJBpulXjd4ktLhwl3lgE+BHcQFJoX/zaeJGl53XFB7ys0/5SZzeBv1WLz/kk
         wfmVd7XBAqpm4ZGH71JFH9+eWjn63aTzwdNFON+hT/smzkQYuQDt413QhuAXMrN+mPlC
         sQswBLFHG4R01NOX9lQVLajWNmksRnLrIFgYteF6bThUh5Kb9nId5tTPoLsHoXd+tQG2
         EDL3C8e6jfsSTefzQO9Z5OA20tpWVp1DYILwQT5XZ6eB+4GTRAVN9O1eTkaFr94nK1wU
         FO1aVckezY76jqQ/2psPnxKBS/V0oIKsLPS5uBxrEeUC5qcXJti4/9cKEkiJI0xbZAuR
         uWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fBo1+HCeMV1YXAlWKCtAuQFnV7KnLzFAUah7I6NP9lI=;
        b=T+63xFIg7SpYQF6ekJ1cDubrQKJAn6fuc5hXTavaVFXO7g1NcDWTE0Csj6e+/WLELH
         KHsHSQRZS6cEI4njDpTKPZH2hnY0a3kVxiFTMndS7CXhJbP9DzqmlrrFtkPreSy+lcKm
         8ej7t0eSunroPdy6y0J9ZPGL96VOeSQdLklFvPaokh1LB5TB3VnR9GT/7Ss9CEMfgEXq
         totYEnphwu+AgKPJuPdzv2RAuTjK+aeC2eQRAjvaxiGyzrPD5nf9jj7GIJgKFR4dA0Dl
         CdiAjBYAR9z2LSgN1JwKOTLhcq0n8X2KAj7flnDtZSae3gO1DBzMg50Sb67gUUJ6I8GH
         5ojw==
X-Gm-Message-State: APjAAAUOqrSTC3lrY3NUgGrs5fON282OSi0FrBST1TM5KjoS2CvvGJI8
        of+BomStwO/YSZQOcQpWZuwsHA==
X-Google-Smtp-Source: APXvYqwHQtEoMhkDuStyIn5FzNV1scIY8dvmt4vwCkW7NxJmrLBCpkLhCF0I5EkhKaCpTKqr/kMH0Q==
X-Received: by 2002:adf:db04:: with SMTP id s4mr16868612wri.12.1571654773647;
        Mon, 21 Oct 2019 03:46:13 -0700 (PDT)
Received: from dell ([95.149.164.99])
        by smtp.gmail.com with ESMTPSA id s12sm15264345wra.82.2019.10.21.03.46.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:46:13 -0700 (PDT)
Date:   Mon, 21 Oct 2019 11:46:11 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
Message-ID: <20191021104611.GZ4365@dell>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 18 Oct 2019, Srinivas Kandagatla wrote:

> Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
> 
> This codec has integrated SoundWire controller, pin controller and
> interrupt controller.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/mfd/Kconfig                   |   8 +
>  drivers/mfd/Makefile                  |   1 +
>  drivers/mfd/wcd934x.c                 | 330 ++++++++++++++++
>  include/linux/mfd/wcd934x/registers.h | 529 ++++++++++++++++++++++++++
>  include/linux/mfd/wcd934x/wcd934x.h   |  24 ++
>  5 files changed, 892 insertions(+)
>  create mode 100644 drivers/mfd/wcd934x.c
>  create mode 100644 include/linux/mfd/wcd934x/registers.h
>  create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae24d3ea68ea..ab09862b5996 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1967,6 +1967,14 @@ config MFD_STMFX
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_WCD934X
> +	tristate "Support for WCD9340/WCD9341 Codec"
> +	depends on SLIMBUS
> +	select REGMAP
> +	select REGMAP_SLIMBUS
> +	select REGMAP_IRQ
> +	select MFD_CORE
> +

No help?

>  menu "Multimedia Capabilities Port drivers"
>  	depends on ARCH_SA1100
>  
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c1067ea46204..8059a9c36188 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -58,6 +58,7 @@ endif
>  ifeq ($(CONFIG_MFD_CS47L24),y)
>  obj-$(CONFIG_MFD_ARIZONA)	+= cs47l24-tables.o
>  endif
> +obj-$(CONFIG_MFD_WCD934X)	+= wcd934x.o
>  obj-$(CONFIG_MFD_WM8400)	+= wm8400-core.o
>  wm831x-objs			:= wm831x-core.o wm831x-irq.o wm831x-otp.o
>  wm831x-objs			+= wm831x-auxadc.o
> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> new file mode 100644
> index 000000000000..bb4d2a6c89bc
> --- /dev/null
> +++ b/drivers/mfd/wcd934x.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <linux/clk.h>
> +#include <linux/gpio.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/wcd934x/registers.h>
> +#include <linux/mfd/wcd934x/wcd934x.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slimbus.h>
> +
> +static const struct mfd_cell wcd934x_devices[] = {
> +	{ /* Audio Codec */

These comments aren't required.  The .names are good enough.

> +		.name = "wcd934x-codec",
> +	}, { /* Pin controller */
> +		.name = "wcd934x-pinctrl",
> +		.of_compatible = "qcom,wcd9340-pinctrl",
> +	}, { /* Soundwire Controller */
> +		.name = "wcd934x-soundwire",
> +		.of_compatible = "qcom,soundwire-v1.3.0",
> +	},
> +};
> +
> +static const struct regmap_irq wcd934x_irqs[] = {
> +	/* INTR_REG 0 */

Again, doesn't really add or explain anything additional.

> +	[WCD934X_IRQ_SLIMBUS] = {
> +		.reg_offset = 0,
> +		.mask = BIT(0),
> +		.type = {
> +			.type_reg_offset = 0,
> +			.types_supported = IRQ_TYPE_EDGE_BOTH,
> +			.type_reg_mask  = BIT(0),
> +			.type_level_low_val = BIT(0),
> +			.type_level_high_val = BIT(0),
> +			.type_falling_val = 0,
> +			.type_rising_val = 0,
> +		},
> +	},
> +	[WCD934X_IRQ_SOUNDWIRE] = {
> +		.reg_offset = 2,
> +		.mask = BIT(4),
> +		.type = {
> +			.type_reg_offset = 2,
> +			.types_supported = IRQ_TYPE_EDGE_BOTH,
> +			.type_reg_mask  = BIT(4),
> +			.type_level_low_val = BIT(4),
> +			.type_level_high_val = BIT(4),
> +			.type_falling_val = 0,
> +			.type_rising_val = 0,
> +		},
> +	},
> +};
> +
> +static const struct regmap_irq_chip wcd934x_regmap_irq_chip = {
> +	.name = "wcd934x_irq",
> +	.status_base = WCD934X_INTR_PIN1_STATUS0,
> +	.mask_base = WCD934X_INTR_PIN1_MASK0,
> +	.ack_base = WCD934X_INTR_PIN1_CLEAR0,
> +	.type_base = WCD934X_INTR_LEVEL0,
> +	.num_type_reg = 4,
> +	.type_in_mask = false,
> +	.num_regs = 4,
> +	.irqs = wcd934x_irqs,
> +	.num_irqs = ARRAY_SIZE(wcd934x_irqs),
> +};
> +
> +static bool wcd934x_is_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case WCD934X_INTR_PIN1_STATUS0...WCD934X_INTR_PIN2_CLEAR3:
> +	case WCD934X_SWR_AHB_BRIDGE_RD_DATA_0:
> +	case WCD934X_SWR_AHB_BRIDGE_RD_DATA_1:
> +	case WCD934X_SWR_AHB_BRIDGE_RD_DATA_2:
> +	case WCD934X_SWR_AHB_BRIDGE_RD_DATA_3:
> +	case WCD934X_SWR_AHB_BRIDGE_ACCESS_STATUS:
> +	case WCD934X_ANA_MBHC_RESULT_3:
> +	case WCD934X_ANA_MBHC_RESULT_2:
> +	case WCD934X_ANA_MBHC_RESULT_1:
> +	case WCD934X_ANA_MBHC_MECH:
> +	case WCD934X_ANA_MBHC_ELECT:
> +	case WCD934X_ANA_MBHC_ZDET:
> +	case WCD934X_ANA_MICB2:
> +	case WCD934X_ANA_RCO:
> +	case WCD934X_ANA_BIAS:
> +		return true;
> +	default:
> +		return false;
> +	}
> +
> +};
> +
> +static const struct regmap_range_cfg wcd934x_ranges[] = {
> +	{	.name = "WCD934X",
> +		.range_min =  0x0,
> +		.range_max =  WCD934X_MAX_REGISTER,
> +		.selector_reg = WCD934X_SEL_REGISTER,
> +		.selector_mask = WCD934X_SEL_MASK,
> +		.selector_shift = WCD934X_SEL_SHIFT,
> +		.window_start = WCD934X_WINDOW_START,
> +		.window_len = WCD934X_WINDOW_LENGTH,
> +	},
> +};
> +
> +static struct regmap_config wcd934x_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.max_register = 0xffff,
> +	.can_multi_write = true,
> +	.ranges = wcd934x_ranges,
> +	.num_ranges = ARRAY_SIZE(wcd934x_ranges),
> +	.volatile_reg = wcd934x_is_volatile_register,
> +};
> +
> +static int wcd934x_parse_resources(struct wcd934x_data *wcd)
> +{
> +	struct device *dev = wcd->dev;

Since most things stem from the device, it's more common to pass that
instead.  You can then use dev_get_drvdata() to obtain the device
data.

> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	wcd->irq = of_irq_get(wcd->dev->of_node, 0);
> +	if (wcd->irq < 0) {
> +		if (wcd->irq != -EPROBE_DEFER)
> +			dev_err(wcd->dev, "Failed to get IRQ: err = %d\n",
> +				wcd->irq);
> +		return wcd->irq;
> +	}
> +
> +	wcd->reset_gpio = of_get_named_gpio(np,	"reset-gpios", 0);
> +	if (wcd->reset_gpio < 0) {
> +		dev_err(dev, "Failed to get reset gpio: err = %d\n",
> +			wcd->reset_gpio);
> +		return wcd->reset_gpio;
> +	}
> +
> +	wcd->extclk = devm_clk_get(dev, "extclk");
> +	if (IS_ERR(wcd->extclk)) {
> +		dev_err(dev, "Failed to get extclk");
> +		return PTR_ERR(wcd->extclk);
> +	}
> +
> +	wcd->supplies[0].supply = "vdd-buck";
> +	wcd->supplies[1].supply = "vdd-buck-sido";
> +	wcd->supplies[2].supply = "vdd-tx";
> +	wcd->supplies[3].supply = "vdd-rx";
> +	wcd->supplies[4].supply = "vdd-io";
> +
> +	ret = regulator_bulk_get(dev, WCD934X_MAX_SUPPLY, wcd->supplies);
> +	if (ret != 0) {
> +		dev_err(dev, "Failed to get supplies: err = %d\n", ret);
> +		return ret;
> +	}

More of a nit-pick really, but I don't see any reason for all of this
not to be in probe.

> +	return 0;
> +}
> +
> +static int wcd934x_power_on_reset(struct wcd934x_data *wcd)
> +{
> +	int ret;
> +
> +	ret = regulator_bulk_enable(WCD934X_MAX_SUPPLY, wcd->supplies);
> +	if (ret != 0) {
> +		dev_err(wcd->dev, "Failed to get supplies: err = %d\n", ret);
> +		return ret;
> +	}

By doing regulator_bulk_{get,enable}() in separate functions, you put
an unnecessary burden on 'struct wcd934x_data'.  Unless of course
you're using 'supplies' to disable and put as well.  Where does that
happen?  Surely you should do that in .remove()?

> +	/*
> +	 * For WCD934X, it takes about 600us for the Vout_A and
> +	 * Vout_D to be ready after BUCK_SIDO is powered up.
> +	 * SYS_RST_N shouldn't be pulled high during this time
> +	 */
> +	usleep_range(600, 650);
> +	gpio_direction_output(wcd->reset_gpio, 0);
> +	msleep(20);
> +	gpio_set_value(wcd->reset_gpio, 1);
> +	msleep(20);
> +
> +	return 0;
> +}
> +
> +static int wcd934x_slim_probe(struct slim_device *sdev)

I'd expect to find the .probe() closer to the bottom of the file.

> +{
> +	struct device *dev = &sdev->dev;
> +	struct wcd934x_data *wcd;

This is actually "ddata".  It's more common to do:

       struct wcd934x_ddata *ddata;

> +	int ret = 0;

Why does this need pre-initialisation?

> +	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
> +	if (!wcd)
> +		return	-ENOMEM;
> +
> +	wcd->dev = dev;

'\n' here.

> +	ret = wcd934x_parse_resources(wcd);
> +	if (ret) {
> +		dev_err(dev, "Error parsing DT: err = %d\n", ret);

You've already printed an error at this point.  No need for another.

> +		return ret;
> +	}
> +
> +	ret = wcd934x_power_on_reset(wcd);
> +	if (ret) {
> +		dev_err(dev, "Error Power resetting device: err = %d\n", ret);

You've already printed an error at this point.  No need for another.

> +		return ret;
> +	}
> +
> +	wcd->sdev = sdev;
> +	dev_set_drvdata(dev, wcd);

Do this first, then you can use dev_get_drvdata() above.

> +	return 0;
> +}
> +
> +static int wcd934x_bring_up(struct wcd934x_data *wcd)
> +{
> +	struct regmap *rm = wcd->regmap;

It's much more common to use 'regmap' or 'map'.

> +	u16 id_minor, id_major;
> +	int ret;
> +
> +	ret = regmap_bulk_read(rm, WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE0,
> +			       (u8 *)&id_minor, sizeof(u16));
> +	if (ret)
> +		return -EINVAL;
> +
> +	ret = regmap_bulk_read(rm, WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE2,
> +			       (u8 *)&id_major, sizeof(u16));
> +	if (ret)
> +		return -EINVAL;
> +
> +	dev_info(wcd->dev, "wcd934x chip id major 0x%x, minor 0x%x\n",
> +		 id_major, id_minor);
> +
> +	regmap_write(rm, WCD934X_CODEC_RPM_RST_CTL, 0x01);
> +	regmap_write(rm, WCD934X_SIDO_NEW_VOUT_A_STARTUP, 0x19);
> +	regmap_write(rm, WCD934X_SIDO_NEW_VOUT_D_STARTUP, 0x15);
> +	/* Add 1msec delay for VOUT to settle */
> +	usleep_range(1000, 1100);
> +	regmap_write(rm, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x5);
> +	regmap_write(rm, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x7);
> +	regmap_write(rm, WCD934X_CODEC_RPM_RST_CTL, 0x3);
> +	regmap_write(rm, WCD934X_CODEC_RPM_RST_CTL, 0x7);
> +	regmap_write(rm, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x3);
> +
> +	return 0;
> +

Superfluous '\n'.

> +}
> +
> +static int wcd934x_slim_status(struct slim_device *sdev,
> +			       enum slim_device_status status)
> +{
> +	struct device *dev = &sdev->dev;
> +	struct wcd934x_data *wcd;
> +	int ret;

This is semantically odd!  Why are you doing most of the
initialisation and bring-up in 'status' and not 'probe'.  Seems
broken to me.

> +	wcd = dev_get_drvdata(dev);
> +
> +	switch (status) {
> +	case SLIM_DEVICE_STATUS_UP:
> +		wcd->regmap = regmap_init_slimbus(sdev, &wcd934x_regmap_config);
> +		if (IS_ERR(wcd->regmap)) {
> +			dev_err(dev, "Error allocating slim regmap\n");
> +			return PTR_ERR(wcd->regmap);
> +		}
> +
> +		ret = wcd934x_bring_up(wcd);
> +		if (ret) {
> +			dev_err(dev, "Error WCD934X bringup: err = %d\n", ret);

Please use well formed English.

"Failed to bring up WCD934X".

> +			return ret;
> +		}
> +
> +		ret = devm_regmap_add_irq_chip(wcd->dev, wcd->regmap, wcd->irq,
> +					       IRQF_TRIGGER_HIGH, 0,
> +					       &wcd934x_regmap_irq_chip,
> +					       &wcd->irq_data);
> +		if (ret) {
> +			dev_err(wcd->dev, "Error adding irq_chip: err = %d\n",

"Failed to add IRQ chip".

> +				ret);
> +			return ret;
> +		}
> +
> +		ret = mfd_add_devices(wcd->dev, 0, wcd934x_devices,

What do you mean by 0 here?

> +				      ARRAY_SIZE(wcd934x_devices),
> +				      NULL, 0, NULL);
> +		if (ret) {
> +			dev_err(wcd->dev, "Error add mfd devices: err = %d\n",

"Failed to add child devices".

> +				ret);
> +			return ret;
> +		}
> +		break;
> +	case SLIM_DEVICE_STATUS_DOWN:
> +		mfd_remove_devices(wcd->dev);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void wcd934x_slim_remove(struct slim_device *sdev)
> +{
> +	struct wcd934x_data *wcd = dev_get_drvdata(&sdev->dev);

No more clean-up?  Aren't the regulators still enabled?

> +	mfd_remove_devices(&sdev->dev);
> +	kfree(wcd);
> +}
> +
> +static const struct slim_device_id wcd934x_slim_id[] = {
> +	{SLIM_MANF_ID_QCOM, SLIM_PROD_CODE_WCD9340, 0x1, 0x0},

' 's before and after first and last chars please.

> +	{}
> +};
> +
> +static struct slim_driver wcd934x_slim_driver = {
> +	.driver = {
> +		.name = "wcd934x-slim",
> +	},
> +	.probe = wcd934x_slim_probe,
> +	.remove = wcd934x_slim_remove,
> +	.device_status = wcd934x_slim_status,
> +	.id_table = wcd934x_slim_id,
> +};
> +
> +module_slim_driver(wcd934x_slim_driver);
> +MODULE_DESCRIPTION("WCD934X slim driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("slim:217:250:*");

MODULE_AUTHOR?

[...]

> +#endif
> diff --git a/include/linux/mfd/wcd934x/wcd934x.h b/include/linux/mfd/wcd934x/wcd934x.h
> new file mode 100644
> index 000000000000..d102e211948c
> --- /dev/null
> +++ b/include/linux/mfd/wcd934x/wcd934x.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __WCD934X_H__
> +#define __WCD934X_H__
> +#include <linux/clk.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/regmap.h>
> +#include <linux/slimbus.h>
> +
> +#define WCD934X_MAX_SUPPLY	5

Kernel doc?

> +struct wcd934x_data {
> +	int reset_gpio;
> +	int irq;

I'd prefer to see the more complex 'struct's at the top.

> +	struct device *dev;
> +	struct clk *extclk;
> +	struct regmap *regmap;
> +	struct slim_device *sdev;

You don't need 'sdev' and 'dev'.

> +	struct regmap_irq_chip_data *irq_data;
> +	struct regulator_bulk_data supplies[WCD934X_MAX_SUPPLY];
> +};
> +
> +#endif /* __WCD934X_H__ */
> +

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
