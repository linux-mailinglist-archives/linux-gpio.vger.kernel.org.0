Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 357FEEE43F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbfKDPum (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:50:42 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43679 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDPum (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:50:42 -0500
Received: by mail-ot1-f67.google.com with SMTP id l14so451088oti.10
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qgd1UJFQkweovlaiJamyJ/Ta+NwAbYv69j4GTr5sQ1Q=;
        b=vkE/ofR4dmVHfr4TywjVPTFMm+gMxFQPM+4kmbmmuxMAP/FisPEk67R53Tutai+B6l
         +sTilsCmQSXIn9kUfFz4kiKsSD0gyZuGH6pHu5w4qsVplZaUc8yqAnYHDrFwl5hujIaZ
         noFc6AVYUm/J49wFIrwCNSsz8OjttfqyOm/+ewmLR/7IWIw+Apnnt1bD6kd0tI2nWZXB
         SjYpTRcCF+7J/HKPojCljpi6RkzjB8j+qoyUJn113g/bDuyhZ1XLpGYYGyIkWgLD/wjq
         RsKSHhqerkF8lZ07NBHlaonDKna0aaGnp9/sOGrv4UdgDYGFZBM9sI2Py5fYWwxifWX2
         3cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qgd1UJFQkweovlaiJamyJ/Ta+NwAbYv69j4GTr5sQ1Q=;
        b=Dm2cOmdIRe1IwBu6b0ttaXgiuvarzSdjI+hkytbHurS/Js4PGme6CNLp+58klAd2IN
         ZaREkLIdt5uSIlIEPLNcO3aIhw9BRZYwJgWyie8LtdLwr48ZwKzHKsvauG3uZXqGW+kO
         wejT2EUVw2K84XqnwxCo8x6aRyJFMXHkLJ7Kme3tvdOH2qmCfB4TY4rMZEgBJJLB0kQN
         JC0f4NRDertqBpdhhUx2a/3NYL8fciQwC4zZiJgi13JaIBvVpinb+PY9OcAeYGaukMbf
         oHXYBWu0nYpay9f32etAUsUwIDhyFuLdugZ+TbyF/Z3yBDleJip4p4B+drXyGc6nBlWT
         4AUg==
X-Gm-Message-State: APjAAAW9FupFGkAYtlgHFF0JFkMEj5WIboR8Hm55E7iMBEWvIlRqWpum
        2aayMYiFT/mioEjoYJay5A/8OkT+YLQBP2WICmDsqg==
X-Google-Smtp-Source: APXvYqwj/0NXi7aMwKxR+jhZeFzg0Lk7AK0MGqds9UDxx8eMfTH1It2XYmkse2Pm72NNsQLl+Ymj9rqRxxXCRL8NGz0=
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr15562769otb.194.1572882641493;
 Mon, 04 Nov 2019 07:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20191104153841.16911-1-warthog618@gmail.com> <20191104153841.16911-5-warthog618@gmail.com>
In-Reply-To: <20191104153841.16911-5-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Nov 2019 16:50:30 +0100
Message-ID: <CAMpxmJUExXZ=ptMyRczvdujc7x9JP62Zy9m+WByYD4=w=1180w@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] gpiolib: add support for biasing output lines
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 4 lis 2019 o 16:39 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Allow pull up/down bias to be set on output lines.
> Use case is for open source or open drain applications where
> internal pull up/down may conflict with external biasing.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 7d8ff52ada42..de08d1a4a3fb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -555,8 +555,9 @@ static int linehandle_create(struct gpio_device *gdev=
, void __user *ip)
>              (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
>                 return -EINVAL;
>
> -       /* Bias flags only allowed for input mode. */
> -       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> +       /* Bias flags only allowed for input or output mode. */
> +       if (!((lflags & GPIOHANDLE_REQUEST_INPUT) ||
> +             (lflags & GPIOHANDLE_REQUEST_OUTPUT)) &&
>             ((lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE) ||
>              (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
>              (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> @@ -3144,6 +3145,9 @@ int gpiod_direction_output(struct gpio_desc *desc, =
int value)
>         }
>
>  set_output_value:
> +       ret =3D gpio_set_bias(gc, desc);
> +       if (ret)
> +               return ret;
>         return gpiod_direction_output_raw_commit(desc, value);

Ugh, I missed one thing here - my for-next branch doesn't contain the
following commit e735244e2cf0 ("gpiolib: don't clear FLAG_IS_OUT when
emulating open-drain/open-source") which happens to modify this
function.

If I provided you with a branch containing it - would it be a lot of
effort on your part to rebase it on top of it? If so - I can do it
myself.

Bart

>  }
>  EXPORT_SYMBOL_GPL(gpiod_direction_output);
> --
> 2.23.0
>
