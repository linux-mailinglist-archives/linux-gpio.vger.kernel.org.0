Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25513466725
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 16:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359214AbhLBPwD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 10:52:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359200AbhLBPwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 10:52:02 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60087C061758
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 07:48:39 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y13so117839700edd.13
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iuPSYgzTIlMyDGzehdK7/z8w8X0z+If2BgHEIifEQvk=;
        b=baNeOyif4KdMCTt9oisfwZJlQZghF+61kAW/QWSTXs5PndIZkJWD7GIiQET4/b2tir
         zLeboJLCr72To9QovmfQFGoApNbnl+aETWO/h1w/F4aobZshIwLX7RRoiKM5LSNIQDkN
         SR/OQ+vsBg5oREtxanSw9p76jAIOhAXQ/3PrsYlozBQ5ZyYHMwOAQUGXLRVPklSqNyXZ
         WO8zg+vMepVbRyLfpTDuVGi1hSn8BzqwzWAzHGx2q7tFBoeIL3q5ecarz9SG7GwrWiut
         moNFoZSF3uVuBz2D56yIrYyiRbw31A7i0Z7PyQ5/qt8IZVsZQMC2kcj4JQgsqxm/q0/3
         cf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iuPSYgzTIlMyDGzehdK7/z8w8X0z+If2BgHEIifEQvk=;
        b=dXsi1I6mTy7R0YatjVPlloL0YVEIQMR80gX3AlOFm2MZvS8kJ1IMyVEgem4Ec/GRZW
         OuDOFwb0rOAkudd9wiDHfiZwK8l8O7ROboeQBDYgjwUcqRQ7JDcKdhuCEYfWpfT9CUV8
         8/O1ddubGKvSctInZflgQdxKHMNI4Wv075smpKeFHU2T5oukrBfa2zWggacamN4DtbMF
         1YdLXVSL25SujoY/4RQA8LCpAwXyjDWW5Qf3YbhTOV2Bg6dguJAcHfc2+XR9UkLBS2Ls
         RbgbVw2+fYJDvuRn4P7Wcaff5ZKqUo1kgCNkqqr+D68+54yRhLJqcl4S9BD4/zprKcJf
         rgXw==
X-Gm-Message-State: AOAM5328pZR8/WZDkWxdyKRopXWNF+Y8EImf1eYg5TGQ3mTPiSCczvUN
        k1PvKrMeT7AdCiLKqpTe6ATK3zC/9XhMp3LDJ+PlyA==
X-Google-Smtp-Source: ABdhPJwLfEGeZ4YffY55vkuPmk1iOWIK2zOfLaU7nlVHQ3/JmmtUDi1cN9GHgdn9ypgpYG37ohSk72uz+A+mKSzjLw0=
X-Received: by 2002:a17:907:9847:: with SMTP id jj7mr15758583ejc.508.1638460110643;
 Thu, 02 Dec 2021 07:48:30 -0800 (PST)
MIME-Version: 1.0
References: <20211202134034.14048-1-brgl@bgdev.pl> <20211202134034.14048-2-brgl@bgdev.pl>
 <YajoPEgfTvuvjqG/@smile.fi.intel.com>
In-Reply-To: <YajoPEgfTvuvjqG/@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Dec 2021 16:48:20 +0100
Message-ID: <CAMRc=MfYKscNMbGqwj6os_SmXhBBqUMWJCwu0K0xO+VZ0vvNfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpiolib: check the 'ngpios' property in core
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

On Thu, Dec 2, 2021 at 4:38 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 02, 2021 at 02:40:34PM +0100, Bartosz Golaszewski wrote:
> > Several drivers read the 'ngpios' device property on their own, but
> > since it's defined as a standard GPIO property in the device tree bindings
> > anyway, it's a good candidate for generalization. If the driver didn't
> > set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> > device's firmware node before bailing out.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> One nit-pick below (you may amend it when applying)
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
> > v3 -> v4:
> > - also make sure we return -EINVAL when the device 'ngpios' property is
> >   set to 0 (thanks Andy!)
> >
> >  drivers/gpio/gpiolib.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index ede8b8a7aa18..bd9b8cb53476 100644
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
> > @@ -646,6 +647,26 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >               goto err_free_dev_name;
> >       }
> >
> > +     /*
> > +      * Try the device properties if the driver didn't supply the number
> > +      * of GPIO lines.
> > +      */
> > +     if (gc->ngpio == 0) {
> > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > +             if (ret == -ENODATA)
> > +                     /*
> > +                      * -ENODATA means that there is no property found and
> > +                      * we want to issue the error message to the user.
> > +                      * Besides that, we want to return different error code
> > +                      * to state that supplied value is not valid.
>
> > +                      * */
>
> First '* ' is not needed.
>

I'll fix it when applying.

Bart
