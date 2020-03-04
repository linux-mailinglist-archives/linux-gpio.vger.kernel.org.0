Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFF5917959A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 17:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729749AbgCDQrF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 11:47:05 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42683 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729573AbgCDQrE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2020 11:47:04 -0500
Received: by mail-qk1-f195.google.com with SMTP id e11so2251887qkg.9
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2020 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4KPhJBTky6Y10hAh0gA+1xxbuiU3B+3CTcaouWBl51g=;
        b=OyJZW7nSH33a9kNGeWLbCGkCqAhO2RAWkBtlBoj2dv0rML8GK4T00y9q3Fp2ESDF/g
         d6RzKiGvkKum4C6bAAv3QoqdxmbrCmAcbZ9DzqSxW7fFgHp3lOYPv84gcoFB0fqShv/r
         V7ADZY3TNRQMAMVluSItJAebUhgGtWMBVEqhwdkQZLrJZ6DtU3PHWM7T11gF9BfPyMS6
         HGwEOIvbySaVEw7AuD73LreIkiCiRDmP3YEUwyqMy0Mjdv5k5/QL9IAoeSNuX/QA+TAB
         fID/bu+S0fvZRR72ag+3a8R3CYcV4OTlknkP2u5dSUlLZn4nul8DXdVysaTwZSYkNEHt
         FzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4KPhJBTky6Y10hAh0gA+1xxbuiU3B+3CTcaouWBl51g=;
        b=DNzIY3i3OL4xd1xgj0/r+4Msu3Bq+n1ji2c5RkgBKrQ3TcJgE0mbfbrQl6iDW5wpF+
         e3ze07UjTMCQavmAZT5IQzUrN8guci+gHtuh7Qmbvek+GPGR8oM4fGzKmUEaSZf9uItA
         FqkZZvLLHM6K2gh7uDISnXDDLhQkpm0OolxD0n4huKZPn+Nwt/nKLYV/K0z+KTK4iooe
         /MCIkOokmLjhJG3Q0HXGmV54NHeEtjnGpFxamy866w8VgDegLZx6o8YA8kjosab0PUlG
         dP0G9z2WM0eUQ3ZwMx8zWL7s7qQKB8YnD0HvkAkENzHZJ9xqLg5FMgdTzGVimxyJX4pB
         btLA==
X-Gm-Message-State: ANhLgQ3PxH4xBf5DjY4tEm+y+tjo1FTBqlpO2O5jObiNSds2hcGDgQa4
        YR4HsNGNvhvEVdGyS7sFTw5rmEWoUwK2AB/NiC3ow39J
X-Google-Smtp-Source: ADFU+vuW8QJvTBmBAkn4wK6LsswrU/Ov6MjbkB5867BZovY4JtzTUYhuv+qQfhJYg8nvS3ZK3kcRrNKuzcfoCgXYJ88=
X-Received: by 2002:a37:c05:: with SMTP id 5mr3961720qkm.120.1583340423809;
 Wed, 04 Mar 2020 08:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20200303092828.4463-1-alexander.sverdlin@nokia.com>
 <CAMpxmJU+_ZtcfTXcwBh1DCWj4Usuwz_ymkgeZT64F24TOdvMXg@mail.gmail.com> <1d0a9528-8434-1087-d127-e5fd3d0c32d6@nokia.com>
In-Reply-To: <1d0a9528-8434-1087-d127-e5fd3d0c32d6@nokia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Mar 2020 17:46:53 +0100
Message-ID: <CAMpxmJXMdKMdXpQKjdyMatLPggUgPOm-wSMZ6rmWZFjwSv1sWA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Warn when IRQ line has not been configured
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 mar 2020 o 15:58 Alexander Sverdlin
<alexander.sverdlin@nokia.com> napisa=C5=82(a):
>
> Hi!
>
> On 04/03/2020 15:21, Bartosz Golaszewski wrote:
> > wt., 3 mar 2020 o 10:29 Alexander A Sverdlin
> > <alexander.sverdlin@nokia.com> napisa=C5=82(a):
> >> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> >>
> >> Existing (irq < 0) condition is always false because adev->irq has uns=
igned
> >> type and contains 0 in case of failed irq_of_parse_and_map(). Up to no=
w all
> >> the mapping errors were silently ignored.
> >>
> >> Seems that repairing this check would be backwards-incompatible and mi=
ght
> >> break the probe() for the implementations without IRQ support. Therefo=
re
> >> warn the user instead.
> >>
> >> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> >> ---
> >>  drivers/gpio/gpio-pl061.c | 6 ++----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> >> index 5df7782..3439120 100644
> >> --- a/drivers/gpio/gpio-pl061.c
> >> +++ b/drivers/gpio/gpio-pl061.c
> >> @@ -326,10 +326,8 @@ static int pl061_probe(struct amba_device *adev, =
const struct amba_id *id)
> >>
> >>         writeb(0, pl061->base + GPIOIE); /* disable irqs */
> >>         irq =3D adev->irq[0];
> >> -       if (irq < 0) {
> >> -               dev_err(&adev->dev, "invalid IRQ\n");
> >> -               return -ENODEV;
> >> -       }
> >> +       if (!irq)
> >> +               dev_warn(&adev->dev, "IRQ support disabled\n");
> >>         pl061->parent_irq =3D irq;
> >>
> >>         girq =3D &pl061->gc.irq;
> >> --
> >> 2.4.6
> >>
> > What happens later on if irq =3D=3D 0? Does irq_set_irq_wake() fail?
>
> Yes, would fail if IRQs would be requested from PL061:
>
> int irq_set_irq_wake(unsigned int irq, unsigned int on)
> {
>         unsigned long flags;
>         struct irq_desc *desc =3D irq_get_desc_buslock(irq, &flags, IRQ_G=
ET_DESC_CHECK_GLOBAL);
>         int ret =3D 0;
>
>         if (!desc)
>                 return -EINVAL;
>
>
> --
> Best regards,
> Alexander Sverdlin.

Ok, I'll go ahead and queue this then.

Thanks!
Bartosz
