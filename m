Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760EDF72E8
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 12:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfKKLSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 06:18:12 -0500
Received: from mga05.intel.com ([192.55.52.43]:9169 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726791AbfKKLSM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Nov 2019 06:18:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Nov 2019 03:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; 
   d="scan'208";a="207087344"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 11 Nov 2019 03:18:08 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iU7hw-00009m-6Z; Mon, 11 Nov 2019 13:18:08 +0200
Date:   Mon, 11 Nov 2019 13:18:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v6 1/2] pinctrl: Add pinmux & GPIO controller driver for
 a new SoC
Message-ID: <20191111111808.GO32742@smile.fi.intel.com>
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com>
 <d15b8cf13882902444e33c616d78c06c6b5fdc7b.1573455324.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d15b8cf13882902444e33c616d78c06c6b5fdc7b.1573455324.git.rahul.tanwar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 11, 2019 at 06:11:29PM +0800, Rahul Tanwar wrote:
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

Looking again into this DT parsing and at other drivers, can't you utilize pin
control framework better?

I see some drivers are using
	pinctrl_utils_add_map_mux()
among other calls.

Some comments below as well.

> +	writel(pmx, mem + (offset << 2));

	offset * 4
looks more naturally here. Applies to other similar cases if any.

> +	val = readl(mem + REG_DRCC(idx));
> +	val = PARSE_DRV_CURRENT(val, pin_offset);
> +
> +	return val;

Can be
	return PARSE_DRV_CURRENT(readl(mem + REG_DRCC(idx)), pin_offset);

but it's up to you.

> +static int eqbr_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> +			    unsigned long *configs, unsigned int num_configs)
> +{
> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> +	struct eqbr_gpio_ctrl *gctrl;
> +	enum pin_config_param param;
> +	struct eqbr_pin_bank *bank;
> +	unsigned int val, offset;
> +	struct gpio_chip *gc;
> +	unsigned long flags;
> +	void __iomem *mem;
> +	u32 regval, mask;
> +	int i;
> +
> +	for (i = 0; i < num_configs; i++) {
> +		param = pinconf_to_config_param(configs[i]);
> +		val = pinconf_to_config_argument(configs[i]);
> +
> +		bank = find_pinbank_via_pin(pctl, pin);
> +		if (!bank) {
> +			dev_err(pctl->dev,
> +				"Couldn't find pin bank for pin %u\n", pin);
> +			return -ENODEV;
> +		}
> +		mem = bank->membase;
> +		offset = pin - bank->pin_base;
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			mem += REG_PUEN;

> +			val &= 0x1;

Unneeded if use standard pattern (see below).

> +			mask = BIT(offset);
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			mem += REG_PDEN;

> +			val &= 0x1;

Ditto.

> +			mask = BIT(offset);
> +			break;
> +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +			mem += REG_OD;

> +			val &= 0x1;

Ditto.

> +			mask = BIT(offset);
> +			break;
> +		case PIN_CONFIG_DRIVE_STRENGTH:
> +			mem += REG_DRCC(offset / DRV_CUR_PINS);

> +			offset = (offset % DRV_CUR_PINS) << 1;
> +			val &= 0x3;

Ditto.

> +			mask = GENMASK(offset + 1, offset);

GENMASK() badly works with non-constants. Better

			mask = GENMASK(1, 0) << offset;

> +			break;
> +		case PIN_CONFIG_SLEW_RATE:
> +			mem += REG_SRC;

> +			val &= 0x1;

Ditto.

> +			mask = BIT(offset);
> +			break;
> +		case PIN_CONFIG_OUTPUT_ENABLE:
> +			gctrl = get_gpio_ctrls_via_bank(pctl, bank);
> +			if (!gctrl) {
> +				dev_err(pctl->dev, "Failed to find gpio via bank pinbase: %u, pin: %u\n",
> +					bank->pin_base, pin);
> +				return -ENODEV;
> +			}
> +			gc = &gctrl->chip;
> +			gc->direction_output(gc, offset, 0);
> +			continue;
> +		default:
> +			return -ENOTSUPP;
> +		}
> +
> +		raw_spin_lock_irqsave(&pctl->lock, flags);
> +		regval = readl(mem);

> +		regval = (regval & ~mask) | (val << offset);

Standard pattern is to apply mask here:
		regval = (regval & ~mask) | ((val << offset) & mask);

> +		writel(regval, mem);
> +		raw_spin_unlock_irqrestore(&pctl->lock, flags);
> +	}
> +
> +	return 0;
> +}

> +			dev_dbg(dev, "Group %s: not function binded!\n",
> +				(char *)prop->value);

Do you need casting here?

-- 
With Best Regards,
Andy Shevchenko


