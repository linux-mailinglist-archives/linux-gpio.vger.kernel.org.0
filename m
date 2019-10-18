Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD850DC4DB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 14:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389693AbfJRM2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 08:28:45 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44611 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfJRM2o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 08:28:44 -0400
Received: by mail-oi1-f196.google.com with SMTP id w6so5020776oie.11
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2019 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z5saEV9lETyWEK3ly33oWxhIwKb71eWMfyDB5TVg3z8=;
        b=GcHg3yCmLwYeLH/bbgZbpOmdPM9HO/1haMTnTyJbnEGPHgC9dLBOHqmLuXGEjICxNG
         w13kod5HmTpNWEiS3SlEk45tU8lKG/kb4mf0PU31QQA9VweWatWSur7B1JFoJMELQVRM
         c5SxmfW6+vpwchA7iIoBrsjZKYz1I0BOEdl7V0Dpsoe3WCTRyMglRbbwhN81Gcin2srB
         Us81x5zPf8RrtYeb1D/ZfgfqgkjDCsJmS94dOFhfR8jlMjHrISzYctmGrNgobvOz7C3f
         1dBttqmwua4cYdRzjVKsI9hQTi+KdaWXOxKBLZbRQsUsfpVDK9TEkQxQoqcVQ+SSLoPO
         kfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z5saEV9lETyWEK3ly33oWxhIwKb71eWMfyDB5TVg3z8=;
        b=RFD9FQfV/AgP2P2sFAacQdbsVsfoBxJhNAfncH/XMUWuxYIis7Ok4iICHwsOIYMp8/
         wCe6Y6MXv9Pb9evNN10RnFOCX/kDEfyP4aBBWhVI5KJfK9yTns0WtPN9m/rADlsU0ZiU
         4kiLZgEe9TirAVDtgNOhzfvPhVBcGoQ1Jy/FxJmqMuty14NoZImVmetdNHDiCK/qsE4N
         x/NXCIXo/LtsJbObRZvag9T5pNXCNfGMA4g7xoEDP9W+Ek7guOOfaa3MfujxIYihow/q
         RhjIC2a2pCgPCR0QQn5qUn4qQ0jjy9vpt8XpuMM7GYv5ipLHLIVU1Hl3n8GYQRDkawdh
         jaSw==
X-Gm-Message-State: APjAAAUM3LqXJOFegPQaB3HTSjJt++sA+i6GKBES1FDvMKKOLfuZdTxJ
        JRcR1FK6wrzIgUBCZQYaVKofXuu3FWSGn+vIyCVsjkt3
X-Google-Smtp-Source: APXvYqw9tshjhquBSOhL6qNyoaeY5QKXzRAeQkBk6B3gPNNSMjJBVxUIzQA+fgCrtqxyNaG+yryZaDx6Wr4HiAr7aSU=
X-Received: by 2002:a54:4402:: with SMTP id k2mr7825668oiw.147.1571401722886;
 Fri, 18 Oct 2019 05:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191018100538.9137-1-l.stach@pengutronix.de>
In-Reply-To: <20191018100538.9137-1-l.stach@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 18 Oct 2019 14:28:31 +0200
Message-ID: <CAMpxmJXwW-ZWwv2i8bbhDkdeya7-dqpqm7knAOFem4cYFsKX0Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: don't warn if ignored GPIO flag matches the behavior
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        patchwork-lst@pengutronix.de, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 18 pa=C5=BA 2019 o 12:05 Lucas Stach <l.stach@pengutronix.de> napisa=
=C5=82(a):
>
> Some devicetrees specify the ACTIVE_LOW flag in the fixed regulator GPIO
> handle. While this has always been ignored, it's consistent with the
> behavior of the regulator binding in the absence of the
> "enable-active-high" DT property. It doesn't make much sense to print a
> user visible warning for a configuration which is consistent, so only
> print the warning if the GPIO flag contradicts the behavior dictated by
> by the enable-active-high property.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpio/gpiolib-of.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 1eea2c6c2e1d..0b5383706b91 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -134,18 +134,20 @@ static void of_gpio_flags_quirks(struct device_node=
 *np,
>              (!(strcmp(propname, "enable-gpio") &&
>                 strcmp(propname, "enable-gpios")) &&
>               of_device_is_compatible(np, "regulator-gpio")))) {
> +               bool active_low =3D
> +                       !of_property_read_bool(np, "enable-active-high");
>                 /*
>                  * The regulator GPIO handles are specified such that the
>                  * presence or absence of "enable-active-high" solely con=
trols
>                  * the polarity of the GPIO line. Any phandle flags must
>                  * be actively ignored.
>                  */
> -               if (*flags & OF_GPIO_ACTIVE_LOW) {
> +               if ((*flags & OF_GPIO_ACTIVE_LOW) && !active_low) {
>                         pr_warn("%s GPIO handle specifies active low - ig=
nored\n",
>                                 of_node_full_name(np));
>                         *flags &=3D ~OF_GPIO_ACTIVE_LOW;
>                 }
> -               if (!of_property_read_bool(np, "enable-active-high"))
> +               if (active_low)
>                         *flags |=3D OF_GPIO_ACTIVE_LOW;
>         }
>         /*
> --
> 2.20.1
>

This makes perfect sense, so applied right away.

Bart
