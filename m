Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65032B1124
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 16:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732614AbfILOaH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 10:30:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:10358 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732610AbfILOaG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Sep 2019 10:30:06 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 07:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,497,1559545200"; 
   d="scan'208";a="200751249"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2019 07:30:01 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1i8Q6i-0006GP-If; Thu, 12 Sep 2019 17:30:00 +0300
Date:   Thu, 12 Sep 2019 17:30:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v1 1/2] pinctrl: Add pinmux & GPIO controller driver for
 new SoC
Message-ID: <20190912143000.GB2680@smile.fi.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <65898579e78b4b3bb5db9ddc884a818046c1eb4c.1568274587.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65898579e78b4b3bb5db9ddc884a818046c1eb4c.1568274587.git.rahul.tanwar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 03:59:10PM +0800, Rahul Tanwar wrote:
> Intel Lightning Mountain SoC has a pinmux controller & GPIO controller IP
> which controls pin multiplexing & configuration including GPIO functions
> selection & GPIO attributes configuration. Add GPIO & pin control framework
> based driver for this IP.

Can you put few more words to explain how new this IP, and why it requires a
complete separate driver?

> +#define PIN_NAME_FMT	"io-%d"
> +#define PIN_NAME_LEN	10
> +#define PAD_REG_OFF	0x100
> +
> +static const struct pin_config pin_cfg_type[] = {
> +	{"intel,pullup",		PINCONF_TYPE_PULL_UP},
> +	{"intel,pulldown",		PINCONF_TYPE_PULL_DOWN},
> +	{"intel,drive-current",		PINCONF_TYPE_DRIVE_CURRENT},
> +	{"intel,slew-rate",		PINCONF_TYPE_SLEW_RATE},
> +	{"intel,open-drain",		PINCONF_TYPE_OPEN_DRAIN},
> +	{"intel,output",		PINCONF_TYPE_OUTPUT},
> +};

Doesn't DT provide a generic naming scheme for these?

> +	val = readl(addr) & ~(mask << offset);
> +	writel(val | ((set & mask) << offset), addr);

More traditional pattern is

	val = readl(...);
	val = (val & ~mask) | (newval & mask);
	writel(val, ...);

> +	virq = irq_find_mapping(desc->irq_domain, offset);
> +	if (virq)
> +		return virq;

> +	else

Redundant.

> +		return irq_create_mapping(desc->irq_domain, offset);

Don't we have more clever helper for this? AFAIR something like this is done in
IRQ framework when you get a mapping from certain domain.


> +	gc->base		= -1; /* desc->bank->pin_base; */

Useless comment.

> +	ret = devm_gpiochip_add_data(dev, gc, desc);
> +	if (ret)
> +		dev_err(dev, "failed to register gpiochip: %s, err: %d\n",
> +			gc->label, ret);
> +
> +	return ret;

Simple
	return devm_gpiochip_add_data(...);
would be enough.

> +		writel(readl(addr) & (~BIT(offset)), addr);

Too many parentheses.

> +static int eqbr_gpio_irq_req_res(struct irq_data *d)
> +{
> +	struct intel_gpio_desc *desc = irq_data_get_irq_chip_data(d);
> +	unsigned int offset;
> +	int ret;
> +
> +	offset = irqd_to_hwirq(d);
> +
> +	/* gpio must be set as input */
> +	intel_eqbr_gpio_dir_input(&desc->chip, offset);
> +	ret = gpiochip_lock_as_irq(&desc->chip, offset);
> +	if (ret) {
> +		pr_err("%s: Failed to lock gpio %u as irq!\n",
> +		       desc->name, offset);
> +		return ret;
> +	}

Above is pretty much generic one...

> +	eqbr_gpio_enable_irq(d);

...and this may go to unmask() / enable() callback.

No?

> +	return 0;
> +}

> +static void eqbr_gpio_irq_rel_res(struct irq_data *d)
> +{
> +	struct intel_gpio_desc *desc = irq_data_get_irq_chip_data(d);
> +	unsigned int offset = irqd_to_hwirq(d);
> +
> +	eqbr_gpio_disable_irq(d);
> +	gpiochip_unlock_as_irq(&desc->chip, offset);
> +}

Ditto.

> +static void eqbr_irq_handler(struct irq_desc *desc)
> +{
> +	struct intel_gpio_desc *gc;
> +	struct irq_chip *ic;
> +	u32 pins, offset;
> +	unsigned int virq;
> +
> +	gc = irq_desc_get_handler_data(desc);
> +	ic = irq_desc_get_chip(desc);
> +
> +	chained_irq_enter(ic, desc);
> +	pins = readl(gc->membase + GPIO_IRNCR);
> +
> +	for_each_set_bit(offset, (unsigned long *)&pins, gc->bank->nr_pins) {
> +		virq = irq_linear_revmap(gc->irq_domain, offset);
> +		if (!virq)

> +			pr_err("gc[%s]:pin:%d irq not registered!\n",
> +			       gc->name, offset);

dev_err() ? But Why is it needed? Shouldn't be registered as a spurious IRQ for
later debugging?

> +		else
> +			generic_handle_irq(virq);
> +	}
> +	chained_irq_exit(ic, desc);
> +}

> +static int gpiolib_reg(struct intel_pinctrl_drv_data *drvdata)
> +{
> +	struct device_node *np;
> +	struct intel_gpio_desc *desc;
> +	struct device *dev;
> +	int i, ret;
> +	char name[32];
> +	struct resource res;
> +
> +	dev = drvdata->dev;
> +	for (i = 0; i < drvdata->nr_gpio_descs; i++) {
> +		desc = drvdata->gpio_desc + i;
> +		np = desc->node;

> +		sprintf(name, "gpiochip%d", i);
> +		desc->name = devm_kmemdup(dev, name,
> +					  strlen(name) + 1, GFP_KERNEL);

Have you run coccinelle scripts against this code?
Above is copy'n'paste of devm_kasprintf().

> +		if (!desc->name)
> +			return -ENOMEM;

> +		if (of_address_to_resource(np, 0, &res)) {
> +			dev_err(dev, "Failed to get GPIO register addrss\n");
> +			return -ENXIO;
> +		}
> +		desc->membase = devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(desc->membase)) {
> +			dev_err(dev, "ioremap fail\n");
> +			return PTR_ERR(desc->membase);
> +		}

Can't you simple use devm_platform_ioremap_resource()?

> +		dev_dbg(dev, "gpio resource: %pr\n", &res);
> +		dev_dbg(dev, "gpiochip membase: %px\n", desc->membase);

Is it anyhow useful?

> +		desc->virq = irq_of_parse_and_map(np, 0);
> +		if (!desc->virq) {
> +			dev_err(dev, "%s: failed to parse and map irq\n",
> +				name);
> +			return -ENXIO;
> +		}
> +		raw_spin_lock_init(&desc->lock);
> +
> +		ret = gpiochip_setup(dev, desc);
> +		if (ret)
> +			return ret;
> +		ret = irqchip_setup(dev, desc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

> +static int add_config(struct intel_pinctrl_drv_data *drvdata,
> +		      unsigned long **confs, unsigned int *nr_conf,
> +		      unsigned long pinconf)
> +{
> +	unsigned long *configs;
> +	struct device *dev = drvdata->dev;
> +	unsigned int num_conf = *nr_conf + 1;
> +
> +	if (!(*nr_conf)) {
> +		configs = devm_kcalloc(dev, 1, sizeof(pinconf), GFP_KERNEL);
> +		if (!configs)
> +			return -ENOMEM;
> +	} else {
> +		configs = devm_kmemdup(dev, *confs,
> +				       num_conf * sizeof(pinconf), GFP_KERNEL);
> +		if (!configs)
> +			return -ENOMEM;

> +		devm_kfree(dev, *confs);

This a red flag for using devm_*().
Either a sign of bad design or misplacement of devm_*().

> +	}
> +
> +	configs[num_conf - 1] = pinconf;
> +	*confs = configs;
> +	*nr_conf = num_conf;
> +
> +	return 0;
> +}

> +	/**

Are you sure about this?
Have you run kernel-doc script? Does it complain?

> +	 * Create pinctrl_map for each groups, per group per entry.
> +	 * Create pinctrl_map for pin config, per group per entry.
> +	 */
> +	if (nr_config)
> +		map_cnt++;

> +static void eqbr_dt_free_map(struct pinctrl_dev *pctldev,
> +			     struct pinctrl_map *map, unsigned int num_maps)
> +{
> +	struct intel_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	int i;
> +
> +	for (i = 0; i < num_maps; i++)
> +		if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
> +			devm_kfree(pctl->dev, map[i].data.configs.configs);
> +	devm_kfree(pctl->dev, map);

Yeah, no devm_*() here.

> +}

> +static const struct pinmux_ops eqbr_pinmux_ops = {
> +	.get_functions_count	= eqbr_pinmux_get_func_count,
> +	.get_function_name	= eqbr_pinmux_get_fname,
> +	.get_function_groups	= eqbr_pinmux_get_groups,
> +	.set_mux		= eqbr_pinmux_set_mux,
> +	.gpio_request_enable	= eqbr_pinmux_gpio_request,

> +	.strict			= 1,

Wrong type.

> +};

> +
> +static void set_drv_cur(void __iomem *mem, unsigned int offset,
> +			unsigned int set, raw_spinlock_t *lock)
> +{
> +	unsigned int idx = offset; /* 16 pin per register*/
> +	unsigned int reg;
> +

> +	idx = idx / DRV_CUR_PINS;

It can be done in the first place in the definition block.

> +	offset %= DRV_CUR_PINS;
> +	reg = REG_DRCC(idx);

> +	eqbr_set_val(mem + REG_DRCC(idx), offset * 2,
> +		     0x3, set, lock);

Quite enough space in previous line for arguments.

> +}

> +static int get_drv_cur(void __iomem *mem, unsigned int offset)
> +{
> +	unsigned int idx = offset; /* 0-15, 16-31 per register*/
> +	unsigned int val;
> +
> +	idx = idx / DRV_CUR_PINS;
> +	val = readl(mem + REG_DRCC(idx));
> +	offset %= DRV_CUR_PINS;
> +	val = PARSE_DRV_CURRENT(val, offset);
> +
> +	return val;
> +}

Ditto.

> +		case PINCONF_TYPE_PULL_UP:
> +			eqbr_set_val(mem + REG_PUEN, offset,
> +				     1, val, &pctl->lock);

Please, configure you editor better. The recommended limit is 80, not 60.

> +			break;
> +		case PINCONF_TYPE_PULL_DOWN:
> +			eqbr_set_val(mem + REG_PDEN, offset,
> +				     1, val, &pctl->lock);
> +			break;
> +		case PINCONF_TYPE_OPEN_DRAIN:
> +			eqbr_set_val(mem + REG_OD, offset,
> +				     1, val, &pctl->lock);
> +			break;
> +		case PINCONF_TYPE_DRIVE_CURRENT:
> +			set_drv_cur(mem, offset, val, &pctl->lock);
> +			break;
> +		case PINCONF_TYPE_SLEW_RATE:
> +			eqbr_set_val(mem + REG_SRC, offset,
> +				     1, val, &pctl->lock);
> +			break;

Ditto.

> +	val = !!(readl(mem + REG_PUEN) & BIT(offset));
> +	seq_printf(s, "PULL UP: %u\n", val);
> +	val = !!(readl(mem + REG_PDEN) & BIT(offset));
> +	seq_printf(s, "PULL DOWN: %u\n", val);
> +	val = !!(readl(mem + REG_OD) & BIT(offset));
> +	seq_printf(s, "OPEN DRAIN: %u\n", val);
> +	val = get_drv_cur(mem, offset);
> +	seq_printf(s, "DRIVE CURRENT: %u\n", val);
> +	val = !!(readl(mem + REG_SRC) & BIT(offset));
> +	seq_printf(s, "SLEW RATE: %u\n", val);
> +	gpio = get_gpio_desc_via_bank(pctl, bank);
> +	val = intel_eqbr_gpio_get_dir(&gpio->chip, offset);
> +	seq_printf(s, "OUTPUT: %u\n", !val);

I think GPIO library does it for you.

> +static int add_group_to_func(struct device *dev, struct intel_pmx_func *funcs,
> +			     unsigned int nr_funcs, unsigned int idx,
> +			     const char *grp_name)
> +{
> +	unsigned int nr_grps = funcs[idx].nr_groups + 1;
> +	const char **grps;
> +
> +	grps = devm_kmemdup(dev, funcs[idx].groups,
> +			    nr_grps * sizeof(*grps), GFP_KERNEL);
> +	if (!grps)
> +		return -ENOMEM;

> +	devm_kfree(dev, funcs[idx].groups);

Possible misplacement of devm_*().

> +	grps[nr_grps - 1] = grp_name;
> +	funcs[idx].groups = grps;
> +	funcs[idx].nr_groups = nr_grps;
> +
> +	return 0;
> +}

> +static int is_func_exist(struct intel_pmx_func *funcs, const char *name,
> +			 unsigned int nr_funcs, unsigned int *idx)
> +{
> +	int i;
> +
> +	if (!funcs || !nr_funcs)
> +		return 0;
> +
> +	for (i = 0; i < nr_funcs; i++) {
> +		if (strcmp(funcs[i].name, name) == 0) {
> +			*idx = i;
> +			return 1;
> +		}
> +	}
> +
> +	return 0;

NIH match_string(). But I think pin control core does it for drivers.

> +}

> +static void dump_pinctrl_group_func(struct intel_pinctrl_drv_data *drvdata)
> +{
> +	struct device *dev = drvdata->dev;
> +	const struct intel_pin_group *group;
> +	const struct intel_pmx_func *func;
> +	int i, j;
> +
> +	dev_info(dev, "Total %u groups, %u functions\n",
> +		 drvdata->nr_grps, drvdata->nr_funcs);
> +
> +	for (i = 0; i < drvdata->nr_grps; i++) {
> +		group = &drvdata->pin_grps[i];
> +
> +		dev_dbg(dev, "group name: %s, pin num: %u, pmx: %u\n",
> +			group->name, group->nr_pins, group->pmx);
> +		for (j = 0; j < group->nr_pins; j++)
> +			dev_dbg(dev, "pin[%d]: %u\n", j, group->pins[j]);
> +	}
> +
> +	for (i = 0; i < drvdata->nr_funcs; i++) {
> +		func = &drvdata->pmx_funcs[i];
> +
> +		dev_dbg(dev, "function name: %s, group num: %u\n",
> +			func->name, func->nr_groups);
> +		for (j = 0; j < func->nr_groups; j++)
> +			dev_dbg(dev, "group[%d]: %s\n", j, func->groups[j]);
> +	}
> +}

Ditto.

> +static int pinctrl_setup_from_dt(struct device *dev,
> +				 struct intel_pinctrl_drv_data *drvdata)
> +{

It's a very big function with potential of refactoring.
Also check what core provides.

> +}

> +static int pinctrl_reg(struct intel_pinctrl_drv_data *drvdata)
> +{

> +	drvdata->pctl_dev = devm_pinctrl_register(dev, pctl_desc, drvdata);
> +	if (IS_ERR(drvdata->pctl_dev)) {

> +		dev_err(dev, "Register pinctrl failed!\n");

Useless.

> +		return PTR_ERR(drvdata->pctl_dev);
> +	}
> +
> +	return 0;

PTR_ERR_OR_ZERO()

> +}

> +/**
> + * reset all pins to DEFAULT state, including below registers
> + * PINMUX set to GPIO
> + * DIR set to INPUT
> + * Clear PULLUP/PULLDOWN/SLEW RATE/DRIVE CURRENT/OPEN DRAIN
> + */

Please, read kernel doc documentation.

> +static void pinctrl_pin_reset(struct intel_pinctrl_drv_data *drvdata)
> +{

> +	for (i = 0; i < drvdata->nr_gpio_descs; i++) {
> +		gdesc = &drvdata->gpio_desc[i];

> +		for (pin = 0; pin < gdesc->bank->nr_pins; pin++) {
> +			if (!(BIT(pin) & gdesc->bank->aval_pinmap))
> +				continue;

for_each_set_bit()

> +		}
> +	}

> +}

> +static int intel_pinctrl_probe(struct platform_device *pdev)
> +{

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	drvdata->membase = devm_ioremap_resource(dev, res);

devm_platform_ioremap_resource()

> +	if (IS_ERR(drvdata->membase))
> +		return PTR_ERR(drvdata->membase);

> +}

> +#define PINCONF_SET_MASK		(BIT(PINCONF_SET_SIZE) - 1)
> +#define PINCONF_TYPE_MASK		(BIT(PINCONF_TYPE_SIZE) - 1)

GENMASK()

-- 
With Best Regards,
Andy Shevchenko


