Return-Path: <linux-gpio+bounces-10411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D29850F3
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 04:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42F71285524
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 02:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04DF148301;
	Wed, 25 Sep 2024 02:30:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000AFA55;
	Wed, 25 Sep 2024 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727231433; cv=none; b=QE931H35RvfYfLJZ3BjfSxR23gDboPg9ZF3UoXX5vTT6V7R6aRus4c9Vc45g89ZMC6FixNyxrrAQ7EJ7kD6Ap3vl1Qf9DiKfeIzR2UkSxEbhsRu3+eVcLy0xw/3jP3lIsMAXRoXQwJW9y+T2soNzxfFqEdLGslSmYyvB7J8GOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727231433; c=relaxed/simple;
	bh=d1aJOHs6Wfb1URjlB5Zq4IVqXVmW+o+htl7KIyeVQls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8pK9TUfCJs+Th9T5WckvF0jKdlJF3alzvm+OsQ1MOAWmEpERVz1i9BSTjdYqNuBz3aVwPj72IiRIPYWBoXgsaH6/O2GwZm93WmfVXGtS38r59cgfgW+WNw7yvCdBpblGKf5uXSlbHS7wam76S7S6O4Ri5XCbgQrF13tdH01HVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Wed, 25 Sep 2024 10:30:21 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 2/3] pinctrl: spacemit: add support for SpacemiT K1 SoC
Message-ID: <20240925023021-GYA3482125@gentoo>
References: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
 <20240903-02-k1-pinctrl-v4-2-d76c00a33b2b@gentoo.org>
 <CACRpkda2M5kpBi9jJvvAH1SzFurs=c9Z+brSJ_MOkvNz=28t_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda2M5kpBi9jJvvAH1SzFurs=c9Z+brSJ_MOkvNz=28t_Q@mail.gmail.com>

Hi Linus:

thanks for your review..

On 10:58 Mon 23 Sep     , Linus Walleij wrote:
> Hi Yixun,
> 
> thanks for your patch!
> 
> Some comments and suggestions below:
> 
> On Tue, Sep 3, 2024 at 2:27 PM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > SpacemiT's K1 SoC has a pinctrl controller which use single register
> > to describe all functions, which include bias pull up/down(strong pull),
> > drive strength, schmitter trigger, slew rate, mux mode.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> 
> > +config PINCTRL_SPACEMIT_K1
> > +       tristate "SpacemiT K1 SoC Pinctrl driver"
> > +       depends on ARCH_SPACEMIT || COMPILE_TEST
> > +       depends on OF
> > +       select GENERIC_PINCTRL_GROUPS
> > +       select GENERIC_PINMUX_FUNCTIONS
> > +       select GENERIC_PINCONF
> 
> (...)
> 
> > @@ -0,0 +1,1078 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> > +
> > +#include <linux/bitfield.h>
> 
> I think you really just use <linux/bits.h>
> 
ok
> > +#include <linux/export.h>
> 
> Why?
> 
will drop
> > +#include <linux/pinctrl/consumer.h>
> 
> Why?
will drop
> 
> > +#include <linux/pinctrl/machine.h>
> 
> Why?
will drop
> 
> > +#include "../core.h"
for pinctrl_generic_add_group()
for pinctrl_generic_get_group()
..
> > +#include "../pinctrl-utils.h"
for pinctrl_utils_free_map()

> > +#include "../pinconf.h"
for pinconf_generic_parse_dt_config()

> > +#include "../pinmux.h"
for pinmux_generic_add_function()
for pinmux_generic_get_function_count()
for pinmux_generic_get_function_name()
for pinmux_generic_get_function_groups()
..
> 
> All of them, really?
> 
can't, or any suggestion? if I'm taking wrong approach..

> > +static inline void __iomem *spacemit_pin_to_reg(struct spacemit_pinctrl *pctrl,
> > +                                               unsigned int pin)
> > +{
> > +       return pctrl->regs + spacemit_pin_to_offset(pin);
> > +}
> 
> If this is the only user of spacemit_pin_to_offset() then fold it into one
> function, I'd say.
> 
also used in spacemit_pctrl_dbg_show(), it would be more clean to show pins' offset
so I will keep this

> > +static unsigned int spacemit_dt_get_pin(u32 value)
> > +{
> > +       return (value >> 16) & GENMASK(15, 0);
> > +}
> 
> Make it a static u16 and drop the genmask, shifting 32 bits
> 16 bits right shifts in zeroes in the top bits.
> 
ok
> > +
> > +static unsigned int spacemit_dt_get_pin_mux(u32 value)
> > +{
> > +       return value & GENMASK(15, 0);
> > +}
> 
> Return static u16
> 
ok
> > +static void spacemit_pctrl_dbg_show(struct pinctrl_dev *pctldev,
> > +                                   struct seq_file *seq, unsigned int pin)
> > +{
> > +       struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +       const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +       enum spacemit_pin_io_type type = spacemit_to_pin_io_type(spin);
> > +       void __iomem *reg;
> > +       u32 value;
> > +
> > +       seq_printf(seq, "offset: 0x%04x ", spacemit_pin_to_offset(pin));
> > +       seq_printf(seq, "type: %s ", io_type_desc[type]);
> > +
> > +       reg = spacemit_pin_to_reg(pctrl, pin);
> > +       value = readl(reg);
> > +       seq_printf(seq, "mux: %ld reg: 0x%04x", (value & PAD_MUX), value);
> > +}
> 
> This is nice and helpful for users and debugging!
> 
> > +static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> > +                                        struct device_node *np,
> > +                                        struct pinctrl_map **maps,
> > +                                        unsigned int *num_maps)
> > +{
> > +       struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +       struct device *dev = pctrl->dev;
> > +       struct device_node *child;
> > +       struct pinctrl_map *map;
> > +       const char **grpnames;
> > +       const char *grpname;
> > +       int ngroups = 0;
> > +       int nmaps = 0;
> > +       int ret;
> > +
> > +       for_each_available_child_of_node(np, child)
> > +               ngroups += 1;
> > +
> > +       grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
> > +       if (!grpnames)
> > +               return -ENOMEM;
> > +
> > +       map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
> > +       if (!map)
> > +               return -ENOMEM;
> > +
> > +       ngroups = 0;
> > +       mutex_lock(&pctrl->mutex);
> 
> Use a scoped guard in this and other instances:
> 
> #include <linux/cleanup.h>
> 
> guard(mutex)(&pctrl->mutex);
> 
> And just drop the mutex unlock, it will be unlocked when you
> exit the function. (narrower scopes are possible consult
> git grep guard drivers/gpio).
> 
good idea, I will fix all locks according to this..

> > +       for_each_available_child_of_node(np, child) {
> 
> Instead of the kludgy construction requireing of_node_put at the end of the
> function, use for_each_available_child_of_node_scoped().
> 
good suggestion, will fix it
> > +static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
> > +                               unsigned int fsel, unsigned int gsel)
> > +{
> > +       struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +       const struct group_desc *group;
> > +       const struct spacemit_pin_mux_config *configs;
> > +       unsigned int i, mux;
> > +       void __iomem *reg;
> > +
> > +       group = pinctrl_generic_get_group(pctldev, gsel);
> > +       if (!group)
> > +               return -EINVAL;
> > +
> > +       configs = group->data;
> > +
> > +       for (i = 0; i < group->grp.npins; i++) {
> > +               const struct spacemit_pin *spin = configs[i].pin;
> > +               u32 value = configs[i].config;
> > +               unsigned long flags;
> > +
> > +               reg = spacemit_pin_to_reg(pctrl, spin->pin);
> > +               mux = spacemit_dt_get_pin_mux(value);
> > +
> > +               raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +               value = readl_relaxed(reg) & ~PAD_MUX;
> > +               writel_relaxed(mux | value, reg);
> > +               raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> 
> Use a guard() clause for the lock instead.
> 
ditto
> > +static int spacemit_request_gpio(struct pinctrl_dev *pctldev,
> > +                                struct pinctrl_gpio_range *range,
> > +                                unsigned int pin)
> > +{
> > +       struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +       const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +       void __iomem *reg;
> > +
> > +       reg = spacemit_pin_to_reg(pctrl, pin);
> > +       writel(spin->gpiofunc, reg);
> 
> Doesn't this register write require any locking?
> 
right, will fix it
> > +static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
> > +                                  unsigned int pin, u32 value)
> > +{
> > +       const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> > +       void __iomem *reg;
> > +       unsigned long flags;
> > +       unsigned int mux;
> > +
> > +       if (!pin)
> > +               return -EINVAL;
> > +
> > +       reg = spacemit_pin_to_reg(pctrl, spin->pin);
> > +
> > +       raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +       mux = readl_relaxed(reg) & PAD_MUX;
> > +       writel_relaxed(mux | value, reg);
> > +       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> 
> Use a scoped guard.
> 
ok
> Yours,
> Linus Walleij

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

