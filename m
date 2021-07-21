Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0D83D10EE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 16:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbhGUNdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 09:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238509AbhGUNdG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 09:33:06 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352C0C061575
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 07:13:43 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id r25so1513588vsk.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZfNzgsD7J2Mjt1wMPXQg6aTS+MDAP37E7oHrwgMTDE=;
        b=RiHimWEdJ/RGZ9gofssOFkx+Wfty76jxVPgU8sJf9GNjIeUy02HWR2f3yFqLtn3aZV
         Res00d+d7X+xgbJYJtPOOOpG5ZKAXeDFChxnAVN3kC+ktsv2ZUZ/jI+Y1lS7f9Z/MlM4
         N2+ApXcedGuK0ZsphtpBKRo7TX5qVD/mt8fxkr0u2VlANdNkGSXKd2ysAW/NsBQUqY0E
         d2oziHVdEUbdxu5CW8fbxGW9O3zSiDp0O1cHtYX/H7CUFYxa1NzCVrMiFG6atT4/l6/y
         GxUutU9oArsohXQYkoqOUXQ0GBPE9rC9x3CDbu5oVMJKUBHqix4yKMQRUXHlGa+w93b9
         c1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZfNzgsD7J2Mjt1wMPXQg6aTS+MDAP37E7oHrwgMTDE=;
        b=XcRnRIJHG1OCuQqTclwXXO0fPAbscs0TU6EwGAqWgmwWGVFYbCXqOGHe20/o0iTo9b
         OnmM9FReGP9AKAJ8CnyhKxj9lpkEZ3VpkoMqYNjb5udfYzY4o2pfDL8EnVLhZQ//6YJk
         SsM1Ckk02FnKvDh5Q7rIZ4Vzxesb7ygzEHkk9glgcllCRsaeMfOkpZboC6ylZ4N80Fuh
         IJPYnBwK3/8lpDifJmljUIzIx17KJ38rut8GG+PcCyLZNTOCdv1KQZ0ez25Wv1WgxE2v
         D6z4q03ynkWkPAHn1RXT8zOpXX7QboITGaDYTIfpEtDEX7TbCSbQpAQpRVIa5OPvbYJ/
         K5tw==
X-Gm-Message-State: AOAM533EcbsKKuvRf0V1M0t2d8SEJbE9d5t1Lfr0a7l9aXfMy4plzteu
        V5IQxL2QXWlNcyfkK6T6TBpO7+8Tz9nm0F5m0wXqWg==
X-Google-Smtp-Source: ABdhPJzDzZiF5vXCGP5mkzRnVr4i3jpCUZGt6JzyAJTJuPHcvtQTM87aLzJv4GnqrDPGagqH5nK/n18oBDQ0LIAiPEw=
X-Received: by 2002:a67:c009:: with SMTP id v9mr12696459vsi.47.1626876822371;
 Wed, 21 Jul 2021 07:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210707135144.191567-1-aardelean@deviqon.com> <CAMpxmJVBTqX_e6a7PjdNmwYN-SCgqXQ1WbfzZbRLBGvPSVHTFQ@mail.gmail.com>
In-Reply-To: <CAMpxmJVBTqX_e6a7PjdNmwYN-SCgqXQ1WbfzZbRLBGvPSVHTFQ@mail.gmail.com>
From:   Alexandru Ardelean <aardelean@deviqon.com>
Date:   Wed, 21 Jul 2021 17:13:30 +0300
Message-ID: <CAASAkoYhg2VQB5En8=pybeHngnApaYoStg3ZB9=J-ZMofD7Rkg@mail.gmail.com>
Subject: Re: [PATCH] gpio: viperboard: remove platform_set_drvdata() call in probe
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 21 Jul 2021 at 16:16, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Jul 7, 2021 at 3:51 PM Alexandru Ardelean <aardelean@deviqon.com> wrote:
> >
> > The platform_set_drvdata() call is only useful if we need to retrieve back
> > the private information.
> > Since the driver doesn't do that, it's not useful to have it.
> >
> > This change removes it.
> >
> > Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> > ---
> >  drivers/gpio/gpio-viperboard.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
> > index c301c1d56dd2..98ddd6590362 100644
> > --- a/drivers/gpio/gpio-viperboard.c
> > +++ b/drivers/gpio/gpio-viperboard.c
> > @@ -422,12 +422,8 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
> >         vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
> >         vb_gpio->gpiob.direction_output = vprbrd_gpiob_direction_output;
> >         ret = devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpiob, vb_gpio);
> > -       if (ret < 0) {
> > +       if (ret < 0)
> >                 dev_err(vb_gpio->gpiob.parent, "could not add gpio b");
> > -               return ret;
> > -       }
> > -
> > -       platform_set_drvdata(pdev, vb_gpio);
> >
> >         return ret;
> >  }
> > --
> > 2.31.1
> >
>
> The log is not really needed, we'll get an error message from gpiolib
> core. Can you remove it while you're at it and just return the result
> of devm_gpiochip_add_data()?

I thought about removing it, but in this driver there are 2
devm_gpiochip_add_data() calls.
It registers 2 GPIOchip instances.
Which is not so easy to see in this patch.

First one says "could not add gpio a"  and this one says "could not add gpio b".
I hesitated to remove either of these.

In this case, it may be a little helpful to know which GPIOchip failed
to be registered.

But I don't mind removing them both.
Whatever you prefer. I'm undecided.

>
> Bart
