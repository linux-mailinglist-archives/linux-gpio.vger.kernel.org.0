Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D29074A0ED
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jul 2023 17:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjGFP1H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jul 2023 11:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjGFP1G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jul 2023 11:27:06 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38BC1BFD
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jul 2023 08:27:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9741caaf9d4so98934666b.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jul 2023 08:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688657219; x=1691249219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rLjD5fOXkEsYyUXjnk5KFfhkSlrjQt4GGe1ZHO5yss=;
        b=k9mY4BXC/IFz1590LRqybJuslykyGxG0/kN95UPZI3wMpE7NDMmegQBKgXASz2sCO/
         +PGxIRCWBRcJ5eLqUEGUELFES2sOkGj9bhTTY0vJ3a1SIBZdPyBpUJFR95FcbILIjkO6
         G5ymoEfeCsDnH1dDe+nKE3PPMwfD8/Uk5zRvc9F+S41HfdMKzC9rHquqToXbDtKBxESN
         +puT7Dn3Q+fi9bvkxO5wwl3gd0mw0YreE4xzU4b+gG3zPOHSSFJVesTtPf5Ptfy6hfLI
         20JeSkOr5qQbUDRehaNnxl2Sw/dg5cKpvR9XHpxtjmrX4W8K94BxURPZDwAmCTWTm2qf
         +gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688657219; x=1691249219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rLjD5fOXkEsYyUXjnk5KFfhkSlrjQt4GGe1ZHO5yss=;
        b=fMVCs5bKRiwpzzmzlEa136PQz/xL02wqT7T24TSwKU+xIEpUxzQlPjzLeMMYIMS+0+
         lB0eBPKMkh079IGT04mJ9qmx0XzHC2vdD+E1ncoO6lriv0mB0NF3oI6+39ceoQIJRzJQ
         S4FrAku5lPSwMO7dBQWuXdOsodQzzk9Jn7Mat3PvI3fSVgzEJeNHzfpXRUf70rqVRdAG
         UnHac5TsyFvsDdBCt7Q0XL5fhHyq6HDyXxjuoOy3taDJKiLWWTqwmpDJmuTFP2pBCRLn
         bKuOA/rrqAol+vRzxLecZsG2xckoFhdgFnUDKnBVYweaNBMXdNUnkFffxJD3Ua6ryGBJ
         4Csg==
X-Gm-Message-State: ABy/qLbB2EeLHeYfTxawQ/GGqkeL4cb5l7NWHQVwbEflq4ucAMU+9MBh
        1X9sfIEzUF2rDuTIH6eGWbiQmti1idb82CE5yJYyt0VCk20=
X-Google-Smtp-Source: APBJJlGigJsoWAPUhCnq068j4bJ5EHYONGwMz0WW72XhWaEeDfeBA6rk1zBM9Sm1uIbaZRmXav3I8dRuN5OQlxy0Izc=
X-Received: by 2002:a17:906:72cb:b0:974:20bd:6e15 with SMTP id
 m11-20020a17090672cb00b0097420bd6e15mr2355938ejl.4.1688657218978; Thu, 06 Jul
 2023 08:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230706145611.2660657-1-shenwei.wang@nxp.com>
In-Reply-To: <20230706145611.2660657-1-shenwei.wang@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 6 Jul 2023 18:26:22 +0300
Message-ID: <CAHp75Vdnifkmue857fWZMSXVqHDWrcS_HEDEExXbDXynR0hyoQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mxc: add runtime pm support
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 6, 2023 at 5:56=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Add runtime PM support and allow the GPIO controller to enter
> into runtime suspend automatically when not in use to save power.
> However, it will automatically resume and enable clocks when a
> GPIO or IRQ is requested.
>
> While putting the GPIO module itself into power saving mode may not
> have an obvious impact on current dissipation, the function is necessary
> because the GPIO module disables its clock when idle. This enables the
> system an opportunity to power off the parent subsystem, and this conserv=
es
> more power. The typical i.MX8 SoC features up to 8 GPIO controllers, but
> most of the controllers often remain unused.

Looks better, thank you.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
> v3:
>   - Improved the error handling logic in the probe() function. Thanks a
>     lot to AndyS for reviewing and pointing out the issue.
>
> v2:
>   - improved the patch comments
>   - using pm_runtime_resume_and_get to avoid reference count disbalance
>     when errors
>   - removed the __maybe_unused identifier
>
>  drivers/gpio/gpio-mxc.c | 61 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 9d0cec4b82a3..a9fb6bd9aa6f 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -17,6 +17,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/syscore_ops.h>
> @@ -382,6 +383,23 @@ static int mxc_gpio_to_irq(struct gpio_chip *gc, uns=
igned offset)
>         return irq_find_mapping(port->domain, offset);
>  }
>
> +static int mxc_gpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       int ret;
> +
> +       ret =3D gpiochip_generic_request(chip, offset);
> +       if (ret)
> +               return ret;
> +
> +       return pm_runtime_resume_and_get(chip->parent);
> +}
> +
> +static void mxc_gpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +       gpiochip_generic_free(chip, offset);
> +       pm_runtime_put(chip->parent);
> +}
> +
>  static int mxc_gpio_probe(struct platform_device *pdev)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
> @@ -429,6 +447,10 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>         if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
>                 port->power_off =3D true;
>
> +       pm_runtime_get_noresume(&pdev->dev);
> +       pm_runtime_set_active(&pdev->dev);
> +       pm_runtime_enable(&pdev->dev);
> +
>         /* disable the interrupt and clear the status */
>         writel(0, port->base + GPIO_IMR);
>         writel(~0, port->base + GPIO_ISR);
> @@ -459,8 +481,8 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>         if (err)
>                 goto out_bgio;
>
> -       port->gc.request =3D gpiochip_generic_request;
> -       port->gc.free =3D gpiochip_generic_free;
> +       port->gc.request =3D mxc_gpio_request;
> +       port->gc.free =3D mxc_gpio_free;
>         port->gc.to_irq =3D mxc_gpio_to_irq;
>         port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") * =
32 :
>                                              pdev->id * 32;
> @@ -482,6 +504,8 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>                 goto out_bgio;
>         }
>
> +       irq_domain_set_pm_device(port->domain, &pdev->dev);
> +
>         /* gpio-mxc can be a generic irq chip */
>         err =3D mxc_gpio_init_gc(port, irq_base);
>         if (err < 0)
> @@ -490,12 +514,15 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)
>         list_add_tail(&port->node, &mxc_gpio_ports);
>
>         platform_set_drvdata(pdev, port);
> +       pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;
>
>  out_irqdomain_remove:
>         irq_domain_remove(port->domain);
>  out_bgio:
> +       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_put_noidle(&pdev->dev);
>         clk_disable_unprepare(port->clk);
>         dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
>         return err;
> @@ -572,6 +599,30 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_=
port *port, bool enable)
>         return ret;
>  }
>
> +static int mxc_gpio_runtime_suspend(struct device *dev)
> +{
> +       struct mxc_gpio_port *port =3D dev_get_drvdata(dev);
> +
> +       mxc_gpio_save_regs(port);
> +       clk_disable_unprepare(port->clk);
> +
> +       return 0;
> +}
> +
> +static int mxc_gpio_runtime_resume(struct device *dev)
> +{
> +       struct mxc_gpio_port *port =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D clk_prepare_enable(port->clk);
> +       if (ret)
> +               return ret;
> +
> +       mxc_gpio_restore_regs(port);
> +
> +       return 0;
> +}
> +
>  static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
>  {
>         struct platform_device *pdev =3D to_platform_device(dev);
> @@ -597,14 +648,19 @@ static int __maybe_unused mxc_gpio_noirq_resume(str=
uct device *dev)
>
>  static const struct dev_pm_ops mxc_gpio_dev_pm_ops =3D {
>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mxc_gpio_noirq_suspend, mxc_gpio_no=
irq_resume)
> +       SET_RUNTIME_PM_OPS(mxc_gpio_runtime_suspend, mxc_gpio_runtime_res=
ume, NULL)
>  };
>
>  static int mxc_gpio_syscore_suspend(void)
>  {
>         struct mxc_gpio_port *port;
> +       int ret;
>
>         /* walk through all ports */
>         list_for_each_entry(port, &mxc_gpio_ports, node) {
> +               ret =3D clk_prepare_enable(port->clk);
> +               if (ret)
> +                       return ret;
>                 mxc_gpio_save_regs(port);
>                 clk_disable_unprepare(port->clk);
>         }
> @@ -625,6 +681,7 @@ static void mxc_gpio_syscore_resume(void)
>                         return;
>                 }
>                 mxc_gpio_restore_regs(port);
> +               clk_disable_unprepare(port->clk);
>         }
>  }
>
> --
> 2.34.1
>


--=20
With Best Regards,
Andy Shevchenko
