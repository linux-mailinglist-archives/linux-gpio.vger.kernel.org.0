Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1003E1518A3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 11:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgBDKN4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 05:13:56 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38336 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgBDKN4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 05:13:56 -0500
Received: by mail-qk1-f193.google.com with SMTP id 21so240463qki.5
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 02:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/OmUGIvaQb9Uv8wXS+U/nOoZbtIeQjrWvcPoE8LQKys=;
        b=lE90fGNeNZlYffihiymjp+CIVPE140qXhzVNDlD4CY96NdUDGVla63HH1RTMeVSPOt
         zdGxZy2fYPolO84vJF4pkzKp6qFU8ePFuemyyhHq0eBXtFQTXw3va7tniDmy6WRySrnk
         /J2Ll36rovMpTkJamgbEMjqyR5vjeh2N+tQU3xiMqtqZW68LLdOm/bQSax4VsVuflzxc
         JstrrJqs3ajDW2A4Cwq/73VhrU0SvZyrdxiY9sk+EZhcCd54XkddB8ODe5g5ohcf3SRm
         7N/e2uBo7CAT6b0TGfOIBJ7zjZeS86AKmwyh3FE2V1Q6dRe/XL0GJYqrdG16wiRUpidx
         T8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/OmUGIvaQb9Uv8wXS+U/nOoZbtIeQjrWvcPoE8LQKys=;
        b=sIejTd8csPwkgvnzK0NXlDwhGTj4aVJr6siNmShn4zMErWZCwHgCviQ17Es7N6VVVo
         vGwGWevA6TT1h/JdvCtfMemqBj35ZtqKcC1eYTY+kmzE7JCor5QkLZJcN5l72J9MWIZZ
         7xM+YkPjGiNRB4Lvb4SFpQyn+QofWVejmVf5u4S4kbFcimRcss6f0ufa9QBr+MwRpJwR
         WHr4CwakzIUCweVLxnavUuM6fj5IcWZ/58g3aRRjXyXbSeBwZRwXULAlYD8dNRunmXCG
         PrBMrL1jl4Y5l7/rFgq9YPF42FqBpeHwjrIt0pmRRxsKemN+R7qMjBubjyNVLLme5wFm
         eJDg==
X-Gm-Message-State: APjAAAV/Vuynqacg6GyacSk/ILU4ovABlXDwmsMhe7VqB/u3qnhNOcWZ
        5X07hn/mp0Ml7p6fCVPgopFnGUOCesbGvUsdPm6gQg==
X-Google-Smtp-Source: APXvYqxusDUOGf7EAio/6WaiWOL3Jwf0uUKX6apnrP03VDouhia9JSFw1LetFwos8sSaTee5LhWyUxO1JiXRmzVyW1g=
X-Received: by 2002:a05:620a:11ba:: with SMTP id c26mr27339140qkk.323.1580811235278;
 Tue, 04 Feb 2020 02:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20200128210845.332679-1-lkundrak@v3.sk>
In-Reply-To: <20200128210845.332679-1-lkundrak@v3.sk>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Feb 2020 11:13:44 +0100
Message-ID: <CAMpxmJUPcackGYLfX83TT1V9x2=iHgnw3cZ=KufuHn9FeKOn_A@mail.gmail.com>
Subject: Re: [PATCH] gpio: pxa: Avoid a warning when gpio0 and gpio1 IRQS are
 not there
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 28 sty 2020 o 22:08 Lubomir Rintel <lkundrak@v3.sk> napisa=C5=82(a):
>
> Not all platforms use those. Let's use
> platform_get_irq_byname_optional() instead platform_get_irq_byname() so
> that we avoid a useless warning:
>
>   [    1.359455] pxa-gpio d4019000.gpio: IRQ gpio0 not found
>   [    1.359583] pxa-gpio d4019000.gpio: IRQ gpio1 not found
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  drivers/gpio/gpio-pxa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index 9888b62f37afb..567742d962aef 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -652,8 +652,8 @@ static int pxa_gpio_probe(struct platform_device *pde=
v)
>         if (!pchip->irqdomain)
>                 return -ENOMEM;
>
> -       irq0 =3D platform_get_irq_byname(pdev, "gpio0");
> -       irq1 =3D platform_get_irq_byname(pdev, "gpio1");
> +       irq0 =3D platform_get_irq_byname_optional(pdev, "gpio0");
> +       irq1 =3D platform_get_irq_byname_optional(pdev, "gpio1");
>         irq_mux =3D platform_get_irq_byname(pdev, "gpio_mux");
>         if ((irq0 > 0 && irq1 <=3D 0) || (irq0 <=3D 0 && irq1 > 0)
>                 || (irq_mux <=3D 0))
> --
> 2.24.1
>

Patch applied. Thanks!

Bartosz
