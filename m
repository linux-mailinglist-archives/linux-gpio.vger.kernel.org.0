Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA1123CC2F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 18:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgHEQ3F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 12:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726517AbgHEQ1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 12:27:40 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFA9C00869D
        for <linux-gpio@vger.kernel.org>; Wed,  5 Aug 2020 07:37:20 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id b22so13835581oic.8
        for <linux-gpio@vger.kernel.org>; Wed, 05 Aug 2020 07:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZfGR7TX+hY0XYN0K0cCFtooSUvzoQ4CdQ0DCus6iYU=;
        b=MIPng49GE9voSVEKN0x3+V1t0o0OK7YpbuCjdd9sV5TwYYz2KGhXwU54GHvaCdG7E0
         AMVphO2bHky+41GLDFtTswCVbAKz/EsUf04uYdHLcf6mC+aq2jRL/bIp3HDtI+Ad6rDf
         KfqccxILv4uze96tW29aAEL/T53xWix4ujNvLZHWsax6G8ATCDaYy7r/Sz9JVUHtH6yO
         3E84Ypdcf1zNj7BlauvnBL3fSB5HoNv67t/PTxQANjcluJXQP0oG6cR1lt+Ymc0doCRS
         2IgKH4z2WR+gVsairgnz1LZcwrgFrDiXXNXFU0B5jI6ewpAA4p52tgQiYJwLUfTUtEvA
         nHcw==
X-Gm-Message-State: AOAM5332DyK7/Sg7doEt+PexmVjfUl3IO1zwZ4ORWljXpGf0MstdNAmM
        YdiwVltbXT4DkWOXfcmus8jhiIyZXkAwaRrCPAIC7w==
X-Google-Smtp-Source: ABdhPJwN4sxDuFxlh53JxEDwBl8pjREk/M0bUWZ8VR2IJMQ71SmpAlcchCA4XxLU1sMKPL7QNahQZlA8GQKNvyyCXHs=
X-Received: by 2002:aca:b742:: with SMTP id h63mr2854502oif.148.1596638239868;
 Wed, 05 Aug 2020 07:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com> <20200718212608.65328-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200718212608.65328-3-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 16:37:08 +0200
Message-ID: <CAMuHMdXBmT3zVBVvK8CrKgRmBpnLOgrfzOp3J61fHXP_u0CJ+Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: aggregator: Simplify isrange() by using get_option()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Sat, Jul 18, 2020 at 11:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> We already have a nice helper called get_option() which can be used
> to validate the input format. Simplify isrange() by using it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -64,30 +64,17 @@ static char *get_arg(char **args)
>
>  static bool isrange(const char *s)
>  {
> -       size_t n;
> +       char **args = (char **)&s;
> +       int dummy;
> +       int res;
>
> -       if (IS_ERR_OR_NULL(s))
> +       if (IS_ERR_OR_NULL(s) || *s == '\0')
>                 return false;
>
> -       while (1) {
> -               n = strspn(s, "0123456789");
> -               if (!n)
> -                       return false;
> -
> -               s += n;
> -
> -               switch (*s++) {
> -               case '\0':
> -                       return true;
> -
> -               case '-':
> -               case ',':
> -                       break;
> -
> -               default:
> -                       return false;
> -               }
> -       }
> +       do {
> +               res = get_option(args, &dummy);
> +       } while (res);
> +       return **args == '\0';
>  }

This change makes isrange() return true for all of the following,
although they are not valid ranges:
    -7
    --7
    7-
    7--9

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
