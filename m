Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F09AEF9F8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 10:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387980AbfKEJtX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 04:49:23 -0500
Received: from mga14.intel.com ([192.55.52.115]:51083 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387867AbfKEJtX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 04:49:23 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 01:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; 
   d="scan'208";a="403294797"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 05 Nov 2019 01:49:18 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iRvSf-0007At-CI; Tue, 05 Nov 2019 11:49:17 +0200
Date:   Tue, 5 Nov 2019 11:49:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v3 1/2] pinctrl: Add pinmux & GPIO controller driver for
 a new SoC
Message-ID: <20191105094917.GK32742@smile.fi.intel.com>
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
 <02558966005c0483144785ed069b144f81d209a9.1572926608.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02558966005c0483144785ed069b144f81d209a9.1572926608.git.rahul.tanwar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 02:49:42PM +0800, Rahul Tanwar wrote:
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

> +static void eqbr_set_val(void __iomem *addr, u32 offset,

> +			 u32 mask, u32 set, raw_spinlock_t *lock)

This lock parameter is quite unusual. Can't you supply a pointer to a data
structure which has lock along with MMIO address?

> +{
> +	u32 val;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(lock, flags);

> +	mask = mask << offset;

Same Q. Why do you need these...

> +	val = readl(addr);

> +	val = (val & ~mask) | ((set << offset) & mask);

...offset shifts? It's unusual.

> +	writel(val, addr);
> +	raw_spin_unlock_irqrestore(lock, flags);
> +}

> +static int gpiochip_setup(struct device *dev, struct eqbr_gpio_desc *desc)
> +{
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;

> +#if defined(CONFIG_OF_GPIO)
> +	gc->of_node = desc->node;
> +#endif

Isn't it what GPIO library does for everybody?

> +
> +	if (!of_property_read_bool(desc->node, "interrupt-controller")) {

> +		dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
> +			 desc->name);

Is it fatal or non-fatal?

> +		return 0;

Ditto.

> +	}

> +}

> +static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
> +{
> +	struct device_node *np;

> +	struct eqbr_gpio_desc *desc;

desc is very confusing here, since GPIO library uses this term for GPIO
descriptors.

> +	struct device *dev;
> +	int i, ret;
> +	struct resource res;
> +

> +		ret = bgpio_init(&desc->chip, dev, desc->bank->nr_pins/8,

'nr_pins / 8,'

> +				 desc->membase + GPIO_IN,
> +				 desc->membase + GPIO_OUTSET,
> +				 desc->membase + GPIO_OUTCLR,
> +				 desc->membase + GPIO_DIR,
> +				 NULL,
> +				 0);
> +		if (ret) {
> +			dev_err(dev, "unable to init generic GPIO\n");
> +			return ret;
> +		}

> +	return 0;
> +}

> +static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +			       unsigned int selector, unsigned int group)
> +{
> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	struct function_desc *func;
> +	struct group_desc *grp;
> +	unsigned int *pinmux;
> +	int i;


> +	pinmux = grp->data;
> +	for (i = 0; i < grp->num_pins; i++)
> +		eqbr_set_pin_mux(pctl, pinmux[i], grp->pins[i]);

Shouldn't be this part serialized?

Same Q to all similar places. I guess I already mentioned this in previous
review.

> +	return 0;
> +}

> +static int is_func_exist(struct eqbr_pmx_func *funcs, const char *name,

Looks like it better to be boolean.

> +			 unsigned int nr_funcs, unsigned int *idx)
> +{
> +	int i;
> +
> +	if (!funcs || !nr_funcs)
> +		return 0;
> +
> +	for (i = 0; i < nr_funcs; i++) {

> +

Redundant blank line.

> +		if (funcs[i].name && (strcmp(funcs[i].name, name) == 0) ) {
> +			*idx = i;
> +			return 1;
> +		}
> +	}
> +
> +	return 0;
> +}

> +static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
> +		       unsigned int *nr_funcs, funcs_util_ops op)
> +{
> +	struct device_node *node = dev->of_node;
> +	struct device_node *np;
> +	struct property *prop;
> +	unsigned int fid;
> +	const char *fn_name;
> +	int i, j;
> +
> +	i = 0;
> +	for_each_child_of_node(node, np) {
> +		prop = of_find_property(np, "groups", NULL);

> +		if (prop) {

Why not
		if (!prop)
			continue;
?

> +			if (of_property_read_string(np, "function",
> +						    &fn_name)) {

It's perfectly one line. Perhaps you may need to configure your text editor.

> +			}

> +		}
> +	}
> +
> +	return 0;
> +}

> +	for (i=0; i < nr_funcs; i++) {

The better style is 'i = 0' and so on.
Simple be consistent. Or do everywhere 'i=0; i<nr_func; i++', etc. But remember
that this is for sure will be declined by most of the maintainers.

> +	}

> +static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
> +{
> +	struct device *dev = drvdata->dev;
> +	struct device_node *node = dev->of_node;
> +	struct device_node *np;
> +	struct property *prop;
> +	int j, err;
> +	unsigned int *pinmux, pin_id, pinmux_id;
> +	struct group_desc group;
> +
> +	for_each_child_of_node(node, np) {
> +		prop = of_find_property(np, "groups", NULL);

> +		if (prop) {

	if (!prop)
		continue;

	?

> +		}
> +		memset(&group, 0, sizeof(group));
> +		pinmux = NULL;
> +	}
> +
> +	return 0;
> +}

> +static int pinbank_init(struct device_node *np,
> +			struct eqbr_pinctrl_drv_data *drvdata,
> +			struct eqbr_pin_bank *bank, unsigned int id)
> +{
> +	struct device *dev = drvdata->dev;
> +	struct of_phandle_args spec;
> +
> +	bank->membase = drvdata->membase + id * PAD_REG_OFF;
> +

> +	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &spec)) {
> +		dev_err(dev, "gpio-range not available!\n");

> +		return -EFAULT;

Shadowing error code with actually unsuitable one.

> +	}

> +	return 0;
> +}

> +	int i=0, nr_gpio=0;

Style.
Besides the fact that better to put assignments closer to their usage.

> +static int eqbr_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct eqbr_pinctrl_drv_data *drvdata;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = dev;

> +	platform_set_drvdata(pdev, drvdata);

I think this makes sense to do as last call in the function.

> +	drvdata->membase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drvdata->membase))
> +		return PTR_ERR(drvdata->membase);
> +
> +	ret = pinbank_probe(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	ret = pinctrl_reg(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpiolib_reg(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


