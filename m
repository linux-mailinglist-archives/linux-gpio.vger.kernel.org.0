Return-Path: <linux-gpio+bounces-25331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFFBB3E6FC
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 16:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F4A77A6EC0
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED530248F66;
	Mon,  1 Sep 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDUOWBYA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57492F49EE;
	Mon,  1 Sep 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756736697; cv=none; b=DBmLxhRYnnIMPTwOj2WaGf4COwtYvLq5OerNk1KSStm9oMzhNfG71BN0OiC+/Mo8iLwIe7E0ssFJhev5mz6+xE9sk9nbnQFTYj64AlcByYNO5K5WvZjh23PLbIR5GtJHXRyD2YJA0vchx2lA0xNxL0CwZJeTrz+qoIuw9+1eWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756736697; c=relaxed/simple;
	bh=M8fJZB18elUtJ0aWEJBsI1OZ1YzJQLmO5PeUR+HzsIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7Pl8gFBPuP0hCbiIQbsEA+1sNZ8Sbm8D1uKdtAZGJ5YKjJTozz6yV7qIoTDdm/NB1qaNGerfbKxEkDV/yf95knGGWznx7tI0DDKxkH9c9ECbnUw5Z5QTMCR5S43mT1v/HrXSxB4OD552ve42g2lVToXDxhHL426bn8ZzoD0kk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDUOWBYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37196C4CEF9;
	Mon,  1 Sep 2025 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756736697;
	bh=M8fJZB18elUtJ0aWEJBsI1OZ1YzJQLmO5PeUR+HzsIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CDUOWBYAe6Rns1+UAHOF5uvQft0nWh5vStgnA3YAN1yV3fwZZt4uxOQz/oq2A9DxP
	 wi16jeYjpwMyqbPvYB3tAzwHKAhlRSmXk9mgWu+BWKvt+89wdo4baSEmWVwEdOBAgY
	 CgCO4fWx5Wexb79uFIwV+tpEE0gTAqULJ94yc9cg30e8S2SDrjvNNUSnKgFTqN/zJB
	 ZsfLdkN4erBWnQkCqanZYK2msRp//ImiSaN6OJ2DOW8HcomFLQP5R1IeBEaPHTN0Tu
	 lLXcL+PaI9XwTudfA5s0eOMOQHFGjbz0YMnFU6Q8+XnhBYnV+EF0Tm7iyW4CcIHi/w
	 eg8AhTuu/koVg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0428b537e5so179054066b.3;
        Mon, 01 Sep 2025 07:24:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx0wQ1lksWg7VUmCa4DsWqWRXe1EwXiFOcGCRtGRvOzXa2hct4safLC8S8QNVGSS26wYjXMX5B37W7JOLO@vger.kernel.org, AJvYcCVAKXnuVm3uAVapqdlbMchpVG11SOjhrU37V82wJEb83ZVTua/CzuOlaGQi9Q5cUyWgbqTKGHhC2/m3kw==@vger.kernel.org, AJvYcCXpNivneiATjvNQD4abU2SjMmp9cEUArUX2wNts8AOLaIuEuh1ERJvNz/0K8wvV7Uvz/mLpvTbAsqq0@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFKKq9HjZp0jFpMRDevzf5DFQyLyR9bC8U0XiVWpPdW4gwQ+p
	NviMP2MNQLF0YdcGOmkzpmRRPCu2jmHrVrzG2T+eGqSVgNF7zet/lzYoz2bDU77KSgrt+7u5/pw
	ubPiTqExVTsB5u0dauG2iZ+vOVCqUmOs=
X-Google-Smtp-Source: AGHT+IHVpqU4+ujyGOutKEp4h9mv3/b4cS5iOmG7yJHLu/13swFAoYpCjbFyooohRiAKA12+JGJbuVS7Sm3PZtgF8yQ=
X-Received: by 2002:a17:906:aad6:b0:b04:2160:f61f with SMTP id
 a640c23a62f3a-b04216100ecmr371386266b.37.1756736695635; Mon, 01 Sep 2025
 07:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901133804.38433-1-ziyao@disroot.org> <20250901133804.38433-3-ziyao@disroot.org>
In-Reply-To: <20250901133804.38433-3-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 1 Sep 2025 22:24:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5GixGbrAaJS+hch-LAFt+noCJXHhQD0f7_7BjNfiOncQ@mail.gmail.com>
X-Gm-Features: Ac12FXz8OpLsu9pH_SGFdYvgBRYpYx6xSKmtG_dB8TOlN4Rt3h8nAHUJHowWJKU
Message-ID: <CAAhV-H5GixGbrAaJS+hch-LAFt+noCJXHhQD0f7_7BjNfiOncQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: loongson-64bit: Add support for Loongson
 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yao,

On Mon, Sep 1, 2025 at 9:38=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> This controller's input and output logic is similar to previous
> generations of SoCs. Additionally, it's capable of interrupt masking,
> and could be configured to detect levels and edges, and is supplied with
> a distinct reset signal.
>
> The interrupt functionality is implemented through an irqchip, whose
> operations are written with previous generation SoCs in mind and could
> be reused. Since all Loongson SoCs with similar interrupt capability
> (2K1500, 2K2000) support byte-control mode, these operations are for
> byte-control mode only for simplicity.
Modify the name style the same as in Patch-1.

>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/gpio/Kconfig               |   1 +
>  drivers/gpio/gpio-loongson-64bit.c | 191 +++++++++++++++++++++++++++--
>  2 files changed, 185 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a437fe652dbc..c55173643eb4 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -437,6 +437,7 @@ config GPIO_LOONGSON_64BIT
>         depends on LOONGARCH || COMPILE_TEST
>         depends on OF_GPIO
>         select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
>         help
>           Say yes here to support the GPIO functionality of a number of
>           Loongson series of chips. The Loongson GPIO controller supports
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index 482e64ba9b42..7fb712e101ce 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -7,6 +7,8 @@
>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/irqdesc.h>
>  #include <linux/module.h>
>  #include <linux/spinlock.h>
>  #include <linux/err.h>
> @@ -14,6 +16,7 @@
>  #include <linux/gpio/generic.h>
>  #include <linux/platform_device.h>
>  #include <linux/bitops.h>
> +#include <linux/reset.h>
>  #include <asm/types.h>
>
>  enum loongson_gpio_mode {
> @@ -28,6 +31,14 @@ struct loongson_gpio_chip_data {
>         unsigned int            out_offset;
>         unsigned int            in_offset;
>         unsigned int            inten_offset;
> +       unsigned int            intpol_offset;
> +       unsigned int            intedge_offset;
> +       unsigned int            intclr_offset;
> +       unsigned int            intsts_offset;
> +       unsigned int            intdual_offset;
> +       unsigned int            intr_num;
> +       irq_flow_handler_t      irq_handler;
> +       const struct irq_chip   *girqchip;
>  };
>
>  struct loongson_gpio_chip {
> @@ -137,7 +148,140 @@ static int loongson_gpio_to_irq(struct gpio_chip *c=
hip, unsigned int offset)
>         return platform_get_irq(pdev, offset);
>  }
>
> -static int loongson_gpio_init(struct device *dev, struct loongson_gpio_c=
hip *lgpio,
> +static void loongson_gpio_irq_ack(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +
> +       writeb(0x1, lgpio->reg_base + lgpio->chip_data->intclr_offset + h=
wirq);
> +}
> +
> +static void loongson_gpio_irq_mask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +
> +       writeb(0x0, lgpio->reg_base + lgpio->chip_data->inten_offset + hw=
irq);
> +}
> +
> +static void loongson_gpio_irq_unmask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +
> +       writeb(0x1, lgpio->reg_base + lgpio->chip_data->inten_offset + hw=
irq);
> +}
> +
> +static int loongson_gpio_irq_set_type(struct irq_data *data, unsigned in=
t type)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +       u8 pol =3D 0, edge =3D 0, dual =3D 0;
> +
> +       if ((type & IRQ_TYPE_SENSE_MASK) =3D=3D IRQ_TYPE_EDGE_BOTH) {
> +               edge =3D 1;
> +               dual =3D 1;
> +               irq_set_handler_locked(data, handle_edge_irq);
> +       } else {
> +               switch (type) {
> +               case IRQ_TYPE_LEVEL_HIGH:
> +                       pol =3D 1;
> +                       fallthrough;
> +               case IRQ_TYPE_LEVEL_LOW:
> +                       irq_set_handler_locked(data, handle_level_irq);
> +                       break;
> +
> +               case IRQ_TYPE_EDGE_RISING:
> +                       pol =3D 1;
> +                       fallthrough;
> +               case IRQ_TYPE_EDGE_FALLING:
> +                       edge =3D 1;
> +                       irq_set_handler_locked(data, handle_edge_irq);
> +                       break;
> +
> +               default:
> +                       return -EINVAL;
> +               };
> +       }
> +
> +       writeb(pol, lgpio->reg_base + lgpio->chip_data->intpol_offset + h=
wirq);
> +       writeb(edge, lgpio->reg_base + lgpio->chip_data->intedge_offset +=
 hwirq);
> +       writeb(dual, lgpio->reg_base + lgpio->chip_data->intdual_offset +=
 hwirq);
> +
> +       return 0;
> +}
> +
> +static void loongson_gpio_ls2k0300_irq_handler(struct irq_desc *desc)
> +{
> +       struct loongson_gpio_chip *lgpio =3D irq_desc_get_handler_data(de=
sc);
> +       struct irq_chip *girqchip =3D irq_desc_get_chip(desc);
> +       int i;
> +
> +       chained_irq_enter(girqchip, desc);
> +
> +       for (i =3D 0; i < lgpio->chip.gc.ngpio; i++) {
> +               /*
> +                * For the GPIO controller of 2K0300, interrupts status b=
its
s/2K0300/LS2K0300/g.

> +                * may be wrongly set even if the corresponding interrupt=
 is
> +                * disabled. Thus interrupt enable bits are checked along=
 with
> +                * status bits to detect interrupts reliably.
> +                */
> +               if (readb(lgpio->reg_base + lgpio->chip_data->intsts_offs=
et + i) &&
> +                   readb(lgpio->reg_base + lgpio->chip_data->inten_offse=
t + i))
> +                       generic_handle_domain_irq(lgpio->chip.gc.irq.doma=
in, i);
> +       }
> +
> +       chained_irq_exit(girqchip, desc);
> +}
> +
> +static const struct irq_chip loongson_gpio_ls2k0300_irqchip =3D {
> +       .irq_ack        =3D loongson_gpio_irq_ack,
> +       .irq_mask       =3D loongson_gpio_irq_mask,
> +       .irq_unmask     =3D loongson_gpio_irq_unmask,
> +       .irq_set_type   =3D loongson_gpio_irq_set_type,
> +       .flags          =3D IRQCHIP_IMMUTABLE | IRQCHIP_SKIP_SET_WAKE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static int loongson_gpio_init_irqchip(struct platform_device *pdev,
> +                                     struct loongson_gpio_chip *lgpio)
> +{
> +       const struct loongson_gpio_chip_data *data =3D lgpio->chip_data;
> +       struct gpio_chip *chip =3D &lgpio->chip.gc;
> +       int i;
> +
> +       chip->irq.default_type =3D IRQ_TYPE_NONE;
> +       chip->irq.handler =3D handle_bad_irq;
> +       chip->irq.parent_handler =3D data->irq_handler;
> +       chip->irq.parent_handler_data =3D lgpio;
> +       gpio_irq_chip_set_chip(&chip->irq, data->girqchip);
> +
> +       chip->irq.num_parents =3D data->intr_num;
> +       chip->irq.parents =3D devm_kcalloc(&pdev->dev, data->intr_num,
> +                                        sizeof(*chip->irq.parents), GFP_=
KERNEL);
> +       if (!chip->parent)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < data->intr_num; i++) {
> +               chip->irq.parents[i] =3D platform_get_irq(pdev, i);
> +               if (chip->irq.parents[i] < 0)
> +                       return dev_err_probe(&pdev->dev, chip->irq.parent=
s[i],
> +                                            "failed to get IRQ %d\n", i)=
;
> +       }
> +
> +       for (i =3D 0; i < data->intr_num; i++) {
> +               writeb(0x0, lgpio->reg_base + data->inten_offset + i);
> +               writeb(0x1, lgpio->reg_base + data->intclr_offset + i);
> +       }
> +
> +       return 0;
> +}
> +
> +static int loongson_gpio_init(struct platform_device *pdev, struct loong=
son_gpio_chip *lgpio,
>                               void __iomem *reg_base)
>  {
>         struct gpio_generic_chip_config config;
> @@ -146,7 +290,7 @@ static int loongson_gpio_init(struct device *dev, str=
uct loongson_gpio_chip *lgp
>         lgpio->reg_base =3D reg_base;
>         if (lgpio->chip_data->mode =3D=3D BIT_CTRL_MODE) {
>                 config =3D (typeof(config)){
> -                       .dev =3D dev,
> +                       .dev =3D &pdev->dev,
>                         .sz =3D 8,
>                         .dat =3D lgpio->reg_base + lgpio->chip_data->in_o=
ffset,
>                         .set =3D lgpio->reg_base + lgpio->chip_data->out_=
offset,
> @@ -155,7 +299,7 @@ static int loongson_gpio_init(struct device *dev, str=
uct loongson_gpio_chip *lgp
>
>                 ret =3D gpio_generic_chip_init(&lgpio->chip, &config);
>                 if (ret) {
> -                       dev_err(dev, "unable to init generic GPIO\n");
> +                       dev_err(&pdev->dev, "unable to init generic GPIO\=
n");
>                         return ret;
>                 }
>         } else {
> @@ -164,16 +308,22 @@ static int loongson_gpio_init(struct device *dev, s=
truct loongson_gpio_chip *lgp
>                 lgpio->chip.gc.get_direction =3D loongson_gpio_get_direct=
ion;
>                 lgpio->chip.gc.direction_output =3D loongson_gpio_directi=
on_output;
>                 lgpio->chip.gc.set =3D loongson_gpio_set;
> -               lgpio->chip.gc.parent =3D dev;
> +               lgpio->chip.gc.parent =3D &pdev->dev;
>                 spin_lock_init(&lgpio->lock);
>         }
>
>         lgpio->chip.gc.label =3D lgpio->chip_data->label;
>         lgpio->chip.gc.can_sleep =3D false;
> -       if (lgpio->chip_data->inten_offset)
> +       if (lgpio->chip_data->girqchip) {
> +               ret =3D loongson_gpio_init_irqchip(pdev, lgpio);
> +               if (ret)
> +                       return dev_err_probe(&pdev->dev, ret,
> +                                            "failed to initialize irqchi=
p\n");
One line is enough.

> +       } else if (lgpio->chip_data->inten_offset) {
>                 lgpio->chip.gc.to_irq =3D loongson_gpio_to_irq;
> +       }
>
> -       return devm_gpiochip_add_data(dev, &lgpio->chip.gc, lgpio);
> +       return devm_gpiochip_add_data(&pdev->dev, &lgpio->chip.gc, lgpio)=
;
>  }
>
>  static int loongson_gpio_probe(struct platform_device *pdev)
> @@ -181,6 +331,7 @@ static int loongson_gpio_probe(struct platform_device=
 *pdev)
>         void __iomem *reg_base;
>         struct loongson_gpio_chip *lgpio;
>         struct device *dev =3D &pdev->dev;
> +       struct reset_control *rst;
>
>         lgpio =3D devm_kzalloc(dev, sizeof(*lgpio), GFP_KERNEL);
>         if (!lgpio)
> @@ -192,7 +343,12 @@ static int loongson_gpio_probe(struct platform_devic=
e *pdev)
>         if (IS_ERR(reg_base))
>                 return PTR_ERR(reg_base);
>
> -       return loongson_gpio_init(dev, lgpio, reg_base);
> +       rst =3D devm_reset_control_get_optional_exclusive_deasserted(&pde=
v->dev, NULL);
> +       if (IS_ERR(rst))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(rst),
> +                                    "failed to get reset control\n");
One line is enough.

With above changes,
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> +
> +       return loongson_gpio_init(pdev, lgpio, reg_base);
>  }
>
>  static const struct loongson_gpio_chip_data loongson_gpio_ls2k_data =3D =
{
> @@ -204,6 +360,23 @@ static const struct loongson_gpio_chip_data loongson=
_gpio_ls2k_data =3D {
>         .inten_offset =3D 0x30,
>  };
>
> +static const struct loongson_gpio_chip_data loongson_gpio_ls2k0300_data =
=3D {
> +       .label =3D "ls2k0300_gpio",
> +       .mode =3D BYTE_CTRL_MODE,
> +       .conf_offset =3D 0x800,
> +       .in_offset =3D 0xa00,
> +       .out_offset =3D 0x900,
> +       .inten_offset =3D 0xb00,
> +       .intpol_offset =3D 0xc00,
> +       .intedge_offset =3D 0xd00,
> +       .intclr_offset =3D 0xe00,
> +       .intsts_offset =3D 0xf00,
> +       .intdual_offset =3D 0xf80,
> +       .intr_num =3D 7,
> +       .irq_handler =3D loongson_gpio_ls2k0300_irq_handler,
> +       .girqchip =3D &loongson_gpio_ls2k0300_irqchip,
> +};
> +
>  static const struct loongson_gpio_chip_data loongson_gpio_ls2k0500_data0=
 =3D {
>         .label =3D "ls2k0500_gpio",
>         .mode =3D BIT_CTRL_MODE,
> @@ -300,6 +473,10 @@ static const struct of_device_id loongson_gpio_of_ma=
tch[] =3D {
>                 .compatible =3D "loongson,ls2k-gpio",
>                 .data =3D &loongson_gpio_ls2k_data,
>         },
> +       {
> +               .compatible =3D "loongson,ls2k0300-gpio",
> +               .data =3D &loongson_gpio_ls2k0300_data,
> +       },
>         {
>                 .compatible =3D "loongson,ls2k0500-gpio0",
>                 .data =3D &loongson_gpio_ls2k0500_data0,
> --
> 2.50.1
>

