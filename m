Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076A4D4D51
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2019 07:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfJLFw1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Oct 2019 01:52:27 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34073 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfJLFw0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Oct 2019 01:52:26 -0400
Received: by mail-io1-f68.google.com with SMTP id q1so26200941ion.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 22:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mCEJ7xGjTLlsy0UKiyymcgvc3M0XVjrAF4O5ypR6YEk=;
        b=mzWeAaNLcyqhP1TwpGkxIf6KbmornkHXhKDg4VhZ6l7M9hP5NvbETbKZey472LSS+T
         psKerTDk1Sgdvojy0aau7fNJbjyEmCFW+Y+IBVQB74NEeZPwjEiwwizb9EK/XezEhQHJ
         HUQRlK31Gyb2/L1ybo8EVHoBPF6GEb7ZQE6+ou8hhicfzjfCewY34bb6He/qjLlaPSNb
         TELGWpiynYDADyPVhQnSIK5aUDjZ5PjhiIQ3W6qyDjkRr1tsPe+pK+eV2qVTFHpVPP1i
         DCLwtOs1eJdGSc0dEto5GXVlRZTrNDUlO4B6dEaoNzkDQS0jTr0I8GVFlxxupLz1v6fQ
         9o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mCEJ7xGjTLlsy0UKiyymcgvc3M0XVjrAF4O5ypR6YEk=;
        b=HkjqTGkNO5kZvtiLNIsfN6SSafHBbSpS5au9doSX19NHMsNW8GJtzcGGRnmGkscutr
         vYRTfTmGsMzoDF17U/d/V8yfB/LHZmK+8LSlcp/teXkUpzdzy9iQLcC22Tu8TOHzNkeh
         HFK4LFZPvC314Db8Jabhb565dhi8gshxJnEJ97NYZQt6Lq6+oyrintDeRtoT3z+t73/i
         LmlEuc3g/rS7xNLiFmxtGLMKq8MJQjvlR26DLS66xUDtNShmaJdfuZu1CHUyoKZpmXKz
         ZhozZnmvelQqXPkM0t0fDPbz01Bx6zYbMHBDlK+cn2wO76LWoCE7PcXDCyyLaN7fhmvt
         klhA==
X-Gm-Message-State: APjAAAU9I2i6WFXqK/wMZTT9vHuIYhqX1Ix4LTAPjgp1j0vvXwZFetVy
        Mg0lxBuH18dUVlb93OwWc2iQ7n218/RLZgeQZ9mrGw==
X-Google-Smtp-Source: APXvYqxHRsoR/ucixYqk+ECBqVpYjHPRjTVPbwwNxUWG1Yb5UQtRnR34iu8U0kO4QdG6YQSrILHrEmFmcRUSlMPAKZo=
X-Received: by 2002:a5e:db46:: with SMTP id r6mr3709717iop.287.1570859544419;
 Fri, 11 Oct 2019 22:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191011154650.1749-1-warthog618@gmail.com> <CAMRc=Mfkop3poFn7vaotxZfCJn=L+6w9uzNVCXTfa4AuVEmm1g@mail.gmail.com>
 <20191012005340.GA4059@sol>
In-Reply-To: <20191012005340.GA4059@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 12 Oct 2019 07:52:13 +0200
Message-ID: <CAMRc=MfqezSoanCuAuJhsn-PyQ8Z8+wDHtYsD0Ux0RztGPRo-g@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 12 pa=C5=BA 2019 o 02:53 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Fri, Oct 11, 2019 at 07:51:43PM +0200, Bartosz Golaszewski wrote:
> > pt., 11 pa=C5=BA 2019 o 17:47 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> > > Gross control means enabling and disabling of bias functionality,
> > > not finer grained control such as setting biasing impedances.
> > >
> > > The support allows both input and output lines to have any one of the
> > > following biases applied as part of the line handle or event request:
> > >  0. As Is - bias is left alone.  This is the default for ABI compatib=
ility.
> > >  1. Pull Up - pull-up bias is enabled.
> > >  2. Pull Down - pull-down bias is enabled.
> > >  3. Pull None - bias is explicitly disabled.
> > >
> > > The biases are encoded in two flags, PULL_UP and PULL_DOWN, where
> > > setting both is interpreted as Pull None. So the flags effectively fo=
rm
> > > a two bit field encoding the values above.
> > >
> > > The setting of biases on output lines may seem odd, but is to allow f=
or
> > > utilisation of internal pull-up/pull-down on open drain and open sour=
ce
> > > outputs, where supported in hardware.
> > >
> > > Patches are against:
> > >   github.com/brgl/linux/commit/82fc38f6ab599ee03f7a8ed078de8abb41e6e6=
11
> > > which contains the initial patch from Drew Fustini, with Bartosz Gola=
szewski,
> > > that adds support for pull-up/down flags in line handle requests.
> > >
> > > Patch 1 adds support to line event requests.
> > > Patch 2 adds pull-up/down support to the gpio-mockup for uAPI testing=
.
> > > Patch 3 rejects biasing changes to lines requested as-is.
> > > Patch 4 adds support for disabling bias (pull none).
> > > Patch 5 adds support for setting bias on output lines.
> > >
> > > Kent Gibson (5):
> > >   gpiolib: add support for pull up/down to lineevent_create
> > >   gpio: mockup: add set_config to support pull up/down
> > >   gpiolib: pull requires explicit input mode
> > >   gpiolib: disable bias on inputs when pull up/down are both set
> > >   gpiolib: allow pull up/down on outputs
> > >
> > >  drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++------------=
--
> > >  drivers/gpio/gpiolib.c     | 55 ++++++++++++++++------
> > >  2 files changed, 100 insertions(+), 49 deletions(-)
> > >
> > > --
> > > 2.23.0
> > >
> >
> > Hi Kent,
> >
> > thanks for doing that, but please make it easier to review. The cover
> > letter shouldn't be sent in response to this thread but be part of the
> > patch series.
>
> Not sure what you mean - this is a new thread.

Sorry for that, I just looked at the gmail client and it somehow
interpreted it as a reply. In my defense: I'm travelling and changing
timezones ATM thus the confusion. :)

> Should the updated series be a reply to this email (yours), or a new
> v2 thread?
>

In general every new version of a series should start a new thread.

> > Please don't rebase the patches on top of my
> > development/experimental branch - every patch needs to spend some time
> > on the mailing list. Rebase the series on top of the latest mainline
> > release candidate. Pull in Drew's changes and just squash my code into
> > your patches - it was not finished anyway. You can send patches from
> > other developers or make them part of your series - there's no problem
> > with that as long as you keep the authorship.
> >
> > That'll make it much easier to review and understand.
> >
> Fair enough.  I was unsure about including others' patches in the
> series, so kept it minimal. Will update the series as soon as I get the
> chance (and know where to send it).
>

OK I've got your v2 - looks like something I can apply on top of
v5.4-rc2, so I'll try to review it tomorrow morning.

Bart

> Cheers,
> Kent.
