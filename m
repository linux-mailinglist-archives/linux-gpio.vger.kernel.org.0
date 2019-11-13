Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046EDFB0CA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 13:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfKMMuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 07:50:17 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42062 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfKMMuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 07:50:17 -0500
Received: by mail-ot1-f66.google.com with SMTP id b16so1472993otk.9
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xKNQ7v4yv1nHmpKbLcQIzTqXHeIHYPJhDQUIafBrUCo=;
        b=LM0vB6+8Ne7H07hxWLkz3Uwzgsdk3gzgJzHbZ37eVIC4oFtORQ85UnfEtJ8FoHHNBE
         s26758Ku8mxiQnVuIuR0QbmkIPWXeKlItB7UE/KWXjFyFQCjxbjHpJCMoXuBK0+vPi9H
         GBut02p0Sjb+QT5pRyEuPPKQAI6iKcUCJbYpsKEfJcoV+dhwmhdwA4WMzoHMFSU3VeCV
         e5OFRB2axfyh7bXT61SNTbdtpbiEgXWtjQLjzgFbSVz/08lIITk6vbIbczOQdmFj6N5j
         Y0yUOsInw4IDVgMsRybL3sOt1q7n8Fktow4YtoJAKUCbsRvXfROnji+TXlSff9JEF3SJ
         +/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xKNQ7v4yv1nHmpKbLcQIzTqXHeIHYPJhDQUIafBrUCo=;
        b=mb21Ifhu2x3bIk7/zKPcSe5yKk6sX2X9xzGNcm3J0Dn8wdG3N7Ao2Bs0+gyF2pTNjG
         F6Pt0Qnroxmfi9t2Wj0WHGv/vEA2GguVXbIZQUvYSS+RTE9s9R88wnCNCDE7twanG10z
         sQOtl3pQHuYFTsMsKF8PKmH2DILRyOur2RzE9XR6lncPysZtEnvYRMmbJmNFQMIj2POk
         1F6Jf23am8LteZEXNXcjWtk7qcSYM0+E5hU2W4Cy2uh4FpBHY1H3K/POdCJPO8x9rBzd
         sTT6bjmP/c0TX54eBb51A9AQq8j1XvkWGnwmZ9ctRNdMsMYqzSKLqsG+BaGVdaYsu6+O
         zNnA==
X-Gm-Message-State: APjAAAWT08SeCnKkhluDSK+314umTRRJQchg/uqojCHGUxXpYFvxxzpq
        LqKbi4anqXphWvQn4zSADJaaa9n5yLzTN5BDPAzInNEw
X-Google-Smtp-Source: APXvYqxVBL98LhQNMDEZ+JCt3DYDZmvFZn/sBaunf1BYMjKSFf+P7kKH1lyOQa8E2L9C+/To/hXUX1yE/Yn5+ZKKqUk=
X-Received: by 2002:a05:6830:453:: with SMTP id d19mr2708443otc.256.1573649416541;
 Wed, 13 Nov 2019 04:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20191113084352.GA25535@localhost.localdomain>
In-Reply-To: <20191113084352.GA25535@localhost.localdomain>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 13 Nov 2019 13:50:05 +0100
Message-ID: <CAMpxmJU3fSa_dUiLs44FKuuTAVTD+_q3WxUX5PCRuvaWCuxKdA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mmio: remove untrue leftover comment
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 13 lis 2019 o 09:44 Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> napisa=C5=82(a):
>
> The comment should have been removed when new GPIO direction
> definitions were taken in use as the function logic was changed. It
> is now perfectly valid and Ok to hit the return from the bottom of
> the direction getting function.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>
> Sorry guys. Just noticed that I should've removed this comment in
> original patch series.
>
>  drivers/gpio/gpio-mmio.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index cd07c948649f..f729e3e9e983 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -386,7 +386,6 @@ static int bgpio_get_dir(struct gpio_chip *gc, unsign=
ed int gpio)
>                 if (!(gc->read_reg(gc->reg_dir_in) & bgpio_line2mask(gc, =
gpio)))
>                         return GPIO_LINE_DIRECTION_OUT;
>
> -       /* This should not happen */
>         return GPIO_LINE_DIRECTION_IN;
>  }
>
>
> base-commit: 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c
> --
> 2.21.0
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =3D]

Queued for v5.5, thanks!

Bartosz
