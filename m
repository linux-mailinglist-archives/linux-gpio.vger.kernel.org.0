Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6140472E78
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 15:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238686AbhLMOEw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 09:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbhLMOEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 09:04:52 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCA7C061574
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 06:04:52 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t5so52137469edd.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yENGFlG/mOG5cGmNIIA+b23W/RE/cf9uRfpXrR8/4dQ=;
        b=EEGwuSUw7KgTFdrREsE0p08UJCb9U9xcTzZnqe1qy2ZvHDQW4qdAtMaB5esySIZdHS
         aT6XAv1eVf+illQxC0x0IAf4UJ/4kRerbkNM8EVySfveme/dHtddZTma0U3Cxi5+8ruI
         xO/uXIlBVyw+m6JgU3/mJUcftiDipTL9IOb9xyvzo8Beberqcgp5bAxTWaNct652FM3S
         1T4leKAEln8nvgkoNVVyojBItwZt1gkRABpxt3SM8t5bVUjX4Uua6F22rl4U6RbsQss+
         pYKD/rLsgGYTGq91AcgLddrsry3htOuvIlLKPOVBTHdcq9DFeZweTUqqzId/2t1MfLy0
         i1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yENGFlG/mOG5cGmNIIA+b23W/RE/cf9uRfpXrR8/4dQ=;
        b=eQSMvvFZSlNsRz3bk+wOfI+9yz/N9ixM5bSI6h9J2HlLdMEuea/RArgyedrxPjVTb7
         or9FGtELANc7vwfeP0GDZfa195XWb7Vv3S61+XdDINlfgvuprIZzkfAxONEcyzxROYSU
         aWZWJXKr1JCMLn2v9FNY36nvss6ibbrJ9POPu3Jh9gpZeaBTjMbn8j8OWHLi9Rqcpjks
         nm6n81gubhXCa+M0enrJpcc26PpPabgtGEWSXQiP+ai2PCAgsPVT2SgjHke78Ffie1aS
         b55VXjMBcbj5z7m3DHDuSmWq7iUtXAvCVQNajwpo0c2pEUzKTzyJYM7PIMegxpuD7wFH
         1b0w==
X-Gm-Message-State: AOAM531pjSbkjzFpgCtjXaw3WkUxlgd7d69J/SKOaVZ1bScAhsU9l4j1
        DG7s+spYwYb0T9+RxlZIQ1oMbNMa9+pL7YdebKF9Bg==
X-Google-Smtp-Source: ABdhPJzhnvPD6hbM84dyyWoCLb2MJSZ/0QUgY6OWiPNIXLB5p3QBA6nKeCUamPgCY4pLxKdEC5KQV41KY7tNgGkH+hY=
X-Received: by 2002:a17:907:7b99:: with SMTP id ne25mr44737768ejc.15.1639404290607;
 Mon, 13 Dec 2021 06:04:50 -0800 (PST)
MIME-Version: 1.0
References: <70b1de02-b674-ca17-9219-61fa8e1c00db@axentia.se>
In-Reply-To: <70b1de02-b674-ca17-9219-61fa8e1c00db@axentia.se>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 15:04:40 +0100
Message-ID: <CAMRc=Me-gjJabw7Q5y+qvytD17JNV-f18YkXT+nUsjOGAw9MqA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: allow line names from device props to override
 driver names
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexander Dahl <ada@thorsis.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 9, 2021 at 12:32 PM Peter Rosin <peda@axentia.se> wrote:
>
> Some gpio providers set names for gpio lines that match the names of
> the pins on the SoC, or variations on that theme. These names are
> generally generic, such as pioC12 in the at91 case. These generic names
> block the possibility to name gpio lines with in device properties
> (i.e. gpio-line-names).
>
> Allow overriding a generic name given by the gpio driver if there is
> a name given to the gpio line using device properties, but leave the
> generic name alone if no better name is available.
>
> However, there is a risk. If user space is depending on the above
> mentioned fixed gpio names, AND there are device properties that
> previously did not reach the surface, the name change might cause
> regressions. But hopefully this stays below the radar...
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/gpio/gpiolib.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> Instead of doing this only for pinctrl-at91.c as in my recent patch [1], do
> it for everyone.
>
> Cheers,
> Peter
>
> [1] https://lore.kernel.org/lkml/4d17866a-d9a4-a3d7-189a-781d18dbea00@axentia.se/
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index abfbf546d159..00a2a689c202 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -422,8 +422,15 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>         if (count > chip->ngpio)
>                 count = chip->ngpio;
>
> -       for (i = 0; i < count; i++)
> -               gdev->descs[i].name = names[chip->offset + i];
> +       for (i = 0; i < count; i++) {
> +               /*
> +                * Allow overriding "fixed" names provided by the gpio
> +                * provider, the "fixed" names are generally generic and less
> +                * informative than the names given in device properties.
> +                */
> +               if (names[chip->offset + i] && names[chip->offset + i][0])
> +                       gdev->descs[i].name = names[chip->offset + i];
> +       }
>
>         kfree(names);
>
> @@ -708,10 +715,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>         INIT_LIST_HEAD(&gdev->pin_ranges);
>  #endif
>
> -       if (gc->names)
> +       if (gc->names) {
>                 ret = gpiochip_set_desc_names(gc);
> -       else
> -               ret = devprop_gpiochip_set_names(gc);
> +               if (ret)
> +                       goto err_remove_from_list;
> +       }
> +       ret = devprop_gpiochip_set_names(gc);
>         if (ret)
>                 goto err_remove_from_list;
>
> --
> 2.20.1
>

Hi Peter,

This looks good, please resend with Andy's comments addressed so that
I can pick it up.

Bart
