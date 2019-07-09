Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1959963BE2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 21:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfGIT1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 15:27:10 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37248 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGIT1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 15:27:10 -0400
Received: by mail-io1-f67.google.com with SMTP id q22so23831765iog.4
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2019 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T97Y7Xhc+iNinb7J95m1ClDnpftj8xDW9+inLk5U/ys=;
        b=vA9eHWFFKZzn9UHXFg38aVO/i848nLoffBQU9YEjFhMbM7Nezm1bh2liAketQATXM9
         oFVv5w54Ln9LfK3riZFBO+0ULgKfV2bp6BoFjTeufJdUOv7ch7ndYnhKP1QrX2FnW2GG
         HlcJeWJjtqrZeznsnxFdH/NXF1ml7owpMNnkMK81W23wPNlFQ77YiS3//QEtdH6iQLjp
         Yfc5aU2WKPjXfW04uYI2oZXmyq8VD5ekXN7e9x2p1PR539ix1WNM1DYNiPtrkvb9sQUo
         p8BIFuiCa83cCe2g+XKHFU7/79D2XUs/Ducv1bITj8cS0OeAmKB/Akfm5ejqQEUBcmiL
         VeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T97Y7Xhc+iNinb7J95m1ClDnpftj8xDW9+inLk5U/ys=;
        b=pkC0p3op7+piVKOdSTCzWNQUzYwx3jiOGUUoriumPYyWb1XUIQQCveS/pBb3V+pg6j
         vmf/lySvfLqGNy3GhJvNlJYgarAF+AMAtifVjjDyNFdiwhFkRV5TXTtYF/OBTgYYJeJ1
         bdhefhmGoEY5jrdqRoXjZXi3Mh/t+6s8wtqkWOyGOeWbvr99t521Aup5v/Gi5e0SOsBU
         F9CFvzf+NOpnwoONa9uTtQ3F0lkDgjUpWLz08x0Bbiexv4RyX8x/g2PGKaLr/3Ogwbyc
         ygfDHRfoKzqKclOo4Lf0R/5VEVeZ1DwdCMallVak7KsAZke9B5jBnTq/M04HqodncGEj
         YdQQ==
X-Gm-Message-State: APjAAAVsOVy6VjwWCxjAAxKekwdC9mpHv7vFn32Op8Cgo+9eDRnyewej
        QNCnnEnaGIDHgOGRudHX36QGgy41b5VEwjFVqmM0ew==
X-Google-Smtp-Source: APXvYqxV7yiLjk3v4LoPbcmdRk8c+zTn6LbS+P4RQ9YJ9CNx6wJD13fR3jqidFhcTLiOP8moLpZ9fZSElhLLLP/iTxA=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr26557129iod.220.1562700429190;
 Tue, 09 Jul 2019 12:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190528154601.7597-1-brgl@bgdev.pl> <CAMuHMdV=eVJKVENkLUi1pj7MY8RGwUGZEt=MG4fdfvToZZquNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV=eVJKVENkLUi1pj7MY8RGwUGZEt=MG4fdfvToZZquNQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 9 Jul 2019 21:26:58 +0200
Message-ID: <CAMRc=Mf0--Yc+S_EEiFxSXbip7JX3y8Qz1fsxFPTUt_fR6dOTg@mail.gmail.com>
Subject: Re: [PATCH] gpio: em: use the managed version of gpiochip_add_data()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 9 lip 2019 o 20:49 Geert Uytterhoeven <geert@linux-m68k.org> napisa=C5=
=82(a):
>
> Hi Bartosz,
>
> On Tue, May 28, 2019 at 5:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Use the managed variant of gpiochip_add_data() and remove the call to
> > gpiochip_remove().
> >
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/gpio/gpio-em.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
> > index 40f8c38bec1c..299101d25fa8 100644
> > --- a/drivers/gpio/gpio-em.c
> > +++ b/drivers/gpio/gpio-em.c
> > @@ -359,7 +359,7 @@ static int em_gio_probe(struct platform_device *pde=
v)
> >                 goto err1;
> >         }
> >
> > -       ret =3D gpiochip_add_data(gpio_chip, p);
> > +       ret =3D devm_gpiochip_add_data(&pdev->dev, gpio_chip, p);
> >         if (ret) {
> >                 dev_err(&pdev->dev, "failed to add GPIO controller\n");
> >                 goto err1;
> > @@ -376,8 +376,6 @@ static int em_gio_remove(struct platform_device *pd=
ev)
> >  {
> >         struct em_gio_priv *p =3D platform_get_drvdata(pdev);
> >
> > -       gpiochip_remove(&p->gpio_chip);
> > -
> >         irq_domain_remove(p->irq_domain);
>
> On a second thought, is it safe to call irq_domain_remove() before
> gpiochip_remove() (which calls gpiochip_irqchip_remove())?
>

Good call. I think the most elegant solution here would be to use
devm_add_action() to keep the ordering right. I'll send a follow-up
tomorrow morning.

Bart

> >         return 0;
>
> >  }
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
