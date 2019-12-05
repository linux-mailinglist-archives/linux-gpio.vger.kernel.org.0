Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13131141DE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 14:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbfLENpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 08:45:49 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:41795 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbfLENpt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 08:45:49 -0500
Received: by mail-io1-f65.google.com with SMTP id z26so3620061iot.8
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2019 05:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tf+pf8pQ++HUmuO8UBLmXes+nwBFFnQhR6FiiNRFLAA=;
        b=Rq4sXnbep80c0TWs93z8qrTZBrMg5VhdGeYet9DaBwSa/R3qGMueRqG+2oBwRWzfp8
         7I0QhSrumvg2akzmhe1p/XHMT9x5Imk5ENrAg4jTYdz0s9u2Iw9n3AMN9o9/H16C1Lb/
         rjN12Kb+//iJ5INEwakrOQoSd6PmxMKkHqwucTiVmzVW4UDotREEkw4hSb5T/bk4w5/R
         4lj078uBc1rgcdQowlUifQQjPukClRiUCdTpau3/WgSys4a0ogmnZh8oD9gS9LMMBba+
         as6iWIC54439MN0CS5mN+lk2qSXKj/lJYMHyvRiNYzkV94rXbqARhr8MGCGpP1HkykXZ
         1uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tf+pf8pQ++HUmuO8UBLmXes+nwBFFnQhR6FiiNRFLAA=;
        b=mMyX8owcNzOJMBMYo7FziBcW3XO328YVU48BrthBETWKJR21B1Yc8TW3ZcYEDU7MtY
         KX6y4+LaFmjfW6/ONnYL+Lvr3I4zxo3VljrM0D9L0ihSu6m6ODRk8m93x4HHnaol/MtC
         rljtdcBxfaMt0c92IPN9twOfd+d9/7+DYvka1IQPgIoQXUXt7p+g9uQPuftAAlUdH2p2
         p5XDmzKm1KRYc98PT2mVHdhCCdN0B2vTqmsbSVrO9uW8XiPfKDTOZBHJhzvRst1GYPVi
         ynkgJwNvXex1fbmI+rqtEjB9o0uunzVuTXWbvwEeXVdM0uziDLJ/8QkbOqNRCNr0nCo2
         bKsg==
X-Gm-Message-State: APjAAAW4VoTwpFecyViOLL/GmJqazGdkj8ZjzGyhIkwxdBJKmKPheQCz
        mSRZvHy4UZdMinvwY2m5HBFCSWuKLdqJPkEEderM+w==
X-Google-Smtp-Source: APXvYqxxSMgYOG1TNL3q6dj6vJ3OBYbaH5fod4ExyFtSwSM3nJkiPc6vSXLBBwIR0x6kbqpaV34qvrXcMoOJ5+KWvqk=
X-Received: by 2002:a05:6602:2352:: with SMTP id r18mr6150964iot.220.1575553548819;
 Thu, 05 Dec 2019 05:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-10-brgl@bgdev.pl>
 <CAHp75VfbwwDyxoZU2vHo7qo8E0rQdT3czC+Wpe7cqr5uoJVUwQ@mail.gmail.com>
 <CAMpxmJXhEK3Whh8vGfW-TewT7uRgipBOd3hhmSGHYkH=PD_Nfw@mail.gmail.com> <CAHp75VcVUdR5TU3CSp-6vvMGEzRT2S9=05h0jyzTrpiZkUKDUQ@mail.gmail.com>
In-Reply-To: <CAHp75VcVUdR5TU3CSp-6vvMGEzRT2S9=05h0jyzTrpiZkUKDUQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Dec 2019 14:45:38 +0100
Message-ID: <CAMRc=McEsrg_2O3VAwCNLHsd+dupmzNOeC2rc0V6t6vGyGjC9w@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] gpiolib: provide a dedicated function for
 setting lineinfo
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

czw., 5 gru 2019 o 11:21 Andy Shevchenko <andy.shevchenko@gmail.com> napisa=
=C5=82(a):
>
> On Thu, Dec 5, 2019 at 11:28 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > =C5=9Br., 4 gru 2019 o 23:30 Andy Shevchenko <andy.shevchenko@gmail.com=
> napisa=C5=82(a):
> > > On Wed, Dec 4, 2019 at 6:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
>
> > > > +       if (desc->name) {
> > > > +               strncpy(info->name, desc->name, sizeof(info->name))=
;
> > > > +               info->name[sizeof(info->name) - 1] =3D '\0';
> > > > +       } else {
> > > > +               info->name[0] =3D '\0';
> > > > +       }
> > > > +
> > > > +       if (desc->label) {
> > > > +               strncpy(info->consumer, desc->label, sizeof(info->c=
onsumer));
> > > > +               info->consumer[sizeof(info->consumer) - 1] =3D '\0'=
;
> > > > +       } else {
> > > > +               info->consumer[0] =3D '\0';
> > > > +       }
> > >
> > > I think we have to fix GCC warnings first and then do whatever this p=
atch does.
> > >
> >
> > What GCC warnings are you referring to exactly?
>
> stncpy() against partial string without NUL-terminator.
>
> So, if desc->label is longer than info->consumer, it will be copied
> partially. I don't check if the modern GCC clever enough to see the
> next operation which does the termination.
>

I'm not sure I get it. What warnings does it produce and in what
environment? I don't see any.

If you want it simpler - we can do `snprintf(info->consumer,
sizeof(info->consumer), desc->label ?: "")`.

Bart
