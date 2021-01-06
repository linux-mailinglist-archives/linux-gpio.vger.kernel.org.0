Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C972EC0EA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 17:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbhAFQPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 11:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbhAFQPO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 11:15:14 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A85AC06134D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jan 2021 08:14:34 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id q4so1769768plr.7
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2021 08:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tl1p/FqJtGVfmFlNg+EbevBewEeECcy3NjsYlrF6q5c=;
        b=VzrdHiJFEbRXJ4USgTukfFMcJiz7+OikzqfrYijuz9reN00VtK63kZcIUb3ghATnJU
         Di0ENbMn2YtkzdR4r7GAhJ9itMv+c//Tvf/e2Kytrs7iBy1UZciHlqnZDElT53AY/L56
         GIERlK+7nFiu4H1DikIBB9aYGPK8tj9zpBhrUSukgabpHNnxNMwyxF6bNCHALzU1Gdiv
         +PfS6szL3W0k+v4azwLYbnXdLXHP5BBvbSp1p5lPyGvrnVvc3XgQ9LtEy4hPigmTGtb/
         atkKcv3Aqu3kzz/0L/SN1pgmCKZMaJwblA+A6f5RjqdlS8wnL3ENaM51EkD+MNIUOIJ5
         c9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tl1p/FqJtGVfmFlNg+EbevBewEeECcy3NjsYlrF6q5c=;
        b=leP0kl3VTSoQ7FYWJiDCePciiTdmSp43Kfr1MxKT9ssuJxExRxV3GQ2UlEjtYQsO3S
         ZSv9AqONazdMm0XyjVfBJNwiSE/TYfQddhupELxiTdvUl2mV91SAjbkhVQqIc4g48SnE
         Fbwoxi6PeEtq4Gyo1gsadPRmxS2r/ThJHYomjV8UMpXV24YeQ7I9cbe8YuHdDmamg7ru
         xKuyr1/SoUA5sCy1QrJgbrFvc3U1Zd815+M0z7wuMjorK1hH/8F1BqkncRTePD/ZLfPS
         bN56wpHqY/BQuybtOZBP5kMYz7zqT1l8CRZC8Ly5PRlccrOzOJTqaOEyMtEMF23EakIv
         GW/Q==
X-Gm-Message-State: AOAM533E1viqrKceti20VCjyTcDbyVs8nanI/+CHxk0+RjaIlCjP5Pbp
        3Ipzdze5BVBNyvUb/teIKfaXp1aNXepcKMJEM+EONYgkuyKIiQ==
X-Google-Smtp-Source: ABdhPJwb5YSIyOHKv6I/qhsbeVQ0AFIeF+MIhRp/+ND+D7FxkgSpm9+CTOmsDeVFVNZTemzlLSLWm4LYWPd+cxc+aZ8=
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr4984663pjt.228.1609949674103;
 Wed, 06 Jan 2021 08:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com> <CAMpxmJUZqFtsFo=fZ6F+fcy3mvY10s0=mo3_Z5cx=6H5qcpUxA@mail.gmail.com>
In-Reply-To: <CAMpxmJUZqFtsFo=fZ6F+fcy3mvY10s0=mo3_Z5cx=6H5qcpUxA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 Jan 2021 18:14:17 +0200
Message-ID: <CAHp75VdPa3MCi6eb4kiWoPFkwmka1+4y09hVCFo1Nm9kAd3B4Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Flavio Suligoi <f.suligoi@asem.it>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 4:25 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, Jan 6, 2021 at 2:34 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jan 6, 2021 at 12:09 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Wed, Jan 6, 2021 at 12:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:

...

> > > I can do it alright. But in the context of user-space I think this
> > > doesn't really change anything. DT users still can use non-unique
> > > names and libgpiod still has to account for that if the API is to be
> > > considered correct. Is this change really useful?
> >
> > IMHO it is useful and the earliest we do the better.
>
> I'm wondering if user-space should make this assumption too then. That
> a non-unique name is either an error or signifies some special value
> (N/A).

My understanding that names are basically aliases to the pin numbers
inside a chip, so
gpiochipX:Y should == gpiochipX:$NAME
Obviously we can't guarantee that if there is no uniqueness assumption made.
Otherwise the idea behind naming the lines sounds controversial to me.

That said, if we allow non-unique names inside one chip, then the name
field is basically *informative*, which means we may not take it
anyhow as a parameter to any of the tools or anything.

> > > How does it affect
> > > ACPI users that already define non-unique names?
> >
> > I suppose that in ACPI we don't have many users that do it on their
> > own (for IoT Intel platforms GPIO expanders have unique names).
> > Also see above. I prefer to have a bug report with a clear source of
> > the issue (like a table that the user can't / won't change which
> > predates the date of kernel release with a patch.
> >
> > +cc: to the user who lately was active in the area.
> >
> > Flavio, perhaps one more rule to the gpio-line-names property has to
> > be added into documentation (Bart, same to DT docs?):
> >  - names inside one chip must be unique
> >
>
> Once we have a proper, core yaml binding for all GPIO devices, we'll
> be able to even enforce it if we agree on a set of exceptions.


-- 
With Best Regards,
Andy Shevchenko
