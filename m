Return-Path: <linux-gpio+bounces-9429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6C96598D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 10:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CE16281ACB
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B24916BE28;
	Fri, 30 Aug 2024 08:09:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ED01662E9;
	Fri, 30 Aug 2024 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005377; cv=none; b=cJsjfCJUanUs+K0im/Bv89zYe2aWQfzSnDg1UsfTqyCgeU75WJExu7o6IJdkUXZySo7cVnfYBXSreJEfRbEBW1+e/RL0+T2UBG/0x89mqVKUdcDMYW6pb8qXepe9LmZVKyYymYGULVY9PiG2dREsiPwCxMlX4WyPSkwsgW+YRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005377; c=relaxed/simple;
	bh=HIK1H4Pb1Iui5jV64Tsn0cWMVj2Hh/pln1mhkk4Ddzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P35dNVGxG1URg1qLHyf2sZfItFZEwU/VaLBxBc5YwulBDkxG+StWrkuIxNHugNA3jItD5ayZU7J4lyTViB22e6PRAOKwJz5L0ESPNpEjgnzcT9TP0eRZ0/T1ui3pZ7tlDECFg2gB4EcdoV+oI7Jcd8d7smx2aElrZ5ruPYhmIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Fri, 30 Aug 2024 08:09:31 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/4] pinctrl: spacemit: add support for SpacemiT K1 SoC
Message-ID: <20240830080931-GYB41291@gentoo>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-2-1fed6a22be98@gentoo.org>
 <IA1PR20MB495365FC785D7C0B205BD982BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495365FC785D7C0B205BD982BB972@IA1PR20MB4953.namprd20.prod.outlook.com>

Hi Inochi:

On 09:46 Fri 30 Aug     , Inochi Amaoto wrote:
> On Wed, Aug 28, 2024 at 11:30:24AM GMT, Yixun Lan wrote:
> > SpacemiT's K1 SoC has a pinctrl controller which use single register
> > to describe all functions, which include bias pull up/down(strong pull),
> > drive strength, schmitter trigger, slew rate, mux mode.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/Kconfig               |   1 +
> >  drivers/pinctrl/Makefile              |   1 +
> >  drivers/pinctrl/spacemit/Kconfig      |  17 +
> >  drivers/pinctrl/spacemit/Makefile     |   3 +
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 978 ++++++++++++++++++++++++++++++++++
> >  drivers/pinctrl/spacemit/pinctrl-k1.h | 180 +++++++
> >  6 files changed, 1180 insertions(+)
> > 
.. snip
> > +
> > +obj-$(CONFIG_PINCTRL_SPACEMIT_K1)	+= pinctrl-k1.o
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > new file mode 100644
> > index 0000000000000..9faac5a629c38
> > --- /dev/null
> > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > @@ -0,0 +1,978 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> > +
> > +
.. snip
> > +static int spacemit_request_gpio(struct pinctrl_dev *pctldev,
> > +				 struct pinctrl_gpio_range *range,
> > +				 unsigned int pin)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	void __iomem *reg;
> > +
> > +	reg = spacemit_pin_to_reg(pctrl, pin);
> > +	writel(spin->gpiofunc, reg);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct pinmux_ops spacemit_pmx_ops = {
> > +	.get_functions_count	= pinmux_generic_get_function_count,
> > +	.get_function_name	= pinmux_generic_get_function_name,
> > +	.get_function_groups	= pinmux_generic_get_function_groups,
> > +	.set_mux		= spacemit_pmx_set_mux,
> > +	.gpio_request_enable	= spacemit_request_gpio,
> > +	.strict			= true,
> > +};
> > +
> 
> > +static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
> > +				unsigned int pin, unsigned long *config)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	int param = pinconf_to_config_param(*config);
> > +	u32 value, arg;
> > +
> > +	if (!pin)
> > +		return -EINVAL;
> > +
> > +	value = readl(spacemit_pin_to_reg(pctrl, pin));
> > +
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		arg = !FIELD_GET(PAD_PULL_EN, value);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		arg = FIELD_GET(PAD_PULLDOWN, value);
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		arg = FIELD_GET(PAD_PULLUP, value);
> > +		break;
> > +	case PIN_CONFIG_DRIVE_STRENGTH:
> > +		arg = FIELD_GET(PAD_DRIVE, value);
> > +		break;
> > +	case PIN_CONFIG_INPUT_SCHMITT:
> > +		arg = FIELD_GET(PAD_SCHMITT, value);
> > +		break;
> > +	case PIN_CONFIG_SLEW_RATE:
> > +		arg = FIELD_GET(PAD_SLEW_RATE, value);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	*config = pinconf_to_config_packed(param, arg);
> > +
> > +	return 0;
> > +}
> 
> return the value follows the config requirement, not the register value.
> 
ok, I rework this part

> > +
> > +#define ENABLE_DRV_STRENGTH	BIT(1)
> > +#define ENABLE_SLEW_RATE	BIT(2)
> > +static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
> > +					    unsigned long *configs,
> > +					    unsigned int num_configs,
> > +					    u32 *value)
> > +{
> > +	enum spacemit_pin_io_type type;
> > +	int i, param;
> > +	u32 v = 0, voltage = 0, arg, val;
> > +	u32 flag = 0, drv_strength, slew_rate;
> > +
> > +	if (!spin)
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < num_configs; i++) {
> > +		param = pinconf_to_config_param(configs[i]);
> > +		arg = pinconf_to_config_argument(configs[i]);
> > +
> > +		switch (param) {
> > +		case PIN_CONFIG_BIAS_DISABLE:
> > +			v &= ~(PAD_PULL_EN | PAD_PULLDOWN | PAD_PULLUP);
> > +			v &= ~PAD_STRONG_PULL;
> > +			break;
> > +		case PIN_CONFIG_BIAS_PULL_DOWN:
> > +			v &= ~(PAD_PULLUP | PAD_STRONG_PULL);
> > +			v |= (PAD_PULL_EN | PAD_PULLDOWN);
> > +			break;
> > +		case PIN_CONFIG_BIAS_PULL_UP:
> > +			v &= ~PAD_PULLDOWN;
> > +			v |= (PAD_PULL_EN | PAD_PULLUP);
> > +
> > +			if (arg == 1)
> > +				v |= PAD_STRONG_PULL;
> > +			break;
> > +		case PIN_CONFIG_DRIVE_STRENGTH:
> > +			flag |= ENABLE_DRV_STRENGTH;
> > +			drv_strength = arg;
> > +			break;
> > +		case PIN_CONFIG_INPUT_SCHMITT:
> > +			v &= ~PAD_SCHMITT;
> > +			v |= FIELD_PREP(PAD_SCHMITT, arg);
> > +			break;
> > +		case PIN_CONFIG_POWER_SOURCE:
> > +			voltage = arg;
> > +			break;
> > +		case PIN_CONFIG_SLEW_RATE:
> > +			if (arg) {
> > +				flag |= ENABLE_SLEW_RATE;
> > +				v |= PAD_SLEW_RATE_EN;
> > +				slew_rate = arg;
> > +			} else {
> > +				v &= ~PAD_SLEW_RATE_EN;
> > +			}
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	if (flag & ENABLE_DRV_STRENGTH) {
> > +		type = spacemit_to_pin_io_type(spin);
> > +
> > +		/* fix external io type */
> > +		if (type == IO_TYPE_EXTERNAL) {
> > +			switch (voltage) {
> > +			case 1800:
> > +				type = IO_TYPE_1V8;
> > +				break;
> > +			case 3300:
> > +				type = IO_TYPE_3V3;
> > +				break;
> > +			default:
> > +				return -EINVAL;
> > +			}
> > +		}
> > +
> > +		val = spacemit_get_driver_strength(type, drv_strength);
> > +
> > +		v &= ~PAD_DRIVE;
> > +		v |= FIELD_PREP(PAD_DRIVE, val);
> > +	}
> > +
> > +	if (flag & ENABLE_SLEW_RATE) {
> > +		/* check, driver strength & slew rate */
> > +		if (flag & ENABLE_DRV_STRENGTH) {
> > +			val = FIELD_GET(PAD_SLEW_RATE, v) + 2;
> > +			if (slew_rate > 1 && slew_rate != val) {
> > +				pr_err("slew rate conflict with drive strength\n");
> > +				return -EINVAL;
> > +			}
> > +		} else {
> > +			v &= ~PAD_SLEW_RATE;
> > +			slew_rate = slew_rate > 1 ? (slew_rate - 2) : 0;
> > +			v |= FIELD_PREP(PAD_SLEW_RATE, slew_rate);
> > +		}
> > +	}
> > +
> > +	*value = v;
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
> > +				 unsigned int pin,
> > +				 u32 value)
> > +{
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	void __iomem *reg;
> > +	unsigned long flags;
> > +	unsigned int mux;
> > +
> > +	if (!pin)
> > +		return -EINVAL;
> > +
> > +	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> > +
> > +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +	mux = readl_relaxed(reg) & PAD_MUX;
> > +	writel_relaxed(mux | value, reg);
> > +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
> > +				unsigned int pin, unsigned long *configs,
> > +				unsigned int num_configs)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	u32 value;
> > +
> > +	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
> > +		return -EINVAL;
> > +
> > +	return spacemit_pin_set_config(pctrl, pin, value);
> > +}
> > +
> > +static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
> > +				      unsigned int gsel,
> > +				      unsigned long *configs,
> > +				      unsigned int num_configs)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin;
> > +	const struct group_desc *group;
> > +	u32 value;
> > +	int i;
> > +
> > +	group = pinctrl_generic_get_group(pctldev, gsel);
> > +	if (!group)
> > +		return -EINVAL;
> > +
> > +	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
> > +	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < group->grp.npins; i++)
> > +		spacemit_pin_set_config(pctrl, group->grp.pins[i], value);
> > +
> > +	return 0;
> > +}
> > +
> 
> > +static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
> > +				      struct seq_file *seq, unsigned int pin)
> > +{
> > +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +	enum spacemit_pin_io_type type = spacemit_to_pin_io_type(spin);
> > +	void __iomem *reg;
> > +	u32 value;
> > +
> > +	reg = spacemit_pin_to_reg(pctrl, pin);
> > +	value = readl(reg);
> > +	seq_printf(seq, ", io type (%d)", type);
> > +	seq_printf(seq, ", strong pull (%ld)", FIELD_GET(PAD_STRONG_PULL, value));
> > +	seq_printf(seq, ", register (0x%04x)\n", value);
> > +}
> 
> drop, move the "io type" to the spacemit_pctrl_dbg_show.
Ok

> "strong pull" should be handled if you use real value in
> spacemit_pinconf_get.
> 
for this reason, I will just drop it


-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

