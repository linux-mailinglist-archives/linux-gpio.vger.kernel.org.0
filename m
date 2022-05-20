Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1373452EAE0
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 13:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343708AbiETLd6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 07:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242092AbiETLd5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 07:33:57 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451FA644EA
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 04:33:55 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id kq17so15087751ejb.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 04:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Ff5tto3mG2moHDMZagyk1l4RGcRKVIn9NkwB+MYSFs=;
        b=U7Hq/1yUUCJZVXfuVeGXfp42guR6XkALOJuCS98MJXa4mUPB101zO1rp84DeQDs8ig
         4NQ6xwIcFxhYCCYOmVA1ovS/lkZMTttERIi9bT3wcTIviG1V2O0bAalzmtLr4kYKVWop
         8xKaDqYiM8aYtgMeryqeg3Ec52+K3u3ktj9UiiJpoVmk70yDX/uGV4TowDHGRPVY/5d8
         6vN7jTfonOu9cBvJBtC6EVqhE1fyUINoovNFNTtzfe/57ds3o/xIXACzDp6JPiBMk9QP
         rbVf4mdGnNBKUTTGRAlZnrLo1Utg4TT7Yju0A1HRi3HhMiblXTUXCd4ssq9kWBuu88DM
         9KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Ff5tto3mG2moHDMZagyk1l4RGcRKVIn9NkwB+MYSFs=;
        b=Q/JT2YPGmsiQnr+ItWY3ltaQ6vWKKUB3DgAQVJQGfrQdgvOi2CxSTnHbq5vMX26YTn
         YJjh24vfqfvJDjeYYZB+YbWER/M/Z68CxWwQx/s9dANjena7b5dw5VeuVujhMtD4FgL9
         lIXiwxFcoGQXvGTsYVl5YT9yLfMjyyUROS3lOpkkY6WuP4v+n8AFhKC3Y+5pEyCUZz91
         64Nl49k3NTRWGPhBmues5No6pIYB8w7FzOZmBNt788hTcooCVOOGL6BBX5+jlr063/dQ
         Pecq6LsbODzUNLJypeMHScs37+sPA8uKmWwNinjolBfNc8NrADDud1CqvsdTvc1PsLCQ
         twsA==
X-Gm-Message-State: AOAM530N7MgqXWPeNOmi3Q80Zt+qZmKBDfW6otv8iVe485zjsHSWpPcr
        WBPFDGITLqQ9pEQWKRVqNm3AqtpM7nB7fSoiGiMqi3jmBdE=
X-Google-Smtp-Source: ABdhPJxWOe0zDSPIJekNjBgD1lDZe2XG7cWximV0loSY7pxt3y6QF+zM9JUWooKidrZRLdvXWARpFnfhUN2ca5sFsSI=
X-Received: by 2002:a17:907:6d8b:b0:6fe:874:25bf with SMTP id
 sb11-20020a1709076d8b00b006fe087425bfmr8658117ejc.734.1653046433749; Fri, 20
 May 2022 04:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220520025624.3803776-1-zheyuma97@gmail.com>
In-Reply-To: <20220520025624.3803776-1-zheyuma97@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 20 May 2022 13:33:43 +0200
Message-ID: <CAMRc=MfeEjJ0bGaDgkYOxYA1pi+8376zis=V1Hyvy5K3AKCAxA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: ml-ioh: Convert to use managed functions pcim*
 and devm_*
To:     Zheyu Ma <zheyuma97@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 4:56 AM Zheyu Ma <zheyuma97@gmail.com> wrote:
>
>  When removing the module, we will get the following flaw:
>
> [   14.204955] remove_proc_entry: removing non-empty directory 'irq/21', leaking at least 'gpio_ml_ioh'
> [   14.205827] WARNING: CPU: 0 PID: 305 at fs/proc/generic.c:717 remove_proc_entry+0x389/0x3f0
> ...
> [   14.220613]  ioh_gpio_remove+0xc5/0xe0 [gpio_ml_ioh]
> [   14.221075]  pci_device_remove+0x92/0x240
>
> Fix this by using managed functions, this makes the error handling more
> simpler.
>
> Fixes: e971ac9a564a ("gpio: ml-ioh: use resource management for irqs")
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  drivers/gpio/gpio-ml-ioh.c | 76 ++++++++------------------------------
>  1 file changed, 16 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
> index b060c4773698..48e3768a830e 100644
> --- a/drivers/gpio/gpio-ml-ioh.c
> +++ b/drivers/gpio/gpio-ml-ioh.c
> @@ -409,29 +409,27 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
>         void *chip_save;
>         int irq_base;
>
> -       ret = pci_enable_device(pdev);
> +       ret = pcim_enable_device(pdev);
>         if (ret) {
> -               dev_err(dev, "%s : pci_enable_device failed", __func__);
> -               goto err_pci_enable;
> +               dev_err(dev, "%s : pcim_enable_device failed", __func__);
> +               return ret;
>         }
>
> -       ret = pci_request_regions(pdev, KBUILD_MODNAME);
> +       ret = pcim_iomap_regions(pdev, BIT(1), KBUILD_MODNAME);
>         if (ret) {
> -               dev_err(dev, "pci_request_regions failed-%d", ret);
> -               goto err_request_regions;
> +               dev_err(dev, "pcim_iomap_regions failed-%d", ret);
> +               return ret;
>         }
>
> -       base = pci_iomap(pdev, 1, 0);
> +       base = pcim_iomap_table(pdev)[1];
>         if (!base) {
> -               dev_err(dev, "%s : pci_iomap failed", __func__);
> -               ret = -ENOMEM;
> -               goto err_iomap;
> +               dev_err(dev, "%s : pcim_iomap_table failed", __func__);
> +               return -ENOMEM;
>         }
>
> -       chip_save = kcalloc(8, sizeof(*chip), GFP_KERNEL);
> +       chip_save = devm_kcalloc(dev, 8, sizeof(*chip), GFP_KERNEL);
>         if (chip_save == NULL) {
> -               ret = -ENOMEM;
> -               goto err_kzalloc;
> +               return -ENOMEM;
>         }
>
>         chip = chip_save;
> @@ -442,10 +440,10 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
>                 chip->ch = i;
>                 spin_lock_init(&chip->spinlock);
>                 ioh_gpio_setup(chip, num_ports[i]);
> -               ret = gpiochip_add_data(&chip->gpio, chip);
> +               ret = devm_gpiochip_add_data(dev, &chip->gpio, chip);
>                 if (ret) {
>                         dev_err(dev, "IOH gpio: Failed to register GPIO\n");
> -                       goto err_gpiochip_add;
> +                       return ret;
>                 }
>         }
>
> @@ -456,15 +454,14 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
>                 if (irq_base < 0) {
>                         dev_warn(dev,
>                                 "ml_ioh_gpio: Failed to get IRQ base num\n");
> -                       ret = irq_base;
> -                       goto err_gpiochip_add;
> +                       return irq_base;
>                 }
>                 chip->irq_base = irq_base;
>
>                 ret = ioh_gpio_alloc_generic_chip(chip,
>                                                   irq_base, num_ports[j]);
>                 if (ret)
> -                       goto err_gpiochip_add;
> +                       return ret;
>         }
>
>         chip = chip_save;
> @@ -472,52 +469,12 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
>                                IRQF_SHARED, KBUILD_MODNAME, chip);
>         if (ret != 0) {
>                 dev_err(dev, "%s request_irq failed\n", __func__);
> -               goto err_gpiochip_add;
> +               return ret;
>         }
>
>         pci_set_drvdata(pdev, chip);
>
>         return 0;
> -
> -err_gpiochip_add:
> -       chip = chip_save;
> -       while (--i >= 0) {
> -               gpiochip_remove(&chip->gpio);
> -               chip++;
> -       }
> -       kfree(chip_save);
> -
> -err_kzalloc:
> -       pci_iounmap(pdev, base);
> -
> -err_iomap:
> -       pci_release_regions(pdev);
> -
> -err_request_regions:
> -       pci_disable_device(pdev);
> -
> -err_pci_enable:
> -
> -       dev_err(dev, "%s Failed returns %d\n", __func__, ret);
> -       return ret;
> -}
> -
> -static void ioh_gpio_remove(struct pci_dev *pdev)
> -{
> -       int i;
> -       struct ioh_gpio *chip = pci_get_drvdata(pdev);
> -       void *chip_save;
> -
> -       chip_save = chip;
> -
> -       for (i = 0; i < 8; i++, chip++)
> -               gpiochip_remove(&chip->gpio);
> -
> -       chip = chip_save;
> -       pci_iounmap(pdev, chip->base);
> -       pci_release_regions(pdev);
> -       pci_disable_device(pdev);
> -       kfree(chip);
>  }
>
>  static int __maybe_unused ioh_gpio_suspend(struct device *dev)
> @@ -558,7 +515,6 @@ static struct pci_driver ioh_gpio_driver = {
>         .name = "ml_ioh_gpio",
>         .id_table = ioh_gpio_pcidev_id,
>         .probe = ioh_gpio_probe,
> -       .remove = ioh_gpio_remove,
>         .driver = {
>                 .pm = &ioh_gpio_pm_ops,
>         },
> --
> 2.36.1
>

Looks so much better now, gotta love devres. :)

If Andy takes it through his tree:

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

Otherwise let me know, I can pick it up myself too.

Bart
