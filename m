Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E3645DABC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 14:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355027AbhKYNLx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 08:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352103AbhKYNJv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 08:09:51 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B172C0613BF
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 04:59:35 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y12so25199201eda.12
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 04:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/ASJwAxDITu7nqTWrfRX5HWNM3K8xnJOv/ZAG/hwZig=;
        b=pb9AlHlxkKMnM69lpU58JjHHRfsjYK4OhPtWFuxyFJpSP6Hhd3CuDUBYt5/V+YePCW
         owitBpbi1eJatC2J5Q44LK5AYPmQoGqQqONXBgNAFge/IAUnd4LNMsGWdW86ohAEJRHJ
         oDQ8NLJzmzErfAeTLChBfgW2BH5/0XoXMm2J1kZqMjnypJ7lc6nOAiRuxwSWYMZmlfFq
         b3mn0W7TA8DKAx7LcYjiGFGpLzOZf6RFmoGBzL632ZUFkUYHphz5zEc3bB9N4/QIN+sR
         FveP6Q5gWyYV5Jk/t3qo3d9JcPbgHMxDOCMi4FXWMT+zrvjGMIyq7N5vubkMOvh/ztDf
         AeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ASJwAxDITu7nqTWrfRX5HWNM3K8xnJOv/ZAG/hwZig=;
        b=Z7MRvuoaqD+bnXqltlnSfc5uqHnwwre0MeajrSuoGn9J32FWcr4eQZuJyQrf3EMtkO
         F2VAv2d8js9Tty2LxBNXfd75I5PmsoouKRlMGYTmfDn6VMVzFAb3kP7kXcuZ45LnZBOi
         6rcvCMDVDsFoaigpTeU02f3saDcjFQdkxR+qanb2EPLC/hFmqDfMIu3LwG7Lc75omoeL
         8NkB9vRRgBgdO6cffGMkMAQNGmMYfvr+cAi8W5p8vLwd21Fq0d9o/gN7cjG9ubXqB/zq
         A7z51mnsx7Q0elz4xcGGop2lnRAvM5JgVrb8JOnDgvsKPK8ZU/484aYhOGd+O36Eo7on
         u77Q==
X-Gm-Message-State: AOAM531LyNC0CI59Wbg+EqOKXW2aZxkbma0CQyaIN27AisvRR7KtuPVB
        Geg8UID7pzi+ZA5XTmHuLPnmffd/tVMkLKCOkOPJ8w==
X-Google-Smtp-Source: ABdhPJwDSdawmzVRarjLwPOrDQ1z1pQS+m3pBwHkypA78rSG3ukdold/w1Gnp7DKOFNzo1lf9RK3fpUa7ixLTf1wF98=
X-Received: by 2002:a05:6402:50d4:: with SMTP id h20mr38591134edb.52.1637845173467;
 Thu, 25 Nov 2021 04:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20211125110738.41028-1-nbd@nbd.name> <20211125110738.41028-13-nbd@nbd.name>
In-Reply-To: <20211125110738.41028-13-nbd@nbd.name>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 25 Nov 2021 13:59:22 +0100
Message-ID: <CAMRc=MfEO-kvOq2aELO6LMSTTHykG8DxdJOf_zUdJSaz8tB8wA@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] gpio: Add support for Airoha EN7523 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Crispin <john@phrozen.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 12:24 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for an single bank.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  arch/arm/boot/dts/en7523-evb.dts |   8 ++
>  arch/arm/boot/dts/en7523.dtsi    |  21 +++++
>  drivers/gpio/Kconfig             |   9 ++
>  drivers/gpio/Makefile            |   1 +
>  drivers/gpio/gpio-en7523.c       | 136 +++++++++++++++++++++++++++++++
>  5 files changed, 175 insertions(+)
>  create mode 100644 drivers/gpio/gpio-en7523.c

These changes should be split into two separate patches. Other than
that the driver looks good.

>
> diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
> index af1a8dd40a41..4082bf61bd79 100644
> --- a/arch/arm/boot/dts/en7523-evb.dts
> +++ b/arch/arm/boot/dts/en7523-evb.dts
> @@ -37,3 +37,11 @@ &pcie0 {
>  &pcie1 {
>         status = "okay";
>  };
> +
> +&gpio0 {
> +       status = "okay";
> +};
> +
> +&gpio1 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
> index d9bdb51614b5..6e0275984b69 100644
> --- a/arch/arm/boot/dts/en7523.dtsi
> +++ b/arch/arm/boot/dts/en7523.dtsi
> @@ -3,6 +3,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/en7523-clk.h>
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         interrupt-parent = <&gic>;
> @@ -120,6 +121,26 @@ uart1: serial@1fbf0000 {
>                 status = "okay";
>         };
>
> +       gpio0: gpio@1fbf0200 {
> +               compatible = "airoha,en7523-gpio";
> +               reg = <0x1fbf0204 0x4>,
> +                     <0x1fbf0200 0x4>,
> +                     <0x1fbf0220 0x4>,
> +                     <0x1fbf0214 0x4>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       gpio1: gpio@1fbf0270 {
> +               compatible = "airoha,en7523-gpio";
> +               reg = <0x1fbf0270 0x4>,
> +                     <0x1fbf0260 0x4>,
> +                     <0x1fbf0264 0x4>,
> +                     <0x1fbf0278 0x4>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
>         pcie: pcie@1a140000 {
>                 compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
>                 device_type = "pci";
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 072ed610f9c6..e4a34272504f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -247,6 +247,15 @@ config GPIO_EM
>         help
>           Say yes here to support GPIO on Renesas Emma Mobile SoCs.
>
> +config GPIO_EN7523
> +       tristate "Airoha GPIO support"
> +       depends on ARCH_AIROHA
> +       default ARCH_AIROHA
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say yes here to support the GPIO controller on Airoha EN7523.
> +
>  config GPIO_EP93XX
>         def_bool y
>         depends on ARCH_EP93XX
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 71ee9fc2ff83..d2269ee0948e 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_GPIO_DLN2)                       += gpio-dln2.o
>  obj-$(CONFIG_GPIO_DWAPB)               += gpio-dwapb.o
>  obj-$(CONFIG_GPIO_EIC_SPRD)            += gpio-eic-sprd.o
>  obj-$(CONFIG_GPIO_EM)                  += gpio-em.o
> +obj-$(CONFIG_GPIO_EN7523)              += gpio-en7523.o
>  obj-$(CONFIG_GPIO_EP93XX)              += gpio-ep93xx.o
>  obj-$(CONFIG_GPIO_EXAR)                        += gpio-exar.o
>  obj-$(CONFIG_GPIO_F7188X)              += gpio-f7188x.o
> diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
> new file mode 100644
> index 000000000000..3ae0d9831d83
> --- /dev/null
> +++ b/drivers/gpio/gpio-en7523.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#define AIROHA_GPIO_MAX                32
> +
> +/**
> + * airoha_gpio_ctrl - Airoha GPIO driver data
> + *
> + * @gc: Associated gpio_chip instance.
> + * @data: The data register.
> + * @dir0: The direction register for the lower 16 pins.
> + * @dir1: The direction register for the lower 16 pins.
> + * @output: The output enable register.
> + */
> +struct airoha_gpio_ctrl {
> +       struct gpio_chip gc;
> +       void __iomem *data;
> +       void __iomem *dir[2];
> +       void __iomem *output;
> +};
> +
> +static struct airoha_gpio_ctrl *gc_to_ctrl(struct gpio_chip *gc)
> +{
> +       return container_of(gc, struct airoha_gpio_ctrl, gc);
> +}
> +
> +static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
> +                         int val, int out)
> +{
> +       struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
> +       u32 dir = ioread32(ctrl->dir[gpio / 16]);
> +       u32 output = ioread32(ctrl->output);
> +       u32 mask = BIT((gpio % 16) * 2);
> +
> +       if (out) {
> +               dir |= mask;
> +               output |= BIT(gpio);
> +       } else {
> +               dir &= ~mask;
> +               output &= ~BIT(gpio);
> +       }
> +
> +       iowrite32(dir, ctrl->dir[gpio / 16]);
> +       iowrite32(output, ctrl->output);
> +
> +       if (out)
> +               gc->set(gc, gpio, val);
> +
> +       return 0;
> +}

No locking needed here? gpio-mmio uses bgpio_lock from struct
gpio_chip, maybe you should take it here too?

Bart

> +
> +static int airoha_dir_out(struct gpio_chip *gc, unsigned int gpio,
> +                         int val)
> +{
> +       return airoha_dir_set(gc, gpio, val, 1);
> +}
> +
> +static int airoha_dir_in(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       return airoha_dir_set(gc, gpio, 0, 0);
> +}
> +
> +static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
> +       u32 dir = ioread32(ctrl->dir[gpio / 16]);
> +       u32 mask = BIT((gpio % 16) * 2);
> +
> +       return dir & mask;
> +}
> +
> +static const struct of_device_id airoha_gpio_of_match[] = {
> +       { .compatible = "airoha,en7523-gpio" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, airoha_gpio_of_match);
> +
> +static int airoha_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct airoha_gpio_ctrl *ctrl;
> +       int err;
> +
> +       ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->data = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(ctrl->data))
> +               return PTR_ERR(ctrl->data);
> +
> +       ctrl->dir[0] = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(ctrl->dir[0]))
> +               return PTR_ERR(ctrl->dir[0]);
> +
> +       ctrl->dir[1] = devm_platform_ioremap_resource(pdev, 2);
> +       if (IS_ERR(ctrl->dir[1]))
> +               return PTR_ERR(ctrl->dir[1]);
> +
> +       ctrl->output = devm_platform_ioremap_resource(pdev, 3);
> +       if (IS_ERR(ctrl->output))
> +               return PTR_ERR(ctrl->output);
> +
> +       err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
> +                        NULL, NULL, NULL, 0);
> +       if (err) {
> +               dev_err(dev, "unable to init generic GPIO");
> +               return err;
> +       }
> +
> +       ctrl->gc.ngpio = AIROHA_GPIO_MAX;
> +       ctrl->gc.owner = THIS_MODULE;
> +       ctrl->gc.direction_output = airoha_dir_out;
> +       ctrl->gc.direction_input = airoha_dir_in;
> +       ctrl->gc.get_direction = airoha_get_dir;
> +
> +       return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
> +}
> +
> +static struct platform_driver airoha_gpio_driver = {
> +       .driver = {
> +               .name = "airoha-gpio",
> +               .of_match_table = airoha_gpio_of_match,
> +       },
> +       .probe = airoha_gpio_probe,
> +};
> +module_platform_driver(airoha_gpio_driver);
> +
> +MODULE_DESCRIPTION("Airoha GPIO support");
> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.30.1
>
