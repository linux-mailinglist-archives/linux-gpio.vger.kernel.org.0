Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9FA0557DC8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 16:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiFWOab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 10:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiFWOaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 10:30:30 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B631162
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 07:30:29 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id fd6so26033592edb.5
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3FqgQSdckr3OdNUbYCmdpzsVtzVQYCqYvXjlPe3jt2g=;
        b=K40v64solAooVxeHtoh68eeXXDCpTf4IVCfUdTc3gLmgaD1d+8LG8dd1DcKhsE3U2+
         eltq4RSYfUwYXY78KixRbCIcWlyWKXaPhMLzTepOoxMn1DRa8Da5neE4xN9GoPCexboz
         1nttK+6LN6M4/lVROsOqhNBQ8Je966WVdoIrTPMBmIZHMbcnpxL4NkvEGnONDLle1C3W
         lhlP4J4k3A6YhL6zWlTbhlhKo1VVHwpYs11JEh0XzSIlHO7iCh0PVZVgvBnua2yMpQrE
         l0E2Yc95YNqIyvjYN4fU3WBHC/X8EqooSxI8hVY1NxOunjm1wSvm4Ra7rKtfbHOBH9lX
         rSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3FqgQSdckr3OdNUbYCmdpzsVtzVQYCqYvXjlPe3jt2g=;
        b=EgG/RxzKoYNHhgIYsArha+iDZeqI/F3+qhruh0HvvOjB7E8GYqqgaenD1ypuz2H7on
         mlnH3u4Kq3zzhtpNrqOQeeNzs2aTIaYNfw/l2vcDGwzS/YARvTzbcUMPEpV00cmmrB2j
         8A/VPjjtb3EqoeKqCQ1gWgmwGXlLuQWzFVIAGit1FUJg8UhGN8SNx1rQjdArLwhSG/0O
         2Mdl6OM3T1h6hEG77BN52DKdlqnNC9eGbN4XTUo/4A2tQv9j0T3obCV5DalETqr1slAt
         C+j0kD0vaj3qTEXCW2K6K3goLZGAgfeEuxK1FRHS9fzAab3033UqNz8wsoLq2qCRKlXp
         DLhA==
X-Gm-Message-State: AJIora/XD9FS6f6h78BKpVN8ux+bbwTGybM1VQRS5r5yqEtmvXmbJAme
        NlUsCNorH3McGbB5cqPMOIHYjw4EJ8ynVF9w1wV8dQ==
X-Google-Smtp-Source: AGRyM1s1vCdehuZoBSyt1SZuQzboeTxZY5Ghl6aMY2Vf7vd7oVHFM4kF0yullI0Wj3aV1Bhz4PleNU/GBe4E+Ul7efc=
X-Received: by 2002:aa7:cb94:0:b0:435:9054:db5 with SMTP id
 r20-20020aa7cb94000000b0043590540db5mr11079105edt.29.1655994627724; Thu, 23
 Jun 2022 07:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <YrQkfBuIHArxHSNr@kili>
In-Reply-To: <YrQkfBuIHArxHSNr@kili>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 16:30:17 +0200
Message-ID: <CAMRc=Me95xJspeUkdmKNowWY+Z-r02zDc-CUuQ8xF5taiTxUgQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: winbond: Fix error code in winbond_gpio_get()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 23, 2022 at 10:30 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This error path returns 1, but it should instead propagate the negative
> error code from winbond_sio_enter().
>
> Fixes: a0d65009411c ("gpio: winbond: Add driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpio/gpio-winbond.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
> index 7f8f5b02e31d..4b61d975cc0e 100644
> --- a/drivers/gpio/gpio-winbond.c
> +++ b/drivers/gpio/gpio-winbond.c
> @@ -385,12 +385,13 @@ static int winbond_gpio_get(struct gpio_chip *gc, unsigned int offset)
>         unsigned long *base = gpiochip_get_data(gc);
>         const struct winbond_gpio_info *info;
>         bool val;
> +       int ret;
>
>         winbond_gpio_get_info(&offset, &info);
>
> -       val = winbond_sio_enter(*base);
> -       if (val)
> -               return val;
> +       ret = winbond_sio_enter(*base);
> +       if (ret)
> +               return ret;
>
>         winbond_sio_select_logical(*base, info->dev);
>
> --
> 2.35.1
>

Applied, thanks!

Bart
