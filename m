Return-Path: <linux-gpio+bounces-11926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 570519AE1B0
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 717851C211BB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18F91C07F1;
	Thu, 24 Oct 2024 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3TgNkOf1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D091BDABD
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729763839; cv=none; b=ciHbMYvhAMf8ZyN/Pht+vua5ojDVE8FFvdLF7sNBYWf0/EPhgflYz+ZB42iMmpGoT6VNIS5qKrKEe54WJD3OlrVcxqfrIRcoGsJlE1Eattrnl6PURzPlbv4YCrCi1XyCPxI7b/zEeRAGJhrq+aMMAioa2kHz6JkK9tWoVfaXrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729763839; c=relaxed/simple;
	bh=78kzJgrYsPW/po7zzZo5mbAfRBbBKeRQ+qnNEMF+HSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sA//iOkpiAqOSaoEdCjdBj/LNsFByhCI5DTGoSjhphbw6pdg7kwcXyYsaZqGzRlYNSYIjcHiAJDRqHl2EUPBpsFYivTAEWTerogid+enLvNCkqJuE/HJoMUa9h3CEa6l6/OjyXflhaSdEfjA/GhOi/ANXfYuZqPvRYmmVrvrJNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3TgNkOf1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f53973fdso594714e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729763835; x=1730368635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJNdOrL2RTdHE+/9JKNav4J8J+DET4BQE6bHWhH5GDY=;
        b=3TgNkOf1FQ4Efjqlz7XCLL63vINxaEKLzFpYsCdXHlGFcGhTIywVC86mDf7o1M0JGk
         G2DIimw1zpcN2p0Im1eHoIMpRM3nw2aTo3DMBGaPt+BE7hTjWbDRmjkMguPuEl8FkorZ
         ++wIIn650RbyazemLmH72wwKL7vlEWzVY0gXdSYuwQRnBnFgEpO1dfb7c2zMiD55YV+K
         jf0xfLDVLoEF+W6MV7EhQQYnpt1cBxf661DPyCvoB5W6C+kQnWSEdx+UMGdTPZcxt25B
         L9dyUBm0pEy+HhQcT2xWSVRCAMK2vnxbu01FWwzHsyk/dQYOX08XI1F/W4PrA4uMfkCY
         EHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729763835; x=1730368635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJNdOrL2RTdHE+/9JKNav4J8J+DET4BQE6bHWhH5GDY=;
        b=cfKwctPkR0q/YxJegnfaEYMgIM9dApdecFdwGYfJLnHUl/x+PJD96JJt8VnliIAB+v
         OJRo7tWVR3BCQWoVyMN+HK8hr3s/lMsGtsp3WCHQZmo20Vn6Jc886y7gyVzUDYqUhM4U
         Hy6ufMh/R3r5mCT7Ryf6Ygf3yHHKKmvrzLDn3cLg9UP2qsnjtCvFTOvg03O0w3fCbMUI
         i9kTqxPEahyJTiGlzLJOheoQSAqQXX6AU+MnrtA7CbLr1rxK+mM8TMwyn2ZnJqJAHpXS
         d8OS8GMkwIWmh7RsZwUZbwNal5h/d6DZyrKdh/Lu3S1eVdTi9WUlyYVRDgRU3lAyxB4M
         VKPw==
X-Gm-Message-State: AOJu0Yx9IZdfybs63JvjDPGy24NVRCVEc/5j4CP2AR0yS/MZKRyYjWkj
	ko7KX6noz6M8asDvNKRHpiuMem3WfWcaKFl4iU9TxjQ/WsAcqG9J606xSW0g/I1F/LgSRxsIVkL
	cq5nyE5E4osG3TNLX1ZG88R/ehtaWfllUsxqtBg==
X-Google-Smtp-Source: AGHT+IGkzVhlIZTSaU0PHeeITD9Jy5HUw0FMMg2Xs93zuvOQE6zgAQe5VoNOREGRl0c76bR+fyZjdY01viWuRPt9Iag=
X-Received: by 2002:a05:6512:23a9:b0:539:e453:d90c with SMTP id
 2adb3069b0e04-53b236c832amr636902e87.2.1729763834846; Thu, 24 Oct 2024
 02:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-tipping-browse-c0d582b16a47@spud> <20241024-dragster-research-0713e1733600@spud>
In-Reply-To: <20241024-dragster-research-0713e1733600@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 11:57:04 +0200
Message-ID: <CAMRc=Md7sqoXbn2tSu23PqjLRat_3dUe80x0QpCHyppEZLacsw@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, valentina.fernandezalanis@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 11:21=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
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
> v8:
> - drop interrupt support
> - replace regular mmio acesses with regmap (nice complexity reduction)
> - change mpfs_gpio_get() so that it can report non-zero when the line
>   direction is output.
> ---
>  drivers/gpio/Kconfig     |   7 ++
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-mpfs.c | 178 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 186 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mpfs.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index d93cd4f722b40..fab9c4f73f62b 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -549,6 +549,13 @@ config GPIO_PL061
>         help
>           Say yes here to support the PrimeCell PL061 GPIO device.
>
> +config GPIO_POLARFIRE_SOC
> +       bool "Microchip FPGA GPIO support"
> +       depends on OF_GPIO

You can drop this. Even if you were using symbols from
drivers/gpio/gpiolib-of.h, they are hidden behind stubs for !OF_GPIO.

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
> index 0000000000000..eaf65ddb6ad73
> --- /dev/null
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -0,0 +1,178 @@
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
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +#define MPFS_GPIO_CTRL(i)              (0x4 * (i))
> +#define MAX_NUM_GPIO                   32

Please use the MPFS prefix everywhere, otherwise it's not clear
whether the define comes from the driver or from GPIO core.

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
> +       ngpios =3D MAX_NUM_GPIO;
> +       device_property_read_u32(dev, "ngpios", &ngpios);
> +       if (ngpios > MAX_NUM_GPIO)
> +               ngpios =3D MAX_NUM_GPIO;
> +
> +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction_input;
> +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direction_output;
> +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direction;
> +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> +       mpfs_gpio->gc.base =3D -1;
> +       mpfs_gpio->gc.ngpio =3D ngpios;
> +       mpfs_gpio->gc.label =3D dev_name(dev);
> +       mpfs_gpio->gc.parent =3D dev;
> +       mpfs_gpio->gc.owner =3D THIS_MODULE;
> +
> +       ret =3D gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);

Use devm_gpiochip_add_data() and remove remove()?

> +       if (ret)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, mpfs_gpio);
> +
> +       return 0;
> +}
> +
> +static void mpfs_gpio_remove(struct platform_device *pdev)
> +{
> +       struct mpfs_gpio_chip *mpfs_gpio =3D platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&mpfs_gpio->gc);
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
> +       .remove =3D mpfs_gpio_remove,
> +};
> +builtin_platform_driver(mpfs_gpio_driver);
> --
> 2.45.2
>

Just a couple nits, otherwise it's short and sweet.

Bart

