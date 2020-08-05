Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D40E23CBE6
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 18:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgHEP6z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 11:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgHEPtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 11:49:40 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C23C0D941F;
        Wed,  5 Aug 2020 08:16:52 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id j16so4477021ooc.7;
        Wed, 05 Aug 2020 08:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ma8XUemDPSU43scaub//Tj8SjqSjSSXU9X7SXIYVoOU=;
        b=bmU5erMabaHnH11G4ugT3ZM+1sK5m+CgBAaNTNYXbKwghE1JcaTdfyatMzrkN6xRef
         8EyEh25LYHNs4TS3f4pJAkWTp5YFFgNSK3ELo+H/WbG2E9LWM762Cz3tKJiSc6zm3ViG
         J0jnPEFIfMw17vO0s7xuJmbGKFt7L9SS+jsHuGwFpussM36hCV716bIr74P5QdnjImBf
         8PPeWstiKPeXSx2pLUCkb5rOTzSLytHTfDnEKL3NcyLBucMwnutLVMbLhkLp5FTHqF6L
         q5Ay4BPAEamWokIyry1/VbK2ccfvRIu99e/1qHRH5hAewbZ6HLYixM6lDLnZuivkVD+j
         +ncA==
X-Gm-Message-State: AOAM530wFlP+DcDNIcMPIc1IHfgx/k6PtcqyB1SRwDI9Jh/fd5Et9e8T
        sUCF2xXLhgEgbqLyA1GhX/cM4coEDBUUP1k+V88eDJD5
X-Google-Smtp-Source: ABdhPJwe10oto1QkttDyucMJ1qGeA6Wk+Q0uDI4AF3ApXEWocJh2xeIhIPIH+vNM+BYieFqojz9wao5UdxjTIgmcZbQ=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr2827246otn.250.1596636279974;
 Wed, 05 Aug 2020 07:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200728134226.27592-1-trix@redhat.com>
In-Reply-To: <20200728134226.27592-1-trix@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 16:04:28 +0200
Message-ID: <CAMuHMdX-m+q-SYveM2BQyM+EoiQ1ctVviJzjs+UbTzH9cJaqMQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: of: reset name variable in of_gpiochip_add_hog
To:     trix@redhat.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Frank Rowand <frank.rowand@sony.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Tom,

Thanks for your patch!

On Tue, Jul 28, 2020 at 3:42 PM <trix@redhat.com> wrote:
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

This is a false-positive: gpiod_hog() is only called if
of_parse_own_gpio() returned success, in which case it has filled in the
name output parameter.

> So it is necessary to reset name so an old value is
> not mistakenly used by gpiod_hog.

Hence this is not needed.

> Fixes: bc21077e084b ("gpio: of: Extract of_gpiochip_add_hog()")

This is not the commit that introduced the "bug".

> Signed-off-by: Tom Rix <trix@redhat.com>

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

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
