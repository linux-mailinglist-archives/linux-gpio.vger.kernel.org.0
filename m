Return-Path: <linux-gpio+bounces-35687-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB6SNyqM8GkuUwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35687-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:30:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFBC482A43
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B51EB3010B29
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452593ECBDD;
	Tue, 28 Apr 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOZOHEQx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F420F3E8C70
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372198; cv=none; b=SnGfKkn23/Lx60RzcifikSOWn9iw4zQ9c+H6jveDPDosZKSjpQe5Oy+2iNEkIshiagKSJnBrqTLc9V9RPZCfcohmoWkD/NvgDnrFywKcmtffJyOAUUfWWppEZ4UiIXmpBqnglximLH9Fl+QahMPG6z78lBf6jhraJ+8Ct/YZlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372198; c=relaxed/simple;
	bh=kLsx+AZu6JpJXrKX0DXj71/Ih8p4NW1P1/libhF77WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDwhfg7G2XObKBO6h1sbkvYhYEBeczd344cZvH1PoRmlO0X1Q7X8/K62Vee4UNW/0zA9I9YPYO4XyL1f4+5UeTDHZ4+GTpfKS6oWLYYZYMZAGqI3dlDXUl+hFSb4ijV5U3k5/5NL+TCkw1URYmlHN586xnhZPpTYv8QtFWsyUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOZOHEQx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4427C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372197;
	bh=kLsx+AZu6JpJXrKX0DXj71/Ih8p4NW1P1/libhF77WE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IOZOHEQx98psfXoHYYDX+OnW6f3UZDPzo8ndDqQIktzssFV7pWuhqOZQucPba5+gN
	 icBzMkkIQk9hRnVluI0Ro6RL3TpOemlVTKXpD/FQ4W46U9dt46mC2t7tY9Vp8XRG5j
	 SZXyCKQteIwaNdctRXowhQYcmS3fYWGLJgvi8tzr+AK4hzsp0n4nZvVzoVlNF6Tf6r
	 GaPD3LJVAvPIhZxU7vtEclNlff0UerruFEyeVFBzThkXd34fMQ1Hpplx+BlhtMu6AZ
	 IR3JfOPjdVhGHXcK/mtTVylXzbkZPtEm2RzXyA6Pv11VrMVwtwFkqtS4kObmx+r07G
	 3MpNra7TPXjxg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so119751611fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 03:29:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8pNkn2ndXOAyo/8npF0eHzfAq7mpNKaV6jBkStp3+1ziNswIAAB3ngIW2R2JrljKWfPoCqhiziQ/Ww@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfVSgPLyTTl/owGg2uTYNAUCYa+Lxw/hlh/2zzsCHTrRUDGzF
	ymMRewqU61PGjMDCeA2+UUBtvIV5FB2t2nJL5BE0Rv/eqpxXbBBCX5GeY33ZMnnEekF8KnARsjo
	bI2wdNS/PSWXHX6ib+R31BywPjq6sSE4=
X-Received: by 2002:a2e:9fc8:0:b0:38e:a74c:cfb7 with SMTP id
 38308e7fff4ca-39240f2ce91mr10662801fa.14.1777372196443; Tue, 28 Apr 2026
 03:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com> <20260424111330.702272-3-changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-3-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:29:44 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Pxz-=cTPCuoL-j0fqJymrHN9BE5w-SCxq4_9S1KDtXw@mail.gmail.com>
X-Gm-Features: AVHnY4LqFo_HDwtWhzAhaUJ81fs1ASYixYqCTQiyBvU7icpL3NbkqcMGvWJEmc4
Message-ID: <CAD++jL=Pxz-=cTPCuoL-j0fqJymrHN9BE5w-SCxq4_9S1KDtXw@mail.gmail.com>
Subject: Re: [PATCH v1 02/20] pinctrl: starfive: Add StarFive JHB100 sys0
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
X-Rspamd-Queue-Id: BDFBC482A43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35687-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Changhuang,

thanks for your patch!

On Fri, Apr 24, 2026 at 1:13=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

(...)

> +config PINCTRL_STARFIVE_JHB100
> +       bool
> +       select GENERIC_PINCONF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS

Neat that you use the generic stuff!

> +#include <linux/pinctrl/consumer.h>

Do you really need the consumer header?

> +/* Custom pinconf parameters */
> +#define STARFIVE_PIN_CONFIG_GMAC_VSEL          (PIN_CONFIG_END + 1)
> +#define STARFIVE_PIN_CONFIG_DEBOUNCE_WIDTH     (PIN_CONFIG_END + 2)

Hm I wonder about this...

> +#define STARFIVE_PIN_DRIVE_I2C_FAST_MODE       (PIN_CONFIG_END + 3)
> +#define STARFIVE_PIN_DRIVE_I2C_FAST_MODE_PLUS  (PIN_CONFIG_END + 4)
> +#define STARFIVE_PIN_OPEN_DRAIN_PULLUP_SELECT  (PIN_CONFIG_END + 5)

But the existing pullup already takes an argument. This looks wrong.

> +static const struct pinconf_generic_params jhb100_custom_bindings[] =3D =
{
> +       { "starfive,gmac-vsel", STARFIVE_PIN_CONFIG_GMAC_VSEL, 0 },

Can't you use the existing "power-source" instead? It's fine if it's only
applicable to a few pins. This is overly specific.

> +       { "starfive,debounce-width", STARFIVE_PIN_CONFIG_DEBOUNCE_WIDTH, =
0 },

Don't know about this... sounds like the argument to the existing
input-debounce which is expressed in microseconds. Just recalculate
that value to your "width"?

> +       { "starfive,drive-i2c-fast-mode", STARFIVE_PIN_DRIVE_I2C_FAST_MOD=
E, 0 },
> +       { "starfive,drive-i2c-fast-mode-plus", STARFIVE_PIN_DRIVE_I2C_FAS=
T_MODE_PLUS, 0 },

It's not special that things are for i2c. Use the generic
slew-rate for these two, it describes how fast something is.

> +       { "starfive,i2c-open-drain-pull-up-ohm", STARFIVE_PIN_OPEN_DRAIN_=
PULLUP_SELECT, 0 },

Use the existing drive-open-drain; with the exitsing bias-pull-up =3D <ohms=
>;
two properties. No need to be fancy and create a new property for this.

> +       { "starfive,vga-rte", STARFIVE_PIN_VGA_RTE_SELECT, 0 },

No idea what this is...

> +static int jhb100_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                struct device_node *np,
> +                                struct pinctrl_map **maps,
> +                                unsigned int *num_maps)

Long complicated function. Try to use the generic helper instead and
extend it if need be.

> +static void jhb100_dt_free_map(struct pinctrl_dev *pctldev, struct pinct=
rl_map *map,
> +                              unsigned int num_maps)

Use the generic helper instead.

> +static const struct pinctrl_ops jhb100_pinctrl_ops =3D {
> +       .get_groups_count =3D pinctrl_generic_get_group_count,
> +       .get_group_name   =3D pinctrl_generic_get_group_name,
> +       .get_group_pins   =3D pinctrl_generic_get_group_pins,
> +       .dt_node_to_map   =3D jhb100_dt_node_to_map,
> +       .dt_free_map      =3D jhb100_dt_free_map,

Maybe the need for this goes away if you just use the generic properties
instead?

> +static void jhb100_set_gpioval(struct jhb100_pinctrl *sfp, unsigned int =
pin,
> +                              unsigned int val)
> +{
> +       const struct jhb100_pinctrl_domain_info *info =3D sfp->info;
> +       unsigned int offset =3D 4 * (pin / 32);
> +       unsigned int shift =3D 1 * (pin % 32);
> +       unsigned int fs_offset =3D 4 * (pin / 16);
> +       unsigned int fs_shift =3D 2 * (pin % 16);

All of these are signs that the GPIOs are "banked" into 32
GPIOs per bank, and I think the chips get simpler and easier
to use if they get split into threecell DT phandles.

> +static int jhb100_gpio_get_direction(struct gpio_chip *gc,
> +                                    unsigned int gpio)
> +{
> +       struct jhb100_pinctrl *sfp =3D container_of(gc, struct jhb100_pin=
ctrl, gc);
> +       const struct jhb100_pinctrl_domain_info *info =3D sfp->info;
> +       unsigned int offset =3D 4 * (gpio / 32);
> +       unsigned int shift =3D 1 * (gpio % 32);

Here too.

> +static void jhb100_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct jhb100_pinctrl *sfp =3D jhb100_from_irq_desc(desc);
> +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +       struct gpio_irq_chip *girq =3D &sfp->gc.irq;
> +       struct starfive_pinctrl_regs *pinctrl_regs =3D sfp->info->regs;
> +       unsigned long is;
> +       unsigned int pin;
> +       unsigned int total, size, remain =3D sfp->npins;
> +
> +       chained_irq_enter(chip, desc);
> +
> +       for (total =3D 0, size =3D 0; total < sfp->npins; total +=3D 32, =
remain -=3D size) {
> +               is =3D readl_relaxed(sfp->base + pinctrl_regs->irq_status=
.reg +
> +                                  (total >> 3));
> +               size =3D umin(remain, 32);
> +
> +               for_each_set_bit(pin, &is, size) {
> +                       if (sfp->gpio_func_sel_arr[pin] >=3D 0)
> +                               generic_handle_domain_irq(girq->domain, p=
in);
> +               }
> +       }
> +
> +       chained_irq_exit(chip, desc);
> +}

And since the IRQs are groups per 32 pins I think this will become much
easier if you break the GPIOs into banks.

(...)
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h

> +struct starfive_pinctrl_regs {
> +       struct pinvref_reg vref;
> +       struct gpio_irq_reg config;
> +       struct gpio_irq_reg output;
> +       struct gpio_irq_reg output_en;
> +       struct gpio_irq_reg func_sel;
> +       struct gpio_irq_reg gpio_status;
> +       struct gpio_irq_reg irq_en;
> +       struct gpio_irq_reg irq_status;
> +       struct gpio_irq_reg irq_clr;
> +       struct gpio_irq_reg irq_trigger;
> +       struct gpio_irq_reg irq_level;
> +       struct gpio_irq_reg irq_both_edge;
> +       struct gpio_irq_reg irq_edge;
> +};

If you want to keep a cache of all registers around, use regmap-mmio.

> +int jhb100_pinctrl_probe(struct platform_device *pdev);
> +
> +void pinctrl_utils_free_map(struct pinctrl_dev *pctldev,
> +                           struct pinctrl_map *map, unsigned int num_map=
s);
> +int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
> +const char *pinmux_generic_get_function_name(struct pinctrl_dev *pctldev=
,
> +                                            unsigned int selector);
> +int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
> +                                      unsigned int selector,
> +                                      const char * const **groups,
> +                                      unsigned int * const num_groups);
> +int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
> +                               const char *name,
> +                               const char * const *groups,
> +                               unsigned int const num_groups,
> +                               void *data);
> +
> +#if defined(CONFIG_GENERIC_PINCONF) && defined(CONFIG_OF)
> +int pinconf_generic_parse_dt_config(struct device_node *np,
> +                                   struct pinctrl_dev *pctldev,
> +                                   unsigned long **configs,
> +                                   unsigned int *nconfigs);
> +#endif

Why is there a copy of the generic function headers here?
It looks wrong.

Yours,
Linus Walleij

