Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 584599FD59
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2019 10:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfH1Imu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Aug 2019 04:42:50 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43422 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfH1Imu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Aug 2019 04:42:50 -0400
Received: by mail-ot1-f66.google.com with SMTP id e12so1952392otp.10
        for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2019 01:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c8fecw86J07eB4LvzHZSjgLTopCBN6rGZGCm6LT9KYk=;
        b=j8m0k44hNvtBhHkdFNyBM4k4CKNzvYygcr+rqWFYJ/9qSdwDrpwc7MuMmzfPcYrKBy
         eOGx7CFi3DvWmgbY5E6qALmlwiaPqk6g7jdpDauxXx1bACuV2f0Ul7YylmznGzNAxTuz
         re/9Hom6HwxhfVuhBcEOxVAA+j+44xn3Sshls0yD7DB0FPwRbbod2TnJsEiIAnZ2ES/g
         jB4Zu2r0MGVnUTmuT9Ro8ec3ntNRvBq8DVF6MOf6j5JBsFWo80VoLUpY0cxcWfnfvN9H
         d/aS82wmMnHV3jmD0qT81gxlKeB0d0A8PsI8Uf6r8nOokfwN9MBIRAKG1cr3EsIeeqJU
         +aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c8fecw86J07eB4LvzHZSjgLTopCBN6rGZGCm6LT9KYk=;
        b=QH5pfGh6BKxwj/keiHKw+ugP+KFgGI/qwtigioR1u/FU+ZmNRxAwx5AuqTPm0gRbkt
         tUgUwepuHV/yke4ZbtAXrMVpdZ5UJhTWZhOz5vY/X3wol7VAEHofIEivf6d8kWFUJmUM
         bSkgduh/JitlJZwoPGL6hDoMa8fd2S+uV9m9N/G9Ujh3JotPqKX2YCX5JXPc3HZ/aSfz
         nwHFyIjEcXeWXT3DOxQj1vRumMb0dm2JF3HqQq5kDQtoSCh4W/ki7ktLy64yz0uIoCMc
         CClG8x+0+blazz+g8TtybSDsxFbK110ARp/STw5CiIuE6lyKX1rO/TkG4fyByXt62cPf
         tuyA==
X-Gm-Message-State: APjAAAW6RBo1LG61lOzs5Hwdk0+gpje0HAk14le0mcWFy2k7y9EYOyzt
        O2OZ2lf6uQCE7+nvXs4DEkJbgaNZhptd4xg0WaeCNQOT
X-Google-Smtp-Source: APXvYqz33PyKdXoPG0wmO7YgVnqTjlN/YD1cQFqLD8Kfa1u3zVYFk8lWAtdcOvzmZLiWNB/w1vnORI9wF+Q0ecI0HyM=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr2280538oto.250.1566981769311;
 Wed, 28 Aug 2019 01:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190827064629.90214-1-david@protonic.nl> <20190827064629.90214-2-david@protonic.nl>
In-Reply-To: <20190827064629.90214-2-david@protonic.nl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 28 Aug 2019 10:42:38 +0200
Message-ID: <CAMpxmJWyZV48zxwk0bCGV1eSbHvAimi38=vX3xq9qRpQ6ENtCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: pca953x.c: Use pca953x_read_regs instead of regmap_bulk_read
To:     David Jander <david@protonic.nl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 27 sie 2019 o 08:47 David Jander <david@protonic.nl> napisa=C5=82(a):
>
> The register number needs to be translated for chips with more than 8
> ports. This patch fixes a bug causing all chips with more than 8 GPIO pin=
s
> to not work correctly.
>
> Signed-off-by: David Jander <david@protonic.nl>
> ---
>  drivers/gpio/gpio-pca953x.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 30072a570bc2..48fea4c68e8d 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -606,8 +606,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_da=
ta *d)
>         u8 invert_irq_mask[MAX_BANK];
>         u8 reg_direction[MAX_BANK];
>
> -       regmap_bulk_read(chip->regmap, chip->regs->direction, reg_directi=
on,
> -                        NBANK(chip));
> +       pca953x_read_regs(chip, chip->regs->direction, reg_direction);
>
>         if (chip->driver_data & PCA_PCAL) {
>                 /* Enable latch on interrupt-enabled inputs */
> @@ -710,8 +709,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *=
chip, u8 *pending)
>                 return false;
>
>         /* Remove output pins from the equation */
> -       regmap_bulk_read(chip->regmap, chip->regs->direction, reg_directi=
on,
> -                        NBANK(chip));
> +       pca953x_read_regs(chip, chip->regs->direction, reg_direction);
>         for (i =3D 0; i < NBANK(chip); i++)
>                 cur_stat[i] &=3D reg_direction[i];
>
> @@ -789,8 +787,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chi=
p,
>          * interrupt.  We have to rely on the previous read for
>          * this purpose.
>          */
> -       regmap_bulk_read(chip->regmap, chip->regs->direction, reg_directi=
on,
> -                        NBANK(chip));
> +       pca953x_read_regs(chip, chip->regs->direction, reg_direction);
>         for (i =3D 0; i < NBANK(chip); i++)
>                 chip->irq_stat[i] &=3D reg_direction[i];
>         mutex_init(&chip->irq_lock);
> --
> 2.19.1
>

Applied to fixes. Thanks!

Bart
