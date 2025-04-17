Return-Path: <linux-gpio+bounces-19041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57331A92545
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 20:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE14919E707B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC449253F23;
	Thu, 17 Apr 2025 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ3u0FY1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1380C1D8DF6;
	Thu, 17 Apr 2025 18:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912840; cv=none; b=HIlA7OaI4ozY575GzQ02y/o+S1+XuZaHj3w4cNR5T/Q8Zrk36twao7Llk7yUOY5HGZjb2hcbZkx2v/eNlZNCwEQI/RA+/uD6DNlJVAJ4qm0It+SyPvxJmEcP091gA7GEOBHbFz2Rvjwj+71uPK42pnjlPjV6tVy3vGYWaqERV+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912840; c=relaxed/simple;
	bh=R4paFq9Bq+WUI2KR3lCOeX7lj2oIori6tu1aWsNdAMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZfuNoxJ23EbZyeOyarIpNiRwCxVi6inWU0JjT12Qdhlm+ZN6o/v7KMBkWEaIiYhdJs0dcuiuT62KleIPZkPDG1zX31hQinLWyvUofIY3E9UJHK6juQvcYA14cVEo2vacMMEeyK2eysK00zDXwgo4/Q8TtulU6dbVHOwROOcIhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQ3u0FY1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744912838; x=1776448838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R4paFq9Bq+WUI2KR3lCOeX7lj2oIori6tu1aWsNdAMY=;
  b=fQ3u0FY1cI+LR45kT4qIErNavR4JS6GOEWfjOwjnGM6O9iWTjBSSOanP
   QeCEor2JY22xTNqO7vTFbUGKG17qNzGHTTEHyfcNP53Ce44iz8u2+9LKb
   wf4sZp1CCseuGMFieicj26ZRxFN8hOytKcfFkry3DXsmIFjPfEIaUeBkP
   HIMx8/EC6PpAkvWtzlRjtDUVb6z1gIg8Hf8X2q+lYgNkJ8BfvTMk8/U44
   6vEJ8CnzLX+7h396HHT+xuQr8VmzQi2pCdh5S8hf3Q/1QBnj+60Z0hkVw
   gclvT44Lr/hi+bpsqK4nGWMSut5E1qD5m96gLV4eBiZFs58bYfjcfU76z
   w==;
X-CSE-ConnectionGUID: NjLK5sh0QIuZyTLDfU6peA==
X-CSE-MsgGUID: nBDAf+OvQDGtoHu68NbzWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="63938503"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="63938503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:00:37 -0700
X-CSE-ConnectionGUID: njsGoQITTYKcWxJuwfPBhw==
X-CSE-MsgGUID: OLoznFOuT7qPoEQQiKFecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161924728"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:00:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5TXM-0000000DH4S-2La4;
	Thu, 17 Apr 2025 21:00:32 +0300
Date: Thu, 17 Apr 2025 21:00:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 10/10] pinctrl: Add pin controller driver for AAEON UP
 boards
Message-ID: <aAFBwANy47y0DAhY@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:18PM +0200, Thomas Richard wrote:
> This enables the pin control support of the onboard FPGA on AAEON UP
> boards.
> 
> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> header, and also as a mux or switch.
> 
> +---------+          +--------------+             +---+
>           |          |              |             |   |
>           | PWM0     |       \      |             | H |
>           |----------|------  \-----|-------------| E |
>           | I2C0_SDA |              |             | A |
> Intel SoC |----------|------\       |             | D |
>           | GPIO0    |       \------|-------------| E |
>           |----------|------        |             | R |
>           |          |     FPGA     |             |   |
> ----------+          +--------------+             +---+
> 
> For most of the pins, the FPGA opens/closes a switch to enable/disable
> the access to the SoC pin from a pin header.
> Each switch, has a direction flag that is set depending the status of the
> SoC pin.
> 
> For some other pins, the FPGA acts as a mux, and routes one pin (or the
> other one) to the header.
> 
> The driver provides also a gpiochip. It requests SoC pins in GPIO mode,
> and drives them in tandem with FPGA pins (switch/mux direction).
> 
> This commit adds support only for UP Squared board

Missed period.

...

> +/*
> + * UP board pin control driver.
> + *
> + * Copyright (C) 2024 Bootlin

My calendar shows something different :-)

> + *
> + * Author: Thomas Richard <thomas.richard@bootlin.com>
> + */

> +#include <linux/array_size.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/gpio/forwarder.h>
> +#include <linux/mfd/upboard-fpga.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/seq_file.h>

+ types.h (bool and NULL from stddef.h that will be included).

...

> +static const enum upboard_pin_mode upboard_up2_uart1_modes[] = {
> +	UPBOARD_PIN_MODE_GPIO_OUT,
> +	UPBOARD_PIN_MODE_GPIO_IN,
> +	UPBOARD_PIN_MODE_GPIO_OUT,
> +	UPBOARD_PIN_MODE_GPIO_IN

Leave trailing comma in such cases.

> +};

...

> +static int upboard_pinctrl_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
> +				   unsigned int group_selector)
> +{
> +	struct upboard_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct upboard_pinctrl_data *pctrl_data = pctrl->pctrl_data;
> +	const struct upboard_pingroup *upgroups = pctrl_data->groups;
> +	struct group_desc *grp;
> +	unsigned int mode, i;
> +	int ret;
> +
> +	grp = pinctrl_generic_get_group(pctldev, group_selector);
> +	if (!grp)
> +		return -EINVAL;
> +
> +	for (i = 0; i < grp->grp.npins; i++) {
> +		mode = upgroups[group_selector].mode ?: upgroups[group_selector].modes[i];

> +

Unneeded blank line.

> +		if (mode == UPBOARD_PIN_MODE_FUNCTION) {
> +			ret = upboard_pinctrl_set_function(pctldev, grp->grp.pins[i]);
> +			if (ret)
> +				return ret;
> +
> +			continue;
> +		}
> +
> +		ret = upboard_pinctrl_gpio_commit_enable(pctldev, grp->grp.pins[i]);
> +		if (ret)
> +			return ret;
> +
> +		ret = upboard_pinctrl_gpio_commit_direction(pctldev, grp->grp.pins[i],
> +							    mode == UPBOARD_PIN_MODE_GPIO_IN);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

...

> +static void upboard_pinctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> +				     unsigned int offset)
> +{
> +	int ret;
> +
> +	ret = upboard_pinctrl_pin_get_mode(pctldev, offset);

> +

Unneeded blank line.

> +	if (ret == UPBOARD_PIN_MODE_FUNCTION)
> +		seq_puts(s, "mode function ");
> +	else if (ret == UPBOARD_PIN_MODE_DISABLED)
> +		seq_puts(s, "HIGH-Z");
> +	else
> +		seq_printf(s, "GPIO (%s) ", ret == UPBOARD_PIN_MODE_GPIO_IN ? "input" : "output");

str_input_output() from string_choices.h ?

Ah, we still have no such... In case you have motivation, you can add a patch,
I will Ack/Review it.

> +}

...

> +static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = container_of(gc, struct gpiochip_fwd, chip);
> +	struct upboard_pinctrl *pctrl = fwd->data;

Yeah, something like

	struct upboard_pinctrl *pctrl = gpio_fwd_get_data(fwd);

> +	unsigned int pin = pctrl->pctrl_data->pin_header[offset];
> +	struct gpio_desc *desc;
> +	int ret;
> +
> +	ret = pinctrl_gpio_request(gc, offset);
> +	if (ret)
> +		return ret;

> +	/* GPIO desc is already registered */
> +	if (fwd->descs[offset])
> +		return 0;

As mentioned in another reply, why 0 and even though, why can't it be simply
filtered by EEXIST from the below?

In worst scenario, you can add an API gpio_fwd_is_registered(fwd, offset).

> +	desc = gpiod_get_index(pctrl->dev, "external", pin, 0);
> +	if (IS_ERR(desc)) {
> +		pinctrl_gpio_free(gc, offset);
> +		return PTR_ERR(desc);
> +	}
> +
> +	return gpio_fwd_add_gpio_desc(fwd, desc, offset);
> +}

...

> +static int upboard_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = container_of(gc, struct gpiochip_fwd, chip);
> +	struct upboard_pinctrl *pctrl = fwd->data;
> +	unsigned int pin = pctrl->pctrl_data->pin_header[offset];
> +	int mode;
> +
> +	/* If the pin is in function mode or high-z, input direction is returned */
> +	mode = upboard_pinctrl_pin_get_mode(pctrl->pctldev, pin);
> +	if (mode < 0)
> +		return mode;
> +
> +	if (mode == UPBOARD_PIN_MODE_GPIO_OUT)
> +		return GPIO_LINE_DIRECTION_OUT;

> +	else

Redundant 'else'.

> +		return GPIO_LINE_DIRECTION_IN;
> +}

...

> +static int upboard_pinctrl_register_functions(struct upboard_pinctrl *pctrl)
> +{
> +	const struct pinfunction *funcs = pctrl->pctrl_data->funcs;
> +	size_t nfuncs = pctrl->pctrl_data->nfuncs;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < nfuncs ; ++i) {

Why out of a sudden pre-increment?

> +		ret = pinmux_generic_add_function(pctrl->pctldev, funcs[i].name,
> +						  funcs[i].groups, funcs[i].ngroups, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

...

> +static int upboard_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct upboard_fpga *fpga = dev_get_drvdata(dev->parent);
> +	const struct dmi_system_id *dmi_id;
> +	enum upboard_board_id board_id;
> +	struct pinctrl_desc *pctldesc;
> +	struct upboard_pinctrl *pctrl;
> +	struct upboard_pin *pins;
> +	struct gpiochip_fwd *fwd;
> +	struct pinctrl *pinctrl;
> +	struct gpio_chip *chip;
> +	int ret, i;

Why i is signed while other code uses unsigned loop iterators?

> +	pctldesc = devm_kzalloc(dev, sizeof(*pctldesc), GFP_KERNEL);
> +	if (!pctldesc)
> +		return -ENOMEM;
> +
> +	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
> +	if (!pctrl)
> +		return -ENOMEM;
> +
> +	switch (fpga->fpga_data->type) {
> +	case UPBOARD_UP_FPGA:
> +		pctldesc->pins = upboard_up_pins;
> +		pctldesc->npins = ARRAY_SIZE(upboard_up_pins);
> +		pctrl->pctrl_data = &upboard_up_pinctrl_data;
> +		break;
> +	case UPBOARD_UP2_FPGA:
> +		pctldesc->pins = upboard_up2_pins;
> +		pctldesc->npins = ARRAY_SIZE(upboard_up2_pins);
> +		pctrl->pctrl_data = &upboard_up2_pinctrl_data;
> +		break;
> +	default:
> +		return dev_err_probe(dev, -ENODEV, "Unsupported device type %d\n",
> +				     fpga->fpga_data->type);
> +	}
> +
> +	dmi_id = dmi_first_match(dmi_platform_info);
> +	if (!dmi_id)
> +		return -ENODEV;
> +
> +	board_id = (enum upboard_board_id)dmi_id->driver_data;

This might need to have an intermediate cast to (unsigned long). Have you run
the build with Clang 19 and `make W=1`?

> +
> +	switch (board_id) {
> +	case UPBOARD_APL01:
> +		pctrl->maps = upboard_pinctrl_mapping_apl01;
> +		pctrl->nmaps = ARRAY_SIZE(upboard_pinctrl_mapping_apl01);
> +		break;
> +	default:
> +		return dev_err_probe(dev, -ENODEV, "Unsupported board\n");
> +	}
> +
> +	pctldesc->name = dev_name(dev);
> +	pctldesc->owner = THIS_MODULE;
> +	pctldesc->pctlops = &upboard_pinctrl_ops;
> +	pctldesc->pmxops = &upboard_pinmux_ops;
> +
> +	pctrl->dev = dev;
> +
> +	pins = devm_kcalloc(dev, pctldesc->npins, sizeof(*pins), GFP_KERNEL);
> +	if (!pins)
> +		return -ENOMEM;
> +
> +	/* Initialize pins */
> +	for (i = 0; i < pctldesc->npins; i++) {
> +		const struct pinctrl_pin_desc *pin_desc = &pctldesc->pins[i];
> +		unsigned int regoff = pin_desc->number / UPBOARD_REGISTER_SIZE;
> +		unsigned int lsb = pin_desc->number % UPBOARD_REGISTER_SIZE;
> +		struct reg_field * const fld_func = pin_desc->drv_data;
> +		struct upboard_pin *pin = &pins[i];
> +		struct reg_field fldconf = {};
> +
> +		if (fld_func) {
> +			pin->funcbit = devm_regmap_field_alloc(dev, fpga->regmap, *fld_func);
> +			if (IS_ERR(pin->funcbit))
> +				return PTR_ERR(pin->funcbit);
> +		}
> +
> +		fldconf.reg = UPBOARD_REG_GPIO_EN0 + regoff;
> +		fldconf.lsb = lsb;
> +		fldconf.msb = lsb;
> +		pin->enbit = devm_regmap_field_alloc(dev, fpga->regmap, fldconf);
> +		if (IS_ERR(pin->enbit))
> +			return PTR_ERR(pin->enbit);
> +
> +		fldconf.reg = UPBOARD_REG_GPIO_DIR0 + regoff;
> +		fldconf.lsb = lsb;
> +		fldconf.msb = lsb;
> +		pin->dirbit = devm_regmap_field_alloc(dev, fpga->regmap, fldconf);
> +		if (IS_ERR(pin->dirbit))
> +			return PTR_ERR(pin->dirbit);
> +	}
> +
> +	pctrl->pins = pins;
> +
> +	ret = devm_pinctrl_register_and_init(dev, pctldesc, pctrl, &pctrl->pctldev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
> +
> +	ret = upboard_pinctrl_register_groups(pctrl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register groups\n");
> +
> +	ret = upboard_pinctrl_register_functions(pctrl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register functions\n");
> +
> +	ret = devm_pinctrl_register_mappings(dev, pctrl->maps, pctrl->nmaps);
> +	if (ret)
> +		return ret;
> +
> +	pinctrl = devm_pinctrl_get_select_default(dev);
> +	if (IS_ERR(pinctrl))
> +		return dev_err_probe(dev, PTR_ERR(pinctrl), "Failed to select pinctrl\n");
> +
> +	ret = pinctrl_enable(pctrl->pctldev);
> +	if (ret)
> +		return ret;
> +
> +	fwd = devm_gpio_fwd_alloc(dev, pctrl->pctrl_data->ngpio);
> +	if (IS_ERR(fwd))
> +		return dev_err_probe(dev, PTR_ERR(fwd), "Failed to allocate the gpiochip forwarder\n");
> +
> +	chip = &fwd->chip;
> +	chip->request = upboard_gpio_request;
> +	chip->free = upboard_gpio_free;
> +	chip->get_direction = upboard_gpio_get_direction;
> +	chip->direction_output = upboard_gpio_direction_output;
> +	chip->direction_input = upboard_gpio_direction_input;
> +
> +	ret = gpio_fwd_register(fwd, pctrl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register the gpiochip forwarder\n");

> +	return gpiochip_add_sparse_pin_range(chip, dev_name(dev), 0, pctrl->pctrl_data->pin_header,
> +					     pctrl->pctrl_data->ngpio);
> +
> +	return ret;

Stray return.

> +}

...

> +static struct platform_driver upboard_pinctrl_driver = {
> +	.driver = {
> +		.name = "upboard-pinctrl",
> +	},
> +	.probe = upboard_pinctrl_probe,
> +};

> +

Unneeded blank line.

> +module_platform_driver(upboard_pinctrl_driver);

-- 
With Best Regards,
Andy Shevchenko



