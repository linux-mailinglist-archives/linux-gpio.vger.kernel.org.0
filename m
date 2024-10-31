Return-Path: <linux-gpio+bounces-12372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A47239B7B3D
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 14:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ABC21F23EC1
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC8119D880;
	Thu, 31 Oct 2024 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qWUltGYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B419D88F
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730379640; cv=none; b=Fm/yi8ti5SlZOSjiB5pLfoegut3VIjGIdTsUZT/DB3hV6dm8y6J0Dkv0NL12GiETsuk3qOH8N44ztzulxtp0jDgEYPkAKjE134ioAhBTcBpX82G5u+CDqWk0u9g5TihUt8Xu70HEOKpvjgk0hFStwvaWPDZZU4J5TnRtwqbpza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730379640; c=relaxed/simple;
	bh=MJqYpDUBnGfWUxo97EONf7BGcCDVTiciN49JoSjUjtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUbay6InLHvuC2aNQ7TtvXxCHT09HBLQDhVQLecUIWt7jyHBP9qg6icrD/M9EPyi8HAxjouOnUggi/hy/4IATBdI+Y3mudPQJA3JIHWBFgt//J06jcxpSfEQui9tlSurKJpmNI052U4kn0sqH7sN+4ejkbWPhx+SJvbwLwBo3nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qWUltGYv; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53c78ebe580so1029314e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730379634; x=1730984434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg9hMbWmmuNYwd7zmtUg4Dlzi/pjACFQHMSdax0JLJQ=;
        b=qWUltGYvppTwgKBMuFLfmphyXLbHAAGAOWRuV8uIYNidkLPNV8dqoEAfw67vCo9CZc
         Jp1pBCPiMbOQK8El/gXd8L+5iUhYkCY28j60iRFTE4831pKol5OkFYAEKHaWaWAq508C
         lnfiYUzkeOmM3seEA1+aqrvxEHDhqbuWQUI+HWuy5wQSCueDueyUq5n/vcq1qqtNgsRt
         cMHaDMq8Z2/65o68IDcfi3+NP/Q3GVMYjl0mSSusS8FqpoHc29TfCcughxq7qXifdrR7
         VUuIcgGvBa/mo/Di5ibJ6ZyiNsgadbcg0RO0EA/ZMDmbNsouEYLskNZVhrEldSBmHKmE
         ei6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730379634; x=1730984434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg9hMbWmmuNYwd7zmtUg4Dlzi/pjACFQHMSdax0JLJQ=;
        b=kzYUzf8Qo7XK9lykNAZGMeLVbgSvpi6JD+oz6nSlTe7XsyWq8AT7FurD1piTRT0Crq
         IigztXlWVchbsgvn2xfgbMkfj8tnyyocfYX2sU0EQQpKMJGjkb6iWBTYqchLzNaHa6f8
         8XN6NMzenmOzelw0I+X4j6wE8E2EVuoTFZGLRKLxDmOzC/53QayAN7LzFeiWm0nJwYNI
         9H4jBH74NDC+3p6FwGL2wPPTTFwCruO5cHQmPTsfZlWfisZTgBY4mmTDLvbSVYdmfUPz
         B1q9/48+WMa4x7xKl81V8qLC75YzKvLINVCp1RGThmseOwB8sAsrhqpZbMCkzcOQ22Z5
         3FvQ==
X-Gm-Message-State: AOJu0YzaCHmZUrsS40Jk3bO/ZvDO3oAZUmoZ+lLYyYG/9eN/mCg3i9G9
	Wj+AsrwBClv0l34AbXga/udRiZJn4LpHyUqljzIbLMTgFuJa9KJ/Ln9gxzrv0pO9+vT5d0AS6sQ
	ZZvNy+tgudyYcWAFChqvc9127At6T1JMtZUfqIQ==
X-Google-Smtp-Source: AGHT+IGNHqQg+sjgBRlifh9JTe30iTHlw7cPodOLsYMZiaZV0iSLilgpBBbhJkTk6qhb24IYvuyJ1dynWKIt7fdhEnY=
X-Received: by 2002:a05:6512:3b2b:b0:53a:1d:e3bc with SMTP id
 2adb3069b0e04-53c7bc5b628mr751273e87.26.1730379634145; Thu, 31 Oct 2024
 06:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud> <20241031-appease-purse-55145b5dfba4@spud>
In-Reply-To: <20241031-appease-purse-55145b5dfba4@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 14:00:22 +0100
Message-ID: <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, valentina.fernandezalanis@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Lewis Hanly <lewis.hanly@microchip.com>
>
> Add a driver to support the Polarfire SoC gpio controller. Interrupt
> controller support is unavailable for now and will be added at a later
> date.
>
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v9:
> - remove remove()
> - drop OF_GPIO from kconfig
> - add a prefix to MAX_NUM_GPIO
>
> v8:
> - drop interrupt support
> - replace regular mmio acesses with regmap (nice complexity reduction)
> - change mpfs_gpio_get() so that it can report non-zero when the line
>   direction is output.
> ---
>  drivers/gpio/Kconfig     |   6 ++
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-mpfs.c | 170 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mpfs.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index d93cd4f722b40..811263b033c89 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -549,6 +549,12 @@ config GPIO_PL061
>         help
>           Say yes here to support the PrimeCell PL061 GPIO device.
>
> +config GPIO_POLARFIRE_SOC
> +       bool "Microchip FPGA GPIO support"
> +       select REGMAP_MMIO
> +       help
> +         Say yes here to support the GPIO controllers on Microchip FPGAs=
.
> +
>  config GPIO_PXA
>         bool "PXA GPIO support"
>         depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 1429e8c0229b9..fc66e6388c76c 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -133,6 +133,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)              +=3D gpio=
-pci-idio-16.o
>  obj-$(CONFIG_GPIO_PISOSR)              +=3D gpio-pisosr.o
>  obj-$(CONFIG_GPIO_PL061)               +=3D gpio-pl061.o
>  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)       +=3D gpio-pmic-eic-sprd.o
> +obj-$(CONFIG_GPIO_POLARFIRE_SOC)       +=3D gpio-mpfs.o
>  obj-$(CONFIG_GPIO_PXA)                 +=3D gpio-pxa.o
>  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)     +=3D gpio-raspberrypi-exp.o
>  obj-$(CONFIG_GPIO_RC5T583)             +=3D gpio-rc5t583.o
> diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> new file mode 100644
> index 0000000000000..e5017307b0fe6
> --- /dev/null
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: (GPL-2.0)
> +/*
> + * Microchip PolarFire SoC (MPFS) GPIO controller driver
> + *
> + * Copyright (c) 2018-2024 Microchip Technology Inc. and its subsidiarie=
s
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/of.h>

Sorry for noticing it only now but you don't use any symbol from this
header so it can be dropped.

> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +#define MPFS_GPIO_CTRL(i)              (0x4 * (i))
> +#define MPFS_MAX_NUM_GPIO              32
> +#define MPFS_GPIO_EN_INT               3
> +#define MPFS_GPIO_EN_OUT_BUF           BIT(2)
> +#define MPFS_GPIO_EN_IN                        BIT(1)
> +#define MPFS_GPIO_EN_OUT               BIT(0)
> +#define MPFS_GPIO_DIR_MASK             GENMASK(2, 0)
> +
> +#define MPFS_GPIO_TYPE_INT_EDGE_BOTH   0x80
> +#define MPFS_GPIO_TYPE_INT_EDGE_NEG    0x60
> +#define MPFS_GPIO_TYPE_INT_EDGE_POS    0x40
> +#define MPFS_GPIO_TYPE_INT_LEVEL_LOW   0x20
> +#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH  0x00
> +#define MPFS_GPIO_TYPE_INT_MASK                GENMASK(7, 5)
> +#define MPFS_IRQ_REG                   0x80
> +#define MPFS_INP_REG                   0x84
> +#define MPFS_OUTP_REG                  0x88
> +
> +struct mpfs_gpio_chip {
> +       struct clk *clk;

After the initial clk_get() you never reference it again so there's no
need to store the address.

> +       struct regmap *regs;
> +       struct gpio_chip gc;
> +};
> +
> +static const struct regmap_config mpfs_gpio_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .val_bits =3D 32,
> +};
> +
> +static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int =
gpio_index)
> +{
> +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> +
> +       regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
> +                          MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
> +
> +       return 0;
> +}
> +
> +static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int=
 gpio_index, int value)
> +{
> +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> +
> +       regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
> +                          MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
> +       regmap_update_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index=
),
> +                          value << gpio_index);
> +
> +       return 0;
> +}
> +
> +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> +                                  unsigned int gpio_index)
> +{
> +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> +       unsigned int gpio_cfg;
> +
> +       regmap_read(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index), &gpio_cf=
g);
> +       if (gpio_cfg & MPFS_GPIO_EN_IN)
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int mpfs_gpio_get(struct gpio_chip *gc, unsigned int gpio_index)
> +{
> +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> +
> +       if (mpfs_gpio_get_direction(gc, gpio_index) =3D=3D GPIO_LINE_DIRE=
CTION_OUT)
> +               return regmap_test_bits(mpfs_gpio->regs, MPFS_OUTP_REG, B=
IT(gpio_index));
> +       else
> +               return regmap_test_bits(mpfs_gpio->regs, MPFS_INP_REG, BI=
T(gpio_index));
> +}
> +
> +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index,=
 int value)
> +{
> +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> +
> +       mpfs_gpio_get(gc, gpio_index);
> +
> +       regmap_update_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index=
),
> +                          value << gpio_index);
> +
> +       mpfs_gpio_get(gc, gpio_index);
> +}
> +
> +static int mpfs_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mpfs_gpio_chip *mpfs_gpio;
> +       struct clk *clk;
> +       void __iomem *base;
> +       int ret, ngpios;
> +
> +       mpfs_gpio =3D devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
> +       if (!mpfs_gpio)
> +               return -ENOMEM;
> +
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return dev_err_probe(dev, PTR_ERR(base), "failed to iorem=
ap memory resource\n");
> +
> +       mpfs_gpio->regs =3D devm_regmap_init_mmio(dev, base, &mpfs_gpio_r=
egmap_config);
> +       if (IS_ERR(mpfs_gpio->regs))
> +               return dev_err_probe(dev, PTR_ERR(mpfs_gpio->regs),
> +                                    "failed to initialise regmap\n");
> +
> +       clk =3D devm_clk_get_enabled(dev, NULL);
> +       if (IS_ERR(clk))
> +               return dev_err_probe(dev, PTR_ERR(clk), "failed to get an=
d enable clock\n");
> +
> +       mpfs_gpio->clk =3D clk;
> +
> +       ngpios =3D MPFS_MAX_NUM_GPIO;
> +       device_property_read_u32(dev, "ngpios", &ngpios);
> +       if (ngpios > MPFS_MAX_NUM_GPIO)
> +               ngpios =3D MPFS_MAX_NUM_GPIO;
> +
> +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction_input;
> +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direction_output;
> +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direction;
> +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> +       mpfs_gpio->gc.base =3D -1;
> +       mpfs_gpio->gc.ngpio =3D ngpios;

The "ngpios" property will be parsed by GPIO core so no need to set it.

> +       mpfs_gpio->gc.label =3D dev_name(dev);
> +       mpfs_gpio->gc.parent =3D dev;
> +       mpfs_gpio->gc.owner =3D THIS_MODULE;
> +
> +       ret =3D devm_gpiochip_add_data(dev, &mpfs_gpio->gc, mpfs_gpio);
> +       if (ret)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, mpfs_gpio);

There's no platform_get_drvdata() in the driver so you can drop this too.

Bart

> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mpfs_gpio_of_ids[] =3D {
> +       { .compatible =3D "microchip,mpfs-gpio", },
> +       { /* end of list */ }
> +};
> +
> +static struct platform_driver mpfs_gpio_driver =3D {
> +       .probe =3D mpfs_gpio_probe,
> +       .driver =3D {
> +               .name =3D "microchip,mpfs-gpio",
> +               .of_match_table =3D mpfs_gpio_of_ids,
> +       },
> +};
> +builtin_platform_driver(mpfs_gpio_driver);
> --
> 2.45.2
>

