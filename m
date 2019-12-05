Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF2F113F3C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 11:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbfLEKVG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 05:21:06 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:47026 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfLEKVF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 05:21:05 -0500
Received: by mail-pj1-f68.google.com with SMTP id z21so1101906pjq.13;
        Thu, 05 Dec 2019 02:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g86M/m+NwKzUuZiuWQRa71hYgYNDWjvbI/gJF0jNkJc=;
        b=cFYmFCS3IahdOlt/5BsvGbAkW5Xu4ATpJy38lHtwxZU5uk49BUZFUK+bQtWFXESKZV
         Y7FzWYUDVTQB0oJnhzfW7nYcwXqqyv3AkQMcQLKVQzgRmumKCWlHuoTvJxCi2kZc8Bcr
         5g+clcx7TxBHK2qil1NgPQjnbz1LDQABbYdi3DkEgLzYc4y78qmVkB1q9dve2Iejm6Z4
         lC7msOIqfCG3MhOQgsMZfUXqYhChCm4qYQXXvh5hQofQ2sgs1/kkBhe9iF41WoCj9f4/
         qHCohtixfJa/O/Zk0Aq1W7uOmbVOdZ9tzelaDWNYcnCuv3EAf4JJbJPhaLymSXZqupAy
         iBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g86M/m+NwKzUuZiuWQRa71hYgYNDWjvbI/gJF0jNkJc=;
        b=mhhVm2IQU3H+gHwHNXEMsvYqbPCs1ivVQcpFs32FdlxoPEYaDs76mjFqvqKWgGg+mV
         31llKc1tVmMSnRCc1w7UK0jwMG60L7Tdld/3zTuK7OgHJ+iUkguWxtGbe7mKlXlY2Mjj
         e4J5adreVDq4FK/W0AC6rKrJQOQkkk3j8RqjQ62EP2uhfxC9yJcOLC/Ll70zQVe1ujzk
         Xt4M/FIsaIHaML+IgL4hF7RZrtMCYJU8biahduGnGgupJkU0s5neKCFFsFgONBzm9vrm
         1sGZkk5VOw8owE9Woy5gfXj74dlHkC8c6trGstQFE3B11+mSGAp9JvLaaYDlIGGYEByg
         kuAg==
X-Gm-Message-State: APjAAAWqYPnwNxzsVN/XK+LTYJQ+FkY4+xz3a7mWUM+3QyqkvdHU07Wo
        rvV5vp+sUbpC8Z8715IDHIq1uWsbHnRhwAMR4HU=
X-Google-Smtp-Source: APXvYqyGoT65ZaljTKSeEOJMhMA9a666L1564pPodhV06TgC9V6SLdE8HUYeecXiWq8ycL0TUR4l28y1Z1rKdE3bX+s=
X-Received: by 2002:a17:902:aa08:: with SMTP id be8mr8035006plb.255.1575541265022;
 Thu, 05 Dec 2019 02:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-10-brgl@bgdev.pl>
 <CAHp75VfbwwDyxoZU2vHo7qo8E0rQdT3czC+Wpe7cqr5uoJVUwQ@mail.gmail.com> <CAMpxmJXhEK3Whh8vGfW-TewT7uRgipBOd3hhmSGHYkH=PD_Nfw@mail.gmail.com>
In-Reply-To: <CAMpxmJXhEK3Whh8vGfW-TewT7uRgipBOd3hhmSGHYkH=PD_Nfw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 12:20:54 +0200
Message-ID: <CAHp75VcVUdR5TU3CSp-6vvMGEzRT2S9=05h0jyzTrpiZkUKDUQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] gpiolib: provide a dedicated function for
 setting lineinfo
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 5, 2019 at 11:28 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> =C5=9Br., 4 gru 2019 o 23:30 Andy Shevchenko <andy.shevchenko@gmail.com> =
napisa=C5=82(a):
> > On Wed, Dec 4, 2019 at 6:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:

> > > +       if (desc->name) {
> > > +               strncpy(info->name, desc->name, sizeof(info->name));
> > > +               info->name[sizeof(info->name) - 1] =3D '\0';
> > > +       } else {
> > > +               info->name[0] =3D '\0';
> > > +       }
> > > +
> > > +       if (desc->label) {
> > > +               strncpy(info->consumer, desc->label, sizeof(info->con=
sumer));
> > > +               info->consumer[sizeof(info->consumer) - 1] =3D '\0';
> > > +       } else {
> > > +               info->consumer[0] =3D '\0';
> > > +       }
> >
> > I think we have to fix GCC warnings first and then do whatever this pat=
ch does.
> >
>
> What GCC warnings are you referring to exactly?

stncpy() against partial string without NUL-terminator.

So, if desc->label is longer than info->consumer, it will be copied
partially. I don't check if the modern GCC clever enough to see the
next operation which does the termination.

--=20
With Best Regards,
Andy Shevchenko
