Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF8E436E67
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 10:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbfFFIVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 04:21:14 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45300 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFIVN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 04:21:13 -0400
Received: by mail-ot1-f66.google.com with SMTP id n2so171701otl.12
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jun 2019 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tbdY8ylU7jD7922f17ovJcbpzHkWuwtr0QGWbw4R4oY=;
        b=E0RKVGHgPY2x6NCL4LdxopjKSxLTrApRYRboogkSOQOhoCKV2cS4gga5jOV3gzoD3F
         6RHn5DO3hVq5bFc5BHK6ngditKTVGWvHmtMC80y8L5rPyfrMxFgyqGcyqhtxABXtROjy
         jjVpFKy7hKmIIp/+4d0VwdCTK/7wApSRx3uxNReIgsooQitHKBz8hzAMRrwMaazO6Fvm
         NOJEgVBrsXVnJxuUEl2YozjIjJjSFp4KUGbaLbClOvtfyBDcV7h8f8MpJsN1BT3CqPSt
         /XOb6GJVw48laEMdnZlekve/YOrFhla8q9l5e4HfX06oQuNPgTt+0DgscA2ICQFm7v67
         APJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tbdY8ylU7jD7922f17ovJcbpzHkWuwtr0QGWbw4R4oY=;
        b=XQWJRjt9ehUxNaoyx7ak54bQ0BFqBQewMZnEwYHl1ePVdfY/Xp4RD3434ZtWGx3huX
         LblPi7VFrawul2gbIjJ+6oVnevLyi7R//1jQIeIQ5BT29CEsJShflt7rofR3lukmClru
         5Hev9nS3DdynQoPGJL0jQkV6qHqN3/qw/gFwQMza8wozVlb/vIWFq+KisYFyoPzbCkSC
         VNXkXWauMHRk52lL6Uzk1ZgmpJZ5gFJyPch4SOLa2Z1kpKUJKwSjzR01V/HPTLk3jaqX
         ANgGRxPIDoXbZrkMg2dt5onW2Tyrw4r+OUYYciyFHMp8/z+NiUMLk+ztH6KHlsrullcF
         afCA==
X-Gm-Message-State: APjAAAXhR7cTlBC6p1tmFF5NqCdmpmHjYFZdANIoOW/HoG8vFvz0K4Uf
        wxWUbMk9VgreNCcJTOiACNr/BX3vxz6sBtiFlRxdQA==
X-Google-Smtp-Source: APXvYqx3yHWzSHkq44QmsxaoFvUF0tb30xws6IMyKIhaH6pqTsRY5qyoxcS3C5HxHiI6ahE6xSe4egkxukU68XpvuoI=
X-Received: by 2002:a9d:760c:: with SMTP id k12mr2745412otl.194.1559809272910;
 Thu, 06 Jun 2019 01:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <1559776732-27636-1-git-send-email-hancock@sedsystems.ca>
In-Reply-To: <1559776732-27636-1-git-send-email-hancock@sedsystems.ca>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 6 Jun 2019 10:21:01 +0200
Message-ID: <CAMpxmJWL=NkqVHAuAV6p28=eBctCBmaMy0XY+F00XF_u1DkJQg@mail.gmail.com>
Subject: Re: [PATCH] gpio: xilinx: convert from OF GPIO to standard devm APIs
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

czw., 6 cze 2019 o 01:19 Robert Hancock <hancock@sedsystems.ca> napisa=C5=
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

Looks good overall, just two nits below.

>  drivers/gpio/Kconfig       |   1 -
>  drivers/gpio/gpio-xilinx.c | 105 ++++++++++++++++++++-------------------=
------
>  2 files changed, 47 insertions(+), 59 deletions(-)
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
> index 32944eb..c9563b27 100644
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
> @@ -340,25 +316,39 @@ static int xgpio_probe(struct platform_device *pdev=
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
> -
> -       chip->mmchip.save_regs =3D xgpio_save_regs;
> -
> -       /* Call the OF gpio helper to setup and register the GPIO device =
*/
> -       status =3D of_mm_gpiochip_add_data(np, &chip->mmchip, chip);
> -       if (status) {
> -               pr_err("%pOF: error in probe function with status %d\n",
> -                      np, status);
> -               return status;
> +       chip->gc.base =3D -1;
> +       chip->gc.ngpio =3D chip->gpio_width[0] + chip->gpio_width[1];
> +       chip->gc.parent =3D &pdev->dev;
> +       chip->gc.direction_input =3D xgpio_dir_in;
> +       chip->gc.direction_output =3D xgpio_dir_out;
> +       chip->gc.get =3D xgpio_get;
> +       chip->gc.set =3D xgpio_set;
> +       chip->gc.set_multiple =3D xgpio_set_multiple;
> +
> +       chip->gc.label =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOF",=
 np);

label =3D dev_name(&pdev->dev) would be much more generic and have the
same effect on DT systems.

> +       if (!chip->gc.label) {
> +               status =3D -ENOMEM;
> +               goto probe_error;
> +       }
> +
> +       chip->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(chip->regs)) {
> +               status =3D PTR_ERR(chip->regs);
> +               goto probe_error;
>         }
>
> +       xgpio_save_regs(chip);
> +
> +       status =3D devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
> +       if (status)
> +               goto probe_error;
> +
>         return 0;
> +
> +probe_error:
> +       pr_err("%pOF: error in probe function with status %d\n",
> +              np, status);

If you're dealing with platform devices then you should use dev_err()
but here I'd drop it altogether as the driver core will print a
similar message. If anything, you should have specific error messages
under each function that fails.

Bart

> +       return status;
>  }
>
>  static const struct of_device_id xgpio_of_match[] =3D {
> @@ -370,7 +360,6 @@ static int xgpio_probe(struct platform_device *pdev)
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
