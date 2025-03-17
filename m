Return-Path: <linux-gpio+bounces-17706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB3CA65D0B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 19:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 672133AABD5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 18:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C254199947;
	Mon, 17 Mar 2025 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXFNN7N6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE44BA47;
	Mon, 17 Mar 2025 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742236986; cv=none; b=fP9wIcPNOj+FmbcKoeZ22yHdV8lD8SuGLS4qY2KHaXa6siV5xtm0xv/YIvkFtrA+Qu/WoLyOqMeVyx4zlOX+/eaHCctY2v5yhG1+E1WoIzYn8HYypFkI4wS6UJH90B8VQdlo4qNnLF4/00A8kioP+Co0v45RHaAcujtt2rITt2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742236986; c=relaxed/simple;
	bh=Df12J3/n6uAFGFqkVYDrYUtc/fislUTXkR3uDuemZ/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2hLilzNr4ke7fVEdHNiYq7lTbpVXk2XybMSx7ybw5NoZF7D5oOiDPmmZR/4Ne6qJ8OlhO5cCyZQlpgSFWx2D29zXFCz71ncQOqKpOfFCEj21Ol3voN2XifKQOSk1v4qfjcWkY+53+f6T38O3sNrtcdheyqCMi4KqcM7GOq6pNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXFNN7N6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742236984; x=1773772984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Df12J3/n6uAFGFqkVYDrYUtc/fislUTXkR3uDuemZ/A=;
  b=eXFNN7N6dsKMDa0ZdDCcxlIRuXmctRgu3TBmHRHmxdFPBrvk4nMqemGr
   OKTlYDQlu3SnVqyw7HNu67/9fcJdasDxGH8veInLEffGym3BBs6jCSdBV
   Ko+Ncaa//dOnD+SHuyQQdBWjruwwQES6z6mQWyfbTAf/8dQJZ+93qTvNN
   8ro5W7qXdMWO6bsPliSYlkbqQ9tliDlz6f1DQW/6KAc4SFUM4Mp5UxgLu
   eXqTc+3fRjvzSaaa9M143mQHB03VO43gmUyarTRE0Y9u5T8XNa19aQPiK
   lJPck7hb/At0zI+bFMSZC0AVplfiztznBFXcDVmOLVutuu4YKsbbLY8TU
   w==;
X-CSE-ConnectionGUID: aT/HxZcgQeG8lduAlCVK3g==
X-CSE-MsgGUID: 0u9RAWebQ6CjrF+P6N5hOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="30931756"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="30931756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 11:43:03 -0700
X-CSE-ConnectionGUID: twayqOCaTqmRgB3YIL0tEA==
X-CSE-MsgGUID: Qe5hfasBSoG/8ujF8a+7Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="122519497"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 11:43:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuFQP-00000003O1N-1Ayq;
	Mon, 17 Mar 2025 20:42:57 +0200
Date: Mon, 17 Mar 2025 20:42:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH RFC v2 6/6] pinctrl: Add pin controller driver for AAEON
 UP boards
Message-ID: <Z9htMdC_E-QFDiRD@smile.fi.intel.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-6-36126e30aa62@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-6-36126e30aa62@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 04:38:04PM +0100, Thomas Richard wrote:
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
> UP boards and UP Squared boards are supported.

> Based on the work done by Gary Wang <garywang@aaeon.com.tw>, largely
> rewritten.

I am not against giving the credit(s), but with "largely rewritten" it sounds
to me like a cover letter material (or comments block after '---' line below).

> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

...

> +config PINCTRL_UPBOARD
> +	tristate "AAeon UP board FPGA pin controller"
> +	depends on MFD_UPBOARD_FPGA
> +	select PINMUX
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIO_AGGREGATOR
> +	help
> +	  Pin controller for the FPGA GPIO lines on UP boards. Due to the
> +	  hardware layout, the driver control the FPGA pins in tandem with
> +	  their corresponding Intel SoC GPIOs.

	  Currently supported:
	  - UP board
	  - UP Squared board

> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pinctrl-upboard.

...

> +/*
> + * UP board pin control driver.
> + *
> + * FPGA provides more GPIO driving power, LEDS and pin mux function.
> + *
> + * Copyright (c) AAEON. All rights reserved.
> + * Copyright (C) 2024 Bootlin

> + * Author: Gary Wang <garywang@aaeon.com.tw>

Hmm... If you want him to be the author you probably want to have his SoB
and Co-developed-by, but again, it contradicts with "largely rewritten"
(in my book it's 67%+, is it the case here?).

> + * Author: Thomas Richard <thomas.richard@bootlin.com>
> + */

...

> +#include <linux/device.h>
> +#include <linux/dmi.h>

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/gpio-fwd.h>

I'm wondering if we may guarantee the consumer.h and driver.h be provided by
forwarder.h as it sounds natural choice if one wants to have the GPIO forwarder
library.

> +#include <linux/mfd/upboard-fpga.h>
> +#include <linux/module.h>

> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>

We usually move this group of inclusions separately...

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/seq_file.h>

...somewhere here.

> +#include "core.h"
> +#include "pinmux.h"

...

> +enum upboard_board_id {
> +	BOARD_UP_APL01,
> +};

This doesn't sound like a list of two or more... Why do you need it?

...

> +enum upboard_pin_mode {
> +	UPBOARD_PIN_MODE_FUNCTION = 1,
> +	UPBOARD_PIN_MODE_GPIO_IN,
> +	UPBOARD_PIN_MODE_GPIO_OUT,
> +	UPBOARD_PIN_MODE_DISABLED,

Why from 1? Is it by HW? In such a case you need to strictly assign _all_ of
them.

> +};

...

> +#define UPBOARD_UP_PIN_NAME(id)					\
> +	{							\
> +		.number = UPBOARD_UP_BIT_##id,			\
> +		.name = #id,					\
> +	}
> +
> +#define UPBOARD_UP_PIN_MUX(bit, data)				\
> +	{							\
> +		.number = UPBOARD_UP_BIT_##bit,			\
> +		.name = "PINMUX_"#bit,				\
> +		.drv_data = (void *)(data),			\
> +	}
> +
> +#define UPBOARD_UP_PIN_FUNC(id, data)				\
> +	{							\
> +		.number = UPBOARD_UP_BIT_##id,			\
> +		.name = #id,					\
> +		.drv_data = (void *)(data),			\
> +	}

Don't we have macros already in pin control headers (global and
subsystem ones)?

...

> +static_assert(ARRAY_SIZE(upboard_up_uart1_modes) ==
> +	      ARRAY_SIZE(upboard_up_uart1_pins));

One line, also include array_size.h.
Ditto for the rest of similar cases.

...

> +#define UPBOARD_PINGROUP_MODE(_grp, _pins, _mode)			\
> +{									\
> +	.grp = PINCTRL_PINGROUP(_grp, _pins, ARRAY_SIZE(_pins)),	\
> +	.mode = _mode,							\
> +}
> +
> +#define UPBOARD_PINGROUP_MODES(_grp, _pins, _modes)			\
> +{									\
> +	.grp = PINCTRL_PINGROUP(_grp, _pins, ARRAY_SIZE(_pins)),	\
> +	.modes = _modes,							\
> +}

See the trick in pinctrl-intel.h how to make it a single macro.

...

> +#define UPBOARD_UP2_PIN_NAME(id)					\
> +	{								\
> +		.number = UPBOARD_UP2_BIT_##id,				\
> +		.name = #id,						\
> +	}
> +
> +#define UPBOARD_UP2_PIN_MUX(bit, data)					\
> +	{								\
> +		.number = UPBOARD_UP2_BIT_##bit,			\
> +		.name = "PINMUX_"#bit,					\
> +		.drv_data = (void *)(data),				\
> +	}
> +
> +#define UPBOARD_UP2_PIN_FUNC(id, data)					\
> +	{								\
> +		.number = UPBOARD_UP2_BIT_##id,				\
> +		.name = #id,						\
> +		.drv_data = (void *)(data),				\
> +	}

As per above, use already given macros in the above.

...

> +static int upboard_pinctrl_gpio_commit_enable(struct pinctrl_dev *pctldev, unsigned int offset)
> +{
> +	struct upboard_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	struct upboard_pin *p = &pctrl->pins[offset];

	int ret;

> +	if (p->funcbit) {
> +		int ret = regmap_field_write(p->funcbit, 0);
> +
> +		if (ret)
> +			return ret;

		ret = regmap_field_write(p->funcbit, 0);
		if (ret)
			return ret;

> +	}
> +
> +	return regmap_field_write(p->enbit, 1);
> +}

...

> +static int upboard_pinctrl_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
> +				   unsigned int group_selector)
> +{
> +	struct upboard_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct upboard_pinctrl_data *pctrl_data = pctrl->pctrl_data;
> +	const struct upboard_pingroup *upgroups = pctrl_data->groups;
> +	struct group_desc *grp;
> +	int mode, ret, i;

Why i is signed?

> +	grp = pinctrl_generic_get_group(pctldev, group_selector);
> +	if (!grp)
> +		return -EINVAL;
> +
> +	for (i = 0; i < grp->grp.npins; i++) {
> +		mode = upgroups[group_selector].mode ? upgroups[group_selector].mode :

Use Elvis.

> +			upgroups[group_selector].modes[i];

		mode = upgroups[group_selector].mode ?: upgroups[group_selector].modes[i];

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
> +							    mode == UPBOARD_PIN_MODE_GPIO_IN ?

> +							    true : false);

Useless ternary.

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
> +	int ret = upboard_pinctrl_pin_get_mode(pctldev, offset);

Split it.

> +	if (ret == UPBOARD_PIN_MODE_FUNCTION)
> +		seq_puts(s, "mode function ");
> +	else if (ret == UPBOARD_PIN_MODE_DISABLED)
> +		seq_puts(s, "HIGH-Z");
> +	else
> +		seq_printf(s, "GPIO (%s) ", ret == UPBOARD_PIN_MODE_GPIO_IN ? "input" : "output");
> +}

Shouldn't be this and respective assignment below under ifdeffery?
I don't remember.

...

> +static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = container_of(gc, struct gpiochip_fwd, chip);

+ container_of.h

> +	struct upboard_pinctrl *pctrl = fwd->data;
> +	unsigned int pin = pctrl->pctrl_data->pin_header[offset];
> +	struct gpio_desc *desc;
> +	int ret;
> +
> +	ret = pinctrl_gpio_request(gc, offset);
> +	if (ret)
> +		return ret;
> +
> +	/* GPIO desc is already registered */
> +	if (fwd->descs[offset])
> +		return 0;
> +
> +	desc = gpiod_get_index(pctrl->dev, "external", pin, 0);
> +	if (IS_ERR(desc)) {

+ err.h

> +		pinctrl_gpio_free(gc, offset);
> +		return PTR_ERR(desc);
> +	}
> +
> +	return gpiochip_fwd_add_gpio_desc(fwd, desc, offset);
> +}

...

> +static int upboard_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = container_of(gc, struct gpiochip_fwd, chip);
> +	struct upboard_pinctrl *pctrl = fwd->data;
> +	unsigned int pin = pctrl->pctrl_data->pin_header[offset];
> +	int mode;

> +	mode = upboard_pinctrl_pin_get_mode(pctrl->pctldev, pin);
> +
> +	/* If the pin is in function mode or high-z, input direction is returned */
> +	if (mode < 0)
> +		return mode;

Write it like this (1 LoC less):

	/* If the pin is in function mode or high-z, input direction is returned */
	mode = upboard_pinctrl_pin_get_mode(pctrl->pctldev, pin);
	if (mode < 0)
		return mode;

> +	if (mode == UPBOARD_PIN_MODE_GPIO_OUT)
> +		return GPIO_LINE_DIRECTION_OUT;
> +	else
> +		return GPIO_LINE_DIRECTION_IN;
> +}

...

> +static int upboard_pinctrl_register_groups(struct upboard_pinctrl *pctrl)
> +{
> +	const struct upboard_pingroup *groups = pctrl->pctrl_data->groups;
> +	size_t ngroups = pctrl->pctrl_data->ngroups;
> +	int ret, i;
> +
> +	for (i = 0; i < ngroups; i++) {
> +		ret = pinctrl_generic_add_group(pctrl->pctldev, groups[i].grp.name,
> +						groups[i].grp.pins, groups[i].grp.npins, pctrl);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int upboard_pinctrl_register_functions(struct upboard_pinctrl *pctrl)
> +{
> +	const struct pinfunction *funcs = pctrl->pctrl_data->funcs;
> +	size_t nfuncs = pctrl->pctrl_data->nfuncs;
> +	int ret, i;
> +
> +	for (i = 0; i < nfuncs ; ++i) {
> +		ret = pinmux_generic_add_function(pctrl->pctldev, funcs[i].name, funcs[i].groups,
> +						  funcs[i].ngroups, NULL);

Logically in the similar way to the above:

		ret = pinmux_generic_add_function(pctrl->pctldev, funcs[i].name,
						  funcs[i].groups, funcs[i].ngroups, NULL);

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

...

> +static const struct dmi_system_id dmi_platform_info[] = {
> +	{
> +		/* UP Squared */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UP-APL01"),
> +		},
> +		.driver_data = (void *)BOARD_UP_APL01,
> +	},
> +	{ },

No comma in the terminator entry.

> +};

...

> +	dmi_id = dmi_first_match(dmi_platform_info);
> +	if (IS_ERR_OR_NULL(dmi_id))

Can it really return error pointer?

> +		return -ENODEV;

...

> +	board_id = (enum upboard_board_id)dmi_id->driver_data;
> +
> +	switch (board_id) {
> +	case BOARD_UP_APL01:
> +		pctrl->maps = upboard_pinctrl_mapping_up_apl01;
> +		pctrl->nmaps = ARRAY_SIZE(upboard_pinctrl_mapping_up_apl01);
> +		break;

Hmm... This is strange. Seems it has only Apollo Lake in the name while
the above states that there is UP board support (which is Cherry Trail based).

> +	default:
> +		return dev_err_probe(dev, -ENODEV, "Unsupported board\n");
> +	}

...

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

> +

Redundant blank line.

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

...

> +	ret = pinctrl_register_mappings(pctrl->maps, pctrl->nmaps);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register pinctrl mappings\n");
> +
> +	pinctrl = devm_pinctrl_get_select_default(dev);
> +	if (IS_ERR(pinctrl)) {
> +		ret = PTR_ERR(pinctrl);
> +		dev_err(dev, "Failed to select pinctrl: %d\n", ret);
> +		goto free_mapping;

One should not mix devm_*() with non-devm_*() in such a way. Here we expect
to have return dev_err_probe() as usual. What is missing is devm_ wrapper
for the above.

> +	}

...

> +free_mapping:
> +	pinctrl_unregister_mappings(pctrl->maps);

And also you don't do that when remove the module...

> +	return ret;

-- 
With Best Regards,
Andy Shevchenko



