Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27727BAEE
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 09:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfGaHs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 03:48:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38970 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfGaHs6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 03:48:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id r21so63181589otq.6
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 00:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pgMoH1mQz4lC1Ao9M4m1l10XPD+7g6S82i3z1Y3nNps=;
        b=TSxE85OAdUwtGQuSO0d0ISP6J1ZuL4qlLrmB+VPeXaOJSdG38RjugQ7pgPBIm0I23U
         9gM7QYpjczPqR6N4gnKmjMeqHKWJ1awb4d1SZyrBCkclYRfs51M4GqQ1tUccFJVovKZg
         /y7QPQ05J0oi+A27Iv0ZvNQJI5XXryrWipxWIO7/8zXE+AyFK7MBDsUvqDM9ZQ/r9n2n
         xDZANwKsnwPCKWe8MEm7UBZIOeXhFI83kZVC/pMJ5D7mqy79ouGn6ldmkhnq3jRpYyp7
         M4a1UImJ8y3vibiG7x/ojVFprA3o2v9nBRHnq2YZE2yp1uYZkVZhNegVfJakC8aHbEsR
         7bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pgMoH1mQz4lC1Ao9M4m1l10XPD+7g6S82i3z1Y3nNps=;
        b=IvFFlJEccQFxc0JW56iNE2xk0dhA1/x0THj37lqk+AGCBTzNlW7vhVcyHpsni2uMDB
         psdgJ4/bmzC++uGVDiLQG5PSZsduQIgo6T0ZLZwqEPDkYrCuaZQZJpqHB7hY6t0+bvP4
         127o4IDj3P7eNhTLL9UcYJ2F0eQfgIL0c/rPgcY70TfWFTTOkVmfyCCdEJ5U9XfHUsI8
         oLbgX90ytqKao695nj6Zsu0H0oHLqzt+htFDlLojiiTm1PTbJVlG2yVlATlrNcWE6Igd
         7O6KlGd0lBFd6eJU7biydCeH4dzBfQkM+dTQB4ej9VNV5WXd3kfSvSmaacIph7TXR6GL
         S73w==
X-Gm-Message-State: APjAAAV1o/DCwvDBL9lFFqEJciY5hLuhZXaml7KTIOUSQCIZxBl62zX2
        cxKF7aVZt8f0JiThg5auvLsAttBAqgYiEAUl2HU=
X-Google-Smtp-Source: APXvYqwrRv1u3uda7NwANyCmNjWW+BXoKYJOzg8bsdJUl8jws2DprRDxrEMXhsPmXMvs80JQYO3wwXdJ7vuW7krtQM0=
X-Received: by 2002:a9d:7643:: with SMTP id o3mr58617599otl.49.1564559337541;
 Wed, 31 Jul 2019 00:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190730190410.24786-1-rfried.dev@gmail.com> <CAMpxmJUXbxjGqaw+qTiwvAKicjC-MC58BOr6_hw-L76JHWOg0g@mail.gmail.com>
In-Reply-To: <CAMpxmJUXbxjGqaw+qTiwvAKicjC-MC58BOr6_hw-L76JHWOg0g@mail.gmail.com>
From:   Ramon Fried <rfried.dev@gmail.com>
Date:   Wed, 31 Jul 2019 10:48:28 +0300
Message-ID: <CAGi-RUJ7FHt5LbGD22rcO-=vjaeAWdjGWt+TO6HUACvEkpBHAg@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH] gpioinfo: mark kernel claimed lines as used
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 31, 2019 at 10:44 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> wt., 30 lip 2019 o 21:04 Ramon Fried <rfried.dev@gmail.com> napisa=C5=82(=
a):
> >
> > In case where the GPIOLINE_FLAG_KERNEL flag was set because of muxing,
> > The used column was still showing the pin as "unused"
> > Fix that by writing "used".
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> >  tools/gpioinfo.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> > index bb17262..85f8758 100644
> > --- a/tools/gpioinfo.c
> > +++ b/tools/gpioinfo.c
> > @@ -119,8 +119,11 @@ static void list_lines(struct gpiod_chip *chip)
> >                      : prinfo(&of, 12, "unnamed");
> >                 printf(" ");
> >
> > -               consumer ? prinfo(&of, 12, "\"%s\"", consumer)
> > -                        : prinfo(&of, 12, "unused");
> > +               if (gpiod_line_is_used(line) && !consumer)
> > +                       prinfo(&of, 12, "used");
> > +               else
> > +                       consumer ? prinfo(&of, 12, "\"%s\"", consumer)
> > +                                : prinfo(&of, 12, "unused");
> >                 printf(" ");
> >
> >                 prinfo(&of, 8, "%s ", direction =3D=3D GPIOD_LINE_DIREC=
TION_INPUT
> > --
> > 2.22.0
> >
>
> Good catch! I think we can make it even more readable by first calling
> gpiod_line_is_used() and printing 'unused' if it returns false and
> then checking the consumer string.
OK, I'll send v2.
Thanks,
Ramon.
>
> Bart
