Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD06369651
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 17:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhDWPlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 11:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242895AbhDWPlL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 11:41:11 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE81C061574;
        Fri, 23 Apr 2021 08:40:33 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id j7so26039481pgi.3;
        Fri, 23 Apr 2021 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YWiMdIvIJTgEdS/toi4P5fn1mH/h8UEOSVIoZ/iPl0A=;
        b=TG6BH8I3MB2RG2/vbj70hkQ6Q0PHjFRcRg/x4C/Gd7/W/7a1IlHo2fP+Zv8gLem5uh
         88qRrNKxlRU0XfNez5j8dhr7FKPai3Ui2RiRr2z396NSatUgxKqR1JkLKNZP9tmTDl4Q
         XyvZxkjnoKJb4SeNTWeyuXhzFndtQahOn63PR/ZGYZICx1PE7yWwEMK3RIWGUj2O40li
         GjMUWB6CUYlF5i6rCr2Fqk5HYGNb426ilPx6282xryllzyJMfQpt4kkCpUL4LzdIJiyZ
         rQ7mZJX9KI3EDlZORwREb9feLuZhFt2/+cC0lMzgsCw4dz7buOtCke0DDvGp1TLEzGOT
         f17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YWiMdIvIJTgEdS/toi4P5fn1mH/h8UEOSVIoZ/iPl0A=;
        b=aPl+yvsruNEP0w9AwMKwHxyy3HC/tT72J1CvntSRueFEyEArdiI9/ApVUXteij+Ft8
         NFcgDca7nrmNEZgnK+QpvakXHkeDLO3VEDL6/8544J3vvBS3Zg+CiRv4NR+tqBwgIqTN
         ENsuN2HwMkgDLvJrWL54wfxOxCDsye/PPIlKNp5xRc4eNt+oc/atckOINrjozp0hER6b
         e7LrVeTYpqMYgUCxKKs3oe4PKfTKPNRIpU1TmDcLbHjMqMl1lW3tUIlsPNcChOHyOSXj
         Zb5an++YDBSKVUMs8f3o+cqKxWCLhww+9uo9+lGaQVEjuBMpP0MTVfHnswizrHs+vmu7
         v3KQ==
X-Gm-Message-State: AOAM530Jz7SFh1oWGoOEspSqMvZ9dJbpf16WFt1c5E3NqDEB+EU38xga
        yYcx2jMPMWrntexp4nI7n5lsHNltFzLg40MG1aM=
X-Google-Smtp-Source: ABdhPJy9MQfjhX9tXSAuJ2nZG3KkkXoEHLisMRFwPUBhbDsIgJqvlHg31bZow1IfzXoS/QP85TP3b/mFHsP4x6CM1pY=
X-Received: by 2002:a62:5c6:0:b029:24d:e97f:1b1d with SMTP id
 189-20020a6205c60000b029024de97f1b1dmr4523754pff.40.1619192432762; Fri, 23
 Apr 2021 08:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210423152333.6299-1-brgl@bgdev.pl>
In-Reply-To: <20210423152333.6299-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Apr 2021 18:40:16 +0300
Message-ID: <CAHp75VcprveU4UiCeezJrnR5n3gWoP5dM1x6E7G1tE2HqOo8Rg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: allocate IDA numbers earlier
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 23, 2021 at 6:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Instead of allocating the device ID number for gpio-sim platform devices
> when the associated configfs item is committed, do it already when the
> item is created. This way we can display the device name even when the
> chip is still pending. Once it's committed the user can easily identify
> the chip by its real device name. This will allow launching concurrent
> user-space test suites with gpio-sim.

Thanks!
With or without below comment addressed:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> Hi all! This is a late one for which I'm sorry but I realized that this
> change will allow us to launch test-suites concurrently if we allow the
> user-space to read the device name before the device is created and then
> wait for this specific name to appear in a udev add event.
>
>  drivers/gpio/gpio-sim.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 92493b98c51b..2e2e6399e453 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -409,6 +409,7 @@ struct gpio_sim_chip_config {
>          * item is 'live'.
>          */
>         struct platform_device *pdev;
> +       int id;
>
>         /*
>          * Each configfs filesystem operation is protected with the subsystem
> @@ -442,7 +443,7 @@ static ssize_t gpio_sim_config_dev_name_show(struct config_item *item,
>         if (pdev)
>                 ret = sprintf(page, "%s\n", dev_name(&pdev->dev));
>         else
> -               ret = sprintf(page, "none\n");
> +               ret = sprintf(page, "gpio-sim.%d\n", config->id);

Wondering if you need to have one place of definition, i.e. "gpio-sim" part.

>         mutex_unlock(&config->lock);
>
>         return ret;
> @@ -724,6 +725,7 @@ static void gpio_sim_chip_config_release(struct config_item *item)
>         struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
>
>         mutex_destroy(&config->lock);
> +       ida_free(&gpio_sim_ida, config->id);
>         kfree_strarray(config->line_names, config->num_line_names);
>         kfree(config);
>  }
> @@ -747,6 +749,12 @@ gpio_sim_config_make_item(struct config_group *group, const char *name)
>         if (!config)
>                 return ERR_PTR(-ENOMEM);
>
> +       config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> +       if (config->id < 0) {
> +               kfree(config);
> +               return ERR_PTR(config->id);
> +       }
> +
>         config_item_init_type_name(&config->item, name,
>                                    &gpio_sim_chip_config_type);
>         config->num_lines = 1;
> @@ -781,18 +789,12 @@ static int gpio_sim_config_commit_item(struct config_item *item)
>                                                 config->line_names,
>                                                 config->num_line_names);
>
> -       pdevinfo.id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> -       if (pdevinfo.id < 0) {
> -               mutex_unlock(&config->lock);
> -               return pdevinfo.id;
> -       }
> -
>         pdevinfo.name = "gpio-sim";
>         pdevinfo.properties = properties;
> +       pdevinfo.id = config->id;
>
>         pdev = platform_device_register_full(&pdevinfo);
>         if (IS_ERR(pdev)) {
> -               ida_free(&gpio_sim_ida, pdevinfo.id);
>                 mutex_unlock(&config->lock);
>                 return PTR_ERR(pdev);
>         }
> @@ -806,15 +808,12 @@ static int gpio_sim_config_commit_item(struct config_item *item)
>  static int gpio_sim_config_uncommit_item(struct config_item *item)
>  {
>         struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
> -       int id;
>
>         mutex_lock(&config->lock);
> -       id = config->pdev->id;
>         platform_device_unregister(config->pdev);
>         config->pdev = NULL;
>         mutex_unlock(&config->lock);
>
> -       ida_free(&gpio_sim_ida, id);
>         return 0;
>  }
>
> --
> 2.30.1
>


-- 
With Best Regards,
Andy Shevchenko
