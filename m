Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA7B3CB40F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 10:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237231AbhGPI0D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 04:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237066AbhGPI0D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 04:26:03 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF63C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:23:07 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id g5so13529604ybu.10
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8a6AkXVjruO4FopbD7cHdtONk9UyC2A2GgPb32Yiq2E=;
        b=ZyTpCioA2DTmHFDHMTeg+FDlIifHUOyH1dhaAD7YXIVlYWBj9a129+cVJjBASRhXWx
         hZfemjGYHpesM8Ijj1DaOSySJeuoRhoS1KRnhHLxVbqqfA606bRO5uSEKuZ4T62U2Cez
         5UEEMynahddp6D6SxJWAXHlaCyT0WefknrwGpKdS1oB+PQ/yxs/Qe2PCStdnT1V850f1
         3o9KVddg7bHqvKZTFwCdudkaaWHNwqEkAtB+2QtNfiMyRPEmVWWUajbF1/pK9UkPczmS
         6aVvI1XVBMqcJZTE8lIBf/1uisnzhjbczD03PMkkP3gaVnHyVAbWMTJZA9dYNr3dg0b0
         i5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8a6AkXVjruO4FopbD7cHdtONk9UyC2A2GgPb32Yiq2E=;
        b=baGM5QAiBApPCsx3XogJ4oXRZkcL3KA6wwY34QfwHQA6R7ZTMLnU0Hs6Dhhapr8PZs
         emBQZ/oem+3mw5OkKSoaluYhgWcdqHHwB8j/AeG2RAiGg38yGogry80tJ3D7PPAWWyZG
         80f5nmRyUEUctV3jA7EVqrZ3nXDBkbEUyyulKAL7HcpMockjaTPdwqkqlHaPdTqTFL27
         3Q2KhxR1pC6sNAKd2xI5hareXCe61bE2eJ9KGv/FtSNCR67ZYAPZA3rmGCoFuX5jN4GV
         +XM0H8SZqtvRoR0/Sa2KzCzZlREU04rnIioxFK+muqAgGGIjxVAAiAJT905akS1NaZEd
         yXPQ==
X-Gm-Message-State: AOAM532009fduPXQo78IqFrpLCjZNRvqMxRiEsn0cV2E7hycNyoYS2hR
        CPyIq9Zm0tN0cqL2tdJle6gktseB9JH9arffbiYxPA==
X-Google-Smtp-Source: ABdhPJzu+0d2Cbw/zzMuzSs+c+OMw6PcwRDsAT8hBiLNMt+8KNaxtsaoxUs97RmRwzLmXGMQ6nIgZdG3Ga1wVL8hLq0=
X-Received: by 2002:a25:487:: with SMTP id 129mr11526735ybe.0.1626423786876;
 Fri, 16 Jul 2021 01:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <c2d40c6934507ee694be43cda24387a1feef7b10.1626267044.git.geert+renesas@glider.be>
In-Reply-To: <c2d40c6934507ee694be43cda24387a1feef7b10.1626267044.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 16 Jul 2021 10:22:56 +0200
Message-ID: <CAMpxmJU8kb-ad8KHqvP8F-kzq89jv_jUVZSAt6Uz1+X4Lntx8g@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Always use local variable dev in gpio_rcar_probe()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 14, 2021 at 2:51 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> As we have already have a pointer to the device structure in a local
> variable in gpio_rcar_probe(), we can just use "dev" instead of
> "p->dev".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpio/gpio-rcar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index e7092d5fe700d2ce..ae1ffb2b230d4a32 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -564,9 +564,9 @@ static int gpio_rcar_probe(struct platform_device *pdev)
>         }
>
>         if (p->info.has_inen) {
> -               pm_runtime_get_sync(p->dev);
> +               pm_runtime_get_sync(dev);
>                 gpio_rcar_enable_inputs(p);
> -               pm_runtime_put(p->dev);
> +               pm_runtime_put(dev);
>         }
>
>         dev_info(dev, "driving %d GPIOs\n", npins);
> --
> 2.25.1
>

Applied, thanks!

Bart
