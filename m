Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61F94563E7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 21:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbhKRUQM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 15:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhKRUQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 15:16:12 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBCBC061574
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 12:13:11 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g14so32342623edb.8
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yfcsLQEcPV0JsHfU07qVfuDHJqM7i+iltNgLWRiMg1k=;
        b=V+OPyhSoe08YXVkmR0afneubAhjj4VTbYsUYS6WjhUYlL5V5lrlsb4or67/Yt1Wfi0
         BkxJXUSgV57M5ivu/ve/JqtD+1qA5VjSjfJO8QaOO0R4d0eFgBD8z2r32uKOSK9d5Gth
         Ha3znWTChGPXe2b35gBDuBnr57IFKXUw4WlUmBg1sf/v6Ul8dmege3Oiu34TxpinrLb0
         SsG3uELtvJ1x6W2Izy41mza7SK6aIgNEwQsT0UdS4b7NeL+wfJWmyzzQdgvtiKtxfjCY
         T1UEjIJu1JMs1IKRIWN45T1sPxH2x70Ol4TU++JBdPaH3MwPh1IhUWCwCdr9wMon6wsu
         p4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yfcsLQEcPV0JsHfU07qVfuDHJqM7i+iltNgLWRiMg1k=;
        b=bNiWgbS0rpFaMYGM1JKIIUcl5DsQDtUcNHSsty9wOW2+b7DHbmgxKNWXKRs6NFLLbI
         HDbYlRLe+L7ZmRzB0UYFPB3ccdrcyFjvFPUkSv0t85oD0PfRJQnk2Ul6mEZ6DZN1Fvag
         FTLxXxZ0O07pEIrz4a0HhE3XRuM44WGrVYlzx2SWh6JYjKGoMuzUDuTlDTBYDXBoo8Yg
         8WvNuvVknEvG2Hzp/bqt0eMXyhIMuKrWum5Tl3aszhupWv5nKit7o0vnRmA1OsGlgtqh
         w0qaIlJafMfcVaJ9itbrqSB3ngG2WDt6lAu2FYCE8ljruheSM7HXOrIq0ArpKujbCB4U
         OElg==
X-Gm-Message-State: AOAM532TefOEwacqa+/O1Yg3f1oBI4bk9Jh7mKlgpyQFCvoopCAkInqv
        L1v9Jd9BZN51wr2NOt5S7o1kx4Pj1fUQiWOmWoeSbRtR3+Kr9j2t
X-Google-Smtp-Source: ABdhPJwbsk04yDg2oy2nZQBz4ntMPLkjIiBSDg0HUVJOTKiMfZVegj6KLZxBktPZRtv5A8GmD4IuDZfIk8vem0tjYXs=
X-Received: by 2002:a17:907:9847:: with SMTP id jj7mr213116ejc.508.1637266390138;
 Thu, 18 Nov 2021 12:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20211118132317.15898-1-brgl@bgdev.pl> <20211118132317.15898-2-brgl@bgdev.pl>
 <YZaH8rsMyUztOX/r@smile.fi.intel.com>
In-Reply-To: <YZaH8rsMyUztOX/r@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 18 Nov 2021 21:12:59 +0100
Message-ID: <CAMRc=MdR_RGLLPJ5Hqetj5_7ZQfUXOijEoVp3uR7cgEDHKnchA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 6:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 18, 2021 at 02:23:17PM +0100, Bartosz Golaszewski wrote:
> > Several drivers read the 'ngpios' device property on their own, but
> > since it's defined as a standard GPIO property in the device tree bindings
> > anyway, it's a good candidate for generalization. If the driver didn't
> > set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> > device's firmware node before bailing out.
>
> ...
>
> >       if (gc->ngpio == 0) {
> > -             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > -             ret = -EINVAL;
> > -             goto err_free_descs;
> > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > +             if (ret) {
> > +                     chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > +                     ret = -EINVAL;
> > +                     goto err_free_descs;
> > +             }
> > +
> > +             gc->ngpio = ngpios;
> >       }
>
> This should be
>
>         if (gc->ngpio == 0) {
>                 ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
>                 if (ret)
>                         return ret;

But device_property_read_u32() returning -ENODATA means there's no
such property, which should actually be converted to -EINVAL as the
caller wanting to create the chip provided invalid configuration - in
this case: a chip with 0 lines. In case of the non-array variant of
read_u32 that's also the only error that can be returned so this bit
looks right to me.

Bart

>
>                 gc->ngpio = ngpios;
>         }
>
>         if (gc->ngpio == 0) {
>                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
>                 ret = -EINVAL;
>                 goto err_free_descs;
>         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
