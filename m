Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39929FA7A5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 04:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfKMDzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 22:55:32 -0500
Received: from mga01.intel.com ([192.55.52.88]:52064 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726936AbfKMDzc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 22:55:32 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 19:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,299,1569308400"; 
   d="scan'208";a="194543002"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga007.jf.intel.com with ESMTP; 12 Nov 2019 19:55:31 -0800
Received: from [10.226.38.118] (rtanwar-mobl.gar.corp.intel.com [10.226.38.118])
        by linux.intel.com (Postfix) with ESMTP id DBE89580372;
        Tue, 12 Nov 2019 19:55:28 -0800 (PST)
Subject: Re: [PATCH v6 1/2] pinctrl: Add pinmux & GPIO controller driver for a
 new SoC
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com>
 <d15b8cf13882902444e33c616d78c06c6b5fdc7b.1573455324.git.rahul.tanwar@linux.intel.com>
 <20191111111808.GO32742@smile.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <7e9ca877-7d7b-3ae6-8a22-adde1fdae929@linux.intel.com>
Date:   Wed, 13 Nov 2019 11:55:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191111111808.GO32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Andy,

On 11/11/2019 7:18 PM, Andy Shevchenko wrote:
> On Mon, Nov 11, 2019 at 06:11:29PM +0800, Rahul Tanwar wrote:
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
> Looking again into this DT parsing and at other drivers, can't you utilize pin
> control framework better?
>
> I see some drivers are using
> 	pinctrl_utils_add_map_mux()
> among other calls.

pinctrl_utils_add_map_mux() is already used in the driver via below
generic op:

pinctrl_ops.dt_node_to_map = pinconf_generic_dt_node_map_all

Please see call graph of pinconf_generic_dt_node_map_all() where it 
eventually invokes pinctrl_utils_add_map_mux(). 

Drivers where you see explicit usage of pinctrl_utils_add_map_mux() 
are not using GENERIC_PINCONF of core framework.

Since we are using all possible core framework provided generic ops, 
so i think utilization of pin control framework should already be 
maximized.


> Some comments below as well.
>
>> +	writel(pmx, mem + (offset << 2));
> 	offset * 4
> looks more naturally here. Applies to other similar cases if any.

Noted.

>> +	val = readl(mem + REG_DRCC(idx));
>> +	val = PARSE_DRV_CURRENT(val, pin_offset);
>> +
>> +	return val;
> Can be
> 	return PARSE_DRV_CURRENT(readl(mem + REG_DRCC(idx)), pin_offset);
>
> but it's up to you.

Agree, will update.

>> +static int eqbr_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>> +			    unsigned long *configs, unsigned int num_configs)
>> +{
>> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
>> +	struct eqbr_gpio_ctrl *gctrl;
>> +	enum pin_config_param param;
>> +	struct eqbr_pin_bank *bank;
>> +	unsigned int val, offset;
>> +	struct gpio_chip *gc;
>> +	unsigned long flags;
>> +	void __iomem *mem;
>> +	u32 regval, mask;
>> +	int i;
>> +
>> +	for (i = 0; i < num_configs; i++) {
>> +		param = pinconf_to_config_param(configs[i]);
>> +		val = pinconf_to_config_argument(configs[i]);
>> +
>> +		bank = find_pinbank_via_pin(pctl, pin);
>> +		if (!bank) {
>> +			dev_err(pctl->dev,
>> +				"Couldn't find pin bank for pin %u\n", pin);
>> +			return -ENODEV;
>> +		}
>> +		mem = bank->membase;
>> +		offset = pin - bank->pin_base;
>> +
>> +		switch (param) {
>> +		case PIN_CONFIG_BIAS_PULL_UP:
>> +			mem += REG_PUEN;
>> +			val &= 0x1;
> Unneeded if use standard pattern (see below).
>
>> +			mask = BIT(offset);
>> +			break;
>> +		case PIN_CONFIG_BIAS_PULL_DOWN:
>> +			mem += REG_PDEN;
>> +			val &= 0x1;
> Ditto.
>
>> +			mask = BIT(offset);
>> +			break;
>> +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>> +			mem += REG_OD;
>> +			val &= 0x1;
> Ditto.
>
>> +			mask = BIT(offset);
>> +			break;
>> +		case PIN_CONFIG_DRIVE_STRENGTH:
>> +			mem += REG_DRCC(offset / DRV_CUR_PINS);
>> +			offset = (offset % DRV_CUR_PINS) << 1;
>> +			val &= 0x3;
> Ditto.
>
>> +			mask = GENMASK(offset + 1, offset);
> GENMASK() badly works with non-constants. Better
>
> 			mask = GENMASK(1, 0) << offset;

Noted.

>> +			break;
>> +		case PIN_CONFIG_SLEW_RATE:
>> +			mem += REG_SRC;
>> +			val &= 0x1;
> Ditto.
>
>> +			mask = BIT(offset);
>> +			break;
>> +		case PIN_CONFIG_OUTPUT_ENABLE:
>> +			gctrl = get_gpio_ctrls_via_bank(pctl, bank);
>> +			if (!gctrl) {
>> +				dev_err(pctl->dev, "Failed to find gpio via bank pinbase: %u, pin: %u\n",
>> +					bank->pin_base, pin);
>> +				return -ENODEV;
>> +			}
>> +			gc = &gctrl->chip;
>> +			gc->direction_output(gc, offset, 0);
>> +			continue;
>> +		default:
>> +			return -ENOTSUPP;
>> +		}
>> +
>> +		raw_spin_lock_irqsave(&pctl->lock, flags);
>> +		regval = readl(mem);
>> +		regval = (regval & ~mask) | (val << offset);
> Standard pattern is to apply mask here:
> 		regval = (regval & ~mask) | ((val << offset) & mask);

Agree. In-fact, i had proposed to you exact same pattern earlier but
it was in a different function call so i guess it was not that obvious.
Will change, thanks.

>> +		writel(regval, mem);
>> +		raw_spin_unlock_irqrestore(&pctl->lock, flags);
>> +	}
>> +
>> +	return 0;
>> +}
>> +			dev_dbg(dev, "Group %s: not function binded!\n",
>> +				(char *)prop->value);
> Do you need casting here?

I think yes, to avoid compiler warning..

Regards,
Rahul

