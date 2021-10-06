Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41578423C7A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Oct 2021 13:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237952AbhJFLUR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Oct 2021 07:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhJFLUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Oct 2021 07:20:17 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459FFC061749
        for <linux-gpio@vger.kernel.org>; Wed,  6 Oct 2021 04:18:25 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g8so8514081edt.7
        for <linux-gpio@vger.kernel.org>; Wed, 06 Oct 2021 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y4CqMqzlZnf2+LZUU+1J6mUHWy8xNvqh2LGAK4xG+9k=;
        b=ZH0r4YYjyaCPo7Xb2eVmvl36E5/IU5I3eQ63rKV6KEL2M78uP5FF0M0EoNMLmhg3eF
         6AAeyBGhUc/Zd2M1ZijEhSSn1BRS8BkD3uZ0qgeT3SyjjReSa1Gq9eZk65FW2dRAukfn
         MZv7IdYFZG5kwvLd5Qti1q12ODTGgcBY6qMiJMe3ViU/RRf6x+yYOI0vhQEz/hlFeud/
         eskiMaUpyXkBq9CXal/VttBbUbsdEZ70U4vFfSIRETWKJ6Gs8FjBxBcM3OMh9Dc5xs57
         xF+IgJJkNYPkRo5SGLytsiMYZgcrqaJ8BWIHk9YQi6pzD4YDxotyb1IusBySrlKxFXi1
         /2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4CqMqzlZnf2+LZUU+1J6mUHWy8xNvqh2LGAK4xG+9k=;
        b=I9j8JtHkCbYvaxmSfxswbXtvmNX0SnzI3cgV5ZXTq3MzsoOPHk2kRV3Y42IAf6y2Xd
         hkHWnAJtPTl5asWUR8mn2uH+q340gYG+55+9KT87qoqWUbYU1tX1aLvhcHIza2rbZ0PU
         pu9J5/E2Y4kf7Jzom3Nn6tKxoOpnGmt6JQADyZJ+EEYxwTUz2Uy4VFLtlmdS+Cj0dw1V
         8ozLqyIJnIFdFoGeoMVXN3i5wq89Akk06uRLUN6lYjC9mQAY6W4EvEjCYWuAGkk/soPX
         l0WB/eLUfjWNbaSYXLCTebSGrf8C+cKOWTd1Ak/JyLCbwLokUsd0rLrs+5kl4k4lGhAV
         41tg==
X-Gm-Message-State: AOAM532DIRfKL8mXDIziMuzOO1kfZuGrYXuyFxZsbHYsgEyJPu/BcQbG
        u4RWhRiXSgwUpp8eyNv5yt6rT+0c+tv9IMxu0FoV1A==
X-Google-Smtp-Source: ABdhPJw9mtBWuqIeN/734cyiWsFm4aBzVZnSmEvpOeR6nHONxxM0GSxiA2UUHTvRNaYyeOscG5/ciTS6S5PZX+HeRuQ=
X-Received: by 2002:a17:907:3353:: with SMTP id yr19mr31648744ejb.508.1633519103841;
 Wed, 06 Oct 2021 04:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211005122449.16296-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211005122449.16296-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Oct 2021 13:18:12 +0200
Message-ID: <CAMRc=MfxE_rnOLj_1EfUO3ezbxvrvrTzukXKim=zPOs2=wx2Ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gpio: mockup: Convert to use software nodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 5, 2021 at 2:24 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The gpio-mockup driver creates the properties that are shared between
> platform and GPIO devices. Because of that, the properties may not
> be removed at the proper point of time without provoking a use-after-free
> as shown in the following backtrace:
>
>   refcount_t: underflow; use-after-free.
>   WARNING: CPU: 0 PID: 103 at lib/refcount.c:28 refcount_warn_saturate+0xd1/0x120
>   ...
>   Call Trace:
>   kobject_put+0xdc/0xf0
>   software_node_notify_remove+0xa8/0xc0
>   device_del+0x15a/0x3e0
>
> That's why the driver has to manage the lifetime of the software nodes
> by itself.
>
> The problem originates from the old device_add_properties() API, but
> has been only revealed after the commit bd1e336aa853 ("driver core: platform:
> Remove platform_device_add_properties()"). Hence, it's used as a landmark
> for backporting.
>
> Fixes: bd1e336aa853 ("driver core: platform: Remove platform_device_add_properties()")
> Reported-and-tested-by: Kent Gibson <warthog618@gmail.com>

I prefer to have the Reported-by and Tested-by tags separately even
for the same person. I fixed that in my tree.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v3: fixed tag, more grammar fixes
>  drivers/gpio/gpio-mockup.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 0a9d746a0fe0..8b147b565e92 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -478,8 +478,18 @@ static void gpio_mockup_unregister_pdevs(void)
>  {
>         int i;
>
> -       for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++)
> -               platform_device_unregister(gpio_mockup_pdevs[i]);
> +       for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++) {
> +               struct platform_device *pdev;
> +               struct fwnode_handle *fwnode;
> +
> +               pdev = gpio_mockup_pdevs[i];
> +               if (!pdev)
> +                       continue;
> +
> +               fwnode = dev_fwnode(&pdev->dev);
> +               platform_device_unregister(pdev);
> +               fwnode_remove_software_node(fwnode);
> +       }
>  }
>
>  static __init char **gpio_mockup_make_line_names(const char *label,
> @@ -508,6 +518,7 @@ static int __init gpio_mockup_register_chip(int idx)
>         struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
>         struct platform_device_info pdevinfo;
>         struct platform_device *pdev;
> +       struct fwnode_handle *fwnode;
>         char **line_names = NULL;
>         char chip_label[32];
>         int prop = 0, base;
> @@ -536,13 +547,18 @@ static int __init gpio_mockup_register_chip(int idx)
>                                         "gpio-line-names", line_names, ngpio);
>         }
>
> +       fwnode = fwnode_create_software_node(properties, NULL);
> +       if (IS_ERR(fwnode))
> +               return PTR_ERR(fwnode);
> +
>         pdevinfo.name = "gpio-mockup";
>         pdevinfo.id = idx;
> -       pdevinfo.properties = properties;
> +       pdevinfo.fwnode = fwnode;
>
>         pdev = platform_device_register_full(&pdevinfo);
>         kfree_strarray(line_names, ngpio);
>         if (IS_ERR(pdev)) {
> +               fwnode_remove_software_node(fwnode);
>                 pr_err("error registering device");
>                 return PTR_ERR(pdev);
>         }
> --
> 2.33.0
>

Applied for fixes, thanks!

Bart
