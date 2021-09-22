Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06C641428C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 09:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhIVHWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 03:22:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:11611 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231379AbhIVHWP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 03:22:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="203690760"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="203690760"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 00:20:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="518486983"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 00:20:42 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mSwYZ-00492s-J7;
        Wed, 22 Sep 2021 10:20:39 +0300
Date:   Wed, 22 Sep 2021 10:20:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <YUrZR/Tl7obfehXP@smile.fi.intel.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921222956.40719-2-joey.gouly@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 21, 2021 at 11:29:56PM +0100, Joey Gouly wrote:
> From: Stan Skowronek <stan@corellium.com>
> 
> This driver adds support for the pinctrl / GPIO hardware found
> on some Apple SoCs.
> 
> Co-authored-by: Joey Gouly <joey.gouly@arm.com>

Have you read Submitting Patches document? Please read and act accordingly.

> Signed-off-by: Stan Skowronek <stan@corellium.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>

...

> +F:	drivers/pinctrl/pinctrl-apple-gpio.c

Are you sure it's a good naming? Have you guaranteed that next Apple silicons
will use the same / compatible IP?

...

> +config PINCTRL_APPLE_GPIO
> +	bool "Apple SoC GPIO pin controller driver"

Why not module?

> +	depends on ARCH_APPLE
> +	select PINMUX
> +	select GPIOLIB
> +	select GPIOLIB_IRQCHIP
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select OF_GPIO
> +	help
> +	  This is the driver for the GPIO controller found on Apple ARM SoCs,
> +	  including M1.

After fixing above, put a standard sentence on how the module will be called.

...

> +#define USE_PINMUX_GENERIC_FN 1
> +#define USE_PINCTRL_GENERIC_FN 1

Why you left them if they are hard coded?

...

> +#define PINCFG_STAT_OUTVAL	0x01
> +#define PINCFG_STAT_OUTEN	0x02
> +#define PINCFG_STAT_PERIPH	0x20
> +#define PINCFG_STAT_IRQEN	0x80

BIT() ?

...

> +	struct apple_gpio_pincfg *pin_cfgs;

Can you use the data structures from generic pin control?

...

> +#define REG_GPIOx_OUT	(1 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_HI	(2 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_LO	(3 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_UP	(4 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_DN	(5 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_ANY	(6 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_OFF	(7 << REG_GPIOx_DATA)

Easy to read and understand if the shift is a plain number.

..

> +	prev = readl(ppin);
> +	cfg = (prev & ~clr) | set;
> +
> +	if(!(prev & REG_GPIOx_CFG_DONE))
> +		writel(cfg & ~REG_GPIOx_CFG_DONE, ppin);
> +	writel(cfg, ppin);

Is it IP requirement to have sequential writes? Can it be done in one?

...

> +#if USE_PINMUX_GENERIC_FN
> +		if (func >=pinmux_generic_get_function_count(pctldev)) {

Missed space.
I noticed more places, so please carefully check the style.

> +#else
> +		if (func >= apple_gpio_pinmux_get_functions_count(pctldev)) {
> +#endif
> +			ret = -EINVAL;
> +			goto free_map;
> +		}

...

> +static int apple_gpio_pinmux_get_function_groups(struct pinctrl_dev *pctldev, unsigned func, const char * const **groups, unsigned * const num_groups)

Seems quite too long line.

...

> +	int i, ret = 0;

Don't hid ret assignment here. It's error prone.

...

> +	if(!of_find_property(node, "gpio-controller", NULL)) {
> +		dev_err(pctl->dev, "Apple GPIO must have 'gpio-controller' property.\n");
> +		return -ENODEV;
> +	}

How is it possible?

...

> +	if (of_find_property(node, "interrupt-controller", NULL)) {

Are you sure you need this check and OF core doesn't provide a generic way for this?

> +		ret = platform_irq_count(to_platform_device(pctl->dev));
> +		if(ret < 0)
> +			return ret;
> +
> +		pctl->nirqgrps = ret;
> +
> +		pctl->irq_chip.name = dev_name(pctl->dev);
> +		pctl->irq_chip.irq_startup = apple_gpio_gpio_irq_startup;
> +		pctl->irq_chip.irq_ack = apple_gpio_gpio_irq_ack;
> +		pctl->irq_chip.irq_mask = apple_gpio_gpio_irq_mask;
> +		pctl->irq_chip.irq_unmask = apple_gpio_gpio_irq_unmask;
> +		pctl->irq_chip.irq_set_type = apple_gpio_gpio_irq_set_type;
> +
> +		girq = &pctl->gpio_chip.irq;
> +		girq->chip = &pctl->irq_chip;
> +		girq->parent_handler = apple_gpio_gpio_irq_handler;
> +		girq->num_parents = pctl->nirqgrps;
> +
> +		girq->parents = devm_kmalloc_array(pctl->dev, pctl->nirqgrps,
> +			sizeof(girq->parents[0]), GFP_KERNEL);

sizeof(*...)

> +		if (!girq->parents)
> +			return -ENOMEM;
> +
> +		for(i = 0; i < pctl->nirqgrps; i++) {
> +			ret = platform_get_irq(to_platform_device(pctl->dev), i);
> +			if(ret < 0) {

> +				if(ret != -EPROBE_DEFER)
> +					dev_err(pctl->dev, "Failed to map IRQ %d (%d).\n", i, ret);
> +				return ret;

return dev_err_probe(...);

> +			}
> +			girq->parents[i] = ret;
> +		}
> +
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_level_irq;
> +	}

...

> +	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
> +	if(ret < 0) {
> +		dev_err(pctl->dev, "Failed to add GPIO chip (%d).\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;

Simple `return devm_gpiochip_add_data(...);` will do the job.

...

> +static const struct of_device_id apple_gpio_pinctrl_of_match[] = {
> +	{ .compatible = "apple,t8103-pinctrl", },

> +	{ },

No comma for the array termination.

> +};

...

> +	if (of_parse_phandle_with_fixed_args(pdev->dev.of_node, "gpio-ranges",
> +			3, 0, &pinspec)) {
> +		dev_err(&pdev->dev, "gpio-ranges property not found\n");
> +		return -EINVAL;
> +	}
> +
> +	pctl->npins = pinspec.args[2];
> +	pin_base = pinspec.args[1];


Isn't this being provided by pin control?

...

> +		pctl->pins[i].number = i + pin_base;
> +		pctl->pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i + pin_base);
> +		pctl->pins[i].drv_data = pctl;
> +		pctl->pin_names[i] = pctl->pins[i].name;
> +		pctl->pin_nums[i] = i + pin_base;

Try to reduce Yoda style, i.e. use `pin_base + i`.

...

> +static struct platform_driver apple_gpio_pinctrl_driver = {
> +	.driver = {
> +		.name = "apple-gpio-pinctrl",
> +		.of_match_table = apple_gpio_pinctrl_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = apple_gpio_pinctrl_probe,
> +};

> +

Redundant blank line.

> +module_platform_driver(apple_gpio_pinctrl_driver);

-- 
With Best Regards,
Andy Shevchenko


