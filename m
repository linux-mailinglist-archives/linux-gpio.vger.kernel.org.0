Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7A7F4A05
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 13:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389148AbfKHLlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 06:41:05 -0500
Received: from mga04.intel.com ([192.55.52.120]:37523 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389136AbfKHLlE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Nov 2019 06:41:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 03:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; 
   d="scan'208";a="205970904"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 08 Nov 2019 03:40:59 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iT2dO-0002lG-IF; Fri, 08 Nov 2019 13:40:58 +0200
Date:   Fri, 8 Nov 2019 13:40:58 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v5 1/2] pinctrl: Add pinmux & GPIO controller driver for
 a new SoC
Message-ID: <20191108114058.GE32742@smile.fi.intel.com>
References: <cover.1573196057.git.rahul.tanwar@linux.intel.com>
 <890db37db56e7e49e83b9fa03903bf3482c624c7.1573196057.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <890db37db56e7e49e83b9fa03903bf3482c624c7.1573196057.git.rahul.tanwar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 08, 2019 at 05:42:22PM +0800, Rahul Tanwar wrote:
> Intel Lightning Mountain SoC has a pinmux controller & GPIO controller IP which
> controls pin multiplexing & configuration including GPIO functions selection &
> GPIO attributes configuration.
> 
> This IP is not based on & does not have anything in common with Chassis
> specification. The pinctrl drivers under pinctrl/intel/* are all based upon
> Chassis spec compliant pinctrl IPs. So this driver doesn't fit & can not use
> pinctrl framework under pinctrl/intel/* and it requires a separate new driver.
> 
> Add a new GPIO & pin control framework based driver for this IP.

> +static void eqbr_gpio_enable_irq(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
> +	unsigned int offset = irqd_to_hwirq(d);
> +	unsigned long flags;
> +

> +	gc->direction_input(gc, offset);

Does this any IO?
If so, between above and below a window of possible race.
Ditto for all other functions that do something similar.

> +	raw_spin_lock_irqsave(&gctrl->lock, flags);
> +	writel(BIT(offset), gctrl->membase + GPIO_IRNRNSET);
> +	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
> +}

> +		ret = bgpio_init(&gctrl->chip, dev, gctrl->bank->nr_pins / 8,
> +				 gctrl->membase + GPIO_IN,
> +				 gctrl->membase + GPIO_OUTSET,
> +				 gctrl->membase + GPIO_OUTCLR,
> +				 gctrl->membase + GPIO_DIR,

> +				 NULL,
> +				 0);

One line?

> +static int get_drv_cur(void __iomem *mem, unsigned int offset)
> +{
> +	unsigned int idx = offset / DRV_CUR_PINS; /* 0-15, 16-31 per register*/
> +	unsigned int val;
> +
> +	val = readl(mem + REG_DRCC(idx));

> +	offset %= DRV_CUR_PINS;

From style point of view is better to have
	... foo = offset / X;
	... bar = offset % X;

directly in definition block. Moreover, for example, on x86 it might be
converted by compiler to single idiv call in assembly that returns in
(eax, edx) both values at once.

> +	val = PARSE_DRV_CURRENT(val, offset);
> +
> +	return val;
> +}

> +	if (!(bank->aval_pinmap & BIT(offset))) {
> +		dev_err(pctl->dev,
> +			"PIN: %u is not valid, pinbase: %u, bitmap: %u\n",
> +			pin, bank->pin_base, bank->aval_pinmap);
> +		return -ENODEV;
> +	}

Looks like aval_pinmap is NIH of valid_mask bitmap in GPIO library.
Can you check if it suits your purposes?

> +static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
> +			 unsigned int nr_funcs, unsigned int *idx)
> +{
> +	int i;
> +

> +	if (!funcs || !nr_funcs)
> +		return false;

nr_funcs check is a dup of the one in for loop.

> +	for (i = 0; i < nr_funcs; i++) {

> +		if (funcs[i].name && (strcmp(funcs[i].name, name) == 0) ) {

An extra space, but you may use !strcmp() and make it shorter without redundant
parentheses.

> +			*idx = i;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}

> +		switch (op) {
> +			case OP_COUNT_NR_FUNCS:

case goes usually on the same column as switch.

> +				if (!is_func_exist(funcs, fn_name,
> +						   *nr_funcs, &fid))
> +					*nr_funcs = *nr_funcs + 1;
> +				break;
> +
> +			case OP_ADD_FUNCS:
> +				if (!is_func_exist(funcs, fn_name,
> +						   *nr_funcs, &fid))
> +					funcs[i].name = fn_name;
> +				break;
> +
> +			case OP_COUNT_NR_FUNC_GRPS:
> +				if (is_func_exist(funcs, fn_name,
> +						  *nr_funcs, &fid))
> +					funcs[fid].nr_groups++;
> +				break;
> +
> +			case OP_ADD_FUNC_GRPS:
> +				if (is_func_exist(funcs, fn_name,
> +						  *nr_funcs, &fid)) {

> +					for(j=0;

Other style issueS.

> +					    j < funcs[fid].nr_groups;
> +					    j++) {
> +						if (!funcs[fid].groups[j])
> +							break;
> +					}
> +					funcs[fid].groups[j] = prop->value;
> +				}
> +				break;
> +
> +			default:
> +				return -EINVAL;

> +

Redundant blank line.

> +		}

> +	for (i = 0; i < nr_funcs; i++) {
> +		if (funcs[i].nr_groups) {

	if (!foo)
		continue;
?

> +			funcs[i].groups = devm_kcalloc(dev, funcs[i].nr_groups,
> +						       sizeof(*(funcs[i].groups)),
> +						       GFP_KERNEL);
> +			if (!funcs[i].groups)
> +				return -ENOMEM;
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko


