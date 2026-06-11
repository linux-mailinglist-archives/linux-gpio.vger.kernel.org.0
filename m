Return-Path: <linux-gpio+bounces-38330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q0pbJqGeKmomtwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:40:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08816671725
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a3Obh9xB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38330-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38330-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BB730BDA0E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB2F3E8C55;
	Thu, 11 Jun 2026 11:37:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903723E7BC4
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177837; cv=none; b=JpAwrEtSuf7thrZU1GUb0U8pOa1964vmNnww8bTN+T6FKEjzLQaf67jmhLC9SyHH8Zb/iVMDmVctgZAhtDK9hpjQjvfL1Vp5Hs5gsveDkwUScHqo2vHpeKZv+11EHrpyal4GicPBpiDPMk8u3f3nMDtxT9xIAsrWCy88Rtu+u8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177837; c=relaxed/simple;
	bh=C0kKRMIh6HI0T1/XUBhk37bZFRTSO4ZNr/+RwNnakaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6rqNDAOIErDDdtceR8M9axIz37roR/KWzDTNpQbunvV1em7JWhhH10nzR7JiV9ovZwY54Q9lypkyaf2SxH+qQTqK389a+X2MVI+DvU7d6iF/V+4ZxnfDdfHkgk5a24br9WhNd7XQearCHfuX7X8uu5H/GhZHBvilZQuboSzOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3Obh9xB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDAC1F0089D
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781177835;
	bh=gJDHZAUL0K+utDUnXsy7ITPlImx9umJXO30cxi5KeqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a3Obh9xBEHyiPmLvZ5Myc+oVGKdj6SSpqRsbuvVjuAX/xeIrQi3sDS+w722yLwVGp
	 w8b1Yq2izHL0Tt0IuXSlfrxotsjmjFsATRyUSz7W++5MpQSQzgVLgToka4y3sc2W4h
	 xxjVG0l8opCnObQHf8urxxDO+68Ii2F7fNnU00A03D9ZnGXkodIAA7jfoNtzdmOClz
	 n/IVEq+yMID1CgaxQ23oYKsUdvSYewxsJELvXmWF7YS4q0z5s3FSak2qfFqrD5Ouwo
	 Kx/UIizOLLiKZuttqMIvqvz3O+g9856l5ISHNV8+Ck7aedFiwLVvbG/XBhAE0fHucQ
	 kMbSscD3QOASg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39666ac91a2so7425681fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 04:37:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9c6zNHDzqHGCpxVcoZdN3VYsWQGlmBMYxDn+dmy59Kvdpj4q1sLvNMFBWo00t52PNJcOWUhvKQ+ogI@vger.kernel.org
X-Gm-Message-State: AOJu0YxISx3wT0Zopvygir0Uum0Ra3AkDqxyjSr8NG3feQnnsC0j5RPV
	LfEnSnvi8NUpVCXbZThAjwDGf08/xHj7f/WzzTgcg1f5dtmcvxMilklFl+XJ83KU4IwW+P5G1iK
	C+ETFmYFd9i7p9pts6QOjhrnQN+iPABk=
X-Received: by 2002:a05:6512:ac4:b0:5aa:63c2:49ed with SMTP id
 2adb3069b0e04-5ad285e7e19mr612607e87.6.1781177833719; Thu, 11 Jun 2026
 04:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com> <20260603055347.66845-5-changhuang.liang@starfivetech.com>
In-Reply-To: <20260603055347.66845-5-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:37:01 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com>
X-Gm-Features: AVVi8CdGj_YwambI610tLybs-x5ald-wA5S466t0-a_TiSheoDD3ZLXzuT_SxD0
Message-ID: <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38330-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:changhuang.liang@starfivetech.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08816671725

Hi Changhuang,

thanks for your patch!

On Wed, Jun 3, 2026 at 7:54=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

This patch adds generic infrastructure "JHB100" that is then used
by several drivers does it not?

Write something about that and some about the design in the
commit message.

> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 domain
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + * Author: Alex Soo <yuklin.soo@starfivetech.com>

Shouldn't this person be in the Signed-off-by?

I guess it's not legally necessary but feels appropriate.

> +static struct config_reg_layout_desc jhb100_sys0_pinctrl_crl_desc[] =3D =
{
> +       {
> +               .pin_start                      =3D 0,
> +               .pin_cnt                        =3D 4,
> +               .drive_strength_2bit            =3D { .shift =3D 0, .widt=
h =3D 2 },
> +               .input_enable                   =3D { .shift =3D 2, .widt=
h =3D 1 },
> +               .pull_down                      =3D { .shift =3D 3, .widt=
h =3D 1 },
> +               .pull_up                        =3D { .shift =3D 4, .widt=
h =3D 1 },
> +               .slew_rate                      =3D { .shift =3D 5, .widt=
h =3D 1 },
> +               .schmitt_trigger_select         =3D { .shift =3D 6, .widt=
h =3D 1 },
> +               .reserved                       =3D { .shift =3D 7, .widt=
h =3D 8 },
> +               .debounce_width                 =3D { .shift =3D 15, .wid=
th =3D 17 },
> +       },
> +       {
> +               .pin_start                      =3D 4,
> +               .pin_cnt                        =3D 5,
> +               .schmitt_trigger_select         =3D { .shift =3D 0, .widt=
h =3D 1 },
> +               .reserved                       =3D { .shift =3D 1, .widt=
h =3D 31 },
> +       },
> +       {
> +               .pin_start                      =3D 9,
> +               .pin_cnt                        =3D 1,
> +               .drive_strength_2bit            =3D { .shift =3D 0, .widt=
h =3D 2 },
> +               .slew_rate                      =3D { .shift =3D 2, .widt=
h =3D 1 },
> +               .reserved                       =3D { .shift =3D 3, .widt=
h =3D 29 },
> +       },
> +       {
> +               .pin_start                      =3D 10,
> +               .pin_cnt                        =3D 1,
> +               .drive_strength_2bit            =3D { .shift =3D 0, .widt=
h =3D 2 },
> +               .input_enable                   =3D { .shift =3D 2, .widt=
h =3D 1 },
> +               .pull_down                      =3D { .shift =3D 3, .widt=
h =3D 1 },
> +               .pull_up                        =3D { .shift =3D 4, .widt=
h =3D 1 },
> +               .slew_rate                      =3D { .shift =3D 5, .widt=
h =3D 1 },
> +               .schmitt_trigger_select         =3D { .shift =3D 6, .widt=
h =3D 1 },
> +               .reserved                       =3D { .shift =3D 7, .widt=
h =3D 25 },
> +       },
> +       { 0xff },
> +};

Would it be appropriate to index the different register variants with
a enum with a good name so it is easy to understand which
variant each entry in the array is?

> +#include <linux/string.h>
> +#include <linux/sort.h>

Hm why... I guess I will see.

> +#define JHB100_DEBOUNCE_WIDTH_STAGES_MAX       0x1FFFFU

Is that a GENMASK(16,0)?

Since it seems to have something to do with bitfield widths.

> +/* i2c open-drain pull-up select */
> +#define JHB100_I2C_OPEN_DRAIN_PU_600_OHMS      0
> +#define JHB100_I2C_OPEN_DRAIN_PU_900_OHMS      1
> +#define JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS     2
> +#define JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS     3

Very nice and to the point! It's easy to read and understand drivers
that are writing things out explicitly like this!

> +#define JHB100_NR_GPIOS_PER_BANK               32
(...)
> +static inline struct jhb100_gpio_bank *jhb100_gc_to_bank(struct gpio_chi=
p *gc)
> +{
> +       return container_of(gc, struct jhb100_gpio_bank, gc);
> +}
> +
> +static unsigned int jhb100_gpio_to_pin(struct gpio_chip *gc, unsigned in=
t gpio)
> +{
> +       struct jhb100_gpio_bank *bank =3D jhb100_gc_to_bank(gc);
> +
> +       return bank->id * JHB100_NR_GPIOS_PER_BANK + gpio;
> +}

This usually tells me that GPIO_GENERIC can be used but maybe
this has been discussed before...

> +static const struct pinctrl_ops jhb100_pinctrl_ops =3D {
> +       .get_groups_count =3D pinctrl_generic_get_group_count,
> +       .get_group_name   =3D pinctrl_generic_get_group_name,
> +       .get_group_pins   =3D pinctrl_generic_get_group_pins,
> +       .dt_node_to_map   =3D pinctrl_generic_pins_function_dt_node_to_ma=
p,
> +       .dt_free_map      =3D pinctrl_utils_free_map,
> +};

Nice use of the generic helpers!

> +static void jhb100_set_gpioval(struct jhb100_pinctrl *sfp, unsigned int =
pin,
> +                              unsigned int val)
> +{
> +       const struct jhb100_pinctrl_domain_info *info =3D sfp->info;
> +       unsigned int offset =3D 4 * (pin / 32);
> +       unsigned int shift =3D 1 * (pin % 32);
> +       unsigned int fs_offset =3D 4 * (pin / 16);
> +       unsigned int fs_shift =3D 2 * (pin % 16);
> +       u32 func_sel_mask;
> +       u32 dout, doen, fs;
> +       void __iomem *reg_gpio_o;
> +       void __iomem *reg_gpio_oen;
> +       void __iomem *reg_gpio_func_sel;
> +       unsigned long flags;
> +
> +       reg_gpio_o =3D sfp->base + info->regs->output + offset;
> +       reg_gpio_oen =3D sfp->base + info->regs->output_en + offset;
> +       reg_gpio_func_sel =3D sfp->base + info->regs->func_sel.reg + fs_o=
ffset;

The part from here:

> +       func_sel_mask =3D GENMASK(info->regs->func_sel.width_per_pin - 1,=
 0) << fs_shift;
(...)
> +
> +       raw_spin_lock_irqsave(&sfp->lock, flags);
> +       fs =3D readl_relaxed(reg_gpio_func_sel);
> +       if (fs & func_sel_mask) {
> +               fs &=3D ~func_sel_mask;
> +               writel_relaxed(fs, reg_gpio_func_sel);
> +       }

..to here seems to reimplement the shortcut
.gpio_request_enable() in struct pinmux_ops.

Then this:

> +       dout =3D val << shift;
> +       doen =3D 0;

> +       dout |=3D readl_relaxed(reg_gpio_o) & ~BIT(shift);
> +       writel_relaxed(dout, reg_gpio_o);
> +       doen |=3D readl_relaxed(reg_gpio_oen) & ~BIT(shift);
> +       writel_relaxed(doen, reg_gpio_oen);

Seems more like the actual code that should be here.

> +       raw_spin_unlock_irqrestore(&sfp->lock, flags);

Please use guards for these spinlocks. They make for less
bugs.

guard(raw_spinlock_irqsave)(&sfp->lock);

> +static const struct pinmux_ops jhb100_pinmux_ops =3D {
> +       .get_functions_count =3D pinmux_generic_get_function_count,
> +       .get_function_name   =3D pinmux_generic_get_function_name,
> +       .get_function_groups =3D pinmux_generic_get_function_groups,
> +       .set_mux             =3D jhb100_set_mux,
> +};

Implement .gpio_request_enable() (see above) and
.gpio_set_direction() see below.

Maybe also .gpio_disable_free() if you need to deconfigure
stuff when a pin is release from GPIO.

> +static const struct pinconf_ops jhb100_pinconf_ops =3D {
> +       .pin_config_get         =3D jhb100_pinconf_get,
> +       .pin_config_set         =3D jhb100_pinconf_set,
> +       .pin_config_group_get   =3D jhb100_pinconf_group_get,
> +       .pin_config_group_set   =3D jhb100_pinconf_group_set,
> +       .is_generic             =3D true,
> +};

Overall this looks nice, good use of the group config!

> +static int jhb100_gpio_get_direction(struct gpio_chip *gc,
> +                                    unsigned int gpio)
> +{
> +       struct jhb100_gpio_bank *bank =3D jhb100_gc_to_bank(gc);
> +       struct jhb100_pinctrl *sfp =3D gpiochip_get_data(gc);
> +       const struct jhb100_pinctrl_domain_info *info =3D sfp->info;
> +       unsigned int offset =3D 4 * bank->id;
> +       u32 doen;
> +       void __iomem *reg_gpio_oen;
> +
> +       reg_gpio_oen =3D sfp->base + info->regs->output_en + offset;
> +
> +       doen =3D (readl_relaxed(reg_gpio_oen) & BIT(gpio)) >> gpio;
> +
> +       return doen =3D=3D GPOEN_ENABLE ? GPIO_LINE_DIRECTION_OUT : GPIO_=
LINE_DIRECTION_IN;
> +}
> +
> +static int jhb100_gpio_direction_input(struct gpio_chip *gc,
> +                                      unsigned int gpio)
> +{
> +       struct jhb100_pinctrl *sfp =3D gpiochip_get_data(gc);
> +       struct device *dev =3D sfp->dev;
> +       struct config_reg_layout_desc *crl_desc;
> +       unsigned int pin =3D jhb100_gpio_to_pin(gc, gpio);
> +
> +       crl_desc =3D get_crl_desc_by_pin(sfp, pin);
> +       if (!crl_desc) {
> +               dev_err(dev, "pin %d can't not found reg layout descripto=
r\n",
> +                       pin);
> +               return -EINVAL;
> +       }
> +
> +       jhb100_padcfg_rmw(sfp, pin,
> +                         RL_DESC_GENMASK(crl_desc, input_enable) |
> +                         RL_DESC_GENMASK(crl_desc, schmitt_trigger_selec=
t),
> +                         RL_DESC_GENMASK(crl_desc, input_enable) |
> +                         RL_DESC_GENMASK(crl_desc, schmitt_trigger_selec=
t));

Instead of doing these writes directly into the config registers, implement
.gpio_set_direction() in struct pinmux_ops and call the pinmux
generic back-end.

> +static int jhb100_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned int gpio, int value)
> +{
> +       struct jhb100_pinctrl *sfp =3D gpiochip_get_data(gc);
> +       struct device *dev =3D sfp->dev;
> +       struct config_reg_layout_desc *crl_desc;
> +       unsigned int pin =3D jhb100_gpio_to_pin(gc, gpio);
> +
> +       jhb100_set_one_pin_mux(sfp, pin, 0,
> +                              value ? GPOUT_HIGH : GPOUT_LOW);
> +
> +       crl_desc =3D get_crl_desc_by_pin(sfp, pin);
> +       if (!crl_desc) {
> +               dev_err(dev, "pin %d can't not found reg layout descripto=
r\n",
> +                       pin);
> +               return -EINVAL;
> +       }
> +
> +       jhb100_padcfg_rmw(sfp, pin,
> +                         RL_DESC_GENMASK(crl_desc, input_enable) |
> +                         RL_DESC_GENMASK(crl_desc, schmitt_trigger_selec=
t) |
> +                         RL_DESC_GENMASK(crl_desc, pull_down) |
> +                         RL_DESC_GENMASK(crl_desc, pull_up),
> +                         0);

Dito.

> +static int jhb100_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct jhb100_gpio_bank *bank =3D jhb100_gc_to_bank(gc);
> +       struct jhb100_pinctrl *sfp =3D gpiochip_get_data(gc);
> +       const struct jhb100_pinctrl_domain_info *info =3D sfp->info;
> +       unsigned int offset =3D 4 * bank->id;
> +       u32 doen =3D 0;
> +       void __iomem *reg_gpio_oen;
> +       void __iomem *reg;
> +       unsigned long flags;
> +
> +       reg_gpio_oen =3D sfp->base + info->regs->output_en + offset;
> +       reg =3D sfp->base + info->regs->gpio_status + offset;
> +
> +       raw_spin_lock_irqsave(&sfp->lock, flags);
> +       doen =3D readl_relaxed(reg_gpio_oen) | BIT(gpio);
> +       writel_relaxed(doen, reg_gpio_oen);
> +       raw_spin_unlock_irqrestore(&sfp->lock, flags);

Why *on* *earth* are you read-modify-writing the output enable
register in the *get* function? Is this a copy-on-paste error??

> +       return !!(readl_relaxed(reg) & BIT(gpio % 32));

Also you never actuall read reg .... ehhhh this is a glaring bug.

> +static int jhb100_gpio_set(struct gpio_chip *gc, unsigned int gpio, int =
value)
> +{
> +       struct jhb100_gpio_bank *bank =3D jhb100_gc_to_bank(gc);
> +       struct jhb100_pinctrl *sfp =3D gpiochip_get_data(gc);
> +       const struct jhb100_pinctrl_domain_info *info =3D sfp->info;
> +       unsigned int offset =3D 4 * bank->id;
> +       void __iomem *reg_dout;
> +       u32 dout;
> +       unsigned long flags;
> +
> +       reg_dout =3D sfp->base + info->regs->output + offset;
> +       dout =3D (value ? GPOUT_HIGH : GPOUT_LOW) << gpio;
> +
> +       raw_spin_lock_irqsave(&sfp->lock, flags);
> +       dout |=3D readl_relaxed(reg_dout) & ~BIT(gpio);
> +       writel_relaxed(dout, reg_dout);
> +       raw_spin_unlock_irqrestore(&sfp->lock, flags);
> +
> +       return 0;
> +}

This looks right, did you only test output and not input..?

> +static const struct irq_chip jhb100_irq_chip =3D {
> +       .irq_ack        =3D jhb100_irq_ack,
> +       .irq_mask       =3D jhb100_irq_mask,
> +       .irq_mask_ack   =3D jhb100_irq_mask_ack,
> +       .irq_unmask     =3D jhb100_irq_unmask,
> +       .irq_set_type   =3D jhb100_irq_set_type,
> +       .irq_set_wake   =3D jhb100_irq_set_wake,
> +       .irq_print_chip =3D jhb100_irq_print_chip,
> +       .flags          =3D IRQCHIP_SET_TYPE_MASKED |
> +                         IRQCHIP_IMMUTABLE |
> +                         IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
> +                         IRQCHIP_MASK_ON_SUSPEND |
> +                         IRQCHIP_SKIP_SET_WAKE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

The irqchip looks good!

> +static int field_compare(const void *a, const void *b)
> +{
> +       const struct field_info *fa =3D (const struct field_info *)a;
> +       const struct field_info *fb =3D (const struct field_info *)b;
> +
> +       if (fa->shift < fb->shift)
> +               return -1;
> +
> +       if (fa->shift > fb->shift)
> +               return 1;
> +
> +       return 0;
> +}

Are you sure the kernel doesn't already have a helper like this...

> +       sfp->num_banks =3D DIV_ROUND_UP(sfp->ngpios, JHB100_NR_GPIOS_PER_=
BANK);
> +
> +       for (unsigned int i =3D 0; i < sfp->num_banks; i++) {
> +               if (sfp->ngpios > (i + 1) * JHB100_NR_GPIOS_PER_BANK)
> +                       sfp->banks[i].gc.ngpio =3D (i + 1) * JHB100_NR_GP=
IOS_PER_BANK;
> +               else
> +                       sfp->banks[i].gc.ngpio =3D sfp->ngpios - i * JHB1=
00_NR_GPIOS_PER_BANK;

This looks completely bananas, shouldn't this be simply:

sfp->banks[i].gc.ngpio =3D JHB100_NR_GPIOS_PER_BANK;

???

What is getting assigned to ngpios looks like a gpiochip base, and have
all the signs of a real bad AI hallucination.

> +
> +               sfp->banks[i].id =3D i;
> +
> +               sfp->banks[i].gc.parent =3D dev;
> +               sfp->banks[i].gc.label =3D dev_name(dev);
> +               sfp->banks[i].gc.owner =3D THIS_MODULE;
> +               sfp->banks[i].gc.request =3D pinctrl_gpio_request;

Use
gpiochip_generic_request

> +               sfp->banks[i].gc.free =3D pinctrl_gpio_free;

Use
gpiochip_generic_free

These calls will do what you want, and also check that the
right gpio ranges are available.

Make sure you add GPIO ranges (the mapping between pin control
pins and corresponding GPIO offsets) for this to work properly.

I'm pretty sure you can have a generic pin config backend as well.

sfp->banks[i].gc.set_config =3D gpiochip_generic_config;

This will make config calls to the gpiochip call into the pinctrl
backend =3D what you want.

> +               sfp->banks[i].gc.get_direction =3D jhb100_gpio_get_direct=
ion;
> +               sfp->banks[i].gc.direction_input =3D jhb100_gpio_directio=
n_input;
> +               sfp->banks[i].gc.direction_output =3D jhb100_gpio_directi=
on_output;
> +               sfp->banks[i].gc.get =3D jhb100_gpio_get;
> +               sfp->banks[i].gc.set =3D jhb100_gpio_set;
> +               sfp->banks[i].gc.set_config =3D gpiochip_generic_config;
> +               sfp->banks[i].gc.base =3D -1;
> +               sfp->banks[i].gc.of_gpio_n_cells =3D 3;
> +               sfp->banks[i].gc.of_node_instance_match =3D starfive_of_n=
ode_instance_match;

Since you have a threecell scheme with 32 gpios
(JHB100_NR_GPIOS_PER_BANK)  per instance (right? the ngpios
code above made me really confused....)
you should be able so select GPIO_GENERIC,
#include <linux/gpio/generic.h> and use
the generic GPIO pretty much the same way
drivers/gpio/gpio-spacemit-k1.c does it, check that driver
out (especially spacemit_gpio_add_bank()).

Yours,
Linus Walleij

