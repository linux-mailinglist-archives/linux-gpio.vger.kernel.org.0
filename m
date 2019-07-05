Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0DA60320
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 11:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfGEJdY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 05:33:24 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36243 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfGEJdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 05:33:24 -0400
Received: by mail-ot1-f68.google.com with SMTP id r6so8470447oti.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2019 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HROQIJhsY4TQuJdqnfvqx5TwTIiaIY9u98AqrzcTE1U=;
        b=bcXmhFmtX81Q+N9rH9dDCAKUMfDnSZyX8tMy4JwVU0I03xUNM4oWkTkS9xnhR5KGkA
         GOEL35PULJqihGmen0bInboR/NNRs7FKMm8H8jxjc9RbPcEOykxXFZPxMKwBsyptaEF+
         cyucE0b/7d6US6oV2mD0/EP+bXd23muODKzcU6U4dbJKcu9kJoHssSVBeLLElWjn88tJ
         gFAlZkRMo4WThpBknpJ+KmKpDfH805IS5jRqRGDRIiM67O4hAGel/poQQKDv72w1g7Ui
         uTzOUQ7GaKJE82xZtRq4D9/axEvuRRDfI3hGCqeMn+jCX+LXlewpOZLL+4/O6BdmKE+y
         t9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HROQIJhsY4TQuJdqnfvqx5TwTIiaIY9u98AqrzcTE1U=;
        b=Nz+uEWi/JblWx5AHrlNZRIICxlkKDKKI6z+4YS1ufqiy4t/vaWJICVymrhVes1Qf90
         m11hADaplFW2UyoA+z/g1HauCXxop4bDfTS+lExGuT9jT7wdY1UwIybehSEmWQVajmzL
         0hu5fNdiYYAUaBAuI4DYRyfaZU4j2OepEI5BjVyr7CvLopFKKwjvBkIauE2pUAI9zWoo
         QQycgTWQY0lNz2rnsrINzrd3S9zQ6K3d/jRCihUXcNb9m/OmhC4u6ISinW6HKpL4miuo
         WAAOV/BQHVTRlIsaSPAIMGvsHbO9lsseaINhfCCS8nXoDKJOEl/sMlxBLuqDuiJHD3jp
         VQYg==
X-Gm-Message-State: APjAAAUxztihoEtw4ixLXeIFfdEDjanI7+NbNgUf7me1TVzDRmVbO8C1
        dsMMszDlYDL2zn62oSrCbWi3Vldt3wyNobNCdfPvmg==
X-Google-Smtp-Source: APXvYqw/93nr/E5l0p2Rqtw78pD8KO36CuASALI3gbDEnX3dng9qRsUPVaIkDy3GbV4sAr9h6a1SE2DYzahy++A3mqw=
X-Received: by 2002:a9d:2969:: with SMTP id d96mr2138546otb.85.1562319203458;
 Fri, 05 Jul 2019 02:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190705093031.18182-1-michael.wu@vatics.com>
In-Reply-To: <20190705093031.18182-1-michael.wu@vatics.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Jul 2019 11:33:12 +0200
Message-ID: <CAMpxmJUzaEREeUxCu2BCV12Huv7K=yeUSKntA5RGMfOQbnxaFg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix incorrect IRQ requesting of an active-low lineevent
To:     Michael Wu <michael.wu@vatics.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, mvp.kutali@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 5 lip 2019 o 11:30 Michael Wu <michael.wu@vatics.com> napisa=C5=82(a):
>
> When a pin is active-low, logical trigger edge should be inverted
> to match the same interrupt opportunity.
>
> For example, a button pushed trigger falling edge in ACTIVE_HIGH
> case; in ACTIVE_LOW case, the button pushed trigger rising edge.
> For user space the IRQ requesting doesn't need to do any
> modification except to configuring GPIOHANDLE_REQUEST_ACTIVE_LOW.
>
> Signed-off-by: Michael Wu <michael.wu@vatics.com>
> ---
>  drivers/gpio/gpiolib.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e013d417a936..b98466a05091 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -956,9 +956,11 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>         }
>
>         if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
> -               irqflags |=3D IRQF_TRIGGER_RISING;
> +               irqflags |=3D test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
> +                       IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
>         if (eflags & GPIOEVENT_REQUEST_FALLING_EDGE)
> -               irqflags |=3D IRQF_TRIGGER_FALLING;
> +               irqflags |=3D test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
> +                       IRQ_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
>         irqflags |=3D IRQF_ONESHOT;
>
>         INIT_KFIFO(le->events);
> --
> 2.17.1
>

Is this something that causes a bug in user-space? Any scenario to reproduc=
e it?

Bart
