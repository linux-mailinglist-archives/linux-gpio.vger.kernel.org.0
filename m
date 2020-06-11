Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6873F1F63B7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 10:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgFKIfo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 04:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgFKIfn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jun 2020 04:35:43 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341FFC08C5C1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 01:35:43 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id n141so4855412qke.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DvyWv8zI1tCNOmOhDH9gqHVmEeBnf7bP2kS6STbSdMc=;
        b=wLUMvO0Z7LK1/8yVvwhJOFQxva5EDrX/CWEOg9r468mPT6aPs4b4a+qY4M6ia6vgE7
         C6QK7QHndCAnJLLGrGyaOx4lu02MYqvTnf8ijFGm3essFKN2MbCyKAsBfy5b1hgooJpp
         ai30JnSwYB+vxrNFbAVlXlf2Bpw7GJ4Uw0GIX4CxPhAm3hi6LwTXoUo4lkaHjaqE1VbQ
         3ONkof49g57sX8wnE5j1QusdoCrsP3G6wDbnpq8biRaBUkLUnNNPzfUF4P9xfUKgcO+A
         jZvpCkODIHTmMAGIRnlu02ot85BPJqMfPSyAbqqQEQmbarqFS0TDo4FtRoqYWY56r+zN
         ELZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DvyWv8zI1tCNOmOhDH9gqHVmEeBnf7bP2kS6STbSdMc=;
        b=iOLNakHoKJB4OcXGzOOnvbDjqD+Hh/IgA8rTINlK2KJH35IlV6xGNUJyzhCbT9ygwZ
         +LcGRN5VrHtRFitbM9u76IIXwWL0T7l7JS/IKQPaEERwaFsmyVcMxy1aGEKweLlRHwNL
         JICaUnS1GHKso09mSJ1DwQVMx33oRU1tKtLOEI6IhoYsTCKfPYTH7iIqVRbcDOUY0b4m
         90VADND9fLKy3ZnexiJdf4nnPNNNo8XGFMCB7yKKG+koHdViAmPStuDDKj/rgzUw0gIl
         MHg4wagzlS5hXQ2Kx2v7DzsbOdXttNSeX5LLGPU1cJsoHlyER/S+ZnsSMKAxBBTK1KvY
         uHwQ==
X-Gm-Message-State: AOAM533MVHMblDebbH+HZ8zcVTvJ+T73BskME8oWfcj8vuCsEly9CfzW
        F8b+u/HeZde3mVDdAQ59xxVuWEK3IZvjF43v0w76Nzl9
X-Google-Smtp-Source: ABdhPJwS1EfUl7nStNbyXZclW0+o6Uf4aV8Yr3UwYH5ddHX5pwVR3Cj6FaI5MLgsQmh6f32nYDryhm4a06FuhOYT17c=
X-Received: by 2002:a37:a643:: with SMTP id p64mr6671057qke.21.1591864542103;
 Thu, 11 Jun 2020 01:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200605235652.2680545-1-hancock@sedsystems.ca>
In-Reply-To: <20200605235652.2680545-1-hancock@sedsystems.ca>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 11 Jun 2020 10:35:31 +0200
Message-ID: <CAMpxmJWyfVrw_o_YRwyZZoDaNFZ74xm8_Cv28tEu9SbRD2u4Ow@mail.gmail.com>
Subject: Re: [PATCH] gpio: xilinx: Add interrupt support
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 6 cze 2020 o 01:57 Robert Hancock <hancock@sedsystems.ca> napisa=C5=
=82(a):
>
> Adds interrupt support to the Xilinx GPIO driver so that rising and
> falling edge line events can be supported. Since interrupt support is
> an optional feature in the Xilinx IP, the driver continues to support
> devices which have no interrupt provided.
>
> These changes are based on a patch in the Xilinx Linux Git tree,
> "gpio: xilinx: Add irq support to the driver" from Srinivas Neeli, but
> include a number of fixes and improvements such as supporting both
> rising and falling edge events.
>
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  drivers/gpio/Kconfig       |   1 +
>  drivers/gpio/gpio-xilinx.c | 247 ++++++++++++++++++++++++++++++++++---
>  2 files changed, 233 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index bcacd9c74aa80..5f91e7829fb7d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -652,6 +652,7 @@ config GPIO_XGENE_SB
>
>  config GPIO_XILINX
>         tristate "Xilinx GPIO support"
> +       select GPIOLIB_IRQCHIP
>         help
>           Say yes here to support the Xilinx FPGA GPIO device
>
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 67f9f82e0db0e..42ae12801d0bf 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -14,6 +14,9 @@
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
>
>  /* Register Offset Definitions */
>  #define XGPIO_DATA_OFFSET   (0x0)      /* Data register  */
> @@ -21,6 +24,11 @@
>
>  #define XGPIO_CHANNEL_OFFSET   0x8
>
> +#define XGPIO_GIER_OFFSET      0x11c /* Global Interrupt Enable */
> +#define XGPIO_GIER_IE          BIT(31)
> +#define XGPIO_IPISR_OFFSET     0x120 /* IP Interrupt Status */
> +#define XGPIO_IPIER_OFFSET     0x128 /* IP Interrupt Enable */
> +
>  /* Read/Write access to the GPIO registers */
>  #if defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86)
>  # define xgpio_readreg(offset)         readl(offset)
> @@ -35,17 +43,27 @@
>   * @gc: GPIO chip
>   * @regs: register block
>   * @gpio_width: GPIO width for every channel
> - * @gpio_state: GPIO state shadow register
> + * @gpio_state: GPIO write state shadow register
> + * @gpio_last_irq_read: GPIO read state register from last interrupt
>   * @gpio_dir: GPIO direction shadow register
>   * @gpio_lock: Lock used for synchronization
> + * @irq: IRQ used by GPIO device
> + * @irq_enable: GPIO irq enable/disable bitfield
> + * @irq_rising_edge: GPIO irq rising edge enable/disable bitfield
> + * @irq_falling_edge: GPIO irq rising edge enable/disable bitfield
>   */
>  struct xgpio_instance {
>         struct gpio_chip gc;
>         void __iomem *regs;
>         unsigned int gpio_width[2];
>         u32 gpio_state[2];
> +       u32 gpio_last_irq_read[2];
>         u32 gpio_dir[2];
> -       spinlock_t gpio_lock[2];
> +       spinlock_t gpio_lock;
> +       int irq;
> +       u32 irq_enable[2];
> +       u32 irq_rising_edge[2];
> +       u32 irq_falling_edge[2];

I don't know this driver very well. Could you explain why the two
instances of these fields and why are you removing the second lock?

[snip!]

>         chip->gc.base =3D -1;
> @@ -336,6 +530,29 @@ static int xgpio_probe(struct platform_device *pdev)
>
>         xgpio_save_regs(chip);
>
> +       chip->irq =3D platform_get_irq(pdev, 0);

Why not simply: platform_get_irq_optional()?

> +       if (chip->irq <=3D 0) {
> +               dev_info(&pdev->dev, "GPIO IRQ not set\n");
> +       } else {
> +               u32 temp;
> +
> +               /* Disable per-channel interrupts */
> +               xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, 0);
> +               /* Clear any existing per-channel interrupts */
> +               temp =3D xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
> +               xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, temp);
> +               /* Enable global interrupts */
> +               xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET, XGPIO_GIER=
_IE);
> +
> +               chip->gc.irq.chip =3D &xgpio_irqchip;
> +               chip->gc.irq.handler =3D handle_bad_irq;
> +               chip->gc.irq.default_type =3D IRQ_TYPE_NONE;
> +               chip->gc.irq.parent_handler =3D xgpio_irqhandler;
> +               chip->gc.irq.parent_handler_data =3D chip;
> +               chip->gc.irq.parents =3D &chip->irq;
> +               chip->gc.irq.num_parents =3D 1;
> +       }
> +
>         status =3D devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
>         if (status) {
>                 dev_err(&pdev->dev, "failed to add GPIO chip\n");
> --
> 2.26.2
>

Bart
