Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F0F38CC88
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 19:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbhEURrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 13:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbhEURrj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 13:47:39 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AC8C061574
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 10:46:15 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id n7so4451909vkl.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 10:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SkEvVmINwYubZELrUT2CAhIwBMJX/lCcLqqTvO92lSY=;
        b=f9aZx6E8jIIR5nYx9d/YJX/+u6uNBlgr2xe3NWhvUTwqMUK9UNh+hSElncvK4RTVdW
         Y4bMGIcAVePovVZf3tZguUSINPWI2bINlUuKaEtQUsi/w7G+WJPpL2V51gRp9pufuqid
         4m/ch3YZ6TzKlo5O8U8unhhZe+lrgIlqictdxHkwdJcXw27tWVC1GIHH1z4xXrRZ8eN9
         ja+el01rum/DfWcXvyUO8BD3x5Fx1hXxDk+DhGK1elwO8aP9zFHnAEPAjsE6iYqgI6+8
         JIbyEjelnovYFd3Rm7g0HBdWK1kK3u0P0iOgPIuJH+vVFGaLtQoYAEg0v1JphDtjfShs
         abJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SkEvVmINwYubZELrUT2CAhIwBMJX/lCcLqqTvO92lSY=;
        b=G9bbLPj0kdQeEWPk7l/o6GMCT+RbtfQ66iALbc7722QeaWSTnWOSFRwkpM9d8a/k5J
         lqQm72umTPFcHYFfcBXzB60HyEYjAz+QY0fpwlPguag8qNtBKYb4vD45ocWOqWrXC3Ce
         9LXmHBaI68gskOsxqTp0Or55pcbnezAzfhVoKthru7ZKNGAXM9OcaAKmxSpxsZVGPxNd
         nzi6Vn/Xy8QaMsdqpgutMcO7L9yC6P9krLk4QAoE9/SeZ24xDWGodVsHqDzvpjYK/fJL
         ZNZ1Tm7aasVyRDWqQ+fzbaPZx2g4tj0wwqyezVT2abppSmkbDWGKMRfgrYojrFVnSPaX
         E9Aw==
X-Gm-Message-State: AOAM532eq3Q0WISyrVQBmMMsE528QKaQI3ZmET4fq+aZ63yL6aWqXe8/
        +BLaH8cfHnLrPp+xLnF1AhE1wdob2xaErZTzUOrJ8KfbeuzYZn0C
X-Google-Smtp-Source: ABdhPJz4CBpFHUfT+yqDd2IndBLJfLssD18rbmXPN614JrBwyhtn3U76HjK/SRxbZhQ44l538xeE7tIgf7EOZhWGnvk=
X-Received: by 2002:a1f:5506:: with SMTP id j6mr11944560vkb.7.1621619174763;
 Fri, 21 May 2021 10:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210514094108.28890-1-aardelean@deviqon.com> <CAMpxmJWmc-8cCZ5EQcnBKSAmXPbcVUnX7GdhKgKWFp5i=B6y1w@mail.gmail.com>
In-Reply-To: <CAMpxmJWmc-8cCZ5EQcnBKSAmXPbcVUnX7GdhKgKWFp5i=B6y1w@mail.gmail.com>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Fri, 21 May 2021 20:46:03 +0300
Message-ID: <CAASAkobrt=t0ObR+_nn6g403VAMP3f7uh7VmVDAo7S0PgpLE-A@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-tps68470: remove platform_set_drvdata() +
 cleanup probe
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 May 2021 at 16:52, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Fri, May 14, 2021 at 11:41 AM Alexandru Ardelean
> <aardelean@deviqon.com> wrote:
> >
> > The platform_set_drvdata() call is only useful if we need to retrieve back
> > the private information.
> > Since the driver doesn't do that, it's not useful to have it.
> >
> > If this is removed, we can also just do a direct return on
> > devm_gpiochip_add_data(). We don't need to print that this call failed as
> > there are other ways to log/see this during probe.
> >
> > Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> > ---
> >  drivers/gpio/gpio-tps68470.c | 12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> > index f7f5f770e0fb..423b7bc30ae8 100644
> > --- a/drivers/gpio/gpio-tps68470.c
> > +++ b/drivers/gpio/gpio-tps68470.c
> > @@ -125,7 +125,6 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
> >  static int tps68470_gpio_probe(struct platform_device *pdev)
> >  {
> >         struct tps68470_gpio_data *tps68470_gpio;
> > -       int ret;
> >
> >         tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
> >                                      GFP_KERNEL);
> > @@ -146,16 +145,7 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
> >         tps68470_gpio->gc.base = -1;
> >         tps68470_gpio->gc.parent = &pdev->dev;
> >
> > -       ret = devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc,
> > -                                    tps68470_gpio);
> > -       if (ret < 0) {
> > -               dev_err(&pdev->dev, "Failed to register gpio_chip: %d\n", ret);
> > -               return ret;
> > -       }
> > -
> > -       platform_set_drvdata(pdev, tps68470_gpio);
> > -
> > -       return ret;
> > +       return devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
> >  }
> >
> >  static struct platform_driver tps68470_gpio_driver = {
> > --
> > 2.31.1
> >
>
> Applied. I got confused by the dev_get_drvdata() call earlier in probe
> but this one's for the parent.

Yes.
I initially got confused as well about it.

This pattern seems to be similar in other drivers as well; usually MFD devices.

>
> Thanks,
> Bart
