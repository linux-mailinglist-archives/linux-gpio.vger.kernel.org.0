Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF34114516
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 17:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbfLEQsC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 11:48:02 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43681 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLEQsC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 11:48:02 -0500
Received: by mail-pg1-f193.google.com with SMTP id b1so1847991pgq.10;
        Thu, 05 Dec 2019 08:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zhhx3FYcBWt29U1yHWzwpVDT43Q3E7V0xJbgxP+fglE=;
        b=Yd3DpKv2NLYbmyO9excd+6NumOM3EHqH00wyLFA+4PrMOVk5+5Q5Ch3mTbhFJ5APYG
         ODfd5Fez4VXSChlp0SruZPCjnsTuQedkaT5qtqpysrMyCoZaASz4hAboL/s2I5xy+y/p
         BihoeqInIC6Ltod1be2T99JqJxB1L+FpRaDK8hag0s2D9QGmARuZo68sQwkOsHoyxgZV
         i6/5JbUIJcnK0n9OJpd1rGkFd/UgJOEah3xbItnoRKEUBImymAdYk1E0yTXu+5U3+ghF
         XUTa3ERE5s6QCK227YOPU4lXIiyb2dyzmDnIAzlQU9HUMPAf4PP2TyUcAKVr5PN/0g4g
         pTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zhhx3FYcBWt29U1yHWzwpVDT43Q3E7V0xJbgxP+fglE=;
        b=C4gTtLueBNfNnnFFpoxsgC/RRhxBOhXJkqiYEbT+g5vBMIb/6RbN0NLEYdIm7wLwtd
         P/sVucfr6aX7khMUbItQWDxmWgCRDsjJB9kt7FMIQU5t/uVfjbY3wKqVrBkXBLL2uQHc
         npl1qhLW2cREdTSknx+X6+8xH8KHsKD3hHbtYPaw4kFh5ZiE+hQPZ4r+b4v0cr6JH/n5
         SAaZ+WjnphIqFvDeraIblGw3OQkWd1VRKHtzUmd5Mkgw8AR782J49YOFlOhYOkkrFi67
         /c/Elh0Szq+uD9s5Y32S//vy6byMusaQ2Xds5rWX+Z9sql3xRYGo1D5fiFSW2zwQlxc2
         NZhQ==
X-Gm-Message-State: APjAAAV0YfLxsskz/X7/p3eYKIlPo3aphy3TNirn55ul/1Pp+Bn5GCzY
        ZahaymxVCNokH19I/+x/V+KrdmP3cxTNMQXsvQw=
X-Google-Smtp-Source: APXvYqyEuG/HoVyekd64C1hGYMFHWQcMEPsbhjxAEfIUuv2G2mz0kl8Z38KsiWKKxTJP5JLefki+VZWlEZAvvnE4lxI=
X-Received: by 2002:a63:941:: with SMTP id 62mr10660067pgj.203.1575564481017;
 Thu, 05 Dec 2019 08:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-10-brgl@bgdev.pl>
 <CAHp75VfbwwDyxoZU2vHo7qo8E0rQdT3czC+Wpe7cqr5uoJVUwQ@mail.gmail.com>
 <CAMpxmJXhEK3Whh8vGfW-TewT7uRgipBOd3hhmSGHYkH=PD_Nfw@mail.gmail.com>
 <CAHp75VcVUdR5TU3CSp-6vvMGEzRT2S9=05h0jyzTrpiZkUKDUQ@mail.gmail.com> <CAMRc=McEsrg_2O3VAwCNLHsd+dupmzNOeC2rc0V6t6vGyGjC9w@mail.gmail.com>
In-Reply-To: <CAMRc=McEsrg_2O3VAwCNLHsd+dupmzNOeC2rc0V6t6vGyGjC9w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 18:47:50 +0200
Message-ID: <CAHp75VckYszyD6eU8n4W75pGWrnWzo3GZ4rVg+8iwEs_4xJErA@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] gpiolib: provide a dedicated function for
 setting lineinfo
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

On Thu, Dec 5, 2019 at 3:45 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> czw., 5 gru 2019 o 11:21 Andy Shevchenko <andy.shevchenko@gmail.com> napi=
sa=C5=82(a):
> > On Thu, Dec 5, 2019 at 11:28 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > =C5=9Br., 4 gru 2019 o 23:30 Andy Shevchenko <andy.shevchenko@gmail.c=
om> napisa=C5=82(a):
> > > > On Wed, Dec 4, 2019 at 6:02 PM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> > > > > +       if (desc->name) {
> > > > > +               strncpy(info->name, desc->name, sizeof(info->name=
));
> > > > > +               info->name[sizeof(info->name) - 1] =3D '\0';
> > > > > +       } else {
> > > > > +               info->name[0] =3D '\0';
> > > > > +       }
> > > > > +
> > > > > +       if (desc->label) {
> > > > > +               strncpy(info->consumer, desc->label, sizeof(info-=
>consumer));
> > > > > +               info->consumer[sizeof(info->consumer) - 1] =3D '\=
0';
> > > > > +       } else {
> > > > > +               info->consumer[0] =3D '\0';
> > > > > +       }
> > > >
> > > > I think we have to fix GCC warnings first and then do whatever this=
 patch does.
> > > >
> > >
> > > What GCC warnings are you referring to exactly?
> >
> > stncpy() against partial string without NUL-terminator.
> >
> > So, if desc->label is longer than info->consumer, it will be copied
> > partially. I don't check if the modern GCC clever enough to see the
> > next operation which does the termination.
> >
>
> I'm not sure I get it. What warnings does it produce and in what
> environment?

Some kind of
warning: =E2=80=98strncpy=E2=80=99 specified bound 16 equals destination si=
ze
[-Wstringop-truncation]

> I don't see any.

Good, I just checked and see none as well. It means GCC understands
that strncpy() is followed by guaranteed NUL-termination.

> If you want it simpler - we can do `snprintf(info->consumer,
> sizeof(info->consumer), desc->label ?: "")`.

It makes sense only in above context.

--=20
With Best Regards,
Andy Shevchenko
