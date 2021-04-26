Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA5C36ACC2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 09:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhDZHRy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 03:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbhDZHRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 03:17:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9BAC061756
        for <linux-gpio@vger.kernel.org>; Mon, 26 Apr 2021 00:17:00 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id n21so6657460eji.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Apr 2021 00:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MH933JiX/H5vIrqO4AxOURlaNcW6gFjmPwklzI1FH0I=;
        b=0jMzRzgE2kkoPMhWjrzPZDGwEhuG4SrR2M46DjrE2hcFtECln0zCGdsFIHAIk+lU8J
         C/ofDwawrfFnQsRbEVwFk2oJrIP6NNtECIKxLOBg3Jx0IQ8xmfuO5qbrGHnTKWcxG3BP
         jv7VSQzCLqlFGYxl5IGbDEetukm4DVndeNrr0BFKM4Qus5NMmL8pI/E7DGUYKkV/Ud08
         WlXJcmsc7rFzz+o4bqXvppOaBCYe3OmISqDDKo+2clXRPnwjV3BKWWhIsb980vzfjnAU
         InP8KodM2gBESaSibTvil3tI/5R7S7vyW72mElKABVS3PhGDvt2DH1GqIMlw0Op9PgQk
         fvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MH933JiX/H5vIrqO4AxOURlaNcW6gFjmPwklzI1FH0I=;
        b=SaWzcy3XkaWFI5BhFY8vDx0vIEDVGVHfYgQCokmtypxvpzLpGhtvPNFODyoOhQP5bP
         o6H9R3rPQ/ibd86rWkvV5QvXvmFEK6gnjWYm2aLRfJ3EgP2fH1Nltlm3ktQNBCi1dmFS
         KRD+ln6dZf7dkEOuT34N9pQO7BMRXtHTJ+KE5iq2JPWdndZimYsZvXVuKJ3z7lNGXov0
         zDdTO0GvxB9t2pGCpW8fA6RBAnkvr+KaJBEr3eHlv1oB3PEFIbO0542l0cN67I5m7OQQ
         c989Oy7JiU8O5JY7kyEWWeBGhpjKpkqzHdPGEAT8BSxa3wclEExT1OEBknCDhWZqkwMD
         kqiw==
X-Gm-Message-State: AOAM532gfcQCN0XZDfTsMlsRjkbJTST5TdYiOurpxRttKxiZI5aqosRQ
        4Lq56Hkpq70nYdtmtdcCB8OhB07m7MlXSH31WZ3ulw==
X-Google-Smtp-Source: ABdhPJxY8aQGlMeoZmTW3iZo4yxpbbqK8ctIDP9CUlsJ2+2Kgs9avQ0jY3hRJX2eCaEU3f5jCMkHZHFKbTM+mlpys2M=
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr17682145ejm.87.1619421419222;
 Mon, 26 Apr 2021 00:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210423152333.6299-1-brgl@bgdev.pl> <CAHp75VcprveU4UiCeezJrnR5n3gWoP5dM1x6E7G1tE2HqOo8Rg@mail.gmail.com>
In-Reply-To: <CAHp75VcprveU4UiCeezJrnR5n3gWoP5dM1x6E7G1tE2HqOo8Rg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Apr 2021 09:16:48 +0200
Message-ID: <CAMRc=MdTYEyw_0Dmq_6fgtmwvKXS-bWe=VQGPDnOqw8L-S=5cA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: allocate IDA numbers earlier
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Fri, Apr 23, 2021 at 5:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Apr 23, 2021 at 6:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Instead of allocating the device ID number for gpio-sim platform devices
> > when the associated configfs item is committed, do it already when the
> > item is created. This way we can display the device name even when the
> > chip is still pending. Once it's committed the user can easily identify
> > the chip by its real device name. This will allow launching concurrent
> > user-space test suites with gpio-sim.
>
> Thanks!
> With or without below comment addressed:
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> > Hi all! This is a late one for which I'm sorry but I realized that this
> > change will allow us to launch test-suites concurrently if we allow the
> > user-space to read the device name before the device is created and then
> > wait for this specific name to appear in a udev add event.
> >
> >  drivers/gpio/gpio-sim.c | 21 ++++++++++-----------
> >  1 file changed, 10 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> > index 92493b98c51b..2e2e6399e453 100644
> > --- a/drivers/gpio/gpio-sim.c
> > +++ b/drivers/gpio/gpio-sim.c
> > @@ -409,6 +409,7 @@ struct gpio_sim_chip_config {
> >          * item is 'live'.
> >          */
> >         struct platform_device *pdev;
> > +       int id;
> >
> >         /*
> >          * Each configfs filesystem operation is protected with the subsystem
> > @@ -442,7 +443,7 @@ static ssize_t gpio_sim_config_dev_name_show(struct config_item *item,
> >         if (pdev)
> >                 ret = sprintf(page, "%s\n", dev_name(&pdev->dev));
> >         else
> > -               ret = sprintf(page, "none\n");
> > +               ret = sprintf(page, "gpio-sim.%d\n", config->id);
>
> Wondering if you need to have one place of definition, i.e. "gpio-sim" part.
>

I applied it as is for 5.13. Feel free to submit a patch if you think
this is useful.

Bart

> >         mutex_unlock(&config->lock);
> >
> >         return ret;
> > @@ -724,6 +725,7 @@ static void gpio_sim_chip_config_release(struct config_item *item)
> >         struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
> >
> >         mutex_destroy(&config->lock);
> > +       ida_free(&gpio_sim_ida, config->id);
> >         kfree_strarray(config->line_names, config->num_line_names);
> >         kfree(config);
> >  }
> > @@ -747,6 +749,12 @@ gpio_sim_config_make_item(struct config_group *group, const char *name)
> >         if (!config)
> >                 return ERR_PTR(-ENOMEM);
> >
> > +       config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> > +       if (config->id < 0) {
> > +               kfree(config);
> > +               return ERR_PTR(config->id);
> > +       }
> > +
> >         config_item_init_type_name(&config->item, name,
> >                                    &gpio_sim_chip_config_type);
> >         config->num_lines = 1;
> > @@ -781,18 +789,12 @@ static int gpio_sim_config_commit_item(struct config_item *item)
> >                                                 config->line_names,
> >                                                 config->num_line_names);
> >
> > -       pdevinfo.id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
> > -       if (pdevinfo.id < 0) {
> > -               mutex_unlock(&config->lock);
> > -               return pdevinfo.id;
> > -       }
> > -
> >         pdevinfo.name = "gpio-sim";
> >         pdevinfo.properties = properties;
> > +       pdevinfo.id = config->id;
> >
> >         pdev = platform_device_register_full(&pdevinfo);
> >         if (IS_ERR(pdev)) {
> > -               ida_free(&gpio_sim_ida, pdevinfo.id);
> >                 mutex_unlock(&config->lock);
> >                 return PTR_ERR(pdev);
> >         }
> > @@ -806,15 +808,12 @@ static int gpio_sim_config_commit_item(struct config_item *item)
> >  static int gpio_sim_config_uncommit_item(struct config_item *item)
> >  {
> >         struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
> > -       int id;
> >
> >         mutex_lock(&config->lock);
> > -       id = config->pdev->id;
> >         platform_device_unregister(config->pdev);
> >         config->pdev = NULL;
> >         mutex_unlock(&config->lock);
> >
> > -       ida_free(&gpio_sim_ida, id);
> >         return 0;
> >  }
> >
> > --
> > 2.30.1
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko
