Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7366C422268
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 11:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhJEJgy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 05:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbhJEJgx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 05:36:53 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAFBC061749
        for <linux-gpio@vger.kernel.org>; Tue,  5 Oct 2021 02:35:03 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id p11so23104889edy.10
        for <linux-gpio@vger.kernel.org>; Tue, 05 Oct 2021 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JSwrj/Ud7lrZIbkhhLjP94xFBhBdTPGk/OpJL7rQ60U=;
        b=fgC0SKKDbPJHGErBzu2w+/DQ2td0sgSboRQQpVrPLLxMGHK5/UHxVeqhBt4XorCfQZ
         h3iLrxdGCSA/J4xe3JmERz8XS0ZDoCBtvSFxXdyOOvtUTe2oQG33hPNrAt4LSSD5ogBA
         44RHj1H0dhTsdI6RTyvY241PWQEbp0RHQ0O8BHrR9tBMjhGoOYxOHj//LA61nI/+8ksW
         AvlONTQh4383Ukl2FQAPJdpuRgPH+QVmoz0/AtKGViegi9yN/9gnOCEyIEwT/uziHXps
         /9zYkHRl4XEBkPmkuQdLqzg+y8rFEXGkuWR5wvQabKBar5GuT53bBGt11b+KDvbF1Rug
         7iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JSwrj/Ud7lrZIbkhhLjP94xFBhBdTPGk/OpJL7rQ60U=;
        b=Utt5Sp5eNcGYpNXS0tKjGNYb0xT3yzhRaRzRuOGpuyIXNxNTAemkZiTnPV8jAS0s2C
         Ja/kkw02KgSraFy9Qs7tAsjpxNGLM7X0/vM0AVFTWxlNPP1s1V4hC807ikEHwvRaVcWr
         Na/Pl6QtAkysecU1ov6K1n5nfpH2WXIv8E2jYzmT1EOKZjiyzRnIUGwTCxrD10UGvGyR
         3WRXsZbq6/4llr3p9RLuqERcyLm0UZm1WgDtlqM9gLgx08jYLnFOAEZg3SrAfU0J32qv
         dup3j+TSULh+LdBErloSLnfRrWdx9x6Yfc7MLwaRd0qlExsAQXzQcWvfBlk47/xLhFNq
         +QIg==
X-Gm-Message-State: AOAM531buRgVqbU3+rRpZbxLuNNmgL/3hks5I2OZpJrFUMMPfC/g+KYI
        2Vio8t+6VPOwG7AMMQ8xscrM3SnzY5y0HIc8IOhlBg==
X-Google-Smtp-Source: ABdhPJxlhSiXjtj93m9ty2ohKG3220ASg2pl5q+3aERRiJs9OmV95MoF4bpovqIxPPBFhHEWpz5gpl4Qr13swC3EmTk=
X-Received: by 2002:a50:cf41:: with SMTP id d1mr24901339edk.219.1633426502046;
 Tue, 05 Oct 2021 02:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211005091016.18519-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211005091016.18519-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Oct 2021 11:34:51 +0200
Message-ID: <CAMRc=McMzezBgxGij3M51nOAzzHNza7EbQ49CwpQp2okJnXc_Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Convert to use software nodes
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

On Tue, Oct 5, 2021 at 11:10 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The gpio-mockup driver creates a properties that are shared between
> platform and GPIO devices. Because of that, the properties may not
> be removed at the proper point of time without provoking use-after-free
> as shown in the backtrace:
>
>   refcount_t: underflow; use-after-free.
>   WARNING: CPU: 0 PID: 103 at lib/refcount.c:28 refcount_warn_saturate+0xd1/0x120
>   ...
>   Call Trace:
>   kobject_put+0xdc/0xf0
>   software_node_notify_remove+0xa8/0xc0
>   device_del+0x15a/0x3e0
>
> That's why the driver has to manage lifetime of the software nodes by itself.
>
> The problem originates by the old device_add_properties() API, but has been
> only revealed after the commit 5aeb05b27f81 ("software node: balance refcount
> for managed software nodes"). Hence, it's used as landmark for the backporting.
>
> Fixes: 5aeb05b27f81 ("software node: balance refcount for managed software nodes")
> Reported-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
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

I suppose my gpio-sim patch is affected by this issue too. Thanks for
fixing that.

Bart
