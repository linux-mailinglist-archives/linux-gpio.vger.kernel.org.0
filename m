Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B989D4679C0
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 15:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245127AbhLCOzT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 09:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbhLCOzT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 09:55:19 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10059C061751
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 06:51:55 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id w1so12582703edc.6
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v0+2BQWuSC7SZ1X1PqbgajXvS5j6SRgsZxCPp6uaqgI=;
        b=EEn6xcaQJKY8pT73ZXS8zdTkxAyVao9H25NZ61zful3Lp2DI3Cy5dhed8zsvCFfFYp
         xXYiPYgz/96splRtOXOpmytXLF+Tc5qjgew0XBq6K01QP0BEF7BY4lCOCUfy0mEWp7Jr
         rPx30PCMs0IFHr7A/x1KR6SLZPJQh1DQi5F9rlyL1wNEb0kVjgace8G0+oWgTAZqu67n
         5FW1j/DWVJvy9zmBIDbSmfv8AgqeT/MdZsfR9VLRqJXA6hxJ5RZiOXcVNAeKorPJybD4
         KPY8jRqbd9t2RpcUSSPr9uGcCfibkteSopdybUnEVNydWVOI2wXB6A2MvFoXpr4bg9Dl
         j++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v0+2BQWuSC7SZ1X1PqbgajXvS5j6SRgsZxCPp6uaqgI=;
        b=TTF/HlBa1P11lwoOr6Qe38RvYoim61AAGbDb+gQtKtipnzRocSKsA0cbAAGubuux8i
         X6p5wokFGlu/Aw4pFDrzk+iQ4XHY4RxYGl5TwedrNByRnoT10X897P2NHdHtD7A/E9Yi
         InFYX/S/6YzFRV2e1JnvWXqBEffOMPTPBMOg1sg6lr1s8g5kfQbqnByz3C7D81V95Y1q
         lgr7djJoBsvygOgermHXMwutEI+dBkBKkPJUAHSZu7lyIJJSZIzzNQ7Ag6kb9Mtim/cd
         TjmzM9kTmw4AiNY0t3Al04OCbtNyyMsaHUjmvkisXcDzme6rrC/Jg75ewT2tQ0i3hlW5
         MHOg==
X-Gm-Message-State: AOAM532VZ/c+k95NxK5kjixN99ECziV3k3wia7n3i4lgZ/aXQsaqht09
        9okNH5rlGQYrMjU8jHoHC2utc4PVv5IS93lglXspzg==
X-Google-Smtp-Source: ABdhPJyCsYwGEDInt90gwPDtN3JnsLeK0Op8J2SluG63rIhxIyqssW82AWSOhrTaieLgHAmHF20pn+3xzas4ACFu5a0=
X-Received: by 2002:a05:6402:2744:: with SMTP id z4mr27490516edd.310.1638543109410;
 Fri, 03 Dec 2021 06:51:49 -0800 (PST)
MIME-Version: 1.0
References: <6be62f21a1e9bf754e37f130d62870698b88a11c.1638539208.git.geert+renesas@glider.be>
In-Reply-To: <6be62f21a1e9bf754e37f130d62870698b88a11c.1638539208.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 15:51:38 +0100
Message-ID: <CAMRc=Mf2me=Jv=kM6nkNwPVjYzKg-xWxXtiRRju12OM1nSqpfw@mail.gmail.com>
Subject: Re: [PATCH resend] gpiolib: Let gpiod_add_lookup_table() call gpiod_add_lookup_tables()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 3, 2021 at 2:48 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> This saves 20 bytes on arm32, and 44 bytes on arm64.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Interestingly, making gpiod_add_lookup_table() a static inline function
> in <linux/gpio/machine.h> instead would increase the caller's code size
> by 68 bytes on arm32...
> ---
>  drivers/gpio/gpiolib.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index abfbf546d1599ebc..85168f88a7fec774 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3487,11 +3487,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
>   */
>  void gpiod_add_lookup_table(struct gpiod_lookup_table *table)
>  {
> -       mutex_lock(&gpio_lookup_lock);
> -
> -       list_add_tail(&table->list, &gpio_lookup_list);
> -
> -       mutex_unlock(&gpio_lookup_lock);
> +       gpiod_add_lookup_tables(&table, 1);
>  }
>  EXPORT_SYMBOL_GPL(gpiod_add_lookup_table);
>
> --
> 2.25.1
>

Applied, thanks!

Bart
