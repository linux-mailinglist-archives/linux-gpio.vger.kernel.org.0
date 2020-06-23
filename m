Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32044204CF7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 10:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731827AbgFWIuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 04:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731815AbgFWIug (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 04:50:36 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9C7C061755
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 01:50:36 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i3so5286992qtq.13
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y/cIlmiQGFW7vkgx22yAxQ6q0R1TKH8fVp3Z9jLtHCE=;
        b=WYg5PiNkGFNFNcFvVRGdTJteyILQn2nptS9bCOYMnwE+WtWJ007MM1aFQO5500+ZCf
         k7XDFyKgKx4wc55k9QRa5D1IGH+MO2wZujCH0FfNqhPnIIn+Y524vvxGmjWsKiCdNPGl
         gFkZ7Qx0TWQ3lZa89N4Iu0YJ+yEb1t0xAvS94np3zk16yFcxagwGXpPpIphYB+tnQfi9
         VSYvT4mpIxHaJaibpUkPlRDBtR6Plnlb4w5zHz6/Z/4dH2lPohIrTnnfUe1bL081QhED
         Ki8Od93dXAvzZQGRA4gGEL6oks9aSa7YJCZHc02GqNxgrBrC1kcJaGab9HgwUZbpc0wM
         ezUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y/cIlmiQGFW7vkgx22yAxQ6q0R1TKH8fVp3Z9jLtHCE=;
        b=ZmJZAQKBq6Enw8OLelfSKv9EDNfR1kXLEwLBmG6AuVGP8EzGuoJeGvjf/J3S9sqYfx
         bDBkLPfrUvQ88U4wUuBZ5WL4KJgtB37BPg+Ql0+ZnU2Toh+wh2VkLd+7ToQ5mi444Cxu
         Ej6A6XxxpIH6K/JC2pQg4W4OC04mXDQZEiGgS5bX6jvz0HI0clX9MCkmZPowM1dMV+QW
         rGRpwx4P18yIT3bb2SJCovA0wHmUE3lXO7MG0yeeSLcZTXiBh9FozasRWeFWfQrLf2LC
         MreDLDRGi2QaeB3Ln4g8gtyQvzKhCZqXqYD/tan8qF/W0U3i6xQu5LcAtVGChpo/NGOo
         ojAw==
X-Gm-Message-State: AOAM531LbRTA01ae05okVTWSRBvtlYQb/8jxpwXQLEbu30tz9+OfJJgD
        HeTcm3GYtTc3jewKDBVWAm/MmgTN0hTvjpezxutN95t6
X-Google-Smtp-Source: ABdhPJw1r9LEA0YmrFF1idC8wdMqocEjVAPAvtCZnLuEUcAdEm/je/CsSdEV+zck3yFnkB/bicE7kTCPgWTMliYEBb8=
X-Received: by 2002:aed:2a75:: with SMTP id k50mr4736033qtf.27.1592902235814;
 Tue, 23 Jun 2020 01:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200605024919.56177-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200605024919.56177-1-navid.emamdoost@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 23 Jun 2020 10:50:24 +0200
Message-ID: <CAMpxmJU3aivxkjpWQDExnnW_AOF4Unefrb6xgF2fqrzaw-hi0w@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: handle pm_runtime_get_sync failure case
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        smccaman@umn.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 5 cze 2020 o 04:49 Navid Emamdoost <navid.emamdoost@gmail.com> napisa=
=C5=82(a):
>
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put if
> pm_runtime_get_sync fails.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/gpio/gpio-rcar.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 7284473c9fe3..eac1582c70da 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -250,8 +250,10 @@ static int gpio_rcar_request(struct gpio_chip *chip,=
 unsigned offset)
>         int error;
>
>         error =3D pm_runtime_get_sync(p->dev);
> -       if (error < 0)
> +       if (error < 0) {
> +               pm_runtime_put(p->dev);
>                 return error;
> +       }
>
>         error =3D pinctrl_gpio_request(chip->base + offset);
>         if (error)
> --
> 2.17.1
>

Hi Navid!

This doesn't apply to current master. I think the previous version got
applied. Could you please rebase?

Bart
