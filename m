Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69618482F89
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 10:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbiACJnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 04:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbiACJnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 04:43:41 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D5DC061785
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 01:43:40 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id m21so134936633edc.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 01:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lTzK8y2sZdFz3nw0haA5lwIMdx2juzh7izt/ICeGVgM=;
        b=FB1tV7RQM7sQzJfcRPNR/keMKuIUy1sf+mv0eGwPZdmmVPQMmzZPo1rOSBf1Af2d/i
         nDfDh25ILugS3uVv7SsMa6qSy/RpjrBMj4Q86wmUCwTty2vYV44Tu9tIGeQbN6plLYDk
         ReKedn4CsKpiNIyDjLJTpJLt8V48ZDUy0sKTzWlhWiEy5Lj5cZt9gJcp8uPJSxdl4eZH
         Uk/zRoPZd5uFW6fmAtj0lNJ46qL8HlYz2pnTaKtQrh5HHwf7dzIsrkQBe9hq+ZGVLhCZ
         pXzXfjcmLFCl3vjfhgoXqbxgeDKaze/TkEuy/JIXcHpgTZ4YBEitHs/82D5A1vO06Oxl
         t/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lTzK8y2sZdFz3nw0haA5lwIMdx2juzh7izt/ICeGVgM=;
        b=DeimrcHzACgfINnuv/xdEXEAmGdTpaLPgAgxxGPe3PRl+t8+yw4etix91GV0w5ary0
         0WkgK/CeW2B5agqweSaHeLvUpmr57qzx+tCyVwsweTkrGWZsn8lBVnQxagn7ZBE/uy59
         aRYyI/Z8Y/4IfdwF4swjokDzvtcn2ZrypB4M9gmE/UqQepATT8sUyiULdZZk873PH34O
         z550Qm1QvqYhcMKCzc0WrpuCPnLmV7m1JaNgcd0BN2Bgi03MXcok6QdZhDm9AH9/HVX8
         +YxGq0hNhCxbqcFWVYimvlDmWrasyMnI36fKXKIY/f3GLETMzgNWh4uI5tmKyvTLSfhT
         RKXg==
X-Gm-Message-State: AOAM530PutX456YbNSfSbyyLl5ftCM2nkOAHp5zlfSh721KKIRxVAgRY
        wT9e9LjDQSd9IdnfxWCRvwQehzvnO7xA7+oHB1tvwQ==
X-Google-Smtp-Source: ABdhPJyVtCS6fJWUtIb8A/66eRuM+ArEzeQDdaU+UeRjv+TDrX3l7jWqIkrd37j4yqnVlNagMqgT6yHfzl9Cx7n55Ls=
X-Received: by 2002:a50:d74e:: with SMTP id i14mr42729606edj.243.1641203019547;
 Mon, 03 Jan 2022 01:43:39 -0800 (PST)
MIME-Version: 1.0
References: <0723049c70dd9c90b30137b704c82db27d0ac4df.1640528330.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <0723049c70dd9c90b30137b704c82db27d0ac4df.1640528330.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Jan 2022 10:43:28 +0100
Message-ID: <CAMRc=MdnFsZ3uQ3c3iN1Qc4fH=-wMKHY4+giTrqVTJuptKjb8Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: max3191x: Use bitmap_free() to free bitmap
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 26, 2021 at 3:19 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> kfree() and bitmap_free() are the same. But using the later is more
> consistent when freeing memory allocated with bitmap_alloc().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpio/gpio-max3191x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
> index 310d1a248cae..51cd6f98d1c7 100644
> --- a/drivers/gpio/gpio-max3191x.c
> +++ b/drivers/gpio/gpio-max3191x.c
> @@ -326,7 +326,7 @@ static void gpiod_set_array_single_value_cansleep(unsigned int ndescs,
>                 bitmap_zero(values, ndescs);
>
>         gpiod_set_array_value_cansleep(ndescs, desc, info, values);
> -       kfree(values);
> +       bitmap_free(values);
>  }
>
>  static struct gpio_descs *devm_gpiod_get_array_optional_count(
> --
> 2.32.0
>

Good point, applied.

Bart
