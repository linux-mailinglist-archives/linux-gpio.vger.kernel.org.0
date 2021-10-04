Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D741F4210B5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 15:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhJDNvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 09:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237765AbhJDNvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 09:51:40 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B11FC07AE7A;
        Mon,  4 Oct 2021 06:23:19 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id v18so63742612edc.11;
        Mon, 04 Oct 2021 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SgYt949aZNQnDjDSm/7k761HHJhJOPWZR30o9Zy8p+g=;
        b=PmlLfeTqBn5CPTR2/GuwESNit7xO6PYglZyMZ4jFS+vbDlU26z9OJtG5toU/kine9K
         kLHFFE0fqBVz0SzDG6Z/yn+gVrvVeJLEgezV2/+xcBRZsjnlbBADgqg8JNc7zBMzsa/k
         Fuy5MqY6zvXjmvhCctM3X4i4UsI0nHmhajnd6YvsggOZn2cgxuKyEV9sxI1plWajPKff
         Sq8IOLcTQkHaFVYtE4MROmDeva/uZyoR7LNxzvz4qo7cm7VXUJnv1dH5i2fIM69cqIRa
         nz96fVIB4FDJPVcy7be4XxfDJ1Yhi6Nus0++dbOJwoH49L5T38qS+xqOJYEHjajKKQwV
         xPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SgYt949aZNQnDjDSm/7k761HHJhJOPWZR30o9Zy8p+g=;
        b=0wEZ19do4q0g30QGrUjEXkauSDlxb9xRKBnkc0E+/XxeKwJE+uww2o9AAoRx3z/82J
         s+4H8cbsc7rXB0tVTip4zVI99S67jsuofe6Id8JJaMKmamL6l3qad4TfTsRt3U+fzzF0
         UhHNi7/FsNttBJhnU+WEMtPsW2sDYvPJKA6E0phLd1hH7ikadHapoYK+O1XNlEpc8qes
         qZTYGXryp99je91Ougkk9bchfjSsrqgi/TSkTKa/1D46aoQ97jzk3xlvNJPaU5PYFWFt
         xplfa9PWVQTfSDB+510rkc2W6nt2lM0Tiikzf2kYsZhetMiMqsmgTRFsZ3M7ofSqQt2k
         McnQ==
X-Gm-Message-State: AOAM532GFfxgmjEcImbLA7+sdiLBkWDkzLXBRb/3Wl/ZmiISbg+npvcO
        Z+7fyI0YmbMHUT5KdxD3gGawpDwjlgBPtPV805w=
X-Google-Smtp-Source: ABdhPJxrFL6zXCs0m9UnE5kBHZIIjyQm6iIAm/c8N4bmqBQgxC0Es9Ls5FTysKz6s7XfddZ3Z0bzWjWCc4GJ/vunHjA=
X-Received: by 2002:a17:907:2855:: with SMTP id el21mr17525279ejc.141.1633353774409;
 Mon, 04 Oct 2021 06:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <a9af5139b6b8eb687495ffae69d32acd305ac2f3.1633351482.git.geert+renesas@glider.be>
In-Reply-To: <a9af5139b6b8eb687495ffae69d32acd305ac2f3.1633351482.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 4 Oct 2021 16:22:17 +0300
Message-ID: <CAHp75Vf-sRz2WMTa2SUfPr0LRnWYb=29WjcjB9rmV9Ty9WJ8zA@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: Wrap access to gpiochip_fwd.tmp[]
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 4, 2021 at 3:47 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The tmp[] member of the gpiochip_fwd structure is used to store both the
> temporary values bitmap and the desc pointers for operations on multiple
> GPIOs.  As both are arrays with sizes unknown at compile-time, accessing
> them requires offset calculations, which are currently duplicated in
> gpio_fwd_get_multiple() and gpio_fwd_set_multiple().
>
> Introduce (a) accessors for both arrays and (b) a macro to calculate the
> needed storage size.  This confines the layout of the tmp[] member into
> a single spot, to ease maintenance.

...

> +#define fwd_tmp_descs(fwd)     (void *)&(fwd)->tmp[BITS_TO_LONGS((fwd)->chip.ngpio)]
> +
> +#define fwd_tmp_size(ngpios)   (BITS_TO_LONGS((ngpios)) + (ngpios))

...

> -       fwd = devm_kzalloc(dev, struct_size(fwd, tmp,
> -                          BITS_TO_LONGS(ngpios) + ngpios), GFP_KERNEL);
> +       fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
> +                          GFP_KERNEL);

Shouldn't we rather use devm_bitmap_zalloc() / bitmap_free()?

>         if (!fwd)
>                 return ERR_PTR(-ENOMEM);


-- 
With Best Regards,
Andy Shevchenko
