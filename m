Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1AF50E8FE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 21:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244825AbiDYTEf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 15:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244847AbiDYTEc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 15:04:32 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C716EDB5D
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 12:01:17 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id y3so11093427ejo.12
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GnL+OTbAtl+pPSe3au2E/8UP8cRyfPhVkNfldRiZYhI=;
        b=GR1bOfIuqWQ8Gtnbu6Bo0uJmxXyU7PzJHLGZ5WQkzl2Z8CzNqEbxCTAMctSy4VJrup
         3rcrOmXFATh4EkjxWmBm7FfUSfVzRz30kunr4y6mWHjtCmFO3FlSH+BK2RnIL8kl3KLS
         UcrA5xMYdmxFCAIu0ZMuNcOGtqLvdXZg94Hb9vdCN+SBjzm6VCoaoAfHSgSSqQj1BZj3
         Vky1VNsy3M91W4rpt1XcXWIzwlsiEuqm2wqDwvtiifdL2+CYuVJh5XeZNVSrRHHCHyZ8
         FPTcNorlgbqgDYis12p7d5rHDLTaMxRvgTzrlkB2BRqRbbW4Alc5+5OEFDmElrN3Dk/0
         RZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GnL+OTbAtl+pPSe3au2E/8UP8cRyfPhVkNfldRiZYhI=;
        b=i66z99HDk0IjFllWad+Qk3FTltrO3opbKRdJctrcLTeWnj5H7xz8pDz/16KrwM/Xmu
         h3H6L5wUKk+Fr+vRxx2J+rlUi0Z85K1OZlRuaUSDSadADA9L2JeIAe4rEx+R0Ib+kOq4
         GlnQVPHPEfAKcjJcEHRSahv1z8O3rXchkSsN0T2rXMG6Lqfx4qn+IbaIf/g7nD+nNch+
         TmDV2v4RsAsPik2260U1wbx/KEHsTX3Yh+Tq1VxS23oP95vN2TtoWLiZNXpNwnpdDcLI
         c03cFWAi1vDwOp5wvs9bub3D42x0H0R76du9WLyg+ohRuTvmJ1EEzqvNT0Vniof5AzxX
         Rm+A==
X-Gm-Message-State: AOAM530n9pyqowXUD96YkOnOssuqhBdyEjaxWvue4QEhS6ko7XkWXm0G
        VH4SYUyDYxqcGkjn0b3TcaNcb0MmwcQ+eYRmFuE4rQ==
X-Google-Smtp-Source: ABdhPJy9nZE+sVWwaFNeRUUM6rd/urBRNP3ldhzazH2K5764b4K/SO5/L9sdaogzSvo/iNJJHEPIuN2QSmYWzzJt+Sc=
X-Received: by 2002:a17:907:9719:b0:6f0:14b6:33e9 with SMTP id
 jg25-20020a170907971900b006f014b633e9mr18451177ejc.734.1650913275746; Mon, 25
 Apr 2022 12:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220415070710.220785-1-andrei.lalaev@emlid.com>
In-Reply-To: <20220415070710.220785-1-andrei.lalaev@emlid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 21:01:05 +0200
Message-ID: <CAMRc=Mdc+yKcxJ=Pad=BGDjUC0CHaG4iEkoTxUPaE8V-orfCyQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: of: fix bounds check for 'gpio-reserved-ranges'
To:     Andrei Lalaev <andrei.lalaev@emlid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 15, 2022 at 9:09 AM Andrei Lalaev <andrei.lalaev@emlid.com> wrote:
>
> Gpiolib interprets the elements of "gpio-reserved-ranges" as "start,size"
> because it clears "size" bits starting from the "start" bit in the according
> bitmap. So it has to use "greater" instead of "greater or equal" when performs
> bounds check to make sure that GPIOs are in the available range.
> Previous implementation skipped ranges that include the last GPIO in
> the range.
>
> Fixes: 726cb3ba4969 ("gpiolib: Support 'gpio-reserved-ranges' property")
> Signed-off-by: Andrei Lalaev <andrei.lalaev@emlid.com>
> ---
> I wrote the mail to the maintainers
> (https://lore.kernel.org/linux-gpio/20220412115554.159435-1-andrei.lalaev@emlid.com/T/#u)
> of the questioned DTSes (because I couldn't understand how the maintainers
> interpreted this property), but I haven't received a response.
> Since the questioned DTSes use "gpio-reserved-ranges = <0 4>"
> (i.e., the beginning of the range), this patch doesn't affect these DTSes at all.
> TBH this patch doesn't break any existing DTSes because none of them
> reserve gpios at the end of range.
> ---

Queued for fixes and Cc'ed stable, thanks! I also added the part below
the tags to the commit message as it's important so I don't want to
drop it from history.

Bart

>  drivers/gpio/gpiolib-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index ae1ce319cd78..7e5e51d49d09 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -910,7 +910,7 @@ static void of_gpiochip_init_valid_mask(struct gpio_chip *chip)
>                                            i, &start);
>                 of_property_read_u32_index(np, "gpio-reserved-ranges",
>                                            i + 1, &count);
> -               if (start >= chip->ngpio || start + count >= chip->ngpio)
> +               if (start >= chip->ngpio || start + count > chip->ngpio)
>                         continue;
>
>                 bitmap_clear(chip->valid_mask, start, count);
> --
> 2.25.1
>
