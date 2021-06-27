Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180B63B52BA
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 11:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhF0Jtk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 05:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhF0Jtj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 05:49:39 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20206C061574;
        Sun, 27 Jun 2021 02:47:15 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id o7so8209149vss.5;
        Sun, 27 Jun 2021 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fJzqSCLDcgelRtYPsoSySWliff8JjhFJFwYydmDzvLE=;
        b=akkWWnSP3uyHu0/9Y5bo/PyLARj4i7Aws/JWt/CDSuHr5xVadsG04/MB+1mnP/JxQJ
         8/PjoieKALuMBhhCKArgwe/9RaoXjjMujjY+WUkSBT6L3AGSfJQCd1yll9UcIuGfbIpN
         ZrbV/d81lKjV3uxwBnhoyBQAHLf+7+ELtUBwcDAfYnWd/qKp3DX0FEhr1aoi8Z17iPs7
         typA1YFtsXbNKVfjBDxLQmTsZXc66WpvSKswiew7tR0tWwwuDcEzy6R+HoBTDTplQRug
         23FQrq8CgRXEU3TuUkl/kwIpE45GA93cTbWO6mBTYAxMoogb3kbbfjKwmC5NCW/O/ToN
         fHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fJzqSCLDcgelRtYPsoSySWliff8JjhFJFwYydmDzvLE=;
        b=XJzjR14xe3X/Tw1jKCXq2nibfbr9EU4AQ0A/Ffh1+YYye6UxK7LRNCi7A3eNkV5ynK
         dIWckj6RSOJHhv0rXS0+iOZj1OPInlQ/mgVRNoCCHqaSGd7sBNKGDk52FObpBHfjziux
         0cU3XcXbl9XLaz1UvtpXU9tRW7rxzKUKQ2Rjy7VGfsSXR5qLvebfe21DtsEebGnSXB2M
         ap8Swt5y56R2hjnYKzpGlgrbM5jhZ2E/qo6fbBRRHfIvn4acIy3EM8OxdI//T6mY1uQa
         5V7cnr1q/I8MjAPdIBDDHz4NSNBfIxnENroLnkPqrhRkRlP78bn+RmQH65lkQ5lT1jNB
         wb1w==
X-Gm-Message-State: AOAM532ao7m3NNs9O7VD5K8kJOQRt0rNAwWt62yqjINo5lhlaeQe9otU
        MvijK9NyysfmqwPpQQRt1vYmDSB6ddVXkhvB7BI=
X-Google-Smtp-Source: ABdhPJzQe5zG9prjI0l3CDrM7sOwBKLhtpR+APMkWYyTAhdQxddUfHGyrS5r8NYePCAzppZHcPQCypmgPZPMafpOfw4=
X-Received: by 2002:a67:cb09:: with SMTP id b9mr15027541vsl.49.1624787234819;
 Sun, 27 Jun 2021 02:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com> <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
In-Reply-To: <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 27 Jun 2021 11:47:03 +0200
Message-ID: <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Sun, Jun 27, 2021 at 11:33 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 26, 2021 at 7:18 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > The default handling of the gpio-line-names property by the
> > gpiolib-of implementation does not work with the multiple
> > gpiochip banks per device structure used by the gpio-mt7621
> > driver.
> >
> > This commit adds driver level support for the device tree
> > property so that GPIO lines can be assigned friendly names.
>
>
>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> > Hi,
> >
> > This driver has three gpiochips with 32 gpios each. Core implementation
>
> implementation
>
>
> > got gpio's repeated along each gpio chip if chip.names is not assigned.
> > To avoid this behaviour driver will set this names as empty or
>
> the driver
> these names
>
> > with desired friendly line names. Consider the following sample with
> > minimal entries for the first chip with this patch changes applied:
>
> The same comment as per v1:
>
> Any idea why it's not a duplicate of
> https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
> and why the latter is not called in your case?

The core properly calls this function but not in the way expected.
This driver implements three banks of 32 gpios each internally using
one gpiochip per bank, all of them in the same device. So the core
code you are pointing out here duplicates the same names along the
three gpiochips which is not the expected behaviour. So implementing
in this way and setting names at least reserved avoids the core code
to be run and also avoids the duplication getting expected behaviour
for all the banks and each line friendly name.

Best regards,
    Sergio Paracuellos

>
>
> --
> With Best Regards,
> Andy Shevchenko
