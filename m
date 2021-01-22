Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0783003DE
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbhAVNLT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:11:19 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:43684 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbhAVNLQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:11:16 -0500
Received: by mail-oi1-f171.google.com with SMTP id q25so5880260oij.10
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJnvb0vHQ6Gs5fmNJSrN8qbCxo6Xp8n48rfPn1+Nt6k=;
        b=GGblCYEWBmZjB365f77eaJiyfFMMP2Be3YMQYkQbtchBxU10WNPNgUpw5DcCmYnuRY
         JCffWIUQoDGq3O5r9WOjpII+Bu47rKT8BqAxpACUzXXGuDu9T3mYHvFGOYewnuFc+3gl
         B4/+RNVmzaARrPtu5ZN7faPMAHURW1z9pZ5h4yu88fnigPR2KhvaiK91AZxuLW24+NIi
         5KraQ6M+gvv0Ld5PoWFPBwO6+NY6cPk6+WpruIhbiJxvgIjaYlcDoANDRNevHjxxUWzB
         eInJmOObSvJBjeW6q7cR0Djmpnzl+BLIfUAteGIW9OF5ty8hxi9/SBrLdFxdX0dpSTkG
         2EYQ==
X-Gm-Message-State: AOAM53256EuJbimF5duvFMVvoJFQHyodG06g/UqAjeh2ziU/cejym9ab
        6g+vZU3CNKxKT9I3JrXfRwhNoAIV4YMXEYajzYI=
X-Google-Smtp-Source: ABdhPJw6CMvCbXiN2Iw7bX1RZMIu2c3Yn+m6QS3nBn63vzpFSH+7uv6GEewTNrutDBYnQjfUviUi6fOGzfI6ASMidLU=
X-Received: by 2002:aca:31d5:: with SMTP id x204mr3101980oix.153.1611321028045;
 Fri, 22 Jan 2021 05:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com> <20210122123853.75162-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210122123853.75162-2-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 14:10:17 +0100
Message-ID: <CAMuHMdVxNNh+L-Hz7_QURPCWzGfKd-jTKyQXn2WbMpX4habDSA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] lib/cmdline: Update documentation to reflect behaviour
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andriy,

On Fri, Jan 22, 2021 at 1:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> get_options() API has some tricks to optimize that may be not so obvious
> to the caller. Update documentation to reflect current behaviour.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks for your patch!

> --- a/lib/cmdline.c
> +++ b/lib/cmdline.c
> @@ -83,7 +83,7 @@ EXPORT_SYMBOL(get_option);
>   *     get_options - Parse a string into a list of integers
>   *     @str: String to be parsed
>   *     @nints: size of integer array
> - *     @ints: integer array
> + *     @ints: integer array (must have a room for at least one element)

must have room

>   *
>   *     This function parses a string containing a comma-separated
>   *     list of integers, a hyphen-separated range of _positive_ integers,
> @@ -91,6 +91,11 @@ EXPORT_SYMBOL(get_option);
>   *     full, or when no more numbers can be retrieved from the
>   *     string.
>   *
> + *     Returns:
> + *
> + *     The first element is filled by the amount of the collected numbers

the number of collected integers?

Yes, the lack of articles in RU can be a disadvantage...

> + *     in the range. The rest is what was parsed from the @str.
> + *
>   *     Return value is the character in the string which caused
>   *     the parse to end (typically a null terminator, if @str is
>   *     completely parseable).

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
