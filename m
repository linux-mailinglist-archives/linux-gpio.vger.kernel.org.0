Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907F72CAA73
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 19:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392230AbgLASEN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 13:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392229AbgLASEM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 13:04:12 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C473CC0613D4
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 10:03:25 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id c7so4604436edv.6
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 10:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TgW1FQnuQrgiK+Z/NzD7lu4StuId76dlqMcpFgHdPgE=;
        b=SX8R2HCj3E6TK16HzCLIiiaA/lc8URSZ25p/usXodYxou4SmJ+kvSZ4vkMYQzIe6qU
         WEEwaGi/fmyr9BZUFkvUWvir11iQ+vawxaX8QlmopOlfLEM0qqzqgZiXBBFuV33VyYI1
         sea4iuAmvUvhJHLhywz4iiPfN4weGnoQFAOQQRDVyNLT0Q610vNiz7p0UuMruJu55Eq7
         /d4e69E9zHAxchZOqomlonhaVnKN0VBCnj+WaBGmt9+f7sbGAXgycv9v78dI9hGHp5ej
         N+EMP8ltrgNhOk8GqbGXqHYFbzWKLHwHW35PzgOfeJHHm7wDvD3HGE/M07QzwSp/90H7
         csbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TgW1FQnuQrgiK+Z/NzD7lu4StuId76dlqMcpFgHdPgE=;
        b=ssJfe/z/BvcSYPMk09y0x2zxRucLGEL8A+NKOnLVLDyp48h3WIPUnfmHanV83fUFpA
         BIeCpR79iX4LME1RD3giyfq1PikCWAAatBGqwW+bP/1h1HRefSppDZLiGrL+b3rw5bvQ
         8HsJi6XBewFyGTAJ6oXmc7F1YoCpGgXsC0Ynqo2K4bhUsF/nFaLcUWmx0BHPpVnJxDRR
         PfF0whLGWwP0AhDY/p/XSo9mPGlRM5jW2U3pQa6yrV3UcQ3foevDs6WRwESga+I5B8uG
         2DyI8rJleOv5ALOQXB/eBJwgJBpN+uHRxaa6xt2FhvxCTD1J/oH7UhYi6l7xZfZj4E7e
         byPw==
X-Gm-Message-State: AOAM532wEXAqdfBBquTvPkPhB/M9oh/+T9EiiH0FyLumOLeaBAyXg/Q5
        98MEdTTNeCveg2ps2cpTnfPyhYAJl7y7vNe07V06eA==
X-Google-Smtp-Source: ABdhPJxDShoJOPz5mzzbK+n0B02t3W2Iny2yhDuMLenzQhQrug6PBpx4se84F5I8VtjhfSjx5LS5bjyhQ24sGAxsOBo=
X-Received: by 2002:aa7:d54b:: with SMTP id u11mr4267700edr.341.1606845804485;
 Tue, 01 Dec 2020 10:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20201118142917.25752-1-grygorii.strashko@ti.com> <69388132-1a81-e222-76fc-5d3b860a2d53@ti.com>
In-Reply-To: <69388132-1a81-e222-76fc-5d3b860a2d53@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Dec 2020 19:03:13 +0100
Message-ID: <CAMpxmJVM3fdcDtTggkk4d7cuPso1B5Vw-YpmTC5sYZBzY=YMmg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: do not print err message for EPROBE_DEFER
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 1, 2020 at 6:16 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
> hi Bartosz, All,
>
> On 18/11/2020 16:29, Grygorii Strashko wrote:
> > The gpiochip may have dependencies from pinmux and so got deferred. Now it
> > will print error message every time -EPROBE_DEFER is returned which is
> > unnecessary:
> >
> > "gpiochip_add_data_with_key: GPIOs 0..31 (gpio-0-31) failed to register, -517"
> >
> > Hence, do suppress error message for -EPROBE_DEFER case.
> >
> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > ---
> >   drivers/gpio/gpiolib.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 089ddcaa9bc6..fd2c503a6aab 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -771,9 +771,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >       ida_free(&gpio_ida, gdev->id);
> >   err_free_gdev:
> >       /* failures here can mean systems won't boot... */
> > -     pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
> > -            gdev->base, gdev->base + gdev->ngpio - 1,
> > -            gc->label ? : "generic", ret);
> > +     if (ret != -EPROBE_DEFER) {
> > +             pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
> > +                    gdev->base, gdev->base + gdev->ngpio - 1,
> > +                    gc->label ? : "generic", ret);
> > +     }
> >       kfree(gdev);
> >       return ret;
> >   }
> >
>
> Any comments for this patch?
>
> Note. Modern dev_err_probe() seems can't be used as gpio_chip->parent is not guaranteed to be set and
> it's not clear if chip_err() still can be used at this stage.
>
> --
> Best regards,
> grygorii

I applied this patch now. We seem to have a patch congestion on the
list - I'm trying to get through unread email but more is coming
everyday. :(

Bartosz
