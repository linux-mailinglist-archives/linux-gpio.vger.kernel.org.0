Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B185179232
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 15:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgCDOVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 09:21:22 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44737 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgCDOVW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2020 09:21:22 -0500
Received: by mail-qk1-f195.google.com with SMTP id f198so1699741qke.11
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2020 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r5iszS1GKjwP6f5iDhFh8bttt7pxV/zShqSEF2kVK4Q=;
        b=a7sGQntUR9Sgsn8Au9WL/jWJnQY6GGGYKHTSWQnJKceIdsUAdvsZ5r73oIrqGadOTd
         W8xy7qofzv+HH1izkwTFepI7sFAQq6pM4/0A0CUO50uwyQeq2AXI86/QrJHhV2C63c+t
         ExeY19ipS8XvGYlEL04U5gdfNiCoR9n4CyM12Y1AxjsXNaAiwRyUY5ZSCqzPP0GBO3HF
         Flrl2mLG3fWQUfrplNHoGhtEdPYVRnOedOGLaXZKJ01LstbpHoAIbmwc5hV8NNBWaxVE
         BY4uVOYUSu8WHUcuwrbrdFEmVjz6ZRLSAwIcVLtuzykoJw7i878gALlN1YsqVQCi6hts
         4GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r5iszS1GKjwP6f5iDhFh8bttt7pxV/zShqSEF2kVK4Q=;
        b=DjG8KAaD39kMESJKWg5LVwbvtJeTQbdPn+ZuSFfNaRTncFwacSaFPZ2TagULel+3Sw
         ZORhKo5z2U4TfQUMlSEyS58ZYWGhCWJA3NK+mEvcwC1xr/GHAs5r+S9QMevPx+Gq0Gkt
         fWij88vPZlfhcDGPM7+nzOSvtkBxN0OMFbK4iwo5/dVW7l6B0Tm+j8t3m1uEIrZnywZR
         JsXB5de2ufNVsowWEgpfAaWLKY+3Y6Yf+SXx6k0AqdMqeggLItmEQFdF0OlmKqB4cBDM
         bsSBDmsVV8fh3I97Qg4b8LsjfBfdYfcPEZB/k50NXnsWbLQNJXBa8f2SUutdZzuwTZkO
         ve8g==
X-Gm-Message-State: ANhLgQ1sgixrtN4nLk4Ve6Q1PvUGXTHuvfq3tevuUaYHOmh8ixv9bk4K
        t65esMidzt6/dwK6k2nT8o3FIExNoPDWQK6XmjyVJQ==
X-Google-Smtp-Source: ADFU+vvCo2Bi+X06RdPhIkWhe9LlwHuaE344y59LIresxbumuLM+IhXulxmwg939HsdUZ3OBj8i08deUKL8/qZ4dELU=
X-Received: by 2002:a37:4808:: with SMTP id v8mr2829758qka.263.1583331681378;
 Wed, 04 Mar 2020 06:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20200303092828.4463-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20200303092828.4463-1-alexander.sverdlin@nokia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Mar 2020 15:21:10 +0100
Message-ID: <CAMpxmJU+_ZtcfTXcwBh1DCWj4Usuwz_ymkgeZT64F24TOdvMXg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Warn when IRQ line has not been configured
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 3 mar 2020 o 10:29 Alexander A Sverdlin
<alexander.sverdlin@nokia.com> napisa=C5=82(a):
>
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>
> Existing (irq < 0) condition is always false because adev->irq has unsign=
ed
> type and contains 0 in case of failed irq_of_parse_and_map(). Up to now a=
ll
> the mapping errors were silently ignored.
>
> Seems that repairing this check would be backwards-incompatible and might
> break the probe() for the implementations without IRQ support. Therefore
> warn the user instead.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/gpio/gpio-pl061.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 5df7782..3439120 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -326,10 +326,8 @@ static int pl061_probe(struct amba_device *adev, con=
st struct amba_id *id)
>
>         writeb(0, pl061->base + GPIOIE); /* disable irqs */
>         irq =3D adev->irq[0];
> -       if (irq < 0) {
> -               dev_err(&adev->dev, "invalid IRQ\n");
> -               return -ENODEV;
> -       }
> +       if (!irq)
> +               dev_warn(&adev->dev, "IRQ support disabled\n");
>         pl061->parent_irq =3D irq;
>
>         girq =3D &pl061->gc.irq;
> --
> 2.4.6
>

What happens later on if irq =3D=3D 0? Does irq_set_irq_wake() fail?

Bart
