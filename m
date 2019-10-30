Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C39EE9DB7
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 15:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfJ3OjL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 10:39:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:20780 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfJ3OjL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 10:39:11 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 07:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="401526582"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2019 07:39:07 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iPp7r-0007Cs-79; Wed, 30 Oct 2019 16:39:07 +0200
Date:   Wed, 30 Oct 2019 16:39:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v2 1/2] pinctrl: Add pinmux & GPIO controller driver for
 a new SoC
Message-ID: <20191030143907.GY32742@smile.fi.intel.com>
References: <cover.1572409172.git.rahul.tanwar@linux.intel.com>
 <4bb885fe692d29f2635772dcd04839390f1f5671.1572409172.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bb885fe692d29f2635772dcd04839390f1f5671.1572409172.git.rahul.tanwar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 12:23:59PM +0800, Rahul Tanwar wrote:
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

Thanks for an update, my comments below.

> +#define PIN_NAME_FMT	"io-%d"
> +#define PIN_NAME_LEN	10

> +static inline void eqbr_set_val(void __iomem *addr, u32 offset,
> +				u32 mask, u32 set, raw_spinlock_t *lock)


Why is it marked with inline?

> +{
> +	u32 val;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(lock, flags);
> +	val = readl(addr);

> +	val = (val & ~(mask << offset)) | ((set & mask) << offset);

This is unusual, why offset can't be applied once to the mask?

> +	writel(val, addr);
> +	raw_spin_unlock_irqrestore(lock, flags);

Hmm... Don't you have more complicated workflow that requires few
reads/writes/updates to be called atomically?

> +}

> +static void eqbr_gpio_disable_irq(struct irq_data *d)
> +{
> +	unsigned int offset = irqd_to_hwirq(d);
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct eqbr_gpio_desc *desc = gpiochip_get_data(gc);

> +	writel(BIT(offset), desc->membase + GPIO_IRNENCLR);

Is it okay to be without spin lock?
Same Q to the rest similar places.

> +}

> +static inline void eqbr_cfg_bit(void __iomem *addr,
> +				unsigned int offset, unsigned int set)
> +{
> +	if (!set)

Why not to use positive condition?

> +		writel(readl(addr) & ~BIT(offset), addr);
> +	else
> +		writel(readl(addr) | BIT(offset), addr);
> +}

> +	struct gpio_irq_type it;

Not sure if this is used properly. Linus may clarify this.

> +static void eqbr_irq_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +	struct eqbr_gpio_desc *gpio_desc = gpiochip_get_data(gc);
> +	struct irq_chip *ic = irq_desc_get_chip(desc);
> +	u32 pins, offset;
> +
> +	chained_irq_enter(ic, desc);
> +	pins = readl(gpio_desc->membase + GPIO_IRNCR);
> +

> +	for_each_set_bit(offset, (unsigned long *)&pins, gc->ngpio)

This casting is no go.

> +		generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
> +
> +	chained_irq_exit(ic, desc);
> +}

> +static int gpiochip_setup(struct device *dev, struct eqbr_gpio_desc *desc)
> +{
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +
> +	gc = &desc->chip;

> +	gc->owner = THIS_MODULE;

Do we still need this in the drivers?

> +	gc->label = desc->name;
> +	gc->of_node = desc->node;
> +

> +	if (!of_property_read_bool(desc->node, "interrupt-controller")) {

Why is it fatal?

> +		dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
> +			 desc->name);
> +		return 0;
> +	}

> +	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> +				     GFP_KERNEL);

I believe it's fine to have it on one line.

> +	if (!girq->parents)
> +		return -ENOMEM;
> +
> +	girq->default_type = IRQ_TYPE_NONE;

> +	girq->handler = handle_level_irq;

Not bad IRQ handler?

> +	girq->parents[0] = desc->virq;
> +
> +	return 0;
> +}

> +static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
> +{
> +	struct device_node *np;
> +	struct eqbr_gpio_desc *desc;
> +	struct device *dev;
> +	int i, ret;
> +	struct resource res;
> +
> +	dev = drvdata->dev;
> +	for (i = 0; i < drvdata->nr_gpio_descs; i++) {
> +		desc = drvdata->gpio_desc + i;
> +		np = desc->node;
> +
> +		desc->name = devm_kasprintf(dev, GFP_KERNEL, "gpiochip%d", i);
> +		if (!desc->name)
> +			return -ENOMEM;
> +

> +		if (of_address_to_resource(np, 0, &res)) {
> +			dev_err(dev, "Failed to get GPIO register address\n");
> +			return -ENXIO;
> +		}
> +
> +		desc->membase = devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(desc->membase)) {

> +			dev_err(dev, "ioremap fail\n");

Redundant.

> +			return PTR_ERR(desc->membase);
> +	}

Is it per descriptor?!

> +
> +		desc->virq = irq_of_parse_and_map(np, 0);
> +		if (!desc->virq) {
> +			dev_err(dev, "%s: failed to parse and map irq\n",
> +				desc->name);
> +			return -ENXIO;
> +		}
> +		raw_spin_lock_init(&desc->lock);

> +	}
> +
> +	return 0;
> +}

> +static const struct pinmux_ops eqbr_pinmux_ops = {
> +	.get_functions_count	= pinmux_generic_get_function_count,
> +	.get_function_name 	= pinmux_generic_get_function_name,
> +	.get_function_groups 	= pinmux_generic_get_function_groups,
> +	.set_mux		= eqbr_pinmux_set_mux,
> +	.gpio_request_enable	= eqbr_pinmux_gpio_request,
> +	.strict			= true,
> +};

TABs/spaces mix.

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


