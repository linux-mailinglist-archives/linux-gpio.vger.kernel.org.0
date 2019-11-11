Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8742AF6E48
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 06:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfKKF7u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 00:59:50 -0500
Received: from mga01.intel.com ([192.55.52.88]:12455 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbfKKF7u (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Nov 2019 00:59:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Nov 2019 21:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,291,1569308400"; 
   d="scan'208";a="287086311"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2019 21:59:49 -0800
Received: from [10.226.38.118] (rtanwar-mobl.gar.corp.intel.com [10.226.38.118])
        by linux.intel.com (Postfix) with ESMTP id 0E53F580261;
        Sun, 10 Nov 2019 21:59:43 -0800 (PST)
Subject: Re: [PATCH v5 1/2] pinctrl: Add pinmux & GPIO controller driver for a
 new SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
References: <cover.1573196057.git.rahul.tanwar@linux.intel.com>
 <890db37db56e7e49e83b9fa03903bf3482c624c7.1573196057.git.rahul.tanwar@linux.intel.com>
 <20191108114058.GE32742@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <b6283998-fc3f-678d-1647-384f2c7749ca@linux.intel.com>
Date:   Mon, 11 Nov 2019 13:59:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191108114058.GE32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Andy,

On 8/11/2019 7:40 PM, Andy Shevchenko wrote:
> On Fri, Nov 08, 2019 at 05:42:22PM +0800, Rahul Tanwar wrote:
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
>> +static void eqbr_gpio_enable_irq(struct irq_data *d)
>> +{
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
>> +	unsigned int offset = irqd_to_hwirq(d);
>> +	unsigned long flags;
>> +
>> +	gc->direction_input(gc, offset);
> Does this any IO?
> If so, between above and below a window of possible race.
> Ditto for all other functions that do something similar.

gpio-mmio lib uses its own spin lock when it does IO in gc->direction_input()
And that would set pin direction as input (hw ensures that the pin is not
driven high when set direction) while below will enable interrupton that
pin. I do not see any possible race condition in that..

>> +	raw_spin_lock_irqsave(&gctrl->lock, flags);
>> +	writel(BIT(offset), gctrl->membase + GPIO_IRNRNSET);
>> +	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
>> +}
>> +		ret = bgpio_init(&gctrl->chip, dev, gctrl->bank->nr_pins / 8,
>> +				 gctrl->membase + GPIO_IN,
>> +				 gctrl->membase + GPIO_OUTSET,
>> +				 gctrl->membase + GPIO_OUTCLR,
>> +				 gctrl->membase + GPIO_DIR,
>> +				 NULL,
>> +				 0);
> One line?

Sure, missed it.

>> +static int get_drv_cur(void __iomem *mem, unsigned int offset)
>> +{
>> +	unsigned int idx = offset / DRV_CUR_PINS; /* 0-15, 16-31 per register*/
>> +	unsigned int val;
>> +
>> +	val = readl(mem + REG_DRCC(idx));
>> +	offset %= DRV_CUR_PINS;
> From style point of view is better to have
> 	... foo = offset / X;
> 	... bar = offset % X;
>
> directly in definition block. Moreover, for example, on x86 it might be
> converted by compiler to single idiv call in assembly that returns in
> (eax, edx) both values at once.

Ok, i will change it like that but will have to introduce one more variable.

>> +	val = PARSE_DRV_CURRENT(val, offset);
>> +
>> +	return val;
>> +}
>> +	if (!(bank->aval_pinmap & BIT(offset))) {
>> +		dev_err(pctl->dev,
>> +			"PIN: %u is not valid, pinbase: %u, bitmap: %u\n",
>> +			pin, bank->pin_base, bank->aval_pinmap);
>> +		return -ENODEV;
>> +	}
> Looks like aval_pinmap is NIH of valid_mask bitmap in GPIO library.
> Can you check if it suits your purposes?

I did check about it earlier & now as well. It doesn't suit our purpose.
aval_pinmapin the driver indicates whether pad control of this pad is
available or not. It's for all pins irrespective of if it is used as a
gpio or not. Whereas, valid_mask bitmap of GPIO library is just to
indicate if that gpio line is valid or not. valid_mask would have been
useful if this driver was purely a GPIO driver.

>> +static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
>> +			 unsigned int nr_funcs, unsigned int *idx)
>> +{
>> +	int i;
>> +
>> +	if (!funcs || !nr_funcs)
>> +		return false;
> nr_funcs check is a dup of the one in for loop.

Sure, noted.

>> +	for (i = 0; i < nr_funcs; i++) {
>> +		if (funcs[i].name && (strcmp(funcs[i].name, name) == 0) ) {
> An extra space, but you may use !strcmp() and make it shorter without redundant
> parentheses.

Well noted, thanks.

>> +			*idx = i;
>> +			return true;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +		switch (op) {
>> +			case OP_COUNT_NR_FUNCS:
> case goes usually on the same column as switch.

Sure, will change, didn't know about it. Thanks.

>> +				if (!is_func_exist(funcs, fn_name,
>> +						   *nr_funcs, &fid))
>> +					*nr_funcs = *nr_funcs + 1;
>> +				break;
>> +
>> +			case OP_ADD_FUNCS:
>> +				if (!is_func_exist(funcs, fn_name,
>> +						   *nr_funcs, &fid))
>> +					funcs[i].name = fn_name;
>> +				break;
>> +
>> +			case OP_COUNT_NR_FUNC_GRPS:
>> +				if (is_func_exist(funcs, fn_name,
>> +						  *nr_funcs, &fid))
>> +					funcs[fid].nr_groups++;
>> +				break;
>> +
>> +			case OP_ADD_FUNC_GRPS:
>> +				if (is_func_exist(funcs, fn_name,
>> +						  *nr_funcs, &fid)) {
>> +					for(j=0;
> Other style issueS.

Will fix in v6, thanks.

>> +		}
>> +	for (i = 0; i < nr_funcs; i++) {
>> +		if (funcs[i].nr_groups) {
> 	if (!foo)
> 		continue;
> ?

Sure, will change. Thanks.

Regards,
Rahul

