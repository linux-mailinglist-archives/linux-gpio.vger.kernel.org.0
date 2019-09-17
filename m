Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6DA5B4894
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 09:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfIQHxv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 03:53:51 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45356 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbfIQHxv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 03:53:51 -0400
Received: by mail-oi1-f193.google.com with SMTP id o205so1991790oib.12
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2019 00:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QcHRPwpW+8yu03WYrCCORyeZ//yCfab0bYgPjkXrsRE=;
        b=upicZpLOiFZTDEsI8a8k9fguXRP5CVRWV8SZvfj+wolAjafRjigKxjJ/8xnMzGwd//
         ckj1JriKaeIHqyeqh4R7KiAeYhDuUignz+2UiXskvyFj3zl9gd1s9D8BCxzn4tPO2Knu
         JO7gQqC/O2s4QKXdks7SqO4uc5Di5k3Ed5IuGymBwo1qHVcAZ0M0WDV2P8rhTpyIhxQB
         1JpLnHnbgeHa9xUy1/ebIvSr+UF+Md6l7B18X56/cH5OMpojIhARy4o6EyErYIPbnmFQ
         H5J0Wc1Ver2pSt+8Jg6de1sF6MeOrcJGfH114rM8dRAokY01O9sqmpR+3E1D3KhmX54H
         DaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QcHRPwpW+8yu03WYrCCORyeZ//yCfab0bYgPjkXrsRE=;
        b=H/Dq4RqmgR3WURVknPZkzx9A5hW1hs/IkUJv4aDk9VyMOlnUH+chFGyrQ+AO2kJCbf
         oESkzw/6FFlsqXfJbmN9N2OIHwNjFK2ZIUq1pyoRGKl5O7awgDYksnyQsIrVdloESvuJ
         vn2ZbZnBhYjf36t9k0jpmEKpkpYpa2f8Ng8+jrkV8ir8hwrWsYNzBDGk0FG7j7OD2tDv
         CicSppbVTO4205ej4Ty2dUW8MnhybNfx/U1oNLxnHATtzmDWAmVSyGDOYC7NqUsO32D4
         zSaayURfXaYuruQxD+5sF665xlBAjKkE3Gi5JJchyjN//6PGXBz+r0tCINRIFF7Q/KvD
         M4yA==
X-Gm-Message-State: APjAAAU3XQlpktH4axytBbObyIV2OXMxcqCUn12TrF+ENPp8ntbMsHCm
        6a/r7LlFGsYXcE1iEf2nYPwO3rwO1kjGNq9myKmN1ZWU
X-Google-Smtp-Source: APXvYqwAUcldT7SinPcu1qfInZfvGkEHvomHZqdNxmm0CF4ALjKDbRz03HTOxfHnnqoqkWp3q7CgycGysPFoc3SSNco=
X-Received: by 2002:aca:4e85:: with SMTP id c127mr2646146oib.21.1568706830493;
 Tue, 17 Sep 2019 00:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190916134344.26656-1-m.felsch@pengutronix.de>
In-Reply-To: <20190916134344.26656-1-m.felsch@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 17 Sep 2019 09:53:39 +0200
Message-ID: <CAMpxmJXYPSu85UmsWO2n01+fWBdw-1UeEyi3Z2LOFjNbg+m6kQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix getting nonexclusive gpiods from DT
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>, m.szyprowski@samsung.com,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 16 wrz 2019 o 15:43 Marco Felsch <m.felsch@pengutronix.de> napisa=C5=
=82(a):
>
> Since commit ec757001c818 ("gpio: Enable nonexclusive gpiods from DT
> nodes") we are able to get GPIOD_FLAGS_BIT_NONEXCLUSIVE marked gpios.
> Currently the gpiolib uses the wrong flags variable for the check. We
> need to check the gpiod_flags instead of the of_gpio_flags else we
> return -EBUSY for GPIOD_FLAGS_BIT_NONEXCLUSIVE marked and requested
> gpiod's.
>
> Fixes: ec757001c818 gpio: Enable nonexclusive gpiods from DT nodes
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d9074191edef..e4203c1eb869 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4303,7 +4303,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct dev=
ice_node *node,
>         transitory =3D flags & OF_GPIO_TRANSITORY;
>
>         ret =3D gpiod_request(desc, label);
> -       if (ret =3D=3D -EBUSY && (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
> +       if (ret =3D=3D -EBUSY && (dflags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
>                 return desc;
>         if (ret)
>                 return ERR_PTR(ret);
> --
> 2.20.1
>

Queued for fixes, thanks.

Bart
