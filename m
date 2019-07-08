Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E0D61E87
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 14:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730814AbfGHMhA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 08:37:00 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38367 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfGHMhA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 08:37:00 -0400
Received: by mail-oi1-f195.google.com with SMTP id v186so12453837oie.5
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2019 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g+sALRMx3axDPcXHZRFny6DKBCm9LDHQ+6TuqJYb3VA=;
        b=H/CvjME71MktalTFUrkUBLNNXvxjXXjSzQ6LCQxrq4kltLmo7gFhZWI/zGhFWh706y
         CEg5JR10HR0g5rLA+yexfkSHKg7JURdYAJM6IJh1k5Nwy9exQLgJA8wZS6R00kV5tAD8
         hC4zO/iRWp1itRNCxPrGPSl+SougdSUMHAWG+u1nh3Ud1q4pV1B3bMY90uxoww5OsV6Q
         HcmmGZx3TwhtnF+L/dqMsIMfc2CCPqsLwT4OJlYnTUsMYjv2lKktT2H4JfkR3HRHPrzs
         JkbEjse6Q8t7Ra6CsgeuqJKd52X0iwevFk6ENk9KHE993PceVL3d0SysAVVG4Rsw5Wm1
         YrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g+sALRMx3axDPcXHZRFny6DKBCm9LDHQ+6TuqJYb3VA=;
        b=aeqlIYWKOUiqXHBp/n8WIl02+hzfPS68FvJtZpBDdxmjwlQ669ZxXvQd2m61m+AqZi
         QRcNegtUjohcwQ+Mn8DGaYNOwoiFxV5TNEfoLVrnNZ6FpqSUQNOWz3nkCo93/GqGkteE
         oredyhn0AF9bIxdiDlO+qgv5fqKSoSAmoVgZxvBdIGVQkxMQ1Ojt+ayYh5aJJ1piLlxT
         hDtXBpgB4FYw315SKyyfGZZrR882GiNsmo7mUAqgL4FAR92ubKdcEzn5X3KGVNHVPrsX
         sRkyh5PyhXzo/uuVjOiwl/eqKzERTv6MMuoVO/QI9jmNNV3LPNEWvM0IDCm9k1mKsbWD
         P58g==
X-Gm-Message-State: APjAAAXfBUzasG4Tbi8a7YGolmMS6xfpsrxO+3Al2OFet1a9P2I1uign
        900wGr3RBJjyDA7qFzbKAVnDHQQKTY9vzpFYeoqrTg==
X-Google-Smtp-Source: APXvYqyUflSPtdc9XitJfRIqZyQX1NNM41rCZN8kYWPOPj9RAjAOWnZu34JEGgdOEiiBIopc7UvWWVQo/O4kbrc0cKM=
X-Received: by 2002:aca:b06:: with SMTP id 6mr9717816oil.175.1562589419535;
 Mon, 08 Jul 2019 05:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190708084904.18607-1-j-keerthy@ti.com>
In-Reply-To: <20190708084904.18607-1-j-keerthy@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Jul 2019 14:36:48 +0200
Message-ID: <CAMpxmJWbcoK8mvSshONpJT0J0e=eBeRPRhEv=JqUJ1xY8eoqgg@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: silence error prints in case of EPROBE_DEFER
To:     Keerthy <j-keerthy@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 8 lip 2019 o 10:48 Keerthy <j-keerthy@ti.com> napisa=C5=82(a):
>
> Silence error prints in case of EPROBE_DEFER. This avoids
> multiple/duplicate defer prints during boot.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  drivers/gpio/gpio-davinci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index fc494a84a29d..e0b025689625 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -238,8 +238,9 @@ static int davinci_gpio_probe(struct platform_device =
*pdev)
>         for (i =3D 0; i < nirq; i++) {
>                 chips->irqs[i] =3D platform_get_irq(pdev, i);
>                 if (chips->irqs[i] < 0) {
> -                       dev_info(dev, "IRQ not populated, err =3D %d\n",
> -                                chips->irqs[i]);
> +                       if (chips->irqs[i] !=3D -EPROBE_DEFER)
> +                               dev_info(dev, "IRQ not populated, err =3D=
 %d\n",
> +                                        chips->irqs[i]);
>                         return chips->irqs[i];
>                 }
>         }
> --
> 2.17.1
>

Applied to fixes, thanks.

Bart
