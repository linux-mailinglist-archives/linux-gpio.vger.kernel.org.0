Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D8D3003E6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbhAVNOW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:14:22 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:33620 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbhAVNOC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:14:02 -0500
Received: by mail-ot1-f46.google.com with SMTP id 63so5014715oty.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8kHmwLhN0bgOfM/91MGxJRoKdOl21yDcWOvJozOxsg=;
        b=e/zHDvn4U2PAWhaNSZikcaOctI/aYY7VJmcdMA9lF3dbpnPqG1UhYBUoipbrb8iRPv
         PjvHIOb+f58AlTp+946stYgsKnpzkYKRUVpeXS5CYhBHyAgLX4vm9pG1DGYX9epp305n
         untPZoBHOIeBRsN0ALY0fHcL3YoKA0jWoQUCGuleF2KxLUQqGCoz76FFt5UJ36yvp7CE
         UGnrsrd/FWr3m53byFDGS66ITKAAU4PTp01EPuIUBlOQfMmOIESEbOVQOzOtNjvEyoY1
         3drWiR79/3z+RsboSTOgxddXknhodNOAoSdX/mjPVBihNSDlKLhDR64zLlllCtJiHMHI
         JuLw==
X-Gm-Message-State: AOAM533aAkA6R1SIVhrjS314mw/LfuWR3BeR62vkVyirjcW7XIyWVIFK
        GZnvjHfBT7ta/ekn6DRs/KafEydMa5oGmmzj/JW9PCTr
X-Google-Smtp-Source: ABdhPJzFWE7xxwE1m8uswTdNqgUA9CvWzPsghJM6GpI5gUCoTmOiapzaij0aNkL0YPDp1QFprQk4fdx6UwyVfb8bDO0=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr3190117otr.107.1611321201536;
 Fri, 22 Jan 2021 05:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com> <20210122123853.75162-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210122123853.75162-3-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 14:13:10 +0100
Message-ID: <CAMuHMdVekbD0tYsQEVXc6W1OnETziVoFpU9WMgZw5C5ufc+72A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] lib/cmdline: Allow get_options() to take 0 to
 validate the input
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Fri, Jan 22, 2021 at 1:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Allow get_options() to take 0 as a number of integers parameter to validate
> the input.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/lib/cmdline.c
> +++ b/lib/cmdline.c

> @@ -103,15 +106,20 @@ EXPORT_SYMBOL(get_option);
>
>  char *get_options(const char *str, int nints, int *ints)
>  {
> +       bool validate = (nints == 0);
>         int res, i = 1;
>
> -       while (i < nints) {
> -               res = get_option((char **)&str, ints + i);
> +       while (i < nints || validate) {
> +               int *pint = validate ? ints : ints + i;

I think you can use NULL for validation, as per the documentation for
get_option().

> +
> +               res = get_option((char **)&str, pint);
>                 if (res == 0)
>                         break;
>                 if (res == 3) {
> +                       int n = validate ? 0 : nints - i;
>                         int range_nums;
> -                       range_nums = get_range((char **)&str, ints + i, nints - i);
> +
> +                       range_nums = get_range((char **)&str, pint, n);
>                         if (range_nums < 0)
>                                 break;
>                         /*

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
