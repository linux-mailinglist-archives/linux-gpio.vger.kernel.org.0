Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49BB8F2A21
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 10:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfKGJHU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 04:07:20 -0500
Received: from mga12.intel.com ([192.55.52.136]:3962 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726800AbfKGJHU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Nov 2019 04:07:20 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Nov 2019 01:07:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; 
   d="scan'208";a="205618822"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2019 01:07:13 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iSdl2-0001eW-PM; Thu, 07 Nov 2019 11:07:12 +0200
Date:   Thu, 7 Nov 2019 11:07:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v4 1/2] pinctrl: Add pinmux & GPIO controller driver for
 a new SoC
Message-ID: <20191107090712.GV32742@smile.fi.intel.com>
References: <cover.1573111648.git.rahul.tanwar@linux.intel.com>
 <63273c2b9ad14dae2b74e27e679da4d60a67d284.1573111648.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63273c2b9ad14dae2b74e27e679da4d60a67d284.1573111648.git.rahul.tanwar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 07, 2019 at 03:36:44PM +0800, Rahul Tanwar wrote:
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

> +static void eqbr_gpio_mask_ack_irq(struct irq_data *d)
> +{
> +	eqbr_gpio_disable_irq(d);
> +	eqbr_gpio_ack_irq(d);

Potential race?

> +}

> +static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +			       unsigned int selector, unsigned int group)
> +{
> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	struct function_desc *func;
> +	struct group_desc *grp;
> +	unsigned int *pinmux;
> +	int i;
> +
> +	func = pinmux_generic_get_function(pctldev, selector);
> +	if (!func)
> +		return -EINVAL;
> +
> +	grp = pinctrl_generic_get_group(pctldev, group);
> +	if (!grp)
> +		return -EINVAL;
> +
> +	pinmux = grp->data;

> +	for (i = 0; i < grp->num_pins; i++)
> +		eqbr_set_pin_mux(pctl, pinmux[i], grp->pins[i]);

What if in the middle of the loop mux of one of the pins be changed by parallel
thread?

> +	return 0;
> +}

> +static int eqbr_pinmux_gpio_request(struct pinctrl_dev *pctldev,
> +				    struct pinctrl_gpio_range *range,
> +				    unsigned int pin)
> +{
> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> +

> +	/* 0 mux is reserved for GPIO */

Perhaps

#define EQBR_GPIO_MODE	0

?

> +	return eqbr_set_pin_mux(pctl, 0, pin);
> +}

> +	for (i = 0; i < npins; i++) {
> +		ret = eqbr_pinconf_set(pctldev, pins[i], configs, num_configs);
> +		if (ret)
> +			return ret;

What if in the middle of the loop settings of one of the pins be changed by
parallel thread?

> +	}

> +static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
> +{
> +	struct device *dev = drvdata->dev;
> +	struct device_node *node = dev->of_node;
> +	unsigned int *pinmux, pin_id, pinmux_id;
> +	struct group_desc group;
> +	struct device_node *np;
> +	struct property *prop;
> +	int j, err;
> +
> +	for_each_child_of_node(node, np) {
> +		prop = of_find_property(np, "groups", NULL);
> +		if (!prop)
> +			continue;
> +
> +		group.num_pins = of_property_count_u32_elems(np, "pins");
> +		if (group.num_pins < 0) {

> +			dev_err(dev, "No pins in the group: %s\n",
> +				prop->name);

It is perfectly one line. The idea of if (!foo) pattern in the loop to make
code occupy less LOCs along with increased readability.

> +			return -EINVAL;
> +		}
> +		group.name = prop->value;

> +		group.pins = devm_kcalloc(dev, group.num_pins,
> +					  sizeof(*(group.pins)), GFP_KERNEL);
> +		pinmux = devm_kcalloc(dev, group.num_pins,
> +				      sizeof(*pinmux), GFP_KERNEL);

These can be rearranged.

> +
> +		if (!group.pins || !pinmux)
> +			return -ENOMEM;
> +		for (j = 0; j < group.num_pins; j++) {

> +			if (of_property_read_u32_index(np, "pins",
> +						       j, &pin_id)) {

One line.

And so on...

> +				dev_err(dev, "Group %s: Read intel pins id failed\n",
> +					group.name);
> +				return -EINVAL;
> +			}
> +			if (pin_id >= drvdata->pctl_desc.npins) {
> +				dev_err(dev, "Group %s: Invalid pin ID, idx: %d, pin %u\n",
> +					group.name, j, pin_id);
> +				return -EINVAL;
> +			}
> +			group.pins[j] = pin_id;
> +			if (of_property_read_u32_index(np, "pinmux",
> +						       j, &pinmux_id)) {
> +				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
> +					group.name);
> +				return -EINVAL;
> +			}
> +			pinmux[j] = pinmux_id;
> +		}
> +
> +		err = pinctrl_generic_add_group(drvdata->pctl_dev, group.name,
> +						group.pins, group.num_pins,
> +						pinmux);
> +		if (err < 0) {
> +			dev_err(dev, "Failed to register group %s\n",
> +				group.name);
> +			return err;
> +		}
> +		memset(&group, 0, sizeof(group));
> +		pinmux = NULL;
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


