Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE962CB9E2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 10:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgLBJ5T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 04:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgLBJ5S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 04:57:18 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373CCC0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  2 Dec 2020 01:56:38 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 23so2885194wrc.8
        for <linux-gpio@vger.kernel.org>; Wed, 02 Dec 2020 01:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TAm2OziarTCe070YC3SxoosVtP3Io+4yUgTnTBylzhE=;
        b=UwzG/HK2Ot9rFjWIMW2T+YZSxdYFvI2U7xs++xKENivMvRuoYYt9sKmuU5QnMr4clW
         quyXhab4tkpgxRANd2Q3+qjNX6ZFSa0ArSe6IJbFoEkS3jfeCtt7cyTNFK2/QJa/z5WS
         giE2TluMQzN2bh7UKLwBvDlPj/iDjtMmPtihgGD+X0ObXgNor21uD9CZlbLxI9kIgdJx
         Vs9ouXhmnt5UPX1kSUu+izN35mPENGXqjXBil61a/L06uLI13LfSxKW7ZDsJWL0Rsyh5
         X1fYgU+tQsy+Uto1HMKW0OappeRQbSqnAnVWh+JxOk1jtuDLsTyJJ2RLcy4cfCUmxRUt
         ucBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TAm2OziarTCe070YC3SxoosVtP3Io+4yUgTnTBylzhE=;
        b=G7DHfC7FLrPucZ2AzUeK91FXMDZEijJcxfELMOCSjQ99aYyxxiyloKYoZ4XkRgg2cR
         JA+h/ZkFPWrohKokOp5Bc9LsG/qbhvX/OQIWVkCCsukEumxzPkRGtXzynSjrq6/idGqR
         YrdwtRGf3RLKR/OIStaDdarr67obqpekJgMhNptmMfSPT0V+UhNUVXAK9Zokw2yrYUV1
         qI1sbwbI7IGBYAUrs76n/bAImiscTlWveY7JnTzzabXMAd7FtX9j1uLYdZCK3VFwQugA
         9yK5uf1rSE3wf/juY6ALYbERqb0vi5GweClcMaIsFhOcNEmHY5ha3+phN5LA5Ki4JkFb
         MBVQ==
X-Gm-Message-State: AOAM53131ZGO6gJvXsTOif7Pu315ZJ/jhNVPV1JGdomgRAuFZFbc454o
        zVYhUs3GNlnqmyCQ82z9rx6vWg==
X-Google-Smtp-Source: ABdhPJzj1CjFhb1sNfcV5+YJXhmLTp4xferpDnUkLqBNY/SmtT8GglALmCv7b0bPfAcOwA5v68nlpQ==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr2371811wrt.372.1606902996818;
        Wed, 02 Dec 2020 01:56:36 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id m4sm1288221wmi.41.2020.12.02.01.56.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 01:56:36 -0800 (PST)
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201201142830.13152-1-srinivas.kandagatla@linaro.org>
 <20201201142830.13152-3-srinivas.kandagatla@linaro.org>
 <X8ad9lw73ZKsqXKT@builder.lan>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c7f8e95d-21aa-b723-2b6e-0420cb400025@linaro.org>
Date:   Wed, 2 Dec 2020 09:56:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X8ad9lw73ZKsqXKT@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Bjorn for the review,

On 01/12/2020 19:48, Bjorn Andersson wrote:
> On Tue 01 Dec 08:28 CST 2020, Srinivas Kandagatla wrote:
> 
>> Add initial pinctrl driver to support pin configuration for
>> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
>> on SM8250.
>>
>> This IP is an additional pin control block for Audio Pins on top the
>> existing SoC Top level pin-controller.
>> Hardware setup looks like:
>>
>> TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]
>>
>> This pin controller has some similarities compared to Top level
>> msm SoC Pin controller like 'each pin belongs to a single group'
>> and so on. However this one is intended to control only audio
>> pins in particular, which can not be configured/touched by the
>> Top level SoC pin controller except setting them as gpios.
>> Apart from this, slew rate is also available in this block for
>> certain pins which are connected to SLIMbus or SoundWire Bus.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/pinctrl/qcom/Kconfig             |   8 +
>>   drivers/pinctrl/qcom/Makefile            |   1 +
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 727 +++++++++++++++++++++++
>>   3 files changed, 736 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>>
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index 5fe7b8aaf69d..d3e4e89c2810 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -236,4 +236,12 @@ config PINCTRL_SM8250
>>   	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
>>   	  Technologies Inc SM8250 platform.
>>   
>> +config PINCTRL_LPASS_LPI
>> +	tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
>> +	depends on GPIOLIB
>> +	help
>> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>> +	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
>> +
>>   endif
>> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
>> index 9e3d9c91a444..c8520155fb1b 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -28,3 +28,4 @@ obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
>>   obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
>>   obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
>>   obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
>> +obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> new file mode 100644
>> index 000000000000..96c63a33fc99
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -0,0 +1,727 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2020 Linaro Ltd.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/pinctrl/pinconf.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +#include "../core.h"
>> +#include "../pinctrl-utils.h"
>> +
>> +#define LPI_GPIO_CFG_REG		0x00
>> +#define LPI_GPIO_VALUE_REG		0x04
>> +#define LPI_SLEW_RATE_CTL_REG		0xa000
>> +#define LPI_SLEW_RATE_MAX		0x03
>> +#define LPI_SLEW_BITS_SIZE		0x02
>> +#define LPI_GPIO_PULL_SHIFT		0x0
>> +#define LPI_GPIO_PULL_MASK		GENMASK(1, 0)
>> +#define LPI_GPIO_FUNCTION_SHIFT		0x2
>> +#define LPI_GPIO_FUNCTION_MASK	GENMASK(5, 2)
>> +#define LPI_GPIO_OUT_STRENGTH_SHIFT	0x6
>> +#define LPI_GPIO_OUT_STRENGTH_MASK	GENMASK(8, 6)
>> +#define LPI_GPIO_OE_SHIFT		0x9
>> +#define LPI_GPIO_OE_MASK		BIT(9)
>> +#define LPI_GPIO_DIR_SHIFT		0x1
>> +#define LPI_GPIO_DIR_MASK		0x2
> 
> The naming of these two constants no longer relates the their register.
> And you no longer use the MASK, so please drop this.
> 
Yes, most of these defines are redundant can be removed, I will clean 
that up!

> That said the use of "shift" still doesn't give away the obvious fact
> that this is a single bit specifying if the output should be high or
> low. You would capture this by doing something like:
> 
> #define LPI_GPIO_VALUE_HIGH	BIT(1)
> 
Sure will make this explicit!

>> +#define LPI_GPIO_BIAS_DISABLE		0x0
>> +#define LPI_GPIO_PULL_DOWN		0x1
>> +#define LPI_GPIO_KEEPER			0x2
>> +#define LPI_GPIO_PULL_UP		0x3
>> +#define LPI_GPIO_DS_TO_VAL(v) ((v / 2 - 1) << LPI_GPIO_OUT_STRENGTH_SHIFT)
>> +#define NO_SLEW				-1
>> +
>> +#define LPI_FUNCTION(fname)			                \
>> +	[LPI_MUX_##fname] = {		                \
>> +		.name = #fname,				\
>> +		.groups = fname##_groups,               \
>> +		.ngroups = ARRAY_SIZE(fname##_groups),	\
>> +	}
>> +
>>
>> +
>> +static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>> +			    unsigned int group_num)
>> +{
>> +	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> +	const struct lpi_pingroup *g = &pctrl->data->groups[group_num];
>> +	u32 val;
>> +	int i, pin = g->pin;
>> +
>> +	for (i = 0; i < g->nfuncs; i++) {
>> +		if (g->funcs[i] == function)
>> +			break;
>> +	}
>> +
>> +	if (WARN_ON(i == g->nfuncs))
>> +		return -EINVAL;
>> +
>> +	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
>> +	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
> 
> I really meant FIELD_SET(), but now realize that there's only
> FIELD_PREP() and FIELD_GET() in linux/bitfields.h. I think that should
> be corrected, but this seems to do the trick...
> 
I knew that FILED_SET does not exists, Howeever using FIELD_* macros 
here to modify bits would still require 2 lines, one to manually clear 
the bits and then use FILED_SET.

replace_bits() api does nicely!

>> +	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct pinmux_ops lpi_gpio_pinmux_ops = {
>> +	.get_functions_count	= lpi_gpio_get_functions_count,
>> +	.get_function_name	= lpi_gpio_get_function_name,
>> +	.get_function_groups	= lpi_gpio_get_function_groups,
>> +	.set_mux		= lpi_gpio_set_mux,
>> +};
>> +
>> +static int lpi_config_get(struct pinctrl_dev *pctldev,
>> +			  unsigned int pin, unsigned long *config)
>> +{
>> +	unsigned int param = pinconf_to_config_param(*config);
>> +	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
>> +	unsigned int arg = 0;
>> +	int is_out;
>> +	int pull;
>> +	u32 ctl_reg;
>> +
>> +	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG);
>> +	is_out = ctl_reg & LPI_GPIO_OE_MASK;
>> +	pull = (ctl_reg & LPI_GPIO_PULL_MASK) >> LPI_GPIO_PULL_SHIFT;
>> +
>> +	switch (param) {
>> +	case PIN_CONFIG_BIAS_DISABLE:
>> +		if (pull == LPI_GPIO_BIAS_DISABLE)
>> +			arg = 1;
>> +		break;
>> +	case PIN_CONFIG_BIAS_PULL_DOWN:
>> +		if (pull == LPI_GPIO_PULL_DOWN)
>> +			arg = 1;
>> +		break;
>> +	case PIN_CONFIG_BIAS_BUS_HOLD:
>> +		if (pull == LPI_GPIO_KEEPER)
>> +			arg = 1;
>> +		break;
>> +	case PIN_CONFIG_BIAS_PULL_UP:
>> +		if (pull == LPI_GPIO_PULL_UP)
>> +			arg = 1;
>> +		break;
>> +	case PIN_CONFIG_INPUT_ENABLE:
>> +	case PIN_CONFIG_OUTPUT:
>> +		if (is_out)
>> +			arg = 1;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	*config = pinconf_to_config_packed(param, arg);
>> +	return 0;
>> +}
>> +
>> +static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
>> +			  unsigned long *configs, unsigned int nconfs)
>> +{
>> +	struct lpi_pinctrl *pctrl = dev_get_drvdata(pctldev->dev);
>> +	unsigned int param, arg, pullup, strength;
>> +	bool value, output_enabled = false;
>> +	const struct lpi_pingroup *g;
>> +	unsigned long sval;
>> +	int i, slew_offset;
>> +	u32 val;
>> +
>> +	g = &pctrl->data->groups[group];
>> +	for (i = 0; i < nconfs; i++) {
>> +		param = pinconf_to_config_param(configs[i]);
>> +		arg = pinconf_to_config_argument(configs[i]);
>> +
>> +		switch (param) {
>> +		case PIN_CONFIG_BIAS_DISABLE:
>> +			pullup = LPI_GPIO_BIAS_DISABLE;
>> +			break;
>> +		case PIN_CONFIG_BIAS_PULL_DOWN:
>> +			pullup = LPI_GPIO_PULL_DOWN;
>> +			break;
>> +		case PIN_CONFIG_BIAS_BUS_HOLD:
>> +			pullup = LPI_GPIO_KEEPER;
>> +			break;
>> +		case PIN_CONFIG_BIAS_PULL_UP:
>> +			pullup = LPI_GPIO_PULL_UP;
>> +			break;
>> +		case PIN_CONFIG_INPUT_ENABLE:
>> +			output_enabled = false;
>> +			break;
>> +		case PIN_CONFIG_OUTPUT:
>> +			output_enabled = true;
>> +			value = arg;
>> +			break;
>> +		case PIN_CONFIG_DRIVE_STRENGTH:
>> +			strength = arg;
>> +			break;
>> +		case PIN_CONFIG_SLEW_RATE:
>> +			if (arg > LPI_SLEW_RATE_MAX) {
>> +				dev_err(pctldev->dev, "invalid slew rate %u for pin: %d\n",
>> +					arg, group);
>> +				return -EINVAL;
>> +			}
>> +
>> +			slew_offset = g->slew_offset;
>> +			if (slew_offset == NO_SLEW)
>> +				break;
>> +
>> +			mutex_lock(&pctrl->slew_access_lock);
>> +			sval = ioread32(pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
>> +
>> +			for (i = 0; i < LPI_SLEW_BITS_SIZE; i++) {
>> +				assign_bit(slew_offset, &sval, arg & 0x01);
>> +				slew_offset++;
>> +				arg = arg >> 1;
>> +			}
> 
> Isn't this loop just the same as
> 
> 	FIELD_SET(3 << slew_offset, arg & 3, sval)

This will not work FIELD_SET will not clear any bits wich are already 
set! assing_bit will work, but we could do better by adding slew_mask 
per pin rather than slew_offset which should allow us to use 
replace_bits straight away.

> 
> And as you already checked arg agains LPI_SLEW_RATE_MAX you should be
> able to drop the & 3 there in the middle.
> 
>> +
>> +			iowrite32(sval, pctrl->slew_base + LPI_SLEW_RATE_CTL_REG);
>> +
>> +			mutex_unlock(&pctrl->slew_access_lock);
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
>> +
>> +	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
>> +	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
>> +			  LPI_GPIO_OUT_STRENGTH_MASK);
>> +	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
>> +
>> +	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
>> +
>> +	if (output_enabled)
>> +		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
>> +			       value << LPI_GPIO_DIR_SHIFT);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct pinconf_ops lpi_gpio_pinconf_ops = {
>> +	.is_generic			= true,
>> +	.pin_config_group_get		= lpi_config_get,
>> +	.pin_config_group_set		= lpi_config_set,
>> +};
>> +
>> +static int lpi_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
>> +{
>> +	struct lpi_pinctrl *state = gpiochip_get_data(chip);
>> +	unsigned long config;
>> +
>> +	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
>> +
>> +	return lpi_config_set(state->ctrl, pin, &config, 1);
>> +}
>> +
>> +static int lpi_gpio_direction_output(struct gpio_chip *chip,
>> +				     unsigned int pin, int val)
>> +{
>> +	struct lpi_pinctrl *state = gpiochip_get_data(chip);
>> +	unsigned long config;
>> +
>> +	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
>> +
>> +	return lpi_config_set(state->ctrl, pin, &config, 1);
>> +}
>> +
>> +static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
>> +{
>> +	struct lpi_pinctrl *state = gpiochip_get_data(chip);
>> +	int value;
>> +
>> +	value = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG);
>> +	return value;
> 
> I must have missed this last round, gpio_get() should return the current
> value of the pin, i.e:
> 
Thanks I missed this one as well!
> 	return lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG) & BIT(0);
> 
>> +}
>> +
>> +static void lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
>> +{
>> +	struct lpi_pinctrl *state = gpiochip_get_data(chip);
>> +	unsigned long config;
>> +
>> +	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
>> +
>> +	lpi_config_set(state->ctrl, pin, &config, 1);
>> +}
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +#include <linux/seq_file.h>
>> +
>> +static unsigned int lpi_regval_to_drive(u32 val)
>> +{
>> +	return (val + 1) * 2;
>> +}
>> +
>> +static void lpi_gpio_dbg_show_one(struct seq_file *s,
>> +				  struct pinctrl_dev *pctldev,
>> +				  struct gpio_chip *chip,
>> +				  unsigned int offset,
>> +				  unsigned int gpio)
>> +{
>> +	struct lpi_pinctrl *state = gpiochip_get_data(chip);
>> +	struct pinctrl_pin_desc pindesc;
>> +	unsigned int func;
>> +	int is_out;
>> +	int drive;
>> +	int pull;
>> +	u32 ctl_reg;
>> +
>> +	static const char * const pulls[] = {
>> +		"no pull",
>> +		"pull down",
>> +		"keeper",
>> +		"pull up"
>> +	};
>> +
>> +	pctldev = pctldev ? : state->ctrl;
>> +	pindesc = pctldev->desc->pins[offset];
>> +	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
>> +	is_out = ctl_reg & LPI_GPIO_OE_MASK;
>> +
>> +	func = (ctl_reg & LPI_GPIO_FUNCTION_MASK) >> LPI_GPIO_FUNCTION_SHIFT;
> 
> func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
> 
>> +	drive = (ctl_reg & LPI_GPIO_OUT_STRENGTH_MASK) >>
>> +		 LPI_GPIO_OUT_STRENGTH_SHIFT;
> 
> drive = FIELD_GET(LPI_GPIO_OUT_STRENGTH_MASK, ctl_reg);
> 
>> +	pull = (ctl_reg & LPI_GPIO_PULL_MASK) >> LPI_GPIO_PULL_SHIFT;
> 
> pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);

Make sense, will do it!

> 
>> +
>> +	seq_printf(s, " %-8s: %-3s %d",
>> +		   pindesc.name, is_out ? "out" : "in", func);
> 
> This line doesn't need to be broken.


thanks,
srini
> 
> Regards,
> Bjorn
> 
