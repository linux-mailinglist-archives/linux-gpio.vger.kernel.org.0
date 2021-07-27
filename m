Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390643D83C4
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 01:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhG0XPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 19:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbhG0XPj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 19:15:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67916C061757;
        Tue, 27 Jul 2021 16:15:38 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r17so387328lfe.2;
        Tue, 27 Jul 2021 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIJ+KVW6QLPkxmUFt/vZs8q/s59o5S/PRGcj+YzDTD4=;
        b=i7vLKT+bGLiW5/vMeJSuk+5BuC5Wy3gGVWVslg2gQprrd5cNyu+nke3FF64WmGNUlE
         M+fkn7hdPFXHY7XKxqfyb4xHvj37licW7zfkh6QJoa6+kRWp1tYqOnuPyOL86/LBMf9i
         Pn6K7N+gWN8kk3JgZgVwrQrx7gUyWpxkZ8yK2VFYK5TwF40wr4UlVVOheDzKpnH+lMdM
         wVcmTlZfi5Pl8gyK3dMs5F4802pY+YzKYyb8vtA7pYUbLBDfHM4Zo0xOD5JVWbyokUfs
         Pq0bz0E+RpLdnUnufgpIqDOW/pEdf1OUSSm0MXEMr/jXU9F4rNv4PbWlJvd8pA6CZGU2
         hALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIJ+KVW6QLPkxmUFt/vZs8q/s59o5S/PRGcj+YzDTD4=;
        b=bi8tUDYmrLWDsr0iyMRC4WONPidUILcHhFrtKQTTDgQCYwVZAIjwC+pao3q0VpRtNN
         VPV07Jl4ZKT/gw43bea+08/L4SPVkBhNwhPPmQvK2VOz0G9zv+FqtsL6bAA0y8RRk+2k
         9PWIJmhnkmv2nQj21cdSNEngvgCk1yki1pBw/sdjPuDYUw/lJtJ6ZM/naocTgyZppino
         V0x46TwEfC0MqrlH6vRKxqRljg3YebkcWrMZUIfeQGyEv++/WQX3R23Kzwr3/ldIzQri
         MG/7HmOtJDZsu0WxBT2Z+3RuczMaBKys0E6hn/cPuSTliOudnj/jZ9ijfW0zdxA5qxVT
         ngng==
X-Gm-Message-State: AOAM531+whTSA8yao+k7imE+XhIUQhkkX6qQmlt6WCnzYW4+rVXAIDls
        CwPMYncAxZbNjMo1yGF8xwFwGX8krPDiYrv2at4=
X-Google-Smtp-Source: ABdhPJzQkhitpGoeS0R1UVlvigOzqrXxAVhoTtJZ2DYc/dhV8+x6MNA6w8QvBKEOg/vBlpVTq8+/SpEE6jB2prXT92w=
X-Received: by 2002:a05:6512:400b:: with SMTP id br11mr18195956lfb.36.1627427736772;
 Tue, 27 Jul 2021 16:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210727152026.31019-1-sergio.paracuellos@gmail.com> <20210727152026.31019-2-sergio.paracuellos@gmail.com>
In-Reply-To: <20210727152026.31019-2-sergio.paracuellos@gmail.com>
From:   Gregory Fong <gregory.0xf0@gmail.com>
Date:   Tue, 27 Jul 2021 16:15:06 -0700
Message-ID: <CADtm3G5vMnFzxZV2hijZ3daVOgJ=0MnMJmkLyxe0+bNew5g_TA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        f.fainelli@gmail.com, matthias.bgg@gmail.com,
        opensource@vdorst.com, andy.shevchenko@gmail.com,
        git@johnthomson.fastmail.com.au, neil@brown.name, hofrat@osadl.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 8:20 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> The default gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used for example by the gpio-mt7621
> and gpio-brcmstb drivers. To fix these kind of situations driver code
> is forced to fill the names to avoid the gpiolib code to set names
> repeated along the banks. Instead of continue with that antipattern
> fix the gpiolib core function to get expected behaviour for every
> single situation adding a field 'offset' in the gpiochip structure.
> Doing in this way, we can assume this offset will be zero for normal
> driver code where only one gpiochip bank per device is used but
> can be set explicitly in those drivers that really need more than
> one gpiochip.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

One minor comment below, then this looks great:
Reviewed-by: Gregory Fong <gregory.0xf0@gmail.com>

> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/gpio/gpiolib.c      | 32 +++++++++++++++++++++++++++-----
>  include/linux/gpio/driver.h |  4 ++++
>  2 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 27c07108496d..84ed4b73fa3e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -382,10 +382,18 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>         if (count < 0)
>                 return 0;
>
> -       if (count > gdev->ngpio) {
> -               dev_warn(&gdev->dev, "gpio-line-names is length %d but should be at most length %d",
> -                        count, gdev->ngpio);
> -               count = gdev->ngpio;
> +       /*
> +        * When offset is set in the driver side we assume the driver internally
> +        * is using more than one gpiochip per the same device. We have to stop
> +        * setting friendly names if the specified ones with 'gpio-line-names'
> +        * are less than the offset in the device itself. This means all the
> +        * lines are not present for every single pin within all the internal
> +        * gpiochips.
> +        */
> +       if (count <= chip->offset) {
> +               dev_warn(&gdev->dev, "gpio-line-names too short (length %d) cannot map names for the gpiochip at offset %u\n",

nit: there should be some punctuation after "(length %d)", otherwise
with parentheticals removed it reads as

"gpio-line-names too short cannot map names ..."

but we need to provide a space between these thoughts for clarity.  A
comma should be ok:

"gpio-line-names too short (length %d), cannot map names ..."

Best regards,
Gregory
