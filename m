Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1521B2E9375
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 11:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbhADKhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 05:37:17 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:41025 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbhADKhR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 05:37:17 -0500
Received: by mail-ot1-f48.google.com with SMTP id x13so25548008oto.8;
        Mon, 04 Jan 2021 02:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQobp1YZSgBfFcc2U/JI4fMyV/LH2Dew/2DTROwwSdI=;
        b=FpiXyOelkJpPhnNCLa5Fpz7on54yuTGWMV1DYjCVhKAl3O1rTQpEzJ7/7uMZotrbsY
         AJVD7APBshQCjE3YXrFyo9fZREMjkCr+0tItrJhlMNXIzcmkfbIBK1Zp3ioWuC8imDTN
         RecttCWE2VINnO6bnGbIupgRPRKCKzKrWuP0DYyewIIPhXcPM92PxeNcoeh/hhb8now/
         K+1BkLqhdJe84+gGi/ssnc5Y0q2dxn1+vNsB/tGnpHv+5PHG9eZxv2X3+5GdZ3Sx5Zza
         Zmpht+NPTg5gPeQO2g6glPVUMDKrpdFvKkyDrNY3ANJPJSdLON+MBEz6phhCo7l5ag+m
         o3GQ==
X-Gm-Message-State: AOAM533rLDqOfPji6KJl2xjHecNhs36a41e2nXqzpFnGGCMjJubQF93k
        rZ+6qv7gFfbJRquqbTGMt6LfkIghNjpyjv4DcgU=
X-Google-Smtp-Source: ABdhPJyNChEcpd/4Th2nJuUwm0YBaNjtSXdkDzVV3UFJNxT0D3F7zukRzsHMwDkLRI09DZNHpizafws2GzEViQibBe8=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr37111244otr.107.1609756596601;
 Mon, 04 Jan 2021 02:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20201231153141.25525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201231153141.25525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jan 2021 11:36:25 +0100
Message-ID: <CAMuHMdWs2sy9kwbyvw=Xe9rT9vynKb+hzzSSdniosfsiMEpFhA@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Remove redundant compatible values
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Thu, Dec 31, 2020 at 4:31 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The mandatory compatible values 'renesas,rcar-gen{1,2,3}-gpio' have been
> already added to all the respective R-Car Gen{1,2,3} SoC DTSI files,
> remove the redundant device specific values from the driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -392,33 +392,6 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
>
>  static const struct of_device_id gpio_rcar_of_table[] = {
>         {
> -               .compatible = "renesas,gpio-r8a7743",
> -               /* RZ/G1 GPIO is identical to R-Car Gen2. */
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
> -               .compatible = "renesas,gpio-r8a7790",
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
> -               .compatible = "renesas,gpio-r8a7791",
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
> -               .compatible = "renesas,gpio-r8a7792",
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
> -               .compatible = "renesas,gpio-r8a7793",
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
> -               .compatible = "renesas,gpio-r8a7794",
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
> -               .compatible = "renesas,gpio-r8a7795",
> -               /* Gen3 GPIO is identical to Gen2. */
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
> -               .compatible = "renesas,gpio-r8a7796",
> -               /* Gen3 GPIO is identical to Gen2. */
> -               .data = &gpio_rcar_info_gen2,
> -       }, {
>                 .compatible = "renesas,rcar-gen1-gpio",
>                 .data = &gpio_rcar_info_gen1,
>         }, {

The reason the driver matches on these SoC-specific compatible values is
that originally the family-specific compatible values did not exist, and
the device nodes in the initial DTS files thus did not use them.  The
family-specific compatible values were added to the DTS files in v4.15.
However, as this was backported to all v4.14-based R-Car BSP releases
(3.6.0 and later), I think it is safe to apply this.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
