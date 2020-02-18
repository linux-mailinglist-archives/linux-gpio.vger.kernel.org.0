Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB45162A04
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 17:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgBRQCt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 11:02:49 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41112 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgBRQCt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 11:02:49 -0500
Received: by mail-qk1-f196.google.com with SMTP id d11so19936709qko.8
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oto09LwYRX6FYX7brDPiPM4cxtWalpt3QASOWsbUoEE=;
        b=VHjT9YWf16e0vGy+6PMjeXMEGBDrB+6MVzit7ECRRkGRQZNDuJxA4Oh36+Zt3/HD+N
         2cCxW0yl3EWIW9smgEJE9YkM8Tkzr948mFUsRte0lgzIPFWx+gZQf95TvhsK3abU2QYN
         UFGebw2AQsPeXCvXxAxNEhkSsuLSJmZs7uhOdPJte+CIlLJqISzSYEQSh+to4xeNBeGK
         g0OEeUkueFtOyw0LJlb0ImeIwUgo246HTGxcOOujr2EkAeWNTGtehdQCZTHXuUOxrGYV
         t1kz47nzFboU4WC9eNgCeHOPKO3PnpX4zvccOYjobtSqmq9kMGJyTN4yrFddIuFT7OTR
         Z4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oto09LwYRX6FYX7brDPiPM4cxtWalpt3QASOWsbUoEE=;
        b=g7KxIgfr4iSjOfBn/FKbLIq29sBJM52nDhosc9uWrmkYf6987tKe8+BWg8tZ8bTn4Q
         xFfQrO7VnsyPcfJag2UdW9LnlVXoVHt8njJVyKoiwvYFSUTOVaZxMqbKau5wFbOAYJH9
         hbq9B6t9beSJ6e7k4MJkmEIiKaujyGdnk3qq1a4OygQteKVbLS8fgvkiphd9rQatdvW4
         Kk56RSpcNZUfimBLadctaPx2nB/U4TnZxxjrMu4jk70m0FLUjIQxVAFANR3is7RlIXwW
         d4XmjYJBu0n0qH+djRSGrJYNZorZDXPXuxCZzOJdqp4fxm/2ZC8qsemFDzLbV05pTbuU
         4vAQ==
X-Gm-Message-State: APjAAAXO4j62TWFT2TtmImy6JoX8ZqGxjJsoLFT+Nifv2onF9NwxxSJd
        nmwyuLTC9WKydUHCgwQAAdc4vJpdPcbIrf9ShzQmxg==
X-Google-Smtp-Source: APXvYqx1VKVH7TrkVD81e10r+yji5B2W/p4EV6EBOujA2z0DjIBcHZQMiD1AiPiYIdZseFjwJmutWED/nwI7yrJKXiE=
X-Received: by 2002:a37:8343:: with SMTP id f64mr18705569qkd.21.1582041768811;
 Tue, 18 Feb 2020 08:02:48 -0800 (PST)
MIME-Version: 1.0
References: <1581937039-12964-1-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1581937039-12964-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 18 Feb 2020 17:02:37 +0100
Message-ID: <CAMpxmJUkyaU_W2nuBVkun=Trxzvfo4+L5FV4kvBK_KqRbY-eng@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: xilinx: Add clock adaptation support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-gpio <linux-gpio@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 17 lut 2020 o 11:57 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> Add support of clock adaptation for AXI GPIO driver.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/gpio/gpio-xilinx.c | 105 +++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 103 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index a9748b5198e6..26753ae58295 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -14,6 +14,8 @@
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
>
>  /* Register Offset Definitions */
>  #define XGPIO_DATA_OFFSET   (0x0)      /* Data register  */
> @@ -38,6 +40,7 @@
>   * @gpio_state: GPIO state shadow register
>   * @gpio_dir: GPIO direction shadow register
>   * @gpio_lock: Lock used for synchronization
> + * @clk: clock resource for this driver
>   */
>  struct xgpio_instance {
>         struct gpio_chip gc;
> @@ -45,7 +48,8 @@ struct xgpio_instance {
>         unsigned int gpio_width[2];
>         u32 gpio_state[2];
>         u32 gpio_dir[2];
> -       spinlock_t gpio_lock[2];
> +       spinlock_t gpio_lock[2];        /* For serializing operations */
> +       struct clk *clk;
>  };
>
>  static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
> @@ -255,6 +259,70 @@ static void xgpio_save_regs(struct xgpio_instance *c=
hip)
>                        chip->gpio_dir[1]);
>  }
>
> +static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       int ret =3D pm_runtime_get_sync(chip->parent);
> +
> +       /*
> +        * If the device is already active pm_runtime_get() will return 1=
 on
> +        * success, but gpio_request still needs to return 0.
> +        */
> +       return ret < 0 ? ret : 0;
> +}
> +
> +static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +       pm_runtime_put(chip->parent);
> +}
> +
> +static int __maybe_unused xgpio_suspend(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int irq =3D platform_get_irq(pdev, 0);
> +       struct irq_data *data =3D irq_get_irq_data(irq);
> +
> +       if (!irqd_is_wakeup_set(data))
> +               return pm_runtime_force_suspend(dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused xgpio_resume(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int irq =3D platform_get_irq(pdev, 0);
> +       struct irq_data *data =3D irq_get_irq_data(irq);
> +
> +       if (!irqd_is_wakeup_set(data))
> +               return pm_runtime_force_resume(dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct xgpio_instance *gpio =3D platform_get_drvdata(pdev);
> +
> +       clk_disable(gpio->clk);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused xgpio_runtime_resume(struct device *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct xgpio_instance *gpio =3D platform_get_drvdata(pdev);
> +
> +       return clk_enable(gpio->clk);
> +}
> +
> +static const struct dev_pm_ops xgpio_dev_pm_ops =3D {
> +       SET_SYSTEM_SLEEP_PM_OPS(xgpio_suspend, xgpio_resume)
> +       SET_RUNTIME_PM_OPS(xgpio_runtime_suspend,
> +                          xgpio_runtime_resume, NULL)
> +};
> +
>  /**
>   * xgpio_of_probe - Probe method for the GPIO device.
>   * @pdev: pointer to the platform device
> @@ -323,6 +391,8 @@ static int xgpio_probe(struct platform_device *pdev)
>         chip->gc.direction_output =3D xgpio_dir_out;
>         chip->gc.get =3D xgpio_get;
>         chip->gc.set =3D xgpio_set;
> +       chip->gc.request =3D xgpio_request;
> +       chip->gc.free =3D xgpio_free;
>         chip->gc.set_multiple =3D xgpio_set_multiple;
>
>         chip->gc.label =3D dev_name(&pdev->dev);
> @@ -333,15 +403,45 @@ static int xgpio_probe(struct platform_device *pdev=
)
>                 return PTR_ERR(chip->regs);
>         }
>
> +       chip->clk =3D devm_clk_get(&pdev->dev, "s_axi_aclk");
> +       if (IS_ERR(chip->clk)) {
> +               if (PTR_ERR(chip->clk) !=3D -ENOENT) {
> +                       if (PTR_ERR(chip->clk) !=3D -EPROBE_DEFER)
> +                               dev_err(&pdev->dev, "Input clock not foun=
d\n");
> +                       return PTR_ERR(chip->clk);
> +               }
> +               /*
> +                * Clock framework support is optional, continue on
> +                * anyways if we don't find a matching clock.
> +                */

Why not use devm_clk_get_optional() then?

> +               chip->clk =3D NULL;
> +       }
> +       status =3D clk_prepare_enable(chip->clk);
> +       if (status < 0) {
> +               dev_err(&pdev->dev, "Failed to prepare clk\n");
> +               return status;
> +       }
> +       pm_runtime_enable(&pdev->dev);
> +       status =3D pm_runtime_get_sync(&pdev->dev);
> +       if (status < 0)
> +               goto err_unprepare_clk;
> +
>         xgpio_save_regs(chip);
>
>         status =3D devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
>         if (status) {
>                 dev_err(&pdev->dev, "failed to add GPIO chip\n");
> -               return status;
> +               goto err_pm_put;
>         }
>
> +       pm_runtime_put(&pdev->dev);
>         return 0;
> +err_pm_put:
> +       pm_runtime_put(&pdev->dev);
> +err_unprepare_clk:
> +       pm_runtime_disable(&pdev->dev);
> +       clk_unprepare(chip->clk);
> +       return status;
>  }
>
>  static const struct of_device_id xgpio_of_match[] =3D {
> @@ -356,6 +456,7 @@ static struct platform_driver xgpio_plat_driver =3D {
>         .driver         =3D {
>                         .name =3D "gpio-xilinx",
>                         .of_match_table =3D xgpio_of_match,
> +                       .pm =3D &xgpio_dev_pm_ops,
>         },
>  };
>
> --
> 2.7.4
>
