Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6442C9440
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 01:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731083AbgLAAsh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 19:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731076AbgLAAsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 19:48:37 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D33C0613D4
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 16:47:57 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id p126so5329479oif.7
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 16:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CwjogJlLxHtL0xPXJN1BHE+4bJNT+to9NvXAEyIoG/Q=;
        b=ksTs1jq+mai+F1AjM7HIs9r16aSfMpXl+/Vy9oMiGG57vtsc6+SJEMI1bqKLAheQT0
         jUVU+Zcpi76CzDhwYFV9vwq0si2xT5NiWPMdyCb6ay7M6TxqFFUpFg4nbTwHmFPK/rao
         3tXjl+HMVKEJANUv2qwN1crmGDMP8lxS+0VnyXvGoRSD/wRf4157VRteoIz/uaekoM6t
         Sw0ld67+g5y4btiCY2k7x/J6j5XMkeMZde36nvDC2+l0HBn2DDRvzjQ4rPlg8BUG98V+
         dj0sQc5fMn8CaUYH6agTbMy4Iyh/q3GHsVkcbo8mM+WqpO61n/pIOYfDueruvUIPwfd8
         LqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CwjogJlLxHtL0xPXJN1BHE+4bJNT+to9NvXAEyIoG/Q=;
        b=dChBcVI4k+HR3qGyb/eSrYXv6f6n7a0SjB96SCxlfGloW6evnEcC3X8xzd96cXuofr
         4PR+7GPYfGvOzcv/gOWQPVa3QITphpZiXtuF5YCIbvrK1QixZuZOxH5AgB95bqExMpxl
         XxWyYVGEjugve7c00e1+h3Mr2yqHI99FLxQDBml8S9l4TYxRpz34k4rpy8kd4+pNUEEJ
         h5BioTg9rpqftmjw3dMH8Q9p0lNBaR/56f5jE3WEx2/ir8b9ZpwmIhZmtoCtJoLD0/7G
         9F7oKN5tLYZviroLIPiE39jngjovUXHi/hbRBvqYF14x33KNXW7yWTm596Q82BFUISKT
         KQ9Q==
X-Gm-Message-State: AOAM532VtpCfQy/jBA4ihNMvZ5hRcrOREFfMrjrKZnTZEUYlonXW2NU5
        z6fMTKxb8UfxFiatsTKLT0kgxg==
X-Google-Smtp-Source: ABdhPJyb2olsUD063iU0A+k7l7xSvm1XEA686o8WFjk4sd9DB0LvaRvxD1U3uxfhucx6Zr9dRMdP5w==
X-Received: by 2002:aca:acca:: with SMTP id v193mr179181oie.41.1606783676104;
        Mon, 30 Nov 2020 16:47:56 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a25sm48284oos.23.2020.11.30.16.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 16:47:55 -0800 (PST)
Date:   Mon, 30 Nov 2020 18:47:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
Message-ID: <X8WSucFKyROFJ7gF@builder.lan>
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
 <20201116143432.15809-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116143432.15809-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 16 Nov 08:34 CST 2020, Srinivas Kandagatla wrote:

> Add initial pinctrl driver to support pin configuration for
> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on SM8250.
> 
> This IP is an additional pin control block for Audio Pins on top the
> existing SoC Top level pin-controller.
> Hardware setup looks like:
> 
> TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]
> 

Iiuc the LPI TLMM block is just "another pinmux/pinconf block" found in
these SoCs, with the additional magic that the 14 pads are muxed with
some of the TLMM pins - to allow the system integrator to choose how
many pins the LPI should have access to.

I also believe this is what the "egpio" bit in the TLMM registers are
used for (i.e. egpio = route to LPI, egpio = 1 route to TLMM), so we
should need to add support for toggling this bit in the TLMM as well
(which I think we should do as a pinconf in the pinctrl-msm).

> This pin controller has some similarities compared to Top level
> msm SoC Pin controller like 'each pin belongs to a single group'
> and so on. However this one is intended to control only audio
> pins in particular, which can not be configured/touched by the
> Top level SoC pin controller except setting them as gpios.

Seems like this is just a property of what functions they routed in this
region of the TLMM - and when egpio = 1 it could have been anything
else.

> Apart from this, slew rate is also available in this block for
> certain pins which are connected to SLIMbus or SoundWire Bus.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/pinctrl/qcom/Kconfig             |   8 +
>  drivers/pinctrl/qcom/Makefile            |   1 +
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 734 +++++++++++++++++++++++
>  3 files changed, 743 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 5fe7b8aaf69d..d3e4e89c2810 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -236,4 +236,12 @@ config PINCTRL_SM8250
>  	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
>  	  Technologies Inc SM8250 platform.
>  
> +config PINCTRL_LPASS_LPI
> +	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
> +	depends on GPIOLIB
> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
> +	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
> +
>  endif
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index 9e3d9c91a444..c8520155fb1b 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -28,3 +28,4 @@ obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
>  obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
>  obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
>  obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
> +obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> new file mode 100644
> index 000000000000..63cfbb2d032a
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -0,0 +1,734 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Ltd.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include "../core.h"
> +#include "../pinctrl-utils.h"
> +
> +#define LPI_GPIO_REG_VAL_CTL             0x00

I think LPI_GPIO_CFG_REG would be a better name for this.

> +#define LPI_GPIO_REG_DIR_CTL             0x04

Afaict, BIT(9) of LPI_GPIO_CFG_REG controls of the if the pin should be
output or not. This register provides the read value as BIT(0) and the
output value in BIT(1).

So this would rather be the LPI_GPIO_VALUE_REG.

> +#define LPI_SLEW_REG_VAL_CTL             0x00
> +#define LPI_SLEW_RATE_MAX                0x03
> +#define LPI_SLEW_BITS_SIZE               0x02
> +#define LPI_GPIO_REG_PULL_SHIFT		0x0
> +#define LPI_GPIO_REG_PULL_MASK		GENMASK(1, 0)
> +#define LPI_GPIO_REG_FUNCTION_SHIFT	0x2
> +#define LPI_GPIO_REG_FUNCTION_MASK	GENMASK(5, 2)
> +#define LPI_GPIO_REG_OUT_STRENGTH_SHIFT	0x6
> +#define LPI_GPIO_REG_OUT_STRENGTH_MASK	GENMASK(8, 6)
> +#define LPI_GPIO_REG_OE_SHIFT		0x9
> +#define LPI_GPIO_REG_OE_MASK		BIT(9)
> +#define LPI_GPIO_REG_DIR_SHIFT		0x1
> +#define LPI_GPIO_REG_DIR_MASK		0x2
> +#define LPI_GPIO_BIAS_DISABLE		0x0
> +#define LPI_GPIO_PULL_DOWN		0x1
> +#define LPI_GPIO_KEEPER			0x2
> +#define LPI_GPIO_PULL_UP		0x3
> +#define LPI_GPIO_DS_TO_VAL(v) ((v / 2 - 1) << LPI_GPIO_REG_OUT_STRENGTH_SHIFT)
> +#define NO_SLEW				-1
> +
> +#define LPI_FUNCTION(fname)			                \
> +	[LPI_MUX_##fname] = {		                \
> +		.name = #fname,				\
> +		.groups = fname##_groups,               \
> +		.ngroups = ARRAY_SIZE(fname##_groups),	\
> +	}
> +
> +#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
> +	{						\
> +		.name = "gpio" #id,			\
> +		.pins = gpio##id##_pins,		\
> +		.pin = id,				\
> +		.slew_offset = soff,			\
> +		.npins = ARRAY_SIZE(gpio##id##_pins),	\
> +		.funcs = (int[]){			\
> +			LPI_MUX_gpio,			\
> +			LPI_MUX_##f1,			\
> +			LPI_MUX_##f2,			\
> +			LPI_MUX_##f3,			\
> +			LPI_MUX_##f4,			\
> +		},					\
> +		.nfuncs = 5,				\
> +	}
> +
> +struct lpi_pingroup {
> +	const char *name;
> +	const unsigned int *pins;
> +	unsigned int npins;
> +	unsigned int pin;
> +	/* Bit offset in slew register for SoundWire pins only */
> +	unsigned int slew_offset;
> +	unsigned int *funcs;
> +	unsigned int nfuncs;
> +};
> +
> +struct lpi_function {
> +	const char *name;
> +	const char * const *groups;
> +	unsigned int ngroups;
> +};
> +
> +struct lpi_pinctrl_variant_data {
> +	int tlmm_reg_offset;
> +	const struct pinctrl_pin_desc *pins;
> +	int npins;
> +	const struct lpi_pingroup *groups;
> +	int ngroups;
> +	const struct lpi_function *functions;
> +	int nfunctions;
> +};
> +
> +#define MAX_LPI_NUM_CLKS	2
> +
> +struct lpi_pinctrl {
> +	struct device *dev;
> +	struct pinctrl_dev *ctrl;
> +	struct gpio_chip chip;
> +	struct pinctrl_desc desc;
> +	char __iomem *tlmm_base;
> +	char __iomem *slew_base;
> +	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
> +	struct mutex slew_access_lock;
> +	const struct lpi_pinctrl_variant_data *data;
> +};
> +
> +/* sm8250 variant specific data */
> +static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +	PINCTRL_PIN(8, "gpio8"),
> +	PINCTRL_PIN(9, "gpio9"),
> +	PINCTRL_PIN(10, "gpio10"),
> +	PINCTRL_PIN(11, "gpio11"),
> +	PINCTRL_PIN(12, "gpio12"),
> +	PINCTRL_PIN(13, "gpio13"),
> +};
> +
> +enum sm8250_lpi_functions {
> +	LPI_MUX_swr_tx_clk,

Please sort these.

> +	LPI_MUX_qua_mi2s_sclk,
> +	LPI_MUX_swr_tx_data1,

As there's no single pin that can be both data1 and data2 I think you
should have a single group for swr_tx_data and use this function for
both swr_tx_data pins. Or perhaps even just have one for swr or swr_tx.

(This is nice when you're writing DT later on)

> +	LPI_MUX_qua_mi2s_ws,
> +	LPI_MUX_swr_tx_data2,
> +	LPI_MUX_qua_mi2s_data0,
> +	LPI_MUX_swr_rx_clk,
> +	LPI_MUX_qua_mi2s_data1,
> +	LPI_MUX_swr_rx_data1,
> +	LPI_MUX_qua_mi2s_data2,
> +	LPI_MUX_swr_tx_data3,
> +	LPI_MUX_swr_rx_data2,
> +	LPI_MUX_dmic1_clk,
> +	LPI_MUX_i2s1_clk,
> +	LPI_MUX_dmic1_data,
> +	LPI_MUX_i2s1_ws,
> +	LPI_MUX_dmic2_clk,
> +	LPI_MUX_i2s1_data0,
> +	LPI_MUX_dmic2_data,
> +	LPI_MUX_i2s1_data1,
> +	LPI_MUX_i2s2_clk,
> +	LPI_MUX_wsa_swr_clk,
> +	LPI_MUX_i2s2_ws,
> +	LPI_MUX_wsa_swr_data,
> +	LPI_MUX_dmic3_clk,
> +	LPI_MUX_i2s2_data0,
> +	LPI_MUX_dmic3_data,
> +	LPI_MUX_i2s2_data1,
> +	LPI_MUX_gpio,
> +	LPI_MUX_NA,

For me replacing "NA" with "_" makes the lpi_pingroup table below easier
to read (i.e. this becomes LPI_MUX__).

> +};
> +
> +static const unsigned int gpio0_pins[] = { 0 };
> +static const unsigned int gpio1_pins[] = { 1 };
> +static const unsigned int gpio2_pins[] = { 2 };
> +static const unsigned int gpio3_pins[] = { 3 };
> +static const unsigned int gpio4_pins[] = { 4 };
> +static const unsigned int gpio5_pins[] = { 5 };
> +static const unsigned int gpio6_pins[] = { 6 };
> +static const unsigned int gpio7_pins[] = { 7 };
> +static const unsigned int gpio8_pins[] = { 8 };
> +static const unsigned int gpio9_pins[] = { 9 };
> +static const unsigned int gpio10_pins[] = { 10 };
> +static const unsigned int gpio11_pins[] = { 11 };
> +static const unsigned int gpio12_pins[] = { 12 };
> +static const unsigned int gpio13_pins[] = { 13 };
> +static const char * const swr_tx_clk_groups[] = { "gpio0" };
> +static const char * const swr_tx_data1_groups[] = { "gpio1" };
> +static const char * const swr_tx_data2_groups[] = { "gpio2" };
> +static const char * const swr_rx_clk_groups[] = { "gpio3" };
> +static const char * const swr_rx_data1_groups[] = { "gpio4" };
> +static const char * const swr_tx_data3_groups[] = { "gpio5" };
> +static const char * const dmic1_clk_groups[] = { "gpio6" };
> +static const char * const dmic1_data_groups[] = { "gpio7" };
> +static const char * const dmic2_clk_groups[] = { "gpio8" };
> +static const char * const dmic2_data_groups[] = { "gpio9" };
> +static const char * const i2s2_clk_groups[] = { "gpio10" };
> +static const char * const i2s2_ws_groups[] = { "gpio11" };
> +static const char * const dmic3_clk_groups[] = { "gpio12" };
> +static const char * const dmic3_data_groups[] = { "gpio13" };
> +static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
> +static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
> +static const char * const qua_mi2s_data0_groups[] = { "gpio2" };
> +static const char * const qua_mi2s_data1_groups[] = { "gpio3" };
> +static const char * const qua_mi2s_data2_groups[] = { "gpio4" };
> +static const char * const swr_rx_data2_groups[] = { "gpio5" };
> +static const char * const i2s1_clk_groups[] = { "gpio6" };
> +static const char * const i2s1_ws_groups[] = { "gpio7" };
> +static const char * const i2s1_data0_groups[] = { "gpio8" };
> +static const char * const i2s1_data1_groups[] = { "gpio9" };
> +static const char * const wsa_swr_clk_groups[] = { "gpio10" };
> +static const char * const wsa_swr_data_groups[] = { "gpio11" };
> +static const char * const i2s2_data0_groups[] = { "gpio12" };
> +static const char * const i2s2_data1_groups[] = { "gpio13" };
> +
> +static const struct lpi_pingroup sm8250_groups[] = {
> +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, NA, NA),
> +	LPI_PINGROUP(1, 2, swr_tx_data1, qua_mi2s_ws, NA, NA),
> +	LPI_PINGROUP(2, 4, swr_tx_data2, qua_mi2s_data0, NA, NA),
> +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data1, NA, NA),
> +	LPI_PINGROUP(4, 10, swr_rx_data1, qua_mi2s_data2, NA, NA),
> +	LPI_PINGROUP(5, 12, swr_tx_data3, swr_rx_data2, NA, NA),
> +	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, NA,  NA),
> +	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, NA, NA),
> +	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data0, NA, NA),
> +	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data1, NA, NA),
> +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, NA, NA),
> +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, NA, NA),
> +	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data0, NA, NA),
> +	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data1, NA, NA),
> +};
> +
> +static const struct lpi_function sm8250_functions[] = {
> +	LPI_FUNCTION(swr_tx_clk),

Please sort these.

> +	LPI_FUNCTION(qua_mi2s_sclk),
> +	LPI_FUNCTION(swr_tx_data1),
> +	LPI_FUNCTION(qua_mi2s_ws),
> +	LPI_FUNCTION(swr_tx_data2),
> +	LPI_FUNCTION(qua_mi2s_data0),
> +	LPI_FUNCTION(swr_rx_clk),
> +	LPI_FUNCTION(qua_mi2s_data1),
> +	LPI_FUNCTION(swr_rx_data1),
> +	LPI_FUNCTION(qua_mi2s_data2),
> +	LPI_FUNCTION(swr_tx_data3),
> +	LPI_FUNCTION(swr_rx_data2),
> +	LPI_FUNCTION(dmic1_clk),
> +	LPI_FUNCTION(i2s1_clk),
> +	LPI_FUNCTION(dmic1_data),
> +	LPI_FUNCTION(i2s1_ws),
> +	LPI_FUNCTION(dmic2_clk),
> +	LPI_FUNCTION(i2s1_data0),
> +	LPI_FUNCTION(dmic2_data),
> +	LPI_FUNCTION(i2s1_data1),
> +	LPI_FUNCTION(i2s2_clk),
> +	LPI_FUNCTION(wsa_swr_clk),
> +	LPI_FUNCTION(i2s2_ws),
> +	LPI_FUNCTION(wsa_swr_data),
> +	LPI_FUNCTION(dmic3_clk),
> +	LPI_FUNCTION(i2s2_data0),
> +	LPI_FUNCTION(dmic3_data),
> +	LPI_FUNCTION(i2s2_data1),
> +};
> +
> +static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
> +	.tlmm_reg_offset = 0x1000,

Do we have any platform in sight where this is not 0x1000? Could we just
make a define out of it?

> +	.pins = sm8250_lpi_pins,
> +	.npins = ARRAY_SIZE(sm8250_lpi_pins),
> +	.groups = sm8250_groups,
> +	.ngroups = ARRAY_SIZE(sm8250_groups),
> +	.functions = sm8250_functions,
> +	.nfunctions = ARRAY_SIZE(sm8250_functions),
> +};
> +
> +static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
> +			 unsigned int addr)
> +{
> +	return ioread32(state->tlmm_base +
> +			state->data->tlmm_reg_offset * pin + addr);
> +}
> +
> +static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
> +			  unsigned int addr, unsigned int val)
> +{
> +	iowrite32(val, state->tlmm_base +
> +		  state->data->tlmm_reg_offset * pin + addr);
> +
> +	return 0;
> +}
> +
> +static int lpi_gpio_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pctrl->data->ngroups;
> +}
> +
> +static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
> +					   unsigned int group)
> +{
> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pctrl->data->groups[group].name;
> +}
> +
> +static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
> +				   unsigned int group,
> +				   const unsigned int **pins,
> +				   unsigned int *num_pins)
> +{
> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	*pins = pctrl->data->groups[group].pins;
> +	*num_pins = pctrl->data->groups[group].npins;
> +
> +	return 0;
> +}
> +
> +static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
> +	.get_groups_count	= lpi_gpio_get_groups_count,
> +	.get_group_name		= lpi_gpio_get_group_name,
> +	.get_group_pins		= lpi_gpio_get_group_pins,
> +	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
> +	.dt_free_map		= pinctrl_utils_free_map,
> +};
> +
> +static int lpi_gpio_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pctrl->data->nfunctions;
> +}
> +
> +static const char *lpi_gpio_get_function_name(struct pinctrl_dev *pctldev,
> +					      unsigned int function)
> +{
> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pctrl->data->functions[function].name;
> +}
> +
> +static int lpi_gpio_get_function_groups(struct pinctrl_dev *pctldev,
> +					unsigned int function,
> +					const char *const **groups,
> +					unsigned *const num_qgroups)
> +{
> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	*groups = pctrl->data->functions[function].groups;
> +	*num_qgroups = pctrl->data->functions[function].ngroups;
> +
> +	return 0;
> +}
> +
> +static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
> +			    unsigned int group_num)
> +{
> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct lpi_pingroup *g = &pctrl->data->groups[group_num];
> +	unsigned int val;
> +	int i, pin = g->pin;
> +
> +	for (i = 0; i < g->nfuncs; i++) {
> +		if (g->funcs[i] == function)
> +			break;
> +	}
> +
> +	if (WARN_ON(i == g->nfuncs))
> +		return -EINVAL;
> +
> +	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_REG_VAL_CTL);
> +	val &= ~LPI_GPIO_REG_FUNCTION_MASK;
> +	val |= i << LPI_GPIO_REG_FUNCTION_SHIFT;

I think this would benefit from FIELD_SET()

> +	lpi_gpio_write(pctrl, pin, LPI_GPIO_REG_VAL_CTL, val);
> +
> +	return 0;
> +}
> +
> +static const struct pinmux_ops lpi_gpio_pinmux_ops = {
> +	.get_functions_count	= lpi_gpio_get_functions_count,
> +	.get_function_name	= lpi_gpio_get_function_name,
> +	.get_function_groups	= lpi_gpio_get_function_groups,
> +	.set_mux		= lpi_gpio_set_mux,
> +};
> +
> +static int lpi_config_get(struct pinctrl_dev *pctldev,
> +			  unsigned int pin, unsigned long *config)
> +{
> +	unsigned int param = pinconf_to_config_param(*config);
> +	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
> +	unsigned int arg = 0;
> +	int is_out;
> +	int pull;
> +	u32 ctl_reg;
> +
> +	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_REG_DIR_CTL);
> +
> +	is_out = (ctl_reg & LPI_GPIO_REG_DIR_MASK) >> LPI_GPIO_REG_DIR_SHIFT;

This is a single bit, which would be clarified if you replaced _MASK and
_SHIFT with a single LPI_GPIO_OUT BIT(1)

> +
> +	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_REG_VAL_CTL);
> +
> +	pull = (ctl_reg & LPI_GPIO_REG_PULL_MASK) >> LPI_GPIO_REG_PULL_SHIFT;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		if (pull == LPI_GPIO_BIAS_DISABLE)
> +			arg = 1;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		if (pull == LPI_GPIO_PULL_DOWN)
> +			arg = 1;
> +		break;
> +	case PIN_CONFIG_BIAS_BUS_HOLD:
> +		if (pull == LPI_GPIO_KEEPER)
> +			arg = 1;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		if (pull == LPI_GPIO_PULL_UP)
> +			arg = 1;
> +		break;
> +	case PIN_CONFIG_INPUT_ENABLE:
> +	case PIN_CONFIG_OUTPUT:
> +		if (is_out)
> +			arg = 1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	*config = pinconf_to_config_packed(param, arg);
> +	return 0;
> +}
> +
> +static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
> +			  unsigned long *configs, unsigned int nconfs)
> +{
> +	struct lpi_pinctrl *pctrl = dev_get_drvdata(pctldev->dev);
> +	unsigned int param, arg, pullup, strength;
> +	const struct lpi_pingroup *g;
> +	bool value, output_enabled = false;
> +	unsigned long val;
> +	int i, slew_offset, ret = 0;
> +
> +	g = &pctrl->data->groups[group];
> +	for (i = 0; i < nconfs; i++) {
> +		param = pinconf_to_config_param(configs[i]);
> +		arg = pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +			pullup = LPI_GPIO_BIAS_DISABLE;
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			pullup = LPI_GPIO_PULL_DOWN;
> +			break;
> +		case PIN_CONFIG_BIAS_BUS_HOLD:
> +			pullup = LPI_GPIO_KEEPER;
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			pullup = LPI_GPIO_PULL_UP;
> +			break;
> +		case PIN_CONFIG_INPUT_ENABLE:
> +			output_enabled = false;
> +			break;
> +		case PIN_CONFIG_OUTPUT:
> +			output_enabled = true;
> +			lpi_gpio_write(pctrl, group, LPI_GPIO_REG_DIR_CTL,
> +			output_enabled << LPI_GPIO_REG_DIR_SHIFT);

Is there a reason why you write this both here and at the bottom of the
function?

> +			value = arg;
> +			break;
> +		case PIN_CONFIG_DRIVE_STRENGTH:
> +			strength = arg;
> +			break;
> +		case PIN_CONFIG_SLEW_RATE:
> +			if (arg > LPI_SLEW_RATE_MAX) {
> +				dev_err(pctldev->dev, "invalid slew rate %u for pin: %d\n",
> +					arg, group);
> +				goto set_gpio;

So if I set an invalid slew rate the remainder of the pinconf/mux
properties will be ignored and the pin configured with whatever came
before?

Wouldn't either return -EINVAL or perhaps just a break make more sense
here?

> +			}
> +
> +			slew_offset = g->slew_offset;
> +			if (slew_offset == NO_SLEW)
> +				break;
> +
> +			mutex_lock(&pctrl->slew_access_lock);
> +			val = ioread32(pctrl->slew_base + LPI_SLEW_REG_VAL_CTL);
> +
> +			for (i = 0; i < LPI_SLEW_BITS_SIZE; i++) {
> +				assign_bit(slew_offset, &val, arg & 0x01);
> +				slew_offset++;
> +				arg = arg >> 1;
> +			}
> +
> +			iowrite32(val, pctrl->slew_base + LPI_SLEW_REG_VAL_CTL);
> +
> +			mutex_unlock(&pctrl->slew_access_lock);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +set_gpio:
> +	val = lpi_gpio_read(pctrl, group, LPI_GPIO_REG_VAL_CTL);
> +	val &= ~(LPI_GPIO_REG_PULL_MASK | LPI_GPIO_REG_OUT_STRENGTH_MASK |
> +		 LPI_GPIO_REG_OE_MASK);
> +	val |= pullup << LPI_GPIO_REG_PULL_SHIFT;
> +	val |= LPI_GPIO_DS_TO_VAL(strength);

FIELD_SET() would make this prettier.

> +	if (output_enabled)
> +		val |= value << LPI_GPIO_REG_OE_SHIFT;
> +
> +	lpi_gpio_write(pctrl, group, LPI_GPIO_REG_VAL_CTL, val);
> +	lpi_gpio_write(pctrl, group, LPI_GPIO_REG_DIR_CTL,
> +		       output_enabled << LPI_GPIO_REG_DIR_SHIFT);
> +
> +	return ret;

ret is untouched since you set it to 0 at the beginning.

Regards,
Bjorn

> +}
> +
