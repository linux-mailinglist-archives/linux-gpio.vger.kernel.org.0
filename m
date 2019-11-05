Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3FAEFBD8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388318AbfKEKxA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:53:00 -0500
Received: from mga17.intel.com ([192.55.52.151]:49486 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388221AbfKEKxA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 05:53:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 02:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; 
   d="scan'208";a="204939882"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2019 02:52:58 -0800
Received: from [10.226.38.65] (rtanwar-mobl.gar.corp.intel.com [10.226.38.65])
        by linux.intel.com (Postfix) with ESMTP id 5876658045B;
        Tue,  5 Nov 2019 02:52:56 -0800 (PST)
Subject: Re: [PATCH v3 1/2] pinctrl: Add pinmux & GPIO controller driver for a
 new SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
 <02558966005c0483144785ed069b144f81d209a9.1572926608.git.rahul.tanwar@linux.intel.com>
 <20191105094917.GK32742@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <61e076de-7b24-b71d-dd79-c1c506a0f1bf@linux.intel.com>
Date:   Tue, 5 Nov 2019 18:52:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105094917.GK32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/11/2019 5:49 PM, Andy Shevchenko wrote:
> On Tue, Nov 05, 2019 at 02:49:42PM +0800, Rahul Tanwar wrote:
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
>> +static void eqbr_set_val(void __iomem *addr, u32 offset,
>> +			 u32 mask, u32 set, raw_spinlock_t *lock)
> This lock parameter is quite unusual. Can't you supply a pointer to a data
> structure which has lock along with MMIO address?

On second thoughts, i realize that this function can be totally avoided
since it just has two callers which can be further reduced to one caller.
I will remove this function and instead do reg update in the caller function
itself.


>> +static int gpiochip_setup(struct device *dev, struct eqbr_gpio_desc *desc)
>> +{
>> +	struct gpio_irq_chip *girq;
>> +	struct gpio_chip *gc;
>> +#if defined(CONFIG_OF_GPIO)
>> +	gc->of_node = desc->node;
>> +#endif
> Isn't it what GPIO library does for everybody?

We have 4 different of_node's for 4 different gpio_chips/banks. GPIO library
handles like below:

        if (chip->parent) {
                gdev->dev.parent = chip->parent;
                gdev->dev.of_node = chip->parent->of_node;
        }

#ifdef CONFIG_OF_GPIO
        /* If the gpiochip has an assigned OF node this takes precedence */
        if (chip->of_node)
                gdev->dev.of_node = chip->of_node;
        else
                chip->of_node = gdev->dev.of_node;
#endif

So i think we need to assign 4 of_node's to gpio_chip's in the driver.

>> +
>> +	if (!of_property_read_bool(desc->node, "interrupt-controller")) {
>> +		dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
>> +			 desc->name);
> Is it fatal or non-fatal?

It is not fatal. But i am totally missing your point. Is it about
dev_info() ? Can you please elaborate more ?


>> +		return 0;
> Ditto.
>
>> +	}
>> +}
>> +static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
>> +{
>> +	struct device_node *np;
>> +	struct eqbr_gpio_desc *desc;
> desc is very confusing here, since GPIO library uses this term for GPIO
> descriptors.

Agree, better to rename it to avoid confusion with GPIO descriptors.
I will rename it in v4. Thanks.

>> +	struct device *dev;
>> +	int i, ret;
>> +	struct resource res;
>> +
>> +		ret = bgpio_init(&desc->chip, dev, desc->bank->nr_pins/8,
> 'nr_pins / 8,'

Well noted.

>> +				 desc->membase + GPIO_IN,
>> +				 desc->membase + GPIO_OUTSET,
>> +				 desc->membase + GPIO_OUTCLR,
>> +				 desc->membase + GPIO_DIR,
>> +				 NULL,
>> +				 0);
>> +		if (ret) {
>> +			dev_err(dev, "unable to init generic GPIO\n");
>> +			return ret;
>> +		}
>> +	return 0;
>> +}
>> +static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
>> +			       unsigned int selector, unsigned int group)
>> +{
>> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
>> +	struct function_desc *func;
>> +	struct group_desc *grp;
>> +	unsigned int *pinmux;
>> +	int i;
>
>> +	pinmux = grp->data;
>> +	for (i = 0; i < grp->num_pins; i++)
>> +		eqbr_set_pin_mux(pctl, pinmux[i], grp->pins[i]);
> Shouldn't be this part serialized?
>
> Same Q to all similar places. I guess I already mentioned this in previous
> review.

From serialization, you mean locking..rt ? Yes, there is one writel()
statement inthis flow. I will add lock for that statement. Rechecked
the code again, i do notfind any other similar places.


>> +	return 0;
>> +}
>> +static int is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
> Looks like it better to be boolean.

Well noted, will change in v4.

>> +			 unsigned int nr_funcs, unsigned int *idx)
>> +{
>> +	int i;
>> +
>> +	if (!funcs || !nr_funcs)
>> +		return 0;
>> +
>> +	for (i = 0; i < nr_funcs; i++) {
>> +
> Redundant blank line.

Well noted, will change in v4.

>> +		if (funcs[i].name && (strcmp(funcs[i].name, name) == 0) ) {
>> +			*idx = i;
>> +			return 1;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
>> +		       unsigned int *nr_funcs, funcs_util_ops op)
>> +{
>> +	struct device_node *node = dev->of_node;
>> +	struct device_node *np;
>> +	struct property *prop;
>> +	unsigned int fid;
>> +	const char *fn_name;
>> +	int i, j;
>> +
>> +	i = 0;
>> +	for_each_child_of_node(node, np) {
>> +		prop = of_find_property(np, "groups", NULL);
>> +		if (prop) {
> Why not
> 		if (!prop)
> 			continue;
> ?

Sure, i can change like that in v4.

>> +			if (of_property_read_string(np, "function",
>> +						    &fn_name)) {
> It's perfectly one line. Perhaps you may need to configure your text editor.

I am following strict 80 chars limit. This goes on to 81 chars. It's a bit
confusing on when to adhere to 80 chars limit and when to bypass it :)

>> +			}
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +	for (i=0; i < nr_funcs; i++) {
> The better style is 'i = 0' and so on.
> Simple be consistent. Or do everywhere 'i=0; i<nr_func; i++', etc. But remember
> that this is for sure will be declined by most of the maintainers.

Sure, noted.

>> +	}
>>
>> +static int pinbank_init(struct device_node *np,
>> +			struct eqbr_pinctrl_drv_data *drvdata,
>> +			struct eqbr_pin_bank *bank, unsigned int id)
>> +{
>> +	struct device *dev = drvdata->dev;
>> +	struct of_phandle_args spec;
>> +
>> +	bank->membase = drvdata->membase + id * PAD_REG_OFF;
>> +
>> +	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &spec)) {
>> +		dev_err(dev, "gpio-range not available!\n");
>> +		return -EFAULT;
> Shadowing error code with actually unsuitable one.

Will change in v4. Thanks.

Regards,
Rahul

