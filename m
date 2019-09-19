Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36D67B7534
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 10:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387874AbfISIgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 04:36:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:4164 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387617AbfISIgO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Sep 2019 04:36:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Sep 2019 01:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; 
   d="scan'208";a="189538499"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 19 Sep 2019 01:36:12 -0700
Received: from [10.226.38.74] (unknown [10.226.38.74])
        by linux.intel.com (Postfix) with ESMTP id 0BB065802A3;
        Thu, 19 Sep 2019 01:36:09 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] pinctrl: Add pinmux & GPIO controller driver for
 new SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <65898579e78b4b3bb5db9ddc884a818046c1eb4c.1568274587.git.rahul.tanwar@linux.intel.com>
 <20190912143000.GB2680@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <24ae4096-d8d6-fd28-ba2c-98a27f196e6c@linux.intel.com>
Date:   Thu, 19 Sep 2019 16:36:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912143000.GB2680@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Andy,

Thanks for your comments. I agree & will address all your review concerns in
v2 except below mentioned points where i need more clarification.

On 12/9/2019 10:30 PM, Andy Shevchenko wrote:
>> +static const struct pin_config pin_cfg_type[] = {
>> +	{"intel,pullup",		PINCONF_TYPE_PULL_UP},
>> +	{"intel,pulldown",		PINCONF_TYPE_PULL_DOWN},
>> +	{"intel,drive-current",		PINCONF_TYPE_DRIVE_CURRENT},
>> +	{"intel,slew-rate",		PINCONF_TYPE_SLEW_RATE},
>> +	{"intel,open-drain",		PINCONF_TYPE_OPEN_DRAIN},
>> +	{"intel,output",		PINCONF_TYPE_OUTPUT},
>> +};
> Doesn't DT provide a generic naming scheme for these?

For pinctrl multiplexing/configuration nodes, DT does provide generic names
for some properties but it does not seem to mandate it. It states that the
content of pin mux/conf nodes is defined entirely by the binding of the pin
controller device. There are many other examples of pinctrl drivers which use
different prop names than generic ones. For e.g. Samsung. Our understanding
is: if the node is generic i.e. handled by framework, then it should use
generic name. But if the node is private to driver, then it is better to
prefix it with driver name to avoid any conflicts.
>> +	virq = irq_find_mapping(desc->irq_domain, offset);
>> +	if (virq)
>> +		return virq;
>>
>> +	else
>> +		return irq_create_mapping(desc->irq_domain, offset);
> Don't we have more clever helper for this? AFAIR something like this is done in
> IRQ framework when you get a mapping from certain domain.
>

I guess, you mean irq_domain_add_simple(). This function does optionally map
the IRQs but only statically assigned IRQs. We need dynamic gpio_to_irq
mappings which is why the gpio_chip->to_irq() is optionally provided so the
drivers requiring dynamic IRQ mappings can override this function.

But i can definitely get rid of redundant irq_find_mapping() because
irq_create_mapping() anyways invokes irq_find_mapping() first. I will remove
irq_find_mapping() and just use irq_create_mapping() here.
>> +static void eqbr_irq_handler(struct irq_desc *desc)
>> +{
>> +	struct intel_gpio_desc *gc;
>> +	struct irq_chip *ic;
>> +	u32 pins, offset;
>> +	unsigned int virq;
>> +
>> +	gc = irq_desc_get_handler_data(desc);
>> +	ic = irq_desc_get_chip(desc);
>> +
>> +	chained_irq_enter(ic, desc);
>> +	pins = readl(gc->membase + GPIO_IRNCR);
>> +
>> +	for_each_set_bit(offset, (unsigned long *)&pins, gc->bank->nr_pins) {
>> +		virq = irq_linear_revmap(gc->irq_domain, offset);
>> +		if (!virq)
>> +			pr_err("gc[%s]:pin:%d irq not registered!\n",
>> +			       gc->name, offset);
> dev_err() ? But Why is it needed? Shouldn't be registered as a spurious IRQ for
> later debugging?

IMHO, spurious IRQ can only be registered if none of the pins are valid.
Please see below alternative way of handling it & let me know if this
makes more sense.

@@ -313,6 +313,7 @@ static void eqbr_irq_handler(struct irq_desc *desc)
        struct irq_chip *ic;
        u32 pins, offset;
        unsigned int virq;
+       int handled = 0;

        gc = irq_desc_get_handler_data(desc);
        ic = irq_desc_get_chip(desc);
@@ -322,12 +323,16 @@ static void eqbr_irq_handler(struct irq_desc *desc)

        for_each_set_bit(offset, (unsigned long *)&pins, gc->bank->nr_pins) {
                virq = irq_linear_revmap(gc->irq_domain, offset);
-               if (!virq)
-                       pr_err("gc[%s]:pin:%d irq not registered!\n",
-                              gc->name, offset);
-               else
+               if (virq) {
                        generic_handle_irq(virq);
+                       handled++;
+               }
        }
+
+       /* Spurious interrupt */
+       if (handled == 0)
+               handle_bad_irq(desc);
+
        chained_irq_exit(ic, desc);
 }


>> +static int add_config(struct intel_pinctrl_drv_data *drvdata,
>> +		      unsigned long **confs, unsigned int *nr_conf,
>> +		      unsigned long pinconf)
>> +{
>> +	unsigned long *configs;
>> +	struct device *dev = drvdata->dev;
>> +	unsigned int num_conf = *nr_conf + 1;
>> +
>> +	if (!(*nr_conf)) {
>> +		configs = devm_kcalloc(dev, 1, sizeof(pinconf), GFP_KERNEL);
>> +		if (!configs)
>> +			return -ENOMEM;
>> +	} else {
>> +		configs = devm_kmemdup(dev, *confs,
>> +				       num_conf * sizeof(pinconf), GFP_KERNEL);
>> +		if (!configs)
>> +			return -ENOMEM;
>> +		devm_kfree(dev, *confs);
> This a red flag for using devm_*().
> Either a sign of bad design or misplacement of devm_*().

I can switch to non devm versions i.e. kmalloc/kfree for these buffer
allocations. But this leaves me with a fundamental question. As i
understand, devm*() variants are to allocate device specific resources
so you don't have to worry about releasing those resources when device
is unloaded. Does that mean that we should only use devm*() for resources
which have a lifetime from driver load until the driver is unloaded ?
For all other allocations which requires freeing up & reallocation during
the operational state of driver, we should use non devm variants i.e.
kmalloc/kfree ? If yes, then what's the purpose of devm_kfree() & other
similar APIs ?
>
>> +	val = !!(readl(mem + REG_PUEN) & BIT(offset));
>> +	seq_printf(s, "PULL UP: %u\n", val);
>> +	val = !!(readl(mem + REG_PDEN) & BIT(offset));
>> +	seq_printf(s, "PULL DOWN: %u\n", val);
>> +	val = !!(readl(mem + REG_OD) & BIT(offset));
>> +	seq_printf(s, "OPEN DRAIN: %u\n", val);
>> +	val = get_drv_cur(mem, offset);
>> +	seq_printf(s, "DRIVE CURRENT: %u\n", val);
>> +	val = !!(readl(mem + REG_SRC) & BIT(offset));
>> +	seq_printf(s, "SLEW RATE: %u\n", val);
>> +	gpio = get_gpio_desc_via_bank(pctl, bank);
>> +	val = intel_eqbr_gpio_get_dir(&gpio->chip, offset);
>> +	seq_printf(s, "OUTPUT: %u\n", !val);
> I think GPIO library does it for you.

Sorry, could not figure out what you mean. Do you mean no need to override
pinconf_ops->pin_config_dbg_show() ?
>
>> +static int is_func_exist(struct intel_pmx_func *funcs, const char *name,
>> +			 unsigned int nr_funcs, unsigned int *idx)
>> +{
>> +	int i;
>> +
>> +	if (!funcs || !nr_funcs)
>> +		return 0;
>> +
>> +	for (i = 0; i < nr_funcs; i++) {
>> +		if (strcmp(funcs[i].name, name) == 0) {
>> +			*idx = i;
>> +			return 1;
>> +		}
>> +	}
>> +
>> +	return 0;
> NIH match_string(). But I think pin control core does it for drivers.

match_string() searches a string within a array of strings. Here, we are
searching an array of structures, each struct having a unique string, to
match that unique string & return index of containing structure. Could
not find any helper for this purpose. Checked pin control core code as
well but could not find any routine to use for this purpose.

Regards,
Rahul

