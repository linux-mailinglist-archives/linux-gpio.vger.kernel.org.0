Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AD02311AE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 20:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgG1S1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 14:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbgG1S1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 14:27:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E08C061794;
        Tue, 28 Jul 2020 11:27:44 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id p1so10357068pls.4;
        Tue, 28 Jul 2020 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1cAhV+T2vs/+U8dV/Lde+0qKXpHcbVwHA5qtTwaO+qE=;
        b=Os0L1CDOY6KNC6QU5hdX3+SZ2mDYZ/l1g3X2IFen3J6qllE8qia6IUshH/D0dNtiBb
         cFIBaFKbAyAL+2ZyB6SwDgMGKVfw4LYmTjgypBVUk+Q8am6flWCO5gnyzcaoPIlveGYc
         v0kIQi6eDFO8/SLPxdnB1xbxOmOhD+0MSPPnvHteU2+h854NXwVFor6U9bNPBEuJ0tcW
         zl716jcNFim8Bp35haz4aaUyEvReU1deYUo80Gh9L9lapBrcsgTO1zmsc/Cn495AJfyD
         XeXqt0xIa+cH9+7ospps9a1UprKH5zshMd/jjv1UBFhoppl/r//7hlJtx5vhA3F6uQkh
         mrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1cAhV+T2vs/+U8dV/Lde+0qKXpHcbVwHA5qtTwaO+qE=;
        b=YvODgMSqgdcypIuDLELCKNvNVeufhCvIr6LdtPy6azM1Tt3+7FHpJP2TOyBxSsyo8+
         laPG/mdqIIMBs2PG58/okfAj1cIoqixifPFFBpzybOWa8p1Na6yTDA1qy4dqKRj44jg8
         0jhl6X/yiheq4csbfwE+9UmRJXTFALXsZ7BvewMH7BNMzZKkGhvm9FegwgLn6pLaWwJV
         4mf26uMeNsImzyN5RNdkKPZb5DyQOflDrS2/JKcAbmAuhAUxM4aKHta0V4JPgYkvXdk5
         qSK9m3gYvfTOUZX51U7lRMkTty6/BeMBhvTYQ69zLU9ukbrwHBnFR7YXqeCQiXCwNrpN
         Ep/Q==
X-Gm-Message-State: AOAM5303z7B6mqoSa2VxHvCDa4E3aAVhb3YscCKoANqxSSG0yV7N8NdS
        gGoGK/VyW8xbqX6zlhwSbn4PYaGCgCjXKD/ff6k=
X-Google-Smtp-Source: ABdhPJwq320p5Lo3L6NtVYCg87vSIIhI2nTsTdoJdqF3kWLaPhvIQ021YpSGuUJz0u8dYgmc1U0fD9Tj18gBMPfCTVA=
X-Received: by 2002:a17:90a:498b:: with SMTP id d11mr5987005pjh.129.1595960864133;
 Tue, 28 Jul 2020 11:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200728134226.27592-1-trix@redhat.com>
In-Reply-To: <20200728134226.27592-1-trix@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Jul 2020 21:27:27 +0300
Message-ID: <CAHp75VfLK=SQm7k=Gfj5pvgV9ncjuJkz2A6hJ4YqE6YDEdyyOQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: of: reset name variable in of_gpiochip_add_hog
To:     trix@redhat.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        frank.rowand@sony.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 28, 2020 at 4:44 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this error
>
> gpiolib-of.c:664:9: warning: 2nd function call argument
>   is an uninitialized value [core.CallAndMessage]
>         ret = gpiod_hog(desc, name, lflags, dflags);
>

> name is sometimes set by of_parse_own_gpio
> name is always used by gpiod_hog

It's not clear if it's the output of the analyser.
If so, try to file a bug and fix there how it prints out functions,
should be func().
Otherwise fix in the commit message.

> So it is necessary to reset name so an old value is

the name

> not mistakenly used by gpiod_hog.

gpiod_hog()

> Fixes: bc21077e084b ("gpio: of: Extract of_gpiochip_add_hog()")
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Should be no blank line in between.

> ---
>  drivers/gpio/gpiolib-of.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index bd31dd3b6a75..277ada41d04a 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -657,6 +657,7 @@ static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
>         int ret;
>
>         for (i = 0;; i++) {
> +               name = NULL;
>                 desc = of_parse_own_gpio(hog, chip, i, &name, &lflags, &dflags);
>                 if (IS_ERR(desc))
>                         break;
> --
> 2.18.1
>


-- 
With Best Regards,
Andy Shevchenko
