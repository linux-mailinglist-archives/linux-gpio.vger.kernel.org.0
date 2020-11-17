Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382EF2B5D0A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 11:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgKQKim (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 05:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgKQKil (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 05:38:41 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06C8C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 02:38:41 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id m9so6247803pgb.4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 02:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fCCk4dVDRtyg5Yg69J8DhQxTzc78Ar5F7B+bDF1gSdw=;
        b=egwmhE8z1lKPPj4mrIl5XYH58reM0JL9CvFcM+aRCH170ZixwITrHDnZG512RXElIe
         juZrbRjElJYTMwyhFm4fmy9ozkwZdwswO2yUo/8t7EvoIiY878sF/wbk778/ktG9eZQg
         GLVURA0mjlmg7TAOWIeC/xFniGjK854vwfmAHkGD7IVuE6vqMI0AtBVjRGONMSgIJ4ht
         PMlFFDCTK2TpFXNMuRRRrbuBfnc8I1fgKUTGKX5NHMG6m8MAoq6uwWm0dZwYtjK0SWBf
         hat9QMbu8GHVaAPoKHhDkykAr7tTiURqFJk8F451ALtsUg3TLvDk2r6v0MwFcFYuQbj3
         baOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fCCk4dVDRtyg5Yg69J8DhQxTzc78Ar5F7B+bDF1gSdw=;
        b=C/lz0mJuPTDESl0eVC0mN2cJ48KMkCSz3QkBHmZcXXT1g5RpG+RPR5PG7c8poPdXJj
         D4QyPYFylqhEyoJGSYsFoNc1EE1HQy6/F/P59WEe7YGHETCkMbL+LSRP/Wkj1TJEK8AT
         9aZ2auBFXTYzGbFAZb6XxHPCFRq90x5p+Zm/wyPVthTYeLHCXGHWWI4HaOCKaUqdqleV
         O/fAHcNG7QBle4Hx61cQdFskMYQtDEjy1nCL2XDnycJ4aTAXrMe7ird5W3dFIkwoS4FV
         9N4qiKZMF3HQ5zAPgYIY8vLHB5KxjljKifl/mNdApylyj5whW+H9/QRYdsEvMjcL7QVg
         5iIQ==
X-Gm-Message-State: AOAM533Q0Z3mew5QSy5e5pJhdqdcrOt0lCMaABYXQ2UC9N/rnGgxzpA8
        sUQ+LTanj+kMYW2T69mNq6fI8t0t/ig1zzUrseI=
X-Google-Smtp-Source: ABdhPJx+LiOrDKGPONDANWCmxQW4hR8Clh6G5gtiMgR2ZUK31m0sytuaD3DG6Ht527j148pCkszfuYLjVEFbn9zS8Is=
X-Received: by 2002:aa7:8c4f:0:b029:18b:f361:4aa3 with SMTP id
 e15-20020aa78c4f0000b029018bf3614aa3mr924759pfd.73.1605609521366; Tue, 17 Nov
 2020 02:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20201116191311.12477-1-festevam@gmail.com>
In-Reply-To: <20201116191311.12477-1-festevam@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 17 Nov 2020 12:38:25 +0200
Message-ID: <CAHp75VcdOUm2vEgUUgUPUcrMwkXOdZ3Q3RWCvagerfQskznC_w@mail.gmail.com>
Subject: Re: [PATCH v3] mxc: gpio: Convert the driver to DT-only
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 9:13 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
> by removing the unused non-DT support.

I like the result!
FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v2:
> - Update the Subject better reflect what is being done
> - Get rid of enum mxc_gpio_hwtype and the global mxc_gpio_hwdata pointer - Andy
>
>  drivers/gpio/gpio-mxc.c | 102 +++++++++-------------------------------
>  1 file changed, 22 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 643f4c557ac2..8ee4bc55bcfe 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -24,13 +24,6 @@
>  #include <linux/of_device.h>
>  #include <linux/bug.h>
>
> -enum mxc_gpio_hwtype {
> -       IMX1_GPIO,      /* runs on i.mx1 */
> -       IMX21_GPIO,     /* runs on i.mx21 and i.mx27 */
> -       IMX31_GPIO,     /* runs on i.mx31 */
> -       IMX35_GPIO,     /* runs on all other i.mx */
> -};
> -
>  /* device type dependent stuff */
>  struct mxc_gpio_hwdata {
>         unsigned dr_reg;
> @@ -68,6 +61,7 @@ struct mxc_gpio_port {
>         u32 both_edges;
>         struct mxc_gpio_reg_saved gpio_saved_reg;
>         bool power_off;
> +       const struct mxc_gpio_hwdata *hwdata;
>  };
>
>  static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
> @@ -115,48 +109,27 @@ static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
>         .fall_edge      = 0x03,
>  };
>
> -static enum mxc_gpio_hwtype mxc_gpio_hwtype;
> -static struct mxc_gpio_hwdata *mxc_gpio_hwdata;
> -
> -#define GPIO_DR                        (mxc_gpio_hwdata->dr_reg)
> -#define GPIO_GDIR              (mxc_gpio_hwdata->gdir_reg)
> -#define GPIO_PSR               (mxc_gpio_hwdata->psr_reg)
> -#define GPIO_ICR1              (mxc_gpio_hwdata->icr1_reg)
> -#define GPIO_ICR2              (mxc_gpio_hwdata->icr2_reg)
> -#define GPIO_IMR               (mxc_gpio_hwdata->imr_reg)
> -#define GPIO_ISR               (mxc_gpio_hwdata->isr_reg)
> -#define GPIO_EDGE_SEL          (mxc_gpio_hwdata->edge_sel_reg)
> -
> -#define GPIO_INT_LOW_LEV       (mxc_gpio_hwdata->low_level)
> -#define GPIO_INT_HIGH_LEV      (mxc_gpio_hwdata->high_level)
> -#define GPIO_INT_RISE_EDGE     (mxc_gpio_hwdata->rise_edge)
> -#define GPIO_INT_FALL_EDGE     (mxc_gpio_hwdata->fall_edge)
> +#define GPIO_DR                        (port->hwdata->dr_reg)
> +#define GPIO_GDIR              (port->hwdata->gdir_reg)
> +#define GPIO_PSR               (port->hwdata->psr_reg)
> +#define GPIO_ICR1              (port->hwdata->icr1_reg)
> +#define GPIO_ICR2              (port->hwdata->icr2_reg)
> +#define GPIO_IMR               (port->hwdata->imr_reg)
> +#define GPIO_ISR               (port->hwdata->isr_reg)
> +#define GPIO_EDGE_SEL          (port->hwdata->edge_sel_reg)
> +
> +#define GPIO_INT_LOW_LEV       (port->hwdata->low_level)
> +#define GPIO_INT_HIGH_LEV      (port->hwdata->high_level)
> +#define GPIO_INT_RISE_EDGE     (port->hwdata->rise_edge)
> +#define GPIO_INT_FALL_EDGE     (port->hwdata->fall_edge)
>  #define GPIO_INT_BOTH_EDGES    0x4
>
> -static const struct platform_device_id mxc_gpio_devtype[] = {
> -       {
> -               .name = "imx1-gpio",
> -               .driver_data = IMX1_GPIO,
> -       }, {
> -               .name = "imx21-gpio",
> -               .driver_data = IMX21_GPIO,
> -       }, {
> -               .name = "imx31-gpio",
> -               .driver_data = IMX31_GPIO,
> -       }, {
> -               .name = "imx35-gpio",
> -               .driver_data = IMX35_GPIO,
> -       }, {
> -               /* sentinel */
> -       }
> -};
> -
>  static const struct of_device_id mxc_gpio_dt_ids[] = {
> -       { .compatible = "fsl,imx1-gpio", .data = &mxc_gpio_devtype[IMX1_GPIO], },
> -       { .compatible = "fsl,imx21-gpio", .data = &mxc_gpio_devtype[IMX21_GPIO], },
> -       { .compatible = "fsl,imx31-gpio", .data = &mxc_gpio_devtype[IMX31_GPIO], },
> -       { .compatible = "fsl,imx35-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
> -       { .compatible = "fsl,imx7d-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
> +       { .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
> +       { .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
> +       { .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
> +       { .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
> +       { .compatible = "fsl,imx7d-gpio", .data = &imx35_gpio_hwdata },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
> @@ -372,36 +345,6 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
>         return rv;
>  }
>
> -static void mxc_gpio_get_hw(struct platform_device *pdev)
> -{
> -       const struct of_device_id *of_id =
> -                       of_match_device(mxc_gpio_dt_ids, &pdev->dev);
> -       enum mxc_gpio_hwtype hwtype;
> -
> -       if (of_id)
> -               pdev->id_entry = of_id->data;
> -       hwtype = pdev->id_entry->driver_data;
> -
> -       if (mxc_gpio_hwtype) {
> -               /*
> -                * The driver works with a reasonable presupposition,
> -                * that is all gpio ports must be the same type when
> -                * running on one soc.
> -                */
> -               BUG_ON(mxc_gpio_hwtype != hwtype);
> -               return;
> -       }
> -
> -       if (hwtype == IMX35_GPIO)
> -               mxc_gpio_hwdata = &imx35_gpio_hwdata;
> -       else if (hwtype == IMX31_GPIO)
> -               mxc_gpio_hwdata = &imx31_gpio_hwdata;
> -       else
> -               mxc_gpio_hwdata = &imx1_imx21_gpio_hwdata;
> -
> -       mxc_gpio_hwtype = hwtype;
> -}
> -
>  static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>  {
>         struct mxc_gpio_port *port = gpiochip_get_data(gc);
> @@ -417,14 +360,14 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>         int irq_base;
>         int err;
>
> -       mxc_gpio_get_hw(pdev);
> -
>         port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
>         if (!port)
>                 return -ENOMEM;
>
>         port->dev = &pdev->dev;
>
> +       port->hwdata = device_get_match_data(&pdev->dev);
> +
>         port->base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(port->base))
>                 return PTR_ERR(port->base);
> @@ -461,7 +404,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>         writel(0, port->base + GPIO_IMR);
>         writel(~0, port->base + GPIO_ISR);
>
> -       if (mxc_gpio_hwtype == IMX21_GPIO) {
> +       if (port->hwdata == &imx1_imx21_gpio_hwdata) {
>                 /*
>                  * Setup one handler for all GPIO interrupts. Actually setting
>                  * the handler is needed only once, but doing it for every port
> @@ -596,7 +539,6 @@ static struct platform_driver mxc_gpio_driver = {
>                 .suppress_bind_attrs = true,
>         },
>         .probe          = mxc_gpio_probe,
> -       .id_table       = mxc_gpio_devtype,
>  };
>
>  static int __init gpio_mxc_init(void)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
