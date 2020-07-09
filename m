Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D1121A0CC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 15:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgGIN0T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 09:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgGIN0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 09:26:19 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8A5C08C5CE
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 06:26:19 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id e11so1723722qkm.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhJYPz1uJbXILx+BPlJcrxSRAPHiOYjT60/cGxbKCZg=;
        b=c7y4QhjPkpV66ngTeBNl9Y2hniWHjbaGT8OBIVgcA2ardV/MOCVHsDKrTsks8QUzS4
         Ud5l5HQHoajuQYt1dZrza6iR+byPH+kqHgHuf4U3V4FzZZqDalyxE//Ep46mcsXFPzSR
         5cDBdRyXsAm4fQ8gQzSmk5tAgayi02gbt7lG+nOV7cloRKnqkyoQjWrWoISLKIrQgIL0
         BwM9DqET0uBzCtR4TodnzcWDXKa5IUgbisGCrUsmdI2U3BWxBGCvGXkPPzcY/UJSvACP
         W+9rs9NmTskl3Gw3lbFXvSD2Wf1hizE4Wh1lmSUBGrvR0b8Ste0na5qNVKkHU+ubxn5g
         HgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhJYPz1uJbXILx+BPlJcrxSRAPHiOYjT60/cGxbKCZg=;
        b=JtG+K4ERVsGg9cPlBTu3Ryzxosn8ot9E3pSJX2qkleFL3Y2DI4hMoWq5WPEgH+Utkt
         ycporaP2JXhPm6W0FF9Ket6/1HC2Fqe9kLHy0pL4SJzYltBsSCy6Lo4k0Lfcwn/B4kKD
         0kTeIXDFPtd83kJJ94OhgUbnyf6RCpwF/AcHkdzbZJ+ykAMj/4Utq4P+9No8Tz33BAMC
         pZhkw1icdBLeUISIzCmTCMAwsFTX4Ey7L43G1gpQyaJagsYOt9Fcpt/mXy97jPiSjApm
         MnMcdlLNys+N0RKhutff2wH24eZ86S76QD69ezVTgGnMIVDNxMOQUwF1zl+bMjnjflSp
         AtUA==
X-Gm-Message-State: AOAM533fHDd9HW58JqfJwPiYaIBiSL4BqEZJL6pEUgM+5flKTkbwrWls
        ExO1ieTLdSo7lYxs5fetcdIoiiitWIP39zGmpsU/gg==
X-Google-Smtp-Source: ABdhPJzSIJ1h12fJfWEydHi4GCal9DZ7wiIwzZwHZ+kXeX0jYRPoxuiJuoalIV7xxnnDrZ8elYAXgUH3Hg3V+L2D17M=
X-Received: by 2002:a37:9c81:: with SMTP id f123mr58078590qke.21.1594301178286;
 Thu, 09 Jul 2020 06:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <5f049035.1c69fb81.15cb1.53fdSMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <5f049035.1c69fb81.15cb1.53fdSMTPIN_ADDED_MISSING@mx.google.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 9 Jul 2020 15:26:07 +0200
Message-ID: <CAMpxmJWDiF+x5YzYcgcQgH9C6U3rpZLex19UGFAAj7Dh-+BA=Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Add some warn print for easier to debug
To:     mnlife <mnlife@foxmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 5:09 PM mnlife <mnlife@foxmail.com> wrote:
>
>   when I get gpiod optional failed, I am confused for a long time.
> finally I find out that because of the string con_id is too long,
> prop_name is truncated.
>
> Signed-off-by: mnlife <mnlife@foxmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index ccc449df3792..11740f292420 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -467,15 +467,20 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
>         enum of_gpio_flags of_flags;
>         struct gpio_desc *desc;
>         unsigned int i;
> +       int size;
>
>         /* Try GPIO property "foo-gpios" and "foo-gpio" */
>         for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
>                 if (con_id)
> -                       snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
> -                                gpio_suffixes[i]);
> +                       size = snprintf(prop_name, sizeof(prop_name), "%s-%s",
> +                                       con_id, gpio_suffixes[i]);
>                 else
> -                       snprintf(prop_name, sizeof(prop_name), "%s",
> -                                gpio_suffixes[i]);
> +                       size = snprintf(prop_name, sizeof(prop_name), "%s",
> +                                       gpio_suffixes[i]);
> +
> +               if (size >= sizeof(prop_name))
> +                       dev_warn(dev, "prop_name %s is truncated with size %d\n",
> +                                prop_name, size);
>
>                 desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
>                                                 &of_flags);
> --
> 2.17.1
>

To me this isn't a reason for a warning. If anything, this should
simply be documented (if it's not already).

Bart
