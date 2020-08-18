Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F45248F7B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 22:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHRUME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 16:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgHRUMD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 16:12:03 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B284C061389
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 13:12:03 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id b79so19498907qkg.9
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mCdseND4Q1yxnFtiQSLAgE22BOVS3DFVJQBnx+0FA1k=;
        b=is4USddA9HL0bmIjDMo1/up8AxbtbwKHhhxh23jSEjA//iEB2AlWSzij1O9BhVmaBx
         f0lxWgAsQEOdKuqPld7g6GV3xeoS8Aka9K+OGyi/3Dum8qLSTtTokKXG5smmeS55Tu0z
         hx7Qa73R2Ho5coZCveDCqdSENEXRPRLhCyUPJD57txa5emv/yOfpuzEnLDHeaJwIqvMT
         UmQkx+O4eV1WSxSzOk+0I0plyVmHQofc4s33eZ16Ri44ZR8apPc+sdyvhWZvRmFPrIgy
         P6DpNu6WBsGby80CH/twX/HurYxK8Mi+nQUomWqYZFHVxdxCSqtzvej5gSQ0mUU2WTMh
         FJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mCdseND4Q1yxnFtiQSLAgE22BOVS3DFVJQBnx+0FA1k=;
        b=F0R98mGHD//xouX70EcwF6qW729Vm3husQpdyCYbMS8JTwChigGclkqUdyYA7BUgUR
         U3aRF8Mlv7lJl53by0SN+U+5CGjrdBDE55OAE0V+rmk9ncjOwsS5csKlXp1NGDOMkTZ1
         ThS86CYzYB29ifzKcz8dELWBYxAqQykv5HLcFq9X39t7p0n4VfryI2vJq22eb3myOX35
         tV6c/nWN1i4LuI8/GTM0VIsCuNZPZjwGxXQ1B723rbbjTau+zEhv+d8whSn1JJ0s0Tzf
         EV/Jcl9q8CYOaW3pp3HZ3uqsWDK0ZIBAZ9xMJtrbDH7aARQS1s6qex/RKHn/VMWK9jpU
         9PFQ==
X-Gm-Message-State: AOAM532HB7aLIVDMbBijdLDw0IcCAoEFAK1XmQ+M4CwEXTei5TfTbQ44
        II2phbGnXcN6vDRHT17GFFMC/S04afbesTS62U4Nog==
X-Google-Smtp-Source: ABdhPJwOKRYS2PwWBBYN4GFKNKJdQYmjkuOx3UDDgltvQa7vQlCXjb3kyJ+bQrzsi9ccw8z8SKrP/CgWTVGQkKsMYRc=
X-Received: by 2002:a37:a5c1:: with SMTP id o184mr18448700qke.323.1597781522517;
 Tue, 18 Aug 2020 13:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <1595513168-11965-1-git-send-email-srinivas.neeli@xilinx.com> <1595513168-11965-2-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1595513168-11965-2-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 18 Aug 2020 22:11:51 +0200
Message-ID: <CAMpxmJXFXGGXebBDKhnk6W3J-KX+GLFUJOiQQY6ERNC7_D+_hw@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] gpio: xilinx: Add clock adaptation support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 4:06 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:
>
> Add support of clock adaptation for AXI GPIO driver.
>

Please make the commit message more specific. I can tell from the
patch that it's about power management but I've never heard anyone
referring to it as clock adaptation. There's also a lot of runtime pm
code in here. Be more descriptive.

> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V2:
> Add check for return value of platform_get_irq() API.
> ---
>  drivers/gpio/gpio-xilinx.c | 111 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index 67f9f82e0db0..d103613e787a 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -14,6 +14,8 @@
>  #include <linux/io.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>

Alphabetical order of includes?

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

This looks like it was sneaked into an unrelated patch.

> +       struct clk *clk;
>  };
>
>  static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
> @@ -256,6 +260,83 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
>                        chip->gpio_dir[1]);
>  }
>
> +static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       int ret = pm_runtime_get_sync(chip->parent);
> +
> +       /*
> +        * If the device is already active pm_runtime_get() will return 1 on
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
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct irq_data *data;
> +       int irq = platform_get_irq(pdev, 0);
> +
> +       if (irq < 0) {
> +               dev_info(&pdev->dev, "platform_get_irq returned %d\n", irq);
> +               return irq;
> +       }
> +
> +       data = irq_get_irq_data(irq);
> +       if (!irqd_is_wakeup_set(data))
> +               return pm_runtime_force_suspend(dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused xgpio_resume(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct irq_data *data;
> +       int irq = platform_get_irq(pdev, 0);
> +
> +       if (irq < 0) {
> +               dev_info(&pdev->dev, "platform_get_irq returned %d\n", irq);
> +               return irq;
> +       }

No, don't do this on every suspend/resume - just call
platform_get_irq() in probe() and store the irq number for later use.
This way you only check it once. Also why would you log the return
value?

> +
> +       data = irq_get_irq_data(irq);
> +
> +       if (!irqd_is_wakeup_set(data))
> +               return pm_runtime_force_resume(dev);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct xgpio_instance *gpio = platform_get_drvdata(pdev);
> +
> +       clk_disable(gpio->clk);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused xgpio_runtime_resume(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct xgpio_instance *gpio = platform_get_drvdata(pdev);
> +
> +       return clk_enable(gpio->clk);
> +}
> +
> +static const struct dev_pm_ops xgpio_dev_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(xgpio_suspend, xgpio_resume)
> +       SET_RUNTIME_PM_OPS(xgpio_runtime_suspend,
> +                          xgpio_runtime_resume, NULL)
> +};
> +
>  /**
>   * xgpio_of_probe - Probe method for the GPIO device.
>   * @pdev: pointer to the platform device
> @@ -324,6 +405,8 @@ static int xgpio_probe(struct platform_device *pdev)
>         chip->gc.direction_output = xgpio_dir_out;
>         chip->gc.get = xgpio_get;
>         chip->gc.set = xgpio_set;
> +       chip->gc.request = xgpio_request;
> +       chip->gc.free = xgpio_free;
>         chip->gc.set_multiple = xgpio_set_multiple;
>
>         chip->gc.label = dev_name(&pdev->dev);
> @@ -334,15 +417,38 @@ static int xgpio_probe(struct platform_device *pdev)
>                 return PTR_ERR(chip->regs);
>         }
>
> +       chip->clk = devm_clk_get_optional(&pdev->dev, "s_axi_aclk");
> +       if (IS_ERR(chip->clk)) {
> +               if (PTR_ERR(chip->clk) != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "Input clock not found\n");

How is this an error if the clock is optional?

> +               return PTR_ERR(chip->clk);
> +       }
> +       status = clk_prepare_enable(chip->clk);
> +       if (status < 0) {
> +               dev_err(&pdev->dev, "Failed to prepare clk\n");
> +               return status;
> +       }
> +       pm_runtime_enable(&pdev->dev);
> +       status = pm_runtime_get_sync(&pdev->dev);
> +       if (status < 0)
> +               goto err_unprepare_clk;
> +
>         xgpio_save_regs(chip);
>
>         status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
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
>  static const struct of_device_id xgpio_of_match[] = {
> @@ -357,6 +463,7 @@ static struct platform_driver xgpio_plat_driver = {
>         .driver         = {
>                         .name = "gpio-xilinx",
>                         .of_match_table = xgpio_of_match,
> +                       .pm = &xgpio_dev_pm_ops,
>         },
>  };
>
> --
> 2.7.4
>

Bart
