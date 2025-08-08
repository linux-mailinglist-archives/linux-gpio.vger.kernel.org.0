Return-Path: <linux-gpio+bounces-24072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7FB1E6F5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 13:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC07A7AF9EF
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 11:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A83231855;
	Fri,  8 Aug 2025 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQdxHtxB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9B1FBE9B;
	Fri,  8 Aug 2025 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754651244; cv=none; b=FXfyxYd3a1WlkpK6EIWfWE0ZCXBT9foK1h+nEXQl5NdsEfxk/CYi0tATY7G864XC0HXmcwU+UZ+ff34yn2EzfPrxhl1HFuAn+XpbzKnK30fBFB7j1Uf6o4X2LipEbb1RuwFsHjXJy90vxvTvy1Co391rEzWIG165icINdv/BKIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754651244; c=relaxed/simple;
	bh=0wcnvJdBzRXHRBfFbTBXzEb6Off2jCZrooo1uDvoghs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZTDRHU6KHqWRUrjVU6GVNW1tJmd/TmS5kn8Vl7U7pirh3fh38kEm0x2LwmPKSm93n0Sq7mO74iz8ONBnOw1BqLO71dhMpEishQWuhHp7YlIW2hKC3PFHwnyikaZW6vZSW8PWovwWXTYxYE3GVZShsXhzcvhYkusJQvS71AFdFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQdxHtxB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b78310b296so978833f8f.2;
        Fri, 08 Aug 2025 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754651240; x=1755256040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cpk6F//e5HnFlH/LYppdciud82iEdk8diNe7dGvpzB8=;
        b=fQdxHtxB30Yaz1NbSuHvjStavFkvCAifZX1HuFUfouaYxFh/lprMwsfpjJ0hzEK/z8
         nNZ2tgw6zPhu20tjYhnshtULA/vAP3mWFvHXJSiiBhxdlgeO5Hy37+lW9DqIr6vI8+mh
         BnxiGuDJCF1PKQ2gv5h9zZAQ/KrbGQKR2t/p7gPyCX9B7QSPT0mCMjWuPW0YqHKGNFk/
         4Xgfd48u3olCqO/UCohzMYDGwdHHt8bynaEIx4LzGs/y0a4oh3iIZmMbD3VjCyAa8vYs
         3MNMDL87PAcVuvD1aXuazetrhzO6yn1H/xAmVQgOhbkns9QHeTwOAW6I8L2S6ThJMTKZ
         TjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754651240; x=1755256040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cpk6F//e5HnFlH/LYppdciud82iEdk8diNe7dGvpzB8=;
        b=WrBuHWdw/ZUiPZ4evp8RSr9eq8GwctvJ71bnz0gRgwXt3Gb6+nQB10NerP/t3db/Q9
         rLWqJwvGPAWFLFLBd8yNgF8l4MYPiwoLRlCuFuenBmrzVvtgB19D5JG/MyCR+/enhJmD
         61+mq9Oe8kYWR61/eNUBIV7fL9c4VfNT/83jDtESJ8235snytdi5OY6YZCHiWBcgbKcn
         ufmcJtEZ0WPrpsYkBHoO5Dxq5VquYS23UYxjtnvZRkvKDW/t59rEOjnx0td2QWEL1Cvb
         f8TCA5GCWQ9w2YkYNlwkoCWAGJr+FqxsOG4Mhj51FBAIovMNFm6zajvZuGs5m8C/bqd7
         wQYg==
X-Forwarded-Encrypted: i=1; AJvYcCU0wVXI6s4umHPQCHNCJA9rI4CEvpxDrNN/xvxuYPw1Pi9DWSmN6guIFZ1b3U8wdNt9JX7RpGyYYiEfZA==@vger.kernel.org, AJvYcCU6J9MXr7Nk6aOIsCvIiJMSqNWMA40ra5kvGCFHbGqH0GnvxOeKdZPCiDSkzulsG8nLwfy10WkCPUqwpX6+@vger.kernel.org, AJvYcCV7QDIvq/qxcuO8khkFWbdwUwziERo1Slj8rmw/1CkJ54QkMjiYSRRxfNfm4C0apvfvmO740jkp/8zHInL8vAizh8M=@vger.kernel.org, AJvYcCXcqtaoIynSzKBLm7chAJ5QWvu8NMj57OYj6FT+Q1nIlKJi71Vlzhq1yrMHXRz8fX4Dt+ayr5OOjxl3@vger.kernel.org
X-Gm-Message-State: AOJu0YzBer09RP6Cd2IvWb91TiGw2WT/M3sSBgXUqNYF68p4Q0dHvuDK
	XGFkwJQfi2gWyOBBZPHvDS0BA6c8GWW06ILF03ExGmFj2Z3pGDKtjPlG8jFgiwbvyEfrjGTwKZa
	QJqPLXa4reKMvktSFl7c0gDCjpOUT74w=
X-Gm-Gg: ASbGncsehzh+bSDiL6MrtCPg/lq9hKtctxUVfPjM30Y0Ysze4+hVggKQOmC7p3ASRB1
	VjWgTXwhmx6bY9ChZHgsK4YeNGJKp2ViwbPqc02Pw+GRjgmkxHDh3Sl/HroZ6BHpXsFbjXM7xgu
	S3vIkMyjXXiqSDAaFSEiiGIkUIkFCS076jls/PhHTC1be/H51vjcWRAW5GPiwJv9VcLQ2EzwkA6
	qHS4Q==
X-Google-Smtp-Source: AGHT+IGMIVVF3VMxa0toFXStD+1Fni9aH/a2WoTovgwS4uo3mnLYJqoFve3Z6x7lD6nACewr/LTAhGvoozgN8bH5mO0=
X-Received: by 2002:a5d:5d88:0:b0:3a6:d95e:f38c with SMTP id
 ffacd0b85a97d-3b900b4d414mr2352572f8f.33.1754651240271; Fri, 08 Aug 2025
 04:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250801154550.3898494-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVhxxJprKSr3-QmO-8+ue+guqErW5e1tj3yEHRMZhdeiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVhxxJprKSr3-QmO-8+ue+guqErW5e1tj3yEHRMZhdeiQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 Aug 2025 12:06:53 +0100
X-Gm-Features: Ac12FXy8n6U2JBYK0locMxmJWM3bxYij6RxqYH7bHzdjOlfFwKXTVwLNfjPbrUs
Message-ID: <CA+V-a8vo2F1yFMZErg6GPwcWS+ENoafg8-AfnHHq=SMaxn4ZBw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: renesas: Add support for RZ/T2H
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Aug 6, 2025 at 3:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 1 Aug 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > Add the pinctrl and gpio driver for RZ/T2H
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Co-developed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - Fixed Kconfig dependency.
> > - Added dependency for 64bit to avoid build errors on 32bit systems.
> > - Included bitfield.h
>
> Thanks for the update!
>
> Seems like several of my review comments on v1 were missed.
>
Sorry for the oversight. I'll go through and fix it in the next version.

> > --- /dev/null
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
>
> > +#define PM_MASK                        GENMASK(1, 0)
> > +#define PM_PIN_MASK(pin)       (PM_MASK << ((pin) * 2))
>
> Please move PM_INPUT and PM_OUTPUT here, and insert a blank line
> between the PM_* and PFC_* definitions.
>
OK.

> > +#define PFC_MASK               GENMASK_ULL(5, 0)
> > +#define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
> > +
> > +#define PM_INPUT       0x01
>
> BIT(0)
>
> > +#define PM_OUTPUT      0x02
>
> BIT(1)
>
OK, I'll make use of BIT macros.

> > +struct rzt2h_pinctrl_data {
> > +       const char * const *port_pins;
>
> Do you need this? It always points rzt2h_gpio_names[].
>
Agreed, this can be dropped and we can make use of rzt2h_gpio_names directl=
y.

> > +       unsigned int n_port_pins;
> > +       const u8 *port_pin_configs;
> > +       unsigned int n_ports;
> > +};
> > +
> > +struct rzt2h_pinctrl {
> > +       struct pinctrl_dev              *pctl;
> > +       struct pinctrl_desc             desc;
> > +       struct pinctrl_pin_desc         *pins;
> > +       const struct rzt2h_pinctrl_data *data;
> > +       void __iomem                    *base0, *base1;
> > +       struct device                   *dev;
> > +       struct gpio_chip                gpio_chip;
> > +       struct pinctrl_gpio_range       gpio_range;
> > +       spinlock_t                      lock;
> > +       struct mutex                    mutex;
>
> Please add comments to these two locks, to clarify what they are
> protecting against.
>
Ok, I will add comments for clarification.

spinlock_t lock; /* lock read/write registers */
struct mutex mutex; /* serialize adding groups and functions */


> > +       bool                            safety_port_enabled;
> > +};
> > +
> > +#define RZT2H_PINCTRL_REG_ACCESS(size, type) \
> > +static inline void rzt2h_pinctrl_write##size(struct rzt2h_pinctrl *pct=
rl, u8 port, \
> > +                                            type val, u16 offset) \
>
> unsigned int offset?
>
Agreed.

> > +{ \
> > +       if (port > RZT2H_MAX_SAFETY_PORTS) \
> > +               write##size(val, pctrl->base0 + offset); \
> > +       else \
> > +               write##size(val, pctrl->base1 + offset); \
> > +} \
> > +\
> > +static inline type rzt2h_pinctrl_read##size(struct rzt2h_pinctrl *pctr=
l, u8 port, u16 offset) \
>
> Likewise
>
OK.

> > +{ \
> > +       if (port > RZT2H_MAX_SAFETY_PORTS) \
> > +               return read##size(pctrl->base0 + offset); \
> > +       else \
> > +               return read##size(pctrl->base1 + offset); \
> > +}
>
> > +static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned in=
t offset)
> > +{
> > +       u8 port =3D RZT2H_PIN_ID_TO_PORT(offset);
> > +       u8 pin =3D RZT2H_PIN_ID_TO_PIN(offset);
> > +       u8 pincfg;
> > +
> > +       if (offset >=3D pctrl->data->n_port_pins || port >=3D pctrl->da=
ta->n_ports)
> > +               return -EINVAL;
> > +
> > +       if (!pctrl->safety_port_enabled && port <=3D RZT2H_MAX_SAFETY_P=
ORTS)
> > +               return -EINVAL;
> > +
> > +       pincfg =3D pctrl->data->port_pin_configs[port];
> > +       return (pincfg & (1 << pin)) ? 0 : -EINVAL;
>
> BIT(pin)
>
Agreed, I will rewrite as `return (pincfg & BIT(pin)) ? 0 : -EINVAL;`

> > +}
> > +
>
> > +static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pctldev,
> > +                                unsigned int func_selector,
> > +                                unsigned int group_selector)
> > +{
> > +       struct rzt2h_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev=
);
> > +       struct function_desc *func;
> > +       struct group_desc *group;
> > +       const unsigned int *pins;
> > +       unsigned int i;
> > +       u8 *psel_val;
> > +       int ret;
> > +
> > +       func =3D pinmux_generic_get_function(pctldev, func_selector);
> > +       if (!func)
> > +               return -EINVAL;
> > +       group =3D pinctrl_generic_get_group(pctldev, group_selector);
> > +       if (!group)
> > +               return -EINVAL;
> > +
> > +       psel_val =3D func->data;
> > +       pins =3D group->grp.pins;
> > +
> > +       for (i =3D 0; i < group->grp.npins; i++) {
> > +               dev_dbg(pctrl->dev, "port:%u pin: %u PSEL:%u\n",
>
> Please use consistent spacing around colons.
>
OK.

> > +                       RZT2H_PIN_ID_TO_PORT(pins[i]), RZT2H_PIN_ID_TO_=
PIN(pins[i]),
> > +                       psel_val[i]);
> > +               ret =3D rzt2h_validate_pin(pctrl, pins[i]);
> > +               if (ret)
> > +                       return ret;
>
> Please insert a blank line.
>
OK.

> > +               rzt2h_pinctrl_set_pfc_mode(pctrl, RZT2H_PIN_ID_TO_PORT(=
pins[i]),
> > +                                          RZT2H_PIN_ID_TO_PIN(pins[i])=
, psel_val[i]);
> > +       }
> > +
> > +       return 0;
> > +};
>
> > +static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned i=
nt offset)
> > +{
> > +       struct rzt2h_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > +       u8 port =3D RZT2H_PIN_ID_TO_PORT(offset);
> > +       u8 bit =3D RZT2H_PIN_ID_TO_PIN(offset);
> > +       int ret;
> > +
> > +       ret =3D rzt2h_validate_pin(pctrl, offset);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (!(rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit))) =
{
>
> Invert the logic and return early, to reduce indentation?
>
Agreed, I will invert the logic.

> > +               u16 reg;
> > +
> > +               reg =3D rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > +               reg =3D (reg >> (bit * 2)) & PM_MASK;
> > +               if (reg =3D=3D PM_OUTPUT)
>
> The hardware supports enabling both input and output, so I think you
> better check for "reg & PM_OUTPUT".
>
OK, I'll  check for "reg & PM_OUTPUT"/"reg & PM_INPUT"

> > +                       return GPIO_LINE_DIRECTION_OUT;
> > +               if (reg =3D=3D PM_INPUT)
> > +                       return GPIO_LINE_DIRECTION_IN;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
>
> > +static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
> > +{
> > +       struct rzt2h_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > +       u8 port =3D RZT2H_PIN_ID_TO_PORT(offset);
> > +       u8 bit =3D RZT2H_PIN_ID_TO_PIN(offset);
> > +       u16 reg;
> > +
> > +       reg =3D rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > +       reg =3D (reg >> (bit * 2)) & PM_MASK;
> > +
> > +       if (reg =3D=3D PM_INPUT)
>
> "if (reg & PM_INPUT)", to handle both PM_INPUT and PM_OUTPUT set?
>
ditto.

> > +               return !!(rzt2h_pinctrl_readb(pctrl, port, PIN(port)) &=
 BIT(bit));
> > +       if (reg =3D=3D PM_OUTPUT)
> > +               return !!(rzt2h_pinctrl_readb(pctrl, port, P(port)) & B=
IT(bit));
> > +       return -EINVAL;
> > +}
>
> > +static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
> > +{
> > +       struct pinctrl_desc *desc =3D &pctrl->desc;
> > +       struct device *dev =3D pctrl->dev;
> > +       struct pinctrl_pin_desc *pins;
> > +       unsigned int i, j;
> > +       u8 *pin_data;
> > +       int ret;
> > +
> > +       desc->name =3D DRV_NAME;
> > +       desc->npins =3D pctrl->data->n_port_pins;
> > +       desc->pctlops =3D &rzt2h_pinctrl_pctlops;
> > +       desc->pmxops =3D &rzt2h_pinctrl_pmxops;
> > +       desc->owner =3D THIS_MODULE;
> > +
> > +       pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERN=
EL);
> > +       if (!pins)
> > +               return -ENOMEM;
> > +
> > +       pin_data =3D devm_kcalloc(dev, desc->npins,
> > +                               sizeof(*pin_data), GFP_KERNEL);
>
> Fits on a single line.
>
Agreed.

> > +       if (!pin_data)
> > +               return -ENOMEM;
> > +
> > +       pctrl->pins =3D pins;
> > +       desc->pins =3D pins;
> > +
> > +       for (i =3D 0, j =3D 0; i < pctrl->data->n_port_pins; i++) {
> > +               pins[i].number =3D i;
> > +               pins[i].name =3D pctrl->data->port_pins[i];
> > +               if (i && !(i % RZT2H_PINS_PER_PORT))
> > +                       j++;
> > +               pin_data[i] =3D pctrl->data->port_pin_configs[j];
> > +               pins[i].drv_data =3D &pin_data[i];
>
> Where is this used?
>
Good point, this isn't required.

> > +       }
> > +
> > +       ret =3D devm_pinctrl_register_and_init(dev, desc, pctrl, &pctrl=
->pctl);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "pinctrl registration fa=
iled\n");
> > +
> > +       ret =3D pinctrl_enable(pctrl->pctl);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "pinctrl enable failed\n=
");
> > +
> > +       return rzt2h_gpio_register(pctrl);
> > +}
> > +
> > +static int rzt2h_pinctrl_cfg_regions(struct platform_device *pdev,
> > +                                    struct rzt2h_pinctrl *pctrl)
> > +{
> > +       pctrl->base0 =3D devm_platform_ioremap_resource_byname(pdev, "n=
sr");
> > +       if (IS_ERR(pctrl->base0))
> > +               return PTR_ERR(pctrl->base0);
> > +
> > +       pctrl->base1 =3D devm_platform_ioremap_resource_byname(pdev, "s=
rs");
>
> When the optional "srs" region is missing, it is ignored by the
> code below, but __devm_ioremap_resource() will still have printed
> an error message.  So you either have to open-code this using
> platform_get_resource_byname() and devm_ioremap_resource() here, or
> create a static devm_platform_ioremap_resource_byname_optional()
> helper that does the same, or go for a public helper directly.
>
Ahh right, I'll open code this for now (as there several patches
depending on the pinctrl driver)

Cheers,
Prabhakar

