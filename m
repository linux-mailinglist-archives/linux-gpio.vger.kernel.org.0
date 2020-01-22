Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD5E1451A4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 10:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730325AbgAVJzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 04:55:36 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51077 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729904AbgAVJzc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jan 2020 04:55:32 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so6143947wmb.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2020 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qIOJe7NRHMnhA/Z8EfaOJBuV7+Oj8z36rS9cs1CmOTU=;
        b=fRZ2WtOAtrh8CpYPow2ZV11rtYkMrXWNN7EFP+xuZpZV5Dqth3I8/EDQ8F0q/iQP3i
         HhoRRM9Cayug14Fpc/4VZlQad/QMoAc1PDGH/i1ZQ9wfmC1sVqoo1dOjKaENt/vcWshb
         oRlN0hydjbxAgIlCFsADNJJ2I5YhsIluYfXzBHNQCL9Ox9BycLbWslJ/c6LsAG/tsat7
         9FFUHsCQFCxvvyK2Kqtl80pDFzIkZOlkx1NQUmLqDe3sZbWvq7Lpe9A562R7sicl2uQK
         FkP9z7nUdXWnAEdb9S0aRDDGB57gtYpNIG6J+EDdPfWAxjgwCXlhrfvAaaZtGZSo2S5Q
         H+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qIOJe7NRHMnhA/Z8EfaOJBuV7+Oj8z36rS9cs1CmOTU=;
        b=CNlRGXkwu8/XRB0XiIexO3uI5wkmXrGZibKWUsPyBgCnxi94sR1YmD2PrD1Q6+Fws/
         NTxbofdY3VH+6qUFr7/r2eJsl/Q7By4Npint1KRocJJ8S1pEHmdxtngaDNFKdzZMYvag
         6Z1LCwNVv6s6+9mLoHL7zyR2JqMjvpiKruslhpc4qiKfwH8zpQWCK7JaXtQcqCypv5lG
         XQFgRMo/WU77+X+jf+MjEHJc0ESa60nvBk4LuFI28NXcZJARTU0fLGk53YrNYaptcshK
         kbXG1iVIHAGIRnl087peDMni2ofrdM3MX5NrM4IcS8gD9XVABVE38Y+gYoQwy27qUg3z
         UkMQ==
X-Gm-Message-State: APjAAAVsca+Jb878IBhPrXCVoOvxXOKtbRCMoiUqhfma6jU7yVR9RDWk
        KNswDpS/JdSqtPvAfCz81wv/OWgTrwg=
X-Google-Smtp-Source: APXvYqzDCvnSqdpu6H2xMpZQomwxF7STnHeY6tfL7LZ7YONFs9+nXJWdXeu+ATH9WdLm/+IQbWVaFA==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr1963540wmi.149.1579686928333;
        Wed, 22 Jan 2020 01:55:28 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id x18sm56930075wrr.75.2020.01.22.01.55.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jan 2020 01:55:27 -0800 (PST)
Subject: Re: [PATCH v6 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
To:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <90dc6c36-9007-72dc-e9f3-e69fc92d951e@linaro.org>
Date:   Wed, 22 Jan 2020 09:55:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lee,

On 19/12/2019 10:31, Srinivas Kandagatla wrote:
> Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
> 
> This codec has integrated SoundWire controller, pin controller and
> interrupt controller.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---

I have not seen this patch in next yet.
Do you intend to take this for 5.6?

Except this patch all other patches in this series along with soundwire 
controller, gpio controller and codec are already picked up by 
respective maintainers.

--srini



>   drivers/mfd/Kconfig                   |  12 +
>   drivers/mfd/Makefile                  |   1 +
>   drivers/mfd/wcd934x.c                 | 306 +++++++++++++++
>   include/linux/mfd/wcd934x/registers.h | 531 ++++++++++++++++++++++++++
>   include/linux/mfd/wcd934x/wcd934x.h   |  31 ++
>   5 files changed, 881 insertions(+)
>   create mode 100644 drivers/mfd/wcd934x.c
>   create mode 100644 include/linux/mfd/wcd934x/registers.h
>   create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 420900852166..a42cb61ea6c4 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1960,6 +1960,18 @@ config MFD_STMFX
>   	  additional drivers must be enabled in order to use the functionality
>   	  of the device.
>   
> +config MFD_WCD934X
> +	tristate "Support for WCD9340/WCD9341 Codec"
> +	depends on SLIMBUS
> +	select REGMAP
> +	select REGMAP_SLIMBUS
> +	select REGMAP_IRQ
> +	select MFD_CORE
> +	help
> +	  Support for the Qualcomm WCD9340/WCD9341 Codec.
> +	  This driver provides common support WCD934x audio codec and its
> +	  associated Pin Controller, Soundwire Controller and Audio codec.
> +
>   menu "Multimedia Capabilities Port drivers"
>   	depends on ARCH_SA1100
>   
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index aed99f08739f..e4b92277ac2a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -58,6 +58,7 @@ endif
>   ifeq ($(CONFIG_MFD_CS47L24),y)
>   obj-$(CONFIG_MFD_ARIZONA)	+= cs47l24-tables.o
>   endif
> +obj-$(CONFIG_MFD_WCD934X)	+= wcd934x.o
>   obj-$(CONFIG_MFD_WM8400)	+= wm8400-core.o
>   wm831x-objs			:= wm831x-core.o wm831x-irq.o wm831x-otp.o
>   wm831x-objs			+= wm831x-auxadc.o
> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> new file mode 100644
> index 000000000000..90341f3c6810
> --- /dev/null
> +++ b/drivers/mfd/wcd934x.c
> @@ -0,0 +1,306 @@
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
> +	{
> +		.name = "wcd934x-codec",
> +	}, {
> +		.name = "wcd934x-gpio",
> +		.of_compatible = "qcom,wcd9340-gpio",
> +	}, {
> +		.name = "wcd934x-soundwire",
> +		.of_compatible = "qcom,soundwire-v1.3.0",
> +	},
> +};
> +
> +static const struct regmap_irq wcd934x_irqs[] = {
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
> +static int wcd934x_bring_up(struct wcd934x_ddata *ddata)
> +{
> +	struct regmap *regmap = ddata->regmap;
> +	u16 id_minor, id_major;
> +	int ret;
> +
> +	ret = regmap_bulk_read(regmap, WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE0,
> +			       (u8 *)&id_minor, sizeof(u16));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_read(regmap, WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE2,
> +			       (u8 *)&id_major, sizeof(u16));
> +	if (ret)
> +		return ret;
> +
> +	dev_info(ddata->dev, "WCD934x chip id major 0x%x, minor 0x%x\n",
> +		 id_major, id_minor);
> +
> +	regmap_write(regmap, WCD934X_CODEC_RPM_RST_CTL, 0x01);
> +	regmap_write(regmap, WCD934X_SIDO_NEW_VOUT_A_STARTUP, 0x19);
> +	regmap_write(regmap, WCD934X_SIDO_NEW_VOUT_D_STARTUP, 0x15);
> +	/* Add 1msec delay for VOUT to settle */
> +	usleep_range(1000, 1100);
> +	regmap_write(regmap, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x5);
> +	regmap_write(regmap, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x7);
> +	regmap_write(regmap, WCD934X_CODEC_RPM_RST_CTL, 0x3);
> +	regmap_write(regmap, WCD934X_CODEC_RPM_RST_CTL, 0x7);
> +	regmap_write(regmap, WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL, 0x3);
> +
> +	return 0;
> +}
> +
> +static int wcd934x_slim_status_up(struct slim_device *sdev)
> +{
> +	struct device *dev = &sdev->dev;
> +	struct wcd934x_ddata *ddata;
> +	int ret;
> +
> +	ddata = dev_get_drvdata(dev);
> +
> +	ddata->regmap = regmap_init_slimbus(sdev, &wcd934x_regmap_config);
> +	if (IS_ERR(ddata->regmap)) {
> +		dev_err(dev, "Error allocating slim regmap\n");
> +		return PTR_ERR(ddata->regmap);
> +	}
> +
> +	ret = wcd934x_bring_up(ddata);
> +	if (ret) {
> +		dev_err(dev, "Failed to bring up WCD934X: err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
> +				       IRQF_TRIGGER_HIGH, 0,
> +				       &wcd934x_regmap_irq_chip,
> +				       &ddata->irq_data);
> +	if (ret) {
> +		dev_err(dev, "Failed to add IRQ chip: err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO, wcd934x_devices,
> +			      ARRAY_SIZE(wcd934x_devices), NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(dev, "Failed to add child devices: err = %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int wcd934x_slim_status(struct slim_device *sdev,
> +			       enum slim_device_status status)
> +{
> +	switch (status) {
> +	case SLIM_DEVICE_STATUS_UP:
> +		return wcd934x_slim_status_up(sdev);
> +	case SLIM_DEVICE_STATUS_DOWN:
> +		mfd_remove_devices(&sdev->dev);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd934x_slim_probe(struct slim_device *sdev)
> +{
> +	struct device *dev = &sdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct wcd934x_ddata *ddata;
> +	int reset_gpio, ret;
> +
> +	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return	-ENOMEM;
> +
> +	ddata->irq = of_irq_get(np, 0);
> +	if (ddata->irq < 0) {
> +		if (ddata->irq != -EPROBE_DEFER)
> +			dev_err(ddata->dev, "Failed to get IRQ: err = %d\n",
> +				ddata->irq);
> +		return ddata->irq;
> +	}
> +
> +	reset_gpio = of_get_named_gpio(np, "reset-gpios", 0);
> +	if (reset_gpio < 0) {
> +		dev_err(dev, "Failed to get reset gpio: err = %d\n",
> +			reset_gpio);
> +		return reset_gpio;
> +	}
> +
> +	ddata->extclk = devm_clk_get(dev, "extclk");
> +	if (IS_ERR(ddata->extclk)) {
> +		dev_err(dev, "Failed to get extclk");
> +		return PTR_ERR(ddata->extclk);
> +	}
> +
> +	ddata->supplies[0].supply = "vdd-buck";
> +	ddata->supplies[1].supply = "vdd-buck-sido";
> +	ddata->supplies[2].supply = "vdd-tx";
> +	ddata->supplies[3].supply = "vdd-rx";
> +	ddata->supplies[4].supply = "vdd-io";
> +
> +	ret = regulator_bulk_get(dev, WCD934X_MAX_SUPPLY, ddata->supplies);
> +	if (ret) {
> +		dev_err(dev, "Failed to get supplies: err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(WCD934X_MAX_SUPPLY, ddata->supplies);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable supplies: err = %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * For WCD934X, it takes about 600us for the Vout_A and
> +	 * Vout_D to be ready after BUCK_SIDO is powered up.
> +	 * SYS_RST_N shouldn't be pulled high during this time
> +	 */
> +	usleep_range(600, 650);
> +	gpio_direction_output(reset_gpio, 0);
> +	msleep(20);
> +	gpio_set_value(reset_gpio, 1);
> +	msleep(20);
> +
> +	ddata->dev = dev;
> +	dev_set_drvdata(dev, ddata);
> +
> +	return 0;
> +}
> +
> +static void wcd934x_slim_remove(struct slim_device *sdev)
> +{
> +	struct wcd934x_ddata *ddata = dev_get_drvdata(&sdev->dev);
> +
> +	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
> +	mfd_remove_devices(&sdev->dev);
> +	kfree(ddata);
> +}
> +
> +static const struct slim_device_id wcd934x_slim_id[] = {
> +	{ SLIM_MANF_ID_QCOM, SLIM_PROD_CODE_WCD9340,
> +	  SLIM_DEV_IDX_WCD9340, SLIM_DEV_INSTANCE_ID_WCD9340 },
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
> +MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org>");
> diff --git a/include/linux/mfd/wcd934x/registers.h b/include/linux/mfd/wcd934x/registers.h
> new file mode 100644
> index 000000000000..bb8d2e276668
> --- /dev/null
> +++ b/include/linux/mfd/wcd934x/registers.h
> @@ -0,0 +1,531 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _WCD934X_REGISTERS_H
> +#define _WCD934X_REGISTERS_H
> +
> +#define WCD934X_CODEC_RPM_CLK_GATE				0x0002
> +#define WCD934X_CODEC_RPM_CLK_GATE_MASK				GENMASK(1, 0)
> +#define WCD934X_CODEC_RPM_CLK_MCLK_CFG				0x0003
> +#define WCD934X_CODEC_RPM_CLK_MCLK_CFG_9P6MHZ			BIT(0)
> +#define WCD934X_CODEC_RPM_CLK_MCLK_CFG_12P288MHZ		BIT(1)
> +#define WCD934X_CODEC_RPM_CLK_MCLK_CFG_MCLK_MASK		GENMASK(1, 0)
> +#define WCD934X_CODEC_RPM_RST_CTL				0x0009
> +#define WCD934X_CODEC_RPM_PWR_CDC_DIG_HM_CTL			0x0011
> +#define WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE0			0x0021
> +#define WCD934X_CHIP_TIER_CTRL_CHIP_ID_BYTE2			0x0023
> +#define WCD934X_CHIP_TIER_CTRL_EFUSE_CTL			0x0025
> +#define WCD934X_EFUSE_SENSE_STATE_MASK				GENMASK(4, 1)
> +#define WCD934X_EFUSE_SENSE_STATE_DEF				0x10
> +#define WCD934X_EFUSE_SENSE_EN_MASK				BIT(0)
> +#define WCD934X_EFUSE_SENSE_ENABLE				BIT(0)
> +#define WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT14			0x0037
> +#define WCD934X_CHIP_TIER_CTRL_EFUSE_VAL_OUT15			0x0038
> +#define WCD934X_CHIP_TIER_CTRL_EFUSE_STATUS			0x0039
> +#define WCD934X_DATA_HUB_SB_TX10_INP_CFG			0x006b
> +#define WCD934X_DATA_HUB_SB_TX11_INP_CFG			0x006c
> +#define WCD934X_DATA_HUB_SB_TX13_INP_CFG			0x006e
> +#define WCD934X_CPE_FLL_CONFIG_CTL_2				0x0111
> +#define WCD934X_CPE_SS_CPARMAD_BUFRDY_INT_PERIOD		0x0213
> +#define WCD934X_CPE_SS_SVA_CFG					0x0214
> +#define WCD934X_CPE_SS_DMIC0_CTL				0x0218
> +#define WCD934X_CPE_SS_DMIC1_CTL				0x0219
> +#define WCD934X_DMIC_RATE_MASK					GENMASK(3, 1)
> +#define WCD934X_CPE_SS_DMIC2_CTL				0x021a
> +#define WCD934X_CPE_SS_DMIC_CFG					0x021b
> +#define WCD934X_CPE_SS_DMIC_CFG					0x021b
> +#define WCD934X_CPE_SS_CPAR_CFG					0x021c
> +#define WCD934X_INTR_PIN1_MASK0					0x0409
> +#define WCD934X_INTR_PIN1_STATUS0				0x0411
> +#define WCD934X_INTR_PIN1_CLEAR0				0x0419
> +#define WCD934X_INTR_PIN2_CLEAR3				0x0434
> +#define WCD934X_INTR_LEVEL0					0x0461
> +/* INTR_REG 0 */
> +#define	WCD934X_IRQ_SLIMBUS			0
> +#define	WCD934X_IRQ_MISC			1
> +#define	WCD934X_IRQ_HPH_PA_OCPL_FAULT		2
> +#define	WCD934X_IRQ_HPH_PA_OCPR_FAULT		3
> +#define	WCD934X_IRQ_EAR_PA_OCP_FAULT		4
> +#define	WCD934X_IRQ_HPH_PA_CNPL_COMPLETE	5
> +#define	WCD934X_IRQ_HPH_PA_CNPR_COMPLETE	6
> +#define	WCD934X_IRQ_EAR_PA_CNP_COMPLETE		7
> +/* INTR_REG 1 */
> +#define	WCD934X_IRQ_MBHC_SW_DET			8
> +#define	WCD934X_IRQ_MBHC_ELECT_INS_REM_DET	9
> +#define	WCD934X_IRQ_MBHC_BUTTON_PRESS_DET	10
> +#define	WCD934X_IRQ_MBHC_BUTTON_RELEASE_DET	11
> +#define	WCD934X_IRQ_MBHC_ELECT_INS_REM_LEG_DET	12
> +#define	WCD934X_IRQ_RESERVED_0			13
> +#define	WCD934X_IRQ_RESERVED_1			14
> +#define	WCD934X_IRQ_RESERVED_2			15
> +/* INTR_REG 2 */
> +#define	WCD934X_IRQ_LINE_PA1_CNP_COMPLETE	16
> +#define	WCD934X_IRQ_LINE_PA2_CNP_COMPLETE	17
> +#define	WCD934X_IRQ_SLNQ_ANALOG_ERROR		18
> +#define	WCD934X_IRQ_RESERVED_3			19
> +#define	WCD934X_IRQ_SOUNDWIRE			20
> +#define	WCD934X_IRQ_VDD_DIG_RAMP_COMPLETE	21
> +#define	WCD934X_IRQ_RCO_ERROR			22
> +#define	WCD934X_IRQ_CPE_ERROR			23
> +/* INTR_REG 3 */
> +#define	WCD934X_IRQ_MAD_AUDIO			24
> +#define	WCD934X_IRQ_MAD_BEACON			25
> +#define	WCD934X_IRQ_MAD_ULTRASOUND		26
> +#define	WCD934X_IRQ_VBAT_ATTACK			27
> +#define	WCD934X_IRQ_VBAT_RESTORE		28
> +#define	WCD934X_IRQ_CPE1_INTR			29
> +#define	WCD934X_IRQ_RESERVED_4			30
> +#define	WCD934X_IRQ_SLNQ_DIGITAL		31
> +#define WCD934X_NUM_IRQS			32
> +#define WCD934X_ANA_BIAS					0x0601
> +#define WCD934X_ANA_BIAS_EN_MASK				BIT(7)
> +#define WCD934X_ANA_BIAS_EN					BIT(7)
> +#define WCD934X_ANA_PRECHRG_EN_MASK				BIT(6)
> +#define WCD934X_ANA_PRECHRG_EN					BIT(6)
> +#define WCD934X_ANA_PRECHRG_MODE_MASK				BIT(5)
> +#define WCD934X_ANA_PRECHRG_MODE_AUTO				BIT(5)
> +#define WCD934X_ANA_RCO						0x0603
> +#define WCD934X_ANA_RCO_BG_EN_MASK				BIT(7)
> +#define WCD934X_ANA_RCO_BG_ENABLE				BIT(7)
> +#define WCD934X_ANA_BUCK_CTL					0x0606
> +#define WCD934X_ANA_BUCK_HI_ACCU_PRE_ENX_MASK			GENMASK(1, 0)
> +#define WCD934X_ANA_BUCK_PRE_EN2_MASK				BIT(0)
> +#define WCD934X_ANA_BUCK_PRE_EN2_ENABLE				BIT(0)
> +#define WCD934X_ANA_BUCK_PRE_EN1_MASK				BIT(1)
> +#define WCD934X_ANA_BUCK_PRE_EN1_ENABLE				BIT(1)
> +#define WCD934X_ANA_BUCK_HI_ACCU_EN_MASK			BIT(2)
> +#define WCD934X_ANA_BUCK_HI_ACCU_ENABLE				BIT(2)
> +#define WCD934X_ANA_RX_SUPPLIES					0x0608
> +#define WCD934X_ANA_HPH						0x0609
> +#define WCD934X_ANA_EAR						0x060a
> +#define WCD934X_ANA_LO_1_2					0x060b
> +#define WCD934X_ANA_AMIC1					0x060e
> +#define WCD934X_ANA_AMIC2					0x060f
> +#define WCD934X_ANA_AMIC3					0x0610
> +#define WCD934X_ANA_AMIC4					0x0611
> +#define WCD934X_ANA_MBHC_MECH					0x0614
> +#define WCD934X_ANA_MBHC_ELECT					0x0615
> +#define WCD934X_ANA_MBHC_ZDET					0x0616
> +#define WCD934X_ANA_MBHC_RESULT_1				0x0617
> +#define WCD934X_ANA_MBHC_RESULT_2				0x0618
> +#define WCD934X_ANA_MBHC_RESULT_3				0x0619
> +#define WCD934X_ANA_MICB1					0x0622
> +#define WCD934X_MICB_VAL_MASK					GENMASK(5, 0)
> +#define WCD934X_ANA_MICB_EN_MASK				GENMASK(7, 6)
> +#define WCD934X_ANA_MICB_PULL_UP				0x80
> +#define WCD934X_ANA_MICB_ENABLE					0x40
> +#define WCD934X_ANA_MICB_DISABLE				0x0
> +#define WCD934X_ANA_MICB2					0x0623
> +#define WCD934X_ANA_MICB3					0x0625
> +#define WCD934X_ANA_MICB4					0x0626
> +#define WCD934X_BIAS_VBG_FINE_ADJ				0x0629
> +#define WCD934X_MICB1_TEST_CTL_1				0x066b
> +#define WCD934X_MICB1_TEST_CTL_2				0x066c
> +#define WCD934X_MICB2_TEST_CTL_1				0x066e
> +#define WCD934X_MICB3_TEST_CTL_1				0x0671
> +#define WCD934X_MICB4_TEST_CTL_1				0x0674
> +#define WCD934X_CLASSH_MODE_1					0x0697
> +#define WCD934X_CLASSH_MODE_2					0x0698
> +#define WCD934X_CLASSH_MODE_3					0x0699
> +#define WCD934X_CLASSH_CTRL_VCL_1				0x069a
> +#define WCD934X_CLASSH_CTRL_VCL_2				0x069b
> +#define WCD934X_CLASSH_CTRL_CCL_1				0x069c
> +#define WCD934X_CLASSH_CTRL_CCL_2				0x069d
> +#define WCD934X_CLASSH_CTRL_CCL_3				0x069e
> +#define WCD934X_CLASSH_CTRL_CCL_4				0x069f
> +#define WCD934X_CLASSH_CTRL_CCL_5				0x06a0
> +#define WCD934X_CLASSH_BUCK_TMUX_A_D				0x06a1
> +#define WCD934X_CLASSH_BUCK_SW_DRV_CNTL				0x06a2
> +#define WCD934X_RX_OCP_CTL					0x06b6
> +#define WCD934X_RX_OCP_COUNT					0x06b7
> +#define WCD934X_HPH_CNP_EN					0x06cb
> +#define WCD934X_HPH_CNP_WG_CTL					0x06cc
> +#define WCD934X_HPH_GM3_BOOST_EN_MASK				BIT(7)
> +#define WCD934X_HPH_GM3_BOOST_ENABLE				BIT(7)
> +#define WCD934X_HPH_OCP_CTL					0x06ce
> +#define WCD934X_HPH_L_EN					0x06d3
> +#define WCD934X_HPH_GAIN_SRC_SEL_MASK				BIT(5)
> +#define WCD934X_HPH_GAIN_SRC_SEL_COMPANDER			0
> +#define WCD934X_HPH_GAIN_SRC_SEL_REGISTER			BIT(5)
> +#define WCD934X_HPH_L_TEST					0x06d4
> +#define WCD934X_HPH_R_EN					0x06d6
> +#define WCD934X_HPH_R_TEST					0x06d7
> +#define WCD934X_HPH_OCP_DET_MASK				BIT(0)
> +#define WCD934X_HPH_OCP_DET_ENABLE				BIT(0)
> +#define WCD934X_HPH_OCP_DET_DISABLE				0
> +#define WCD934X_DIFF_LO_LO2_COMPANDER				0x06ea
> +#define WCD934X_DIFF_LO_LO1_COMPANDER				0x06eb
> +#define WCD934X_CLK_SYS_MCLK_PRG				0x0711
> +#define WCD934X_EXT_CLK_BUF_EN_MASK	BIT(7)
> +#define WCD934X_EXT_CLK_BUF_EN		BIT(7)
> +#define WCD934X_EXT_CLK_DIV_RATIO_MASK	GENMASK(5, 4)
> +#define WCD934X_EXT_CLK_DIV_BY_2	0x10
> +#define WCD934X_MCLK_SRC_MASK		BIT(1)
> +#define WCD934X_MCLK_SRC_EXT_CLK	0
> +#define WCD934X_MCLK_SRC_MASK		BIT(1)
> +#define WCD934X_MCLK_EN_MASK		BIT(0)
> +#define WCD934X_MCLK_EN			BIT(0)
> +#define WCD934X_CLK_SYS_MCLK2_PRG1				0x0712
> +#define WCD934X_CLK_SYS_MCLK2_PRG2				0x0713
> +#define WCD934X_SIDO_NEW_VOUT_A_STARTUP				0x071b
> +#define WCD934X_SIDO_NEW_VOUT_D_STARTUP				0x071c
> +#define WCD934X_SIDO_NEW_VOUT_D_FREQ1				0x071d
> +#define WCD934X_SIDO_NEW_VOUT_D_FREQ2				0x071e
> +#define WCD934X_SIDO_RIPPLE_FREQ_EN_MASK			BIT(0)
> +#define WCD934X_SIDO_RIPPLE_FREQ_ENABLE				BIT(0)
> +#define WCD934X_MBHC_NEW_CTL_2					0x0721
> +#define WCD934X_TX_NEW_AMIC_4_5_SEL				0x0727
> +#define WCD934X_HPH_NEW_INT_RDAC_HD2_CTL_L			0x0733
> +#define WCD934X_HPH_NEW_INT_RDAC_OVERRIDE_CTL			0x0735
> +#define WCD934X_HPH_NEW_INT_RDAC_HD2_CTL_R			0x0736
> +#define WCD934X_HPH_NEW_INT_HPH_TIMER1				0x073a
> +#define WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK			BIT(1)
> +#define WCD934X_HPH_AUTOCHOP_TIMER_ENABLE			BIT(1)
> +#define WCD934X_CDC_TX0_TX_PATH_CTL				0x0a31
> +#define WCD934X_CDC_TX_PATH_CTL_PCM_RATE_MASK			GENMASK(3, 0)
> +#define WCD934X_CDC_TX_PATH_CTL(dec)			(0xa31 + dec * 0x10)
> +#define WCD934X_CDC_TX0_TX_PATH_CFG0				0x0a32
> +#define WCD934X_CDC_TX0_TX_PATH_CFG1				0x0a33
> +#define WCD934X_CDC_TX0_TX_VOL_CTL				0x0a34
> +#define WCD934X_CDC_TX0_TX_PATH_192_CTL				0x0a35
> +#define WCD934X_CDC_TX0_TX_PATH_192_CFG				0x0a36
> +#define WCD934X_CDC_TX0_TX_PATH_SEC2				0x0a39
> +#define WCD934X_HPH_CUTOFF_FREQ_CHANGE_REQ_MASK			BIT(1)
> +#define WCD934X_HPH_CUTOFF_FREQ_CHANGE_REQ			BIT(1)
> +#define WCD934X_CDC_TX1_TX_PATH_CTL				0x0a41
> +#define WCD934X_CDC_TX1_TX_PATH_CFG0				0x0a42
> +#define WCD934X_CDC_TX1_TX_PATH_CFG1				0x0a43
> +#define WCD934X_CDC_TX1_TX_VOL_CTL				0x0a44
> +#define WCD934X_CDC_TX2_TX_PATH_CTL				0x0a51
> +#define WCD934X_CDC_TX2_TX_PATH_CFG0				0x0a52
> +#define WCD934X_CDC_TX2_TX_PATH_CFG1				0x0a53
> +#define WCD934X_CDC_TX2_TX_VOL_CTL				0x0a54
> +#define WCD934X_CDC_TX3_TX_PATH_CTL				0x0a61
> +#define WCD934X_CDC_TX3_TX_PATH_CFG0				0x0a62
> +#define WCD934X_CDC_TX3_TX_PATH_CFG1				0x0a63
> +#define WCD934X_CDC_TX3_TX_VOL_CTL				0x0a64
> +#define WCD934X_CDC_TX3_TX_PATH_192_CTL				0x0a65
> +#define WCD934X_CDC_TX3_TX_PATH_192_CFG				0x0a66
> +#define WCD934X_CDC_TX4_TX_PATH_CTL				0x0a71
> +#define WCD934X_CDC_TX4_TX_PATH_CFG0				0x0a72
> +#define WCD934X_CDC_TX4_TX_PATH_CFG1				0x0a73
> +#define WCD934X_CDC_TX4_TX_VOL_CTL				0x0a74
> +#define WCD934X_CDC_TX4_TX_PATH_192_CTL				0x0a75
> +#define WCD934X_CDC_TX4_TX_PATH_192_CFG				0x0a76
> +#define WCD934X_CDC_TX5_TX_PATH_CTL				0x0a81
> +#define WCD934X_CDC_TX5_TX_PATH_CFG0				0x0a82
> +#define WCD934X_CDC_TX5_TX_PATH_CFG1				0x0a83
> +#define WCD934X_CDC_TX5_TX_VOL_CTL				0x0a84
> +#define WCD934X_CDC_TX5_TX_PATH_192_CTL				0x0a85
> +#define WCD934X_CDC_TX5_TX_PATH_192_CFG				0x0a86
> +#define WCD934X_CDC_TX6_TX_PATH_CTL				0x0a91
> +#define WCD934X_CDC_TX6_TX_PATH_CFG0				0x0a92
> +#define WCD934X_CDC_TX6_TX_PATH_CFG1				0x0a93
> +#define WCD934X_CDC_TX6_TX_VOL_CTL				0x0a94
> +#define WCD934X_CDC_TX6_TX_PATH_192_CTL				0x0a95
> +#define WCD934X_CDC_TX6_TX_PATH_192_CFG				0x0a96
> +#define WCD934X_CDC_TX7_TX_PATH_CTL				0x0aa1
> +#define WCD934X_CDC_TX7_TX_PATH_CFG0				0x0aa2
> +#define WCD934X_CDC_TX7_TX_PATH_CFG1				0x0aa3
> +#define WCD934X_CDC_TX7_TX_VOL_CTL				0x0aa4
> +#define WCD934X_CDC_TX7_TX_PATH_192_CTL				0x0aa5
> +#define WCD934X_CDC_TX7_TX_PATH_192_CFG				0x0aa6
> +#define WCD934X_CDC_TX8_TX_PATH_CTL				0x0ab1
> +#define WCD934X_CDC_TX8_TX_PATH_CFG0				0x0ab2
> +#define WCD934X_CDC_TX8_TX_PATH_CFG1				0x0ab3
> +#define WCD934X_CDC_TX8_TX_VOL_CTL				0x0ab4
> +#define WCD934X_CDC_TX8_TX_PATH_192_CTL				0x0ab5
> +#define WCD934X_CDC_TX8_TX_PATH_192_CFG				0x0ab6
> +#define WCD934X_CDC_TX9_SPKR_PROT_PATH_CFG0			0x0ac3
> +#define WCD934X_CDC_TX10_SPKR_PROT_PATH_CFG0			0x0ac7
> +#define WCD934X_CDC_TX11_SPKR_PROT_PATH_CFG0			0x0acb
> +#define WCD934X_CDC_TX12_SPKR_PROT_PATH_CFG0			0x0acf
> +#define WCD934X_CDC_COMPANDER1_CTL0				0x0b01
> +#define WCD934X_COMP_CLK_EN_MASK				BIT(0)
> +#define WCD934X_COMP_CLK_ENABLE					BIT(0)
> +#define WCD934X_COMP_SOFT_RST_MASK				BIT(1)
> +#define WCD934X_COMP_SOFT_RST_ENABLE				BIT(1)
> +#define WCD934X_COMP_HALT_MASK					BIT(2)
> +#define WCD934X_COMP_HALT					BIT(2)
> +#define WCD934X_COMP_SOFT_RST_DISABLE				0
> +#define WCD934X_CDC_COMPANDER1_CTL7				0x0b08
> +#define WCD934X_HPH_LOW_PWR_MODE_EN_MASK			BIT(5)
> +#define WCD934X_CDC_COMPANDER2_CTL7				0x0b10
> +#define WCD934X_CDC_COMPANDER7_CTL3				0x0b34
> +#define WCD934X_CDC_COMPANDER7_CTL7				0x0b38
> +#define WCD934X_CDC_COMPANDER8_CTL3				0x0b3c
> +#define WCD934X_CDC_COMPANDER8_CTL7				0x0b40
> +#define WCD934X_CDC_RX0_RX_PATH_CTL				0x0b41
> +#define WCD934X_CDC_RX_PGA_MUTE_EN_MASK				BIT(4)
> +#define WCD934X_CDC_RX_PGA_MUTE_ENABLE				BIT(4)
> +#define WCD934X_CDC_RX_PGA_MUTE_DISABLE				0
> +#define WCD934X_RX_CLK_EN_MASK					BIT(5)
> +#define WCD934X_RX_CLK_ENABLE					BIT(5)
> +#define WCD934X_RX_RESET_MASK					BIT(6)
> +#define WCD934X_RX_RESET_ENABLE					BIT(6)
> +#define WCD934X_RX_RESET_DISABLE				0
> +#define WCD934X_RX_PCM_RATE_MASK				GENMASK(3, 0)
> +#define WCD934X_RX_PCM_RATE_F_48K				0x04
> +#define WCD934X_CDC_RX_PATH_CTL(rx)			(0xb41 + rx * 0x14)
> +#define WCD934X_CDC_MIX_PCM_RATE_MASK				GENMASK(3, 0)
> +#define WCD934X_CDC_RX0_RX_PATH_CFG0				0x0b42
> +#define WCD934X_RX_DLY_ZN_EN_MASK				BIT(3)
> +#define WCD934X_RX_DLY_ZN_ENABLE				BIT(3)
> +#define WCD934X_RX_DLY_ZN_DISABLE				0
> +#define WCD934X_CDC_RX0_RX_PATH_CFG1				0x0b43
> +#define WCD934X_CDC_RX0_RX_PATH_CFG2				0x0b44
> +#define WCD934X_CDC_RX0_RX_VOL_CTL				0x0b45
> +#define WCD934X_CDC_RX0_RX_PATH_MIX_CTL				0x0b46
> +#define WCD934X_CDC_RX_MIX_CLK_EN_MASK				BIT(5)
> +#define WCD934X_CDC_RX_MIX_CLK_ENABLE				BIT(5)
> +#define WCD934X_CDC_RX_PATH_MIX_CTL(rx)			(0xb46 + rx * 0x14)
> +#define WCD934X_CDC_RX0_RX_PATH_MIX_CFG				0x0b47
> +#define WCD934X_CDC_RX0_RX_VOL_MIX_CTL				0x0b48
> +#define WCD934X_CDC_RX0_RX_PATH_SEC0				0x0b49
> +#define WCD934X_CDC_RX0_RX_PATH_DSMDEM_CTL			0x0b53
> +#define WCD934X_CDC_RX1_RX_PATH_CTL				0x0b55
> +#define WCD934X_RX_PATH_PGA_MUTE_EN_MASK			BIT(4)
> +#define WCD934X_RX_PATH_PGA_MUTE_ENABLE				BIT(4)
> +#define WCD934X_CDC_RX_PATH_PGA_MUTE_DISABLE			0
> +#define WCD934X_CDC_RX_PATH_CLK_EN_MASK				BIT(5)
> +#define WCD934X_CDC_RX_PATH_CLK_ENABLE				BIT(5)
> +#define WCD934X_CDC_RX_PATH_CLK_DISABLE				0
> +#define WCD934X_CDC_RX1_RX_PATH_CFG0				0x0b56
> +#define WCD934X_HPH_CMP_EN_MASK					BIT(1)
> +#define WCD934X_HPH_CMP_ENABLE					BIT(1)
> +#define WCD934X_HPH_CMP_DISABLE					0
> +#define WCD934X_CDC_RX1_RX_PATH_CFG2				0x0b58
> +#define WCD934X_CDC_RX1_RX_VOL_CTL				0x0b59
> +#define WCD934X_CDC_RX1_RX_PATH_MIX_CTL				0x0b5a
> +#define WCD934X_CDC_RX1_RX_PATH_MIX_CFG				0x0b5b
> +#define WCD934X_CDC_RX1_RX_VOL_MIX_CTL				0x0b5c
> +#define WCD934X_CDC_RX1_RX_PATH_SEC0				0x0b5d
> +#define WCD934X_CDC_RX1_RX_PATH_SEC3				0x0b60
> +#define WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK			GENMASK(5, 2)
> +#define WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P3125		0x14
> +#define WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P0000		0
> +#define WCD934X_CDC_RX1_RX_PATH_DSMDEM_CTL			0x0b67
> +#define WCD934X_CDC_RX2_RX_PATH_CTL				0x0b69
> +#define WCD934X_CDC_RX2_RX_PATH_CFG0				0x0b6a
> +#define WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK			BIT(2)
> +#define WCD934X_CDC_RX_PATH_CFG_HD2_ENABLE			BIT(2)
> +#define WCD934X_CDC_RX_PATH_CFG_HD2_DISABLE			0
> +#define WCD934X_CDC_RX2_RX_PATH_CFG2				0x0b6c
> +#define WCD934X_CDC_RX2_RX_VOL_CTL				0x0b6d
> +#define WCD934X_CDC_RX2_RX_PATH_MIX_CTL				0x0b6e
> +#define WCD934X_CDC_RX2_RX_PATH_MIX_CFG				0x0b6f
> +#define WCD934X_CDC_RX2_RX_VOL_MIX_CTL				0x0b70
> +#define WCD934X_CDC_RX2_RX_PATH_SEC0				0x0b71
> +#define WCD934X_CDC_RX2_RX_PATH_SEC3				0x0b74
> +#define WCD934X_CDC_RX2_RX_PATH_DSMDEM_CTL			0x0b7b
> +#define WCD934X_CDC_RX3_RX_PATH_CTL				0x0b7d
> +#define WCD934X_CDC_RX3_RX_PATH_CFG0				0x0b6e
> +#define WCD934X_CDC_RX3_RX_PATH_CFG2				0x0b80
> +#define WCD934X_CDC_RX3_RX_VOL_CTL				0x0b81
> +#define WCD934X_CDC_RX3_RX_PATH_MIX_CTL				0x0b82
> +#define WCD934X_CDC_RX3_RX_PATH_MIX_CFG				0x0b83
> +#define WCD934X_CDC_RX3_RX_VOL_MIX_CTL				0x0b84
> +#define WCD934X_CDC_RX3_RX_PATH_SEC0				0x0b85
> +#define WCD934X_CDC_RX3_RX_PATH_DSMDEM_CTL			0x0b8f
> +#define WCD934X_CDC_RX4_RX_PATH_CTL				0x0b91
> +#define WCD934X_CDC_RX4_RX_PATH_CFG0				0x0b92
> +#define WCD934X_CDC_RX4_RX_PATH_CFG2				0x0b94
> +#define WCD934X_CDC_RX4_RX_VOL_CTL				0x0b95
> +#define WCD934X_CDC_RX4_RX_PATH_MIX_CTL				0x0b96
> +#define WCD934X_CDC_RX4_RX_PATH_MIX_CFG				0x0b97
> +#define WCD934X_CDC_RX4_RX_VOL_MIX_CTL				0x0b98
> +#define WCD934X_CDC_RX4_RX_PATH_SEC0				0x0b99
> +#define WCD934X_CDC_RX4_RX_PATH_DSMDEM_CTL			0x0ba3
> +#define WCD934X_CDC_RX7_RX_PATH_CTL				0x0bcd
> +#define WCD934X_CDC_RX7_RX_PATH_CFG0				0x0bce
> +#define WCD934X_CDC_RX7_RX_PATH_CFG1				0x0bcf
> +#define WCD934X_CDC_RX7_RX_PATH_CFG2				0x0bd0
> +#define WCD934X_CDC_RX7_RX_VOL_CTL				0x0bd1
> +#define WCD934X_CDC_RX7_RX_PATH_MIX_CTL				0x0bd2
> +#define WCD934X_CDC_RX7_RX_PATH_MIX_CFG				0x0bd3
> +#define WCD934X_CDC_RX7_RX_VOL_MIX_CTL				0x0bd4
> +#define WCD934X_CDC_RX7_RX_PATH_SEC1				0x0bd6
> +#define WCD934X_CDC_RX7_RX_PATH_MIX_SEC0			0x0bdd
> +#define WCD934X_CDC_RX7_RX_PATH_DSMDEM_CTL			0x0bdf
> +#define WCD934X_CDC_RX8_RX_PATH_CTL				0x0be1
> +#define WCD934X_CDC_RX8_RX_PATH_CFG0				0x0be2
> +#define WCD934X_CDC_RX8_RX_PATH_CFG1				0x0be3
> +#define WCD934X_RX_SMART_BOOST_EN_MASK				BIT(0)
> +#define WCD934X_RX_SMART_BOOST_ENABLE				BIT(0)
> +#define WCD934X_RX_SMART_BOOST_DISABLE			0
> +#define WCD934X_CDC_RX8_RX_PATH_CFG2				0x0be4
> +#define WCD934X_CDC_RX8_RX_VOL_CTL				0x0be5
> +#define WCD934X_CDC_RX8_RX_PATH_MIX_CTL				0x0be6
> +#define WCD934X_CDC_RX8_RX_PATH_MIX_CFG				0x0be7
> +#define WCD934X_CDC_RX8_RX_VOL_MIX_CTL				0x0be8
> +#define WCD934X_CDC_RX8_RX_PATH_SEC1				0x0bea
> +#define WCD934X_CDC_RX8_RX_PATH_MIX_SEC0			0x0bf1
> +#define WCD934X_CDC_RX8_RX_PATH_DSMDEM_CTL			0x0bf3
> +#define WCD934X_CDC_CLSH_DECAY_CTRL				0x0c03
> +#define WCD934X_CDC_CLSH_K2_MSB					0x0c0a
> +#define WCD934X_CDC_CLSH_K2_LSB					0x0c0b
> +#define WCD934X_CDC_CLSH_TEST0					0x0c0f
> +#define WCD934X_CDC_BOOST0_BOOST_PATH_CTL			0x0c19
> +#define WCD934X_BOOST_PATH_CLK_EN_MASK				BIT(4)
> +#define WCD934X_BOOST_PATH_CLK_ENABLE				BIT(4)
> +#define WCD934X_BOOST_PATH_CLK_DISABLE				0
> +#define WCD934X_CDC_BOOST0_BOOST_CTL				0x0c1a
> +#define WCD934X_CDC_BOOST0_BOOST_CFG1				0x0c1b
> +#define WCD934X_CDC_BOOST0_BOOST_CFG2				0x0c1c
> +#define WCD934X_CDC_BOOST1_BOOST_PATH_CTL			0x0c21
> +#define WCD934X_CDC_BOOST1_BOOST_CTL				0x0c22
> +#define WCD934X_CDC_BOOST1_BOOST_CFG1				0x0c23
> +#define WCD934X_CDC_BOOST1_BOOST_CFG2				0x0c24
> +#define WCD934X_SWR_AHB_BRIDGE_RD_DATA_0			0x0c91
> +#define WCD934X_SWR_AHB_BRIDGE_RD_DATA_1			0x0c92
> +#define WCD934X_SWR_AHB_BRIDGE_RD_DATA_2			0x0c93
> +#define WCD934X_SWR_AHB_BRIDGE_RD_DATA_3			0x0c94
> +#define WCD934X_SWR_AHB_BRIDGE_ACCESS_STATUS			0x0c96
> +#define WCD934X_CDC_SIDETONE_SRC0_ST_SRC_PATH_CTL		0x0cb5
> +#define WCD934X_CDC_SIDETONE_SRC1_ST_SRC_PATH_CTL		0x0cb9
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG0			0x0d01
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT_CFG0(i)		(0xd01 + i * 0x2)
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT_SEL_MASK			GENMASK(3, 0)
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT0_CFG1			0x0d02
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT_CFG1(i)		(0xd02 + i * 0x2)
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG0			0x0d03
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT1_CFG1			0x0d04
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG0			0x0d05
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT2_CFG1			0x0d06
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG0			0x0d07
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT3_CFG1			0x0d08
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG0			0x0d09
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT4_CFG1			0x0d0a
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG0			0x0d0f
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT7_CFG1			0x0d10
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG0			0x0d11
> +#define WCD934X_CDC_RX_INP_MUX_RX_INT8_CFG1			0x0d12
> +#define WCD934X_CDC_RX_INP_MUX_RX_MIX_CFG0			0x0d13
> +#define WCD934X_CDC_RX_INP_MUX_RX_MIX_CFG1			0x0d14
> +#define WCD934X_CDC_RX_INP_MUX_RX_MIX_CFG2			0x0d15
> +#define WCD934X_CDC_RX_INP_MUX_RX_MIX_CFG3			0x0d16
> +#define WCD934X_CDC_RX_INP_MUX_RX_MIX_CFG4			0x0d17
> +#define WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG0		0x0d18
> +#define WCD934X_CDC_RX_INP_MUX_SIDETONE_SRC_CFG1		0x0d19
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG0			0x0d1d
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX0_CFG1			0x0d1e
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG0			0x0d1f
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX1_CFG1			0x0d20
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX2_CFG0			0x0d21
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX2_CFG1			0x0d22
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG0			0x0d23
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX3_CFG1			0x0d25
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX4_CFG0			0x0d26
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX5_CFG0			0x0d27
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX6_CFG0			0x0d28
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX7_CFG0			0x0d29
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX8_CFG0			0x0d2a
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX10_CFG0			0x0d2b
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX11_CFG0			0x0d2c
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX12_CFG0			0x0d2d
> +#define WCD934X_CDC_TX_INP_MUX_ADC_MUX13_CFG0			0x0d2e
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG0		0x0d31
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG1		0x0d32
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG2		0x0d33
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR0_MIX_CFG3		0x0d34
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG0		0x0d35
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG1		0x0d36
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG2		0x0d37
> +#define WCD934X_CDC_SIDETONE_IIR_INP_MUX_IIR1_MIX_CFG3		0x0d38
> +#define WCD934X_CDC_IF_ROUTER_TX_MUX_CFG0			0x0d3a
> +#define WCD934X_CDC_IF_ROUTER_TX_MUX_CFG1			0x0d3b
> +#define WCD934X_CDC_IF_ROUTER_TX_MUX_CFG2			0x0d3c
> +#define WCD934X_CDC_IF_ROUTER_TX_MUX_CFG3			0x0d3d
> +#define WCD934X_CDC_CLK_RST_CTRL_MCLK_CONTROL			0x0d41
> +#define WCD934X_CDC_MCLK_EN_MASK				BIT(0)
> +#define WCD934X_CDC_MCLK_EN_ENABLE				BIT(0)
> +#define WCD934X_CDC_CLK_RST_CTRL_FS_CNT_CONTROL			0x0d42
> +#define WCD934X_CDC_FS_MCLK_CNT_EN_MASK				BIT(0)
> +#define WCD934X_CDC_FS_MCLK_CNT_ENABLE				BIT(0)
> +#define WCD934X_CDC_CLK_RST_CTRL_SWR_CONTROL			0x0d43
> +#define WCD934X_CDC_SWR_CLK_EN_MASK				BIT(0)
> +#define WCD934X_CDC_SWR_CLK_ENABLE				BIT(0)
> +#define WCD934X_CDC_CLK_RST_CTRL_DSD_CONTROL			0x0d44
> +#define WCD934X_CDC_CLK_RST_CTRL_ASRC_SHARE_CONTROL		0x0d45
> +#define WCD934X_CDC_CLK_RST_CTRL_GFM_CONTROL			0x0d46
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_PATH_CTL			0x0d55
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL		0x0d56
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B2_CTL		0x0d57
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B3_CTL		0x0d58
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B4_CTL		0x0d59
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B5_CTL		0x0d5a
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B6_CTL		0x0d5b
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B7_CTL		0x0d5c
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B8_CTL		0x0d5d
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_CTL			0x0d5e
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_TIMER_CTL		0x0d5f
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_COEF_B1_CTL		0x0d60
> +#define WCD934X_CDC_SIDETONE_IIR0_IIR_COEF_B2_CTL		0x0d61
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_PATH_CTL			0x0d65
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B1_CTL		0x0d66
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B2_CTL		0x0d67
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B3_CTL		0x0d68
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B4_CTL		0x0d69
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B5_CTL		0x0d6a
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B6_CTL		0x0d6b
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B7_CTL		0x0d6c
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B8_CTL		0x0d6d
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_CTL			0x0d6e
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_TIMER_CTL		0x0d6f
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_COEF_B1_CTL		0x0d70
> +#define WCD934X_CDC_SIDETONE_IIR1_IIR_COEF_B2_CTL		0x0d71
> +#define WCD934X_CDC_TOP_TOP_CFG1				0x0d82
> +#define WCD934X_CDC_TOP_TOP_CFG7				0x0d88
> +#define WCD934X_CDC_TOP_HPHL_COMP_LUT				0x0d8b
> +#define WCD934X_CDC_TOP_HPHR_COMP_LUT				0x0d90
> +#define WCD934X_HPH_LUT_BYPASS_MASK				BIT(7)
> +#define WCD934X_HPH_LUT_BYPASS_ENABLE				BIT(7)
> +#define WCD934X_HPH_LUT_BYPASS_DISABLE				0
> +#define WCD934X_CODEC_CPR_WR_DATA_0				0x5001
> +#define WCD934X_CODEC_CPR_WR_ADDR_0				0x5005
> +#define WCD934X_CODEC_CPR_SVS_CX_VDD				0x5022
> +#define WCD934X_CODEC_CPR_SVS2_CX_VDD				0x5023
> +#define WCD934X_CODEC_CPR_SVS2_MIN_CX_VDD			0x5027
> +#define WCD934X_TLMM_DMIC1_CLK_PINCFG				0x8015
> +#define WCD934X_TLMM_DMIC1_DATA_PINCFG				0x8016
> +#define WCD934X_TLMM_DMIC2_CLK_PINCFG				0x8017
> +#define WCD934X_TLMM_DMIC2_DATA_PINCFG				0x8018
> +#define WCD934X_TLMM_DMIC3_CLK_PINCFG				0x8019
> +#define WCD934X_TLMM_DMIC3_DATA_PINCFG				0x801a
> +#define WCD934X_TEST_DEBUG_PAD_DRVCTL_0				0x803b
> +#define WCD934X_TEST_DEBUG_NPL_DLY_TEST_1			0x803e
> +
> +#define WCD934X_MAX_REGISTER					0xffff
> +#define WCD934X_SEL_REGISTER					0x800
> +#define WCD934X_SEL_MASK					0xff
> +#define WCD934X_SEL_SHIFT					0x0
> +#define WCD934X_WINDOW_START					0x800
> +#define WCD934X_WINDOW_LENGTH					0x100
> +
> +/* SLIMBUS Slave Registers */
> +#define WCD934X_SLIM_PGD_PORT_INT_EN0				0x30
> +#define WCD934X_SLIM_PGD_PORT_INT_STATUS_RX_0			0x34
> +#define WCD934X_SLIM_PGD_PORT_INT_STATUS_RX_1			0x35
> +#define WCD934X_SLIM_PGD_PORT_INT_STATUS_TX_0			0x36
> +#define WCD934X_SLIM_PGD_PORT_INT_STATUS_TX_1			0x37
> +#define WCD934X_SLIM_PGD_PORT_INT_CLR_RX_0			0x38
> +#define WCD934X_SLIM_PGD_PORT_INT_CLR_RX_1			0x39
> +#define WCD934X_SLIM_PGD_PORT_INT_CLR_TX_0			0x3A
> +#define WCD934X_SLIM_PGD_PORT_INT_CLR_TX_1			0x3B
> +#define WCD934X_SLIM_PGD_PORT_INT_RX_SOURCE0			0x60
> +#define WCD934X_SLIM_PGD_PORT_INT_TX_SOURCE0			0x70
> +#define WCD934X_SLIM_PGD_RX_PORT_CFG(p)				(0x30 + p)
> +#define WCD934X_SLIM_PGD_PORT_CFG(p)				(0x40 + p)
> +#define WCD934X_SLIM_PGD_TX_PORT_CFG(p)				(0x50 + p)
> +#define WCD934X_SLIM_PGD_PORT_INT_SRC(p)			(0x60 + p)
> +#define WCD934X_SLIM_PGD_PORT_INT_STATUS(p)			(0x80 + p)
> +#define WCD934X_SLIM_PGD_TX_PORT_MULTI_CHNL_0(p)		(0x100 + 4 * p)
> +/* ports range from 10-16 */
> +#define WCD934X_SLIM_PGD_TX_PORT_MULTI_CHNL_1(p)		(0x101 + 4 * p)
> +#define WCD934X_SLIM_PGD_RX_PORT_MULTI_CHNL_0(p)		(0x140 + 4 * p)
> +
> +#define SLIM_MANF_ID_QCOM			0x217
> +#define SLIM_PROD_CODE_WCD9340			0x250
> +#define SLIM_DEV_IDX_WCD9340			0x1
> +#define SLIM_DEV_INSTANCE_ID_WCD9340		0
> +
> +#endif
> diff --git a/include/linux/mfd/wcd934x/wcd934x.h b/include/linux/mfd/wcd934x/wcd934x.h
> new file mode 100644
> index 000000000000..f3c65a035150
> --- /dev/null
> +++ b/include/linux/mfd/wcd934x/wcd934x.h
> @@ -0,0 +1,31 @@
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
> +
> +/**
> + * struct wcd934x_ddata - wcd934x driver data
> + *
> + * @supplies:	wcd934x regulator supplies
> + * @irq_data:	wcd934x irq_chip data
> + * @regmap:	wcd934x regmap pointer
> + * @extclk:	External clock
> + * @dev:	device instance of wcd934x slim device
> + * @irq:	irq for wcd934x.
> + */
> +struct wcd934x_ddata {
> +	struct regulator_bulk_data supplies[WCD934X_MAX_SUPPLY];
> +	struct regmap_irq_chip_data *irq_data;
> +	struct regmap *regmap;
> +	struct clk *extclk;
> +	struct device *dev;
> +	int irq;
> +};
> +
> +#endif /* __WCD934X_H__ */
> 
