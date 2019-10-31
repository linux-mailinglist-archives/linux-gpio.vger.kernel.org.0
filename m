Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89108EAB30
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 08:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfJaH5t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 03:57:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:65394 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726769AbfJaH5t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 31 Oct 2019 03:57:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 00:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; 
   d="scan'208";a="375157005"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 31 Oct 2019 00:57:48 -0700
Received: from [10.226.38.65] (rtanwar-mobl.gar.corp.intel.com [10.226.38.65])
        by linux.intel.com (Postfix) with ESMTP id 7C956580127;
        Thu, 31 Oct 2019 00:57:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] pinctrl: Add pinmux & GPIO controller driver for a
 new SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
References: <cover.1572409172.git.rahul.tanwar@linux.intel.com>
 <4bb885fe692d29f2635772dcd04839390f1f5671.1572409172.git.rahul.tanwar@linux.intel.com>
 <20191030143907.GY32742@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <bb9d2c3d-2b01-7239-eefa-0e813b091cc8@linux.intel.com>
Date:   Thu, 31 Oct 2019 15:57:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191030143907.GY32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Andy,

On 30/10/2019 10:39 PM, Andy Shevchenko wrote:
> On Wed, Oct 30, 2019 at 12:23:59PM +0800, Rahul Tanwar wrote:
>> Intel Lightning Mountain SoC has a pinmux controller & GPIO controller IP which
>> controls pin multiplexing & configuration including GPIO functions selection &
>> GPIO attributes configuration.
>>
>> This IP is not based on & does not have anything in common with Chassis
>> specification. The pinctrl drivers under pinctrl/intel/* are all based upon
>> Chassis spec compliant pinctrl IPs. So this driver doesn't fit & can not use
>> pinctrl framework under pinctrl/intel/* and it requires a separate new driver.
>>
>> Add a new GPIO & pin control framework based driver for this IP.
>>
>> +static inline void eqbr_set_val(void __iomem *addr, u32 offset,
>> +				u32 mask, u32 set, raw_spinlock_t *lock)
>
> Why is it marked with inline?

Hard to justify. I can remove inline if you recommend so..

>> +{
>> +	u32 val;
>> +	unsigned long flags;
>> +
>> +	raw_spin_lock_irqsave(lock, flags);
>> +	val = readl(addr);
>> +	val = (val & ~(mask << offset)) | ((set & mask) << offset);
> This is unusual, why offset can't be applied once to the mask?

Do you mean like below ? (set still needs to be left shifted by offset)

mask = mask << offset;
val = (val & ~mask) | ((set << offset) & mask);

>> +	writel(val, addr);
>> +	raw_spin_unlock_irqrestore(lock, flags);
> Hmm... Don't you have more complicated workflow that requires few
> reads/writes/updates to be called atomically?

I don't really see any complicated register programming in this driver.
Just forpin configuration, mux setting & GPIO IRQ configuration..

>> +}
>> +static void eqbr_gpio_disable_irq(struct irq_data *d)
>> +{
>> +	unsigned int offset = irqd_to_hwirq(d);
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +	struct eqbr_gpio_desc *desc = gpiochip_get_data(gc);
>> +	writel(BIT(offset), desc->membase + GPIO_IRNENCLR);
> Is it okay to be without spin lock?
> Same Q to the rest similar places.

Yes, you are right. GPIO IRQ ops also needs locking. I was incorrectly
assuming that gpiolib will provide locking when it calls these ops. I
will fix it in v3. Thanks.

>> +}
>> +static inline void eqbr_cfg_bit(void __iomem *addr,
>> +				unsigned int offset, unsigned int set)
>> +{
>> +	if (!set)
> Why not to use positive condition?

Well noted.

>> +		writel(readl(addr) & ~BIT(offset), addr);
>> +	else
>> +		writel(readl(addr) | BIT(offset), addr);
>> +}
>> +	struct gpio_irq_type it;
> Not sure if this is used properly. Linus may clarify this.
>
>> +static void eqbr_irq_handler(struct irq_desc *desc)
>> +{
>> +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>> +	struct eqbr_gpio_desc *gpio_desc = gpiochip_get_data(gc);
>> +	struct irq_chip *ic = irq_desc_get_chip(desc);
>> +	u32 pins, offset;
>> +
>> +	chained_irq_enter(ic, desc);
>> +	pins = readl(gpio_desc->membase + GPIO_IRNCR);
>> +
>> +	for_each_set_bit(offset, (unsigned long *)&pins, gc->ngpio)
> This casting is no go.

Well noted. Copy paste mistake. Will fix it. Thanks.

>> +		generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
>> +
>> +	chained_irq_exit(ic, desc);
>> +}
>> +static int gpiochip_setup(struct device *dev, struct eqbr_gpio_desc *desc)
>> +{
>> +	struct gpio_irq_chip *girq;
>> +	struct gpio_chip *gc;
>> +
>> +	gc = &desc->chip;
>> +	gc->owner = THIS_MODULE;
> Do we still need this in the drivers?

Agree it is redundant. Will remove it. Thanks.

>> +	gc->label = desc->name;
>> +	gc->of_node = desc->node;
>> +
>> +	if (!of_property_read_bool(desc->node, "interrupt-controller")) {
> Why is it fatal?

It is not fatal, that's why it returns 0 instead of error i.e. if this
gpio chip is notintended to be used as interrupt controller then do
not setup gpio_irq_chipand proceed to register gpio chip without
interrupt support.

>> +		dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
>> +			 desc->name);
>> +		return 0;
>> +	}
>> +	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
>> +				     GFP_KERNEL);
> I believe it's fine to have it on one line.

Well noted.

>> +	if (!girq->parents)
>> +		return -ENOMEM;
>> +
>> +	girq->default_type = IRQ_TYPE_NONE;
>> +	girq->handler = handle_level_irq;
> Not bad IRQ handler?

Yes, it should be handle_bad_irq(). Will fix, thanks.

>> +	girq->parents[0] = desc->virq;
>> +
>> +	return 0;
>> +}
>> +static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
>> +{
>> +	struct device_node *np;
>> +	struct eqbr_gpio_desc *desc;
>> +	struct device *dev;
>> +	int i, ret;
>> +	struct resource res;
>> +
>> +	dev = drvdata->dev;
>> +	for (i = 0; i < drvdata->nr_gpio_descs; i++) {
>> +		desc = drvdata->gpio_desc + i;
>> +		np = desc->node;
>> +
>> +		desc->name = devm_kasprintf(dev, GFP_KERNEL, "gpiochip%d", i);
>> +		if (!desc->name)
>> +			return -ENOMEM;
>> +
>> +		if (of_address_to_resource(np, 0, &res)) {
>> +			dev_err(dev, "Failed to get GPIO register address\n");
>> +			return -ENXIO;
>> +		}
>> +
>> +		desc->membase = devm_ioremap_resource(dev, &res);
>> +		if (IS_ERR(desc->membase)) {
>> +			dev_err(dev, "ioremap fail\n");
> Redundant.

Well noted.

>> +			return PTR_ERR(desc->membase);
>> +	}
> Is it per descriptor?!

Yes, it is per descriptor i.e. per gpio_chip. Each gpio_chip has different
membase.

>> +
>> +		desc->virq = irq_of_parse_and_map(np, 0);
>> +		if (!desc->virq) {
>> +			dev_err(dev, "%s: failed to parse and map irq\n",
>> +				desc->name);
>> +			return -ENXIO;
>> +		}
>> +		raw_spin_lock_init(&desc->lock);
>> +	}
>> +
>> +	return 0;
>> +}
>> +static const struct pinmux_ops eqbr_pinmux_ops = {
>> +	.get_functions_count	= pinmux_generic_get_function_count,
>> +	.get_function_name 	= pinmux_generic_get_function_name,
>> +	.get_function_groups 	= pinmux_generic_get_function_groups,
>> +	.set_mux		= eqbr_pinmux_set_mux,
>> +	.gpio_request_enable	= eqbr_pinmux_gpio_request,
>> +	.strict			= true,
>> +};
> TABs/spaces mix.

Well noted. Thanks.

Regards,
Rahul
