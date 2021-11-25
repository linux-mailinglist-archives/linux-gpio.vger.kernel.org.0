Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D3E45D80B
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 11:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354317AbhKYKQo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 05:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354377AbhKYKOo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 05:14:44 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA6FC06175D
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 02:10:20 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id e3so23294399edu.4
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 02:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uY1320pfARFP0aqCxH2XJgkIqC5MefeMwkvkI1jomHM=;
        b=1LvqB7ZzUTj0dRExAAGL9FsbK5F16YizN76SGabC9iuEkGBzMErW86CEyEd5exphPf
         n0mdPUY1gSdp1zx78M39z89pBt+aUdvUm+p4ow0eqgjBJL8s0MD6Noi523q3M/00AmBD
         uoa7WNSrW7cbHG5AkF1Gr1yspFZngpw7KRxXcR+AQ3a51sIaaswP7LR6CsJpgOpJv6Gy
         RJNRPwcWSFklJ3mw9+GDo2sELhk9Jya+DKKyLe5iEmLBBKLKXubyqNQW+JjdCV7ct53H
         k3pjarOa/wKJJzfve2C0n/5ZwrZPFVCV0x+qOseHklOHHpPfCd0qad39s14MdgRSCWEF
         zymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uY1320pfARFP0aqCxH2XJgkIqC5MefeMwkvkI1jomHM=;
        b=rqV+Yc2iOLzN/K0wCyxW0dc3cqmgPY15zJtCG6uFbO2Tq5D9rt6YN98G92BTHooOU/
         CePox/eVS9CEDfSSfbigcEwnxAKa4tiqkVRL5YE+pd7HPz6nDDba5qQxAQ9IZKyh2nJz
         R/mezvoVrafyorVO0vnEzOm+imMCs5HDV5Ae7x4PBsCEksRgm5G95NjeP1JBtPa9jtCU
         1cxofvKTgPauGFvT+e9InHu8klUPMeRcuC2AoqpHCtt/QOdpHqsDbP5TTmBrBkdWt8L5
         O2Y3/iDP4ukpUkU1y9cwGQDU7q03cnvD0Pcx4Nj0s+ljEdSeDwzmFlY0zIt3O7JXAerV
         FTRg==
X-Gm-Message-State: AOAM5333/kEvBOpdPp6UQ6TY6zYalhlG5FocUQyNCtzKwAk+D4eNRW9Z
        XISw676dl1VmYTrrkAtNGrmX0UdmhNCaTQJqEPkPUg==
X-Google-Smtp-Source: ABdhPJxcJWKIiC3o+XJYDTa3abClgRQH1270vQEYzDAfENegSLf/yPfu1BI9/wyfxb0PX544PQ7+DWzsNcrIM6K6UVU=
X-Received: by 2002:a17:906:5343:: with SMTP id j3mr29879323ejo.538.1637835018828;
 Thu, 25 Nov 2021 02:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20211124122850.7095-1-brgl@bgdev.pl> <20211124122850.7095-2-brgl@bgdev.pl>
 <YZ5QYsu2ed5FiSWE@smile.fi.intel.com>
In-Reply-To: <YZ5QYsu2ed5FiSWE@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 25 Nov 2021 11:10:08 +0100
Message-ID: <CAMRc=Mfcph_YPryowhtGtb9G_GOveRm+27BJYyznjxc=BK-jWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 24, 2021 at 3:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 24, 2021 at 01:28:50PM +0100, Bartosz Golaszewski wrote:
> > Several drivers read the 'ngpios' device property on their own, but
> > since it's defined as a standard GPIO property in the device tree bindings
> > anyway, it's a good candidate for generalization. If the driver didn't
> > set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> > device's firmware node before bailing out.
>
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > v1 -> v2:
> > - use device_property_read_u32() instead of fwnode_property_read_u32()
> > - reverse the error check logic
> >
> > v2 -> v3:
> > - don't shadow errors other than -ENODATA in device_property_read_u32()
> >
> >  drivers/gpio/gpiolib.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index ede8b8a7aa18..f79fd2551cf7 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -599,6 +599,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >       int base = gc->base;
> >       unsigned int i;
> >       int ret = 0;
> > +     u32 ngpios;
> >
> >       /*
> >        * First: allocate and populate the internal stat container, and
> > @@ -647,9 +648,17 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >       }
>
> >       if (gc->ngpio == 0) {
> > -             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > -             ret = -EINVAL;
> > -             goto err_free_descs;
> > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > +             if (ret) {
> > +                     if (ret == -ENODATA) {
> > +                             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > +                             ret = -EINVAL;
> > +                     }
> > +
> > +                     goto err_free_descs;
> > +             }
>
> And if the property returns 0 in ngpios?
>
> What about the modified suggestion from previous version:
>
>         if (gc->ngpio == 0) {
>                 ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);

The comment is a good idea but other than that - it's overcomplicating things.

>                 if (ret == -ENODATA)
>                         ngpios = 0;
>                 else if (ret)
>                         return ret;

You still need to goto err_free_descs here.

>
>                 gc->ngpio = ngpios;
>         }
>
>         if (gc->ngpio == 0) {

Why check that again? We already know the driver set it to 0, we
checked it a couple lines before. If we can't get the setting from the
properties then it won't be non 0 here right?

>                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
>                 ret = -EINVAL;
>                 goto err_free_descs;
>         }
>
> ?
>
> > +             gc->ngpio = ngpios;
> >       }
> >
> >       if (gc->ngpio > FASTPATH_NGPIO)
> > --
> > 2.25.1
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I suggest the following:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ede8b8a7aa18..08c1e8fc0dfa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -599,6 +599,7 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
     int base = gc->base;
     unsigned int i;
     int ret = 0;
+    u32 ngpios;

     /*
      * First: allocate and populate the internal stat container, and
@@ -647,9 +648,23 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
     }

     if (gc->ngpio == 0) {
-        chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
-        ret = -EINVAL;
-        goto err_free_descs;
+        /*
+         * If the driver didn't specify the number of GPIOs, try to
+         * get this value from the device properties as a fall-back.
+         */
+        ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
+        if (ret) {
+            /*
+             * -ENODATA means that there is no property found and
+             * we want to issue the error message to the user.
+             * Besides that, we want to return different error code
+             * to state that supplied value is not valid.
+             * */
+            if (ret == -ENODATA) {
+                chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
+                ret = -EINVAL;
+            }
+
+            goto err_free_descs;
+        }
+
+        gc->ngpio = ngpios;
     }

     if (gc->ngpio > FASTPATH_NGPIO)
