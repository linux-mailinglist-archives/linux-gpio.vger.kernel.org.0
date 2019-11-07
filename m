Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5ADF2AD0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 10:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfKGJgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 04:36:14 -0500
Received: from mga01.intel.com ([192.55.52.88]:14474 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726866AbfKGJgO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Nov 2019 04:36:14 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Nov 2019 01:36:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; 
   d="scan'208";a="205623884"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2019 01:36:13 -0800
Received: from [10.226.38.65] (unknown [10.226.38.65])
        by linux.intel.com (Postfix) with ESMTP id 452DD5802C5;
        Thu,  7 Nov 2019 01:36:09 -0800 (PST)
Subject: Re: [PATCH v4 1/2] pinctrl: Add pinmux & GPIO controller driver for a
 new SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
References: <cover.1573111648.git.rahul.tanwar@linux.intel.com>
 <63273c2b9ad14dae2b74e27e679da4d60a67d284.1573111648.git.rahul.tanwar@linux.intel.com>
 <20191107090712.GV32742@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <59074c5d-fb80-cfbf-b54b-10d9fd14eac0@linux.intel.com>
Date:   Thu, 7 Nov 2019 17:36:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107090712.GV32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Andy,

On 7/11/2019 5:07 PM, Andy Shevchenko wrote:
> On Thu, Nov 07, 2019 at 03:36:44PM +0800, Rahul Tanwar wrote:
> +static void eqbr_gpio_mask_ack_irq(struct irq_data *d)
>> +{
>> +	eqbr_gpio_disable_irq(d);
>> +	eqbr_gpio_ack_irq(d);
> Potential race?
>
>> +}
>> +static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
>> +			       unsigned int selector, unsigned int group)
>> +{
>> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
>> +	struct function_desc *func;
>> +	struct group_desc *grp;
>> +	unsigned int *pinmux;
>> +	int i;
>> +
>> +	func = pinmux_generic_get_function(pctldev, selector);
>> +	if (!func)
>> +		return -EINVAL;
>> +
>> +	grp = pinctrl_generic_get_group(pctldev, group);
>> +	if (!grp)
>> +		return -EINVAL;
>> +
>> +	pinmux = grp->data;
>> +	for (i = 0; i < grp->num_pins; i++)
>> +		eqbr_set_pin_mux(pctl, pinmux[i], grp->pins[i]);
> What if in the middle of the loop mux of one of the pins be changed by parallel
> thread?

These are all ops called back from the core pinctrl framework.
My understanding is that multi-threading serialization is provided by the
pinctrl framework using mutex's. Drivers don't have to worry about that.
Drivers only have to worry about multi-core serialization. I checked
many other existing pinctrl drivers & all of them seem to use spin lock
only for register accesses (not for serializing the ops itself).

Is this understanding incorrect ?


>
>> +	/* 0 mux is reserved for GPIO */
> Perhaps
>
> #define EQBR_GPIO_MODE	0
>
> ?

I had first used #define for this but removed it based on Rob Herring
review feedback. I will add it back here but keep it as 0 in dt bindings..

>> +	return eqbr_set_pin_mux(pctl, 0, pin);
>> +}
>> +	for (i = 0; i < npins; i++) {
>> +		ret = eqbr_pinconf_set(pctldev, pins[i], configs, num_configs);
>> +		if (ret)
>> +			return ret;
> What if in the middle of the loop settings of one of the pins be changed by
> parallel thread?

Same comments as above..

>
>> +		group.pins = devm_kcalloc(dev, group.num_pins,
>> +					  sizeof(*(group.pins)), GFP_KERNEL);
>> +		pinmux = devm_kcalloc(dev, group.num_pins,
>> +				      sizeof(*pinmux), GFP_KERNEL);
> These can be rearranged.

Lost you here. Please elaborate more on what you mean by rearranging. Thanks.

Regards,
Rahul


