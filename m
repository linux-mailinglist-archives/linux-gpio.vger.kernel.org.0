Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2C2298F80
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780904AbgJZOiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:38:14 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37111 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781654AbgJZOhT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:37:19 -0400
Received: by mail-ed1-f68.google.com with SMTP id o18so9584947edq.4
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0hxlzYPKjj+zH3dnj3aWvSleah1C7PIpiFACaCgr7c=;
        b=rQ9/ccLXHUPtUAZ2xnDD7mLELnT26MZFPP7xYnJ5v4o9foN4YZ8xjG7oAjEGDlQuGQ
         MYsPsBRK0P+zBz1d4PF+lBtiwrq4N3meQs4/DdKm73hOFCrl8v1S4hIrL/74W5EbujuH
         Ck2z7+wYTBGbRoAFE/fHq1IlpxG8CLXlsf3j1B6zZ8gBApXn+Wg9PeRYjyCYCXhkz8D0
         hHROehMXSSTRXXjLHVTUvIjy4IJ5gH0yOGAj1/qa6wbnV/bkb0qJ9e+Ap/TlpoOemc41
         4RWNduCbrElSxKigyhhtLvikrweCgXATJRyAN/O84fcDbxXbV67c871v+7S3+yxUxzXw
         JQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0hxlzYPKjj+zH3dnj3aWvSleah1C7PIpiFACaCgr7c=;
        b=r1KBGVhY+anLujapeRKPvOLdfWAwD/pfyqtXvoTQzmaX5CAHRML7jdvkgmO5BLGPAI
         twZasP+3DnsgQywRv2aciERgYLu9Ob84WGl44j1HUe1/Z0+qB2eEEs1cPbckMseLs+/Q
         3rBjvPmkNvP5oxfwblrQ4RPwk+SbsloCDSnI5YzeLC8AChRHkgJK5NS8RxM+TK2p3MGK
         4XaFSC3Ipnzgem3mmne4BW3O3uhmmcliHHzv7jx8nbjKpQPrpzPEuF8EPuQ5xuLBldHT
         iL+UeoJouA/yFowxooyFUjoPKpgaB7I1W/ue3/LgVwnj88NVWqlWRl1GqMaXDHvwsjnN
         xqPA==
X-Gm-Message-State: AOAM5327jzfFTJ5+kMEvwFcuyF9VO5KEEXU8Qy/CVRqoQEcufyk2Xz6G
        R3TLYJE6z4jeU3Aa4okmTRpTKNffLH1rbBWThwSUiNgw4eU=
X-Google-Smtp-Source: ABdhPJxcPlk9QU0N5lReZ0DVOhkbpDmfZHB5JI/rMe5GoENn+qAxs6vE0qW4t1uuwv8MXDCH3FsvRu0YZVCb9iDgTnI=
X-Received: by 2002:a05:6402:943:: with SMTP id h3mr15988054edz.88.1603723035930;
 Mon, 26 Oct 2020 07:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com> <20201022165847.56153-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201022165847.56153-3-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:37:05 +0100
Message-ID: <CAMpxmJWhENX6bEWihp5hFjDnbXz5asdmEpw96_SJdx1v3+U1AA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpiolib: of: Use named item for enum gpiod_flags variable
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>, Linus@black.fi.intel.com,
        Walleij@black.fi.intel.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 6:58 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use named item instead of plain integer for enum gpiod_flags
> to make it clear that even 0 has its own meaning.
>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: no changes
>  drivers/gpio/gpiolib-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2f895a2b8411..892a513b7a64 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -593,7 +593,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
>
>         xlate_flags = 0;
>         *lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
> -       *dflags = 0;
> +       *dflags = GPIOD_ASIS;
>
>         ret = of_property_read_u32(chip_np, "#gpio-cells", &tmp);
>         if (ret)
> --
> 2.28.0
>

This patch doesn't seem to depend on the others in this series so I
applied it to my tree. Let me know if that's not the case. I'll let
you take the ACPI patches.

Bartosz
