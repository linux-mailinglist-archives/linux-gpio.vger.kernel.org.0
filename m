Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D8938605
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 10:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfFGIOb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 04:14:31 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38845 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfFGIOb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 04:14:31 -0400
Received: by mail-ot1-f65.google.com with SMTP id d17so1082621oth.5
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MRpwAHQh+MwHffpMSCKSRAScWL3esFEfBlmroZ9/svY=;
        b=pAf8eJfFs3QzH0dXJE+llAnc5Ign4i6ovlziFcErUqvY7z7JhNP8BKNQHqwJx8qMzF
         O6N3DbSkdMLEjw4ZVFGM2UELGqaGqGGVyC9+K6Kee0un44OeviPG6PY9qY6Eb+np1SSa
         muzlx1wswxQ/BZ/7XQtLWnJ8dGVSBx5H38250T1u3dUdjaSC6GE+RMCt3hSsowfRMedK
         /IPhyvnU7qd1HxYFYRtRMenmSxIQBV7hp7rpplWYi2Iyad2i6mUp93hhVurqJOaOZ3eA
         USJ0xYnjN7cDxJqFZShtT2lMqmQpIbyfyQoBTVSveb4ToP6SuSESV0wmRl2Xoh/kZyUx
         R/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MRpwAHQh+MwHffpMSCKSRAScWL3esFEfBlmroZ9/svY=;
        b=EI1GuaEI3wK+GqwocLUgHgF6EyJJkLd73BgDpIpkhBRzb4hSqkqYBzc/PkslKZqkSN
         ffpbaQkYMIOHKxuOK1DNegLBIRM9nteyA5c06Bo+cwSO6tJkHEBNIOjfbrSkVBOeq8H3
         7WKXMHEiywYQnZi7Po7d2Wva8ZBVc3hDR6enbjmSlchom4jClw1zNC7zxId6pa+4t+Y5
         NkyfM4Ol7m/nEI/26Re9Zwk3ftp+i4UvZqPoHf1ykwtS4X2xlAa4YDiCER+/HfLRGEtt
         3z6O4PjluyCcFvqJO6oZupJvBzK3CxeKnr5c50JZ4uQGqSdqu22pJ4l6rvK0Xh2k39RQ
         kMZQ==
X-Gm-Message-State: APjAAAWqLGzigpe0+3YLFkaG0rAbhq7oUDy/b0Zlx4hyBECZHZ4g5zFe
        UCIIXXUCUnVCi0mJi/5yghLOVHOx7r6qPkKnU+lHCffq
X-Google-Smtp-Source: APXvYqwK1hRkpDwQZPHWlFxXMr2SbX+vJKyamJN/6lcIgNa+WP6njiaSHGeKF84r+/roUQ7T7TCzMDyRMszLHZWiDv0=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr18552975otc.250.1559895270294;
 Fri, 07 Jun 2019 01:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <1559838505-7388-1-git-send-email-hancock@sedsystems.ca>
In-Reply-To: <1559838505-7388-1-git-send-email-hancock@sedsystems.ca>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 7 Jun 2019 10:14:19 +0200
Message-ID: <CAMpxmJURc6YkBUCv63MGoko5AERCfL1-HM7n2DYX9sXkZDHOYQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: xilinx: convert from OF GPIO to standard devm APIs
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 6 cze 2019 o 18:28 Robert Hancock <hancock@sedsystems.ca> napisa=C5=
=82(a):
>
> This driver was using the OF GPIO helper API, but barely used any of its
> features and it cost more code than it saved. Also, the OF GPIO code is
> now deprecated. Convert it to use a more standard setup and use devm
> APIs for initialization to avoid the need for a remove function.
>
> Our rationale for this change is that we are using the Xilinx GPIO with
> resources injected using the MFD core rather than on the device tree
> itself. Using platform rather than OF-specific resources allows this to
> work for free.
>
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>
> Changes from v1:
> -use dev_name() to set GPIO chip label
> -use specific dev_err() for each probe error location rather than
>  a generic pr_err() message
>
>  drivers/gpio/Kconfig       |  1 -
>  drivers/gpio/gpio-xilinx.c | 92 +++++++++++++++++++---------------------=
------
>  2 files changed, 38 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index acd40eb..66f1f13 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -602,7 +602,6 @@ config GPIO_XGENE_SB
>
>  config GPIO_XILINX
>         tristate "Xilinx GPIO support"
> -       depends on OF_GPIO
>         help
>           Say yes here to support the Xilinx FPGA GPIO device
>
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 32944eb..1c0ed1d 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -11,7 +11,6 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_platform.h>
> -#include <linux/of_gpio.h>
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> @@ -33,14 +32,16 @@
>
>  /**
>   * struct xgpio_instance - Stores information about GPIO device
> - * @mmchip: OF GPIO chip for memory mapped banks
> + * @gc: GPIO chip
> + * @regs: register block
>   * @gpio_width: GPIO width for every channel
>   * @gpio_state: GPIO state shadow register
>   * @gpio_dir: GPIO direction shadow register
>   * @gpio_lock: Lock used for synchronization
>   */
>  struct xgpio_instance {
> -       struct of_mm_gpio_chip mmchip;
> +       struct gpio_chip gc;
> +       void __iomem *regs;
>         unsigned int gpio_width[2];
>         u32 gpio_state[2];
>         u32 gpio_dir[2];
> @@ -84,11 +85,10 @@ static inline int xgpio_offset(struct xgpio_instance =
*chip, int gpio)
>   */
>  static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
>  {
> -       struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct xgpio_instance *chip =3D gpiochip_get_data(gc);
>         u32 val;
>
> -       val =3D xgpio_readreg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +       val =3D xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
>                             xgpio_regoffset(chip, gpio));
>
>         return !!(val & BIT(xgpio_offset(chip, gpio)));
> @@ -106,7 +106,6 @@ static int xgpio_get(struct gpio_chip *gc, unsigned i=
nt gpio)
>  static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>         unsigned long flags;
> -       struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct xgpio_instance *chip =3D gpiochip_get_data(gc);
>         int index =3D  xgpio_index(chip, gpio);
>         int offset =3D  xgpio_offset(chip, gpio);
> @@ -119,7 +118,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned =
int gpio, int val)
>         else
>                 chip->gpio_state[index] &=3D ~BIT(offset);
>
> -       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +       xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>                        xgpio_regoffset(chip, gpio), chip->gpio_state[inde=
x]);
>
>         spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -138,7 +137,6 @@ static void xgpio_set_multiple(struct gpio_chip *gc, =
unsigned long *mask,
>                                unsigned long *bits)
>  {
>         unsigned long flags;
> -       struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct xgpio_instance *chip =3D gpiochip_get_data(gc);
>         int index =3D xgpio_index(chip, 0);
>         int offset, i;
> @@ -150,7 +148,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, =
unsigned long *mask,
>                 if (*mask =3D=3D 0)
>                         break;
>                 if (index !=3D  xgpio_index(chip, i)) {
> -                       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +                       xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>                                        xgpio_regoffset(chip, i),
>                                        chip->gpio_state[index]);
>                         spin_unlock_irqrestore(&chip->gpio_lock[index], f=
lags);
> @@ -166,7 +164,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, =
unsigned long *mask,
>                 }
>         }
>
> -       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +       xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>                        xgpio_regoffset(chip, i), chip->gpio_state[index])=
;
>
>         spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -184,7 +182,6 @@ static void xgpio_set_multiple(struct gpio_chip *gc, =
unsigned long *mask,
>  static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  {
>         unsigned long flags;
> -       struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct xgpio_instance *chip =3D gpiochip_get_data(gc);
>         int index =3D  xgpio_index(chip, gpio);
>         int offset =3D  xgpio_offset(chip, gpio);
> @@ -193,7 +190,7 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigne=
d int gpio)
>
>         /* Set the GPIO bit in shadow register and set direction as input=
 */
>         chip->gpio_dir[index] |=3D BIT(offset);
> -       xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET +
> +       xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
>                        xgpio_regoffset(chip, gpio), chip->gpio_dir[index]=
);
>
>         spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -216,7 +213,6 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigne=
d int gpio)
>  static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int va=
l)
>  {
>         unsigned long flags;
> -       struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct xgpio_instance *chip =3D gpiochip_get_data(gc);
>         int index =3D  xgpio_index(chip, gpio);
>         int offset =3D  xgpio_offset(chip, gpio);
> @@ -228,12 +224,12 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsi=
gned int gpio, int val)
>                 chip->gpio_state[index] |=3D BIT(offset);
>         else
>                 chip->gpio_state[index] &=3D ~BIT(offset);
> -       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
> +       xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
>                         xgpio_regoffset(chip, gpio), chip->gpio_state[ind=
ex]);
>
>         /* Clear the GPIO bit in shadow register and set direction as out=
put */
>         chip->gpio_dir[index] &=3D ~BIT(offset);
> -       xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET +
> +       xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
>                         xgpio_regoffset(chip, gpio), chip->gpio_dir[index=
]);
>
>         spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
> @@ -243,43 +239,23 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsi=
gned int gpio, int val)
>
>  /**
>   * xgpio_save_regs - Set initial values of GPIO pins
> - * @mm_gc: Pointer to memory mapped GPIO chip structure
> + * @chip: Pointer to GPIO instance
>   */
> -static void xgpio_save_regs(struct of_mm_gpio_chip *mm_gc)
> +static void xgpio_save_regs(struct xgpio_instance *chip)
>  {
> -       struct xgpio_instance *chip =3D
> -               container_of(mm_gc, struct xgpio_instance, mmchip);
> -
> -       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET, chip->gpio_state[=
0]);
> -       xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0])=
;
> +       xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET,  chip->gpio_state[=
0]);
> +       xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
>
>         if (!chip->gpio_width[1])
>                 return;
>
> -       xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OF=
FSET,
> +       xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFF=
SET,
>                        chip->gpio_state[1]);
> -       xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFF=
SET,
> +       xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFS=
ET,
>                        chip->gpio_dir[1]);
>  }
>
>  /**
> - * xgpio_remove - Remove method for the GPIO device.
> - * @pdev: pointer to the platform device
> - *
> - * This function remove gpiochips and frees all the allocated resources.
> - *
> - * Return: 0 always
> - */
> -static int xgpio_remove(struct platform_device *pdev)
> -{
> -       struct xgpio_instance *chip =3D platform_get_drvdata(pdev);
> -
> -       of_mm_gpiochip_remove(&chip->mmchip);
> -
> -       return 0;
> -}
> -
> -/**
>   * xgpio_of_probe - Probe method for the GPIO device.
>   * @pdev: pointer to the platform device
>   *
> @@ -340,21 +316,30 @@ static int xgpio_probe(struct platform_device *pdev=
)
>                 spin_lock_init(&chip->gpio_lock[1]);
>         }
>
> -       chip->mmchip.gc.ngpio =3D chip->gpio_width[0] + chip->gpio_width[=
1];
> -       chip->mmchip.gc.parent =3D &pdev->dev;
> -       chip->mmchip.gc.direction_input =3D xgpio_dir_in;
> -       chip->mmchip.gc.direction_output =3D xgpio_dir_out;
> -       chip->mmchip.gc.get =3D xgpio_get;
> -       chip->mmchip.gc.set =3D xgpio_set;
> -       chip->mmchip.gc.set_multiple =3D xgpio_set_multiple;
> +       chip->gc.base =3D -1;
> +       chip->gc.ngpio =3D chip->gpio_width[0] + chip->gpio_width[1];
> +       chip->gc.parent =3D &pdev->dev;
> +       chip->gc.direction_input =3D xgpio_dir_in;
> +       chip->gc.direction_output =3D xgpio_dir_out;
> +       chip->gc.get =3D xgpio_get;
> +       chip->gc.set =3D xgpio_set;
> +       chip->gc.set_multiple =3D xgpio_set_multiple;
> +
> +       chip->gc.label =3D dev_name(&pdev->dev);
> +
> +       chip->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(chip->regs)) {
> +               status =3D PTR_ERR(chip->regs);
> +               dev_err(&pdev->dev, "failed to ioremap memory resource: %=
d\n",
> +                       status);
> +               return status;

One more nit: just drop the status assignment here and use
PTR_ERR(chip->regs) directly. You don't need to print the error code
in the error message - it will be printed by the core driver framework
after we return an error code from probe().

Bart

> +       }
>
> -       chip->mmchip.save_regs =3D xgpio_save_regs;
> +       xgpio_save_regs(chip);
>
> -       /* Call the OF gpio helper to setup and register the GPIO device =
*/
> -       status =3D of_mm_gpiochip_add_data(np, &chip->mmchip, chip);
> +       status =3D devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
>         if (status) {
> -               pr_err("%pOF: error in probe function with status %d\n",
> -                      np, status);
> +               dev_err(&pdev->dev, "failed to add GPIO chip: %d\n", stat=
us);
>                 return status;
>         }
>
> @@ -370,7 +355,6 @@ static int xgpio_probe(struct platform_device *pdev)
>
>  static struct platform_driver xgpio_plat_driver =3D {
>         .probe          =3D xgpio_probe,
> -       .remove         =3D xgpio_remove,
>         .driver         =3D {
>                         .name =3D "gpio-xilinx",
>                         .of_match_table =3D xgpio_of_match,
> --
> 1.8.3.1
>
