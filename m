Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C71FEF846
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 10:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbfKEJKW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 04:10:22 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34771 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbfKEJKW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 04:10:22 -0500
Received: by mail-ot1-f68.google.com with SMTP id t4so5523078otr.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oLkLUuCn2kxyisNS10l10+eRH/ActYZTvtUhEbrBoL0=;
        b=MX+IJl5Bhd2ZO7WmkMd7XW+KkrzqXkF3WDNeyrEm/3DcNAUncsClU3V6wgrdfUlOET
         SrxH+XR98236e2f7EorCzF0AI32EuLXV0vMgqOPVL+UJ1BaP0qbGHDw4ZCjJ6smF464d
         Y9FMhbRtNP1qACOTMh3OZHtvMPFMKboaFcw87tnOm2EQ/4d+kx8QdsEKsGqz5RJxKWaa
         nSjfXBfp00uSNplxdV3kDivdFC4KknQI1CSkSFyeTyMlIgMzcVzsPMP/Y76HcjwaP0RU
         dx//vgINY8Mn57Yl19IE1FiTyMgTSl5KP188eobKPTRAXlNecqr0nKD78Ha2y7DXzrlF
         q8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oLkLUuCn2kxyisNS10l10+eRH/ActYZTvtUhEbrBoL0=;
        b=Q0FAAVHRnVCCNtw8VfEojqFikaI3VSrTQYl0BGVgH5lKxXjlFGcVdcmT3CqUJv+HEm
         bi/5gjhoAS8NzDAaJbvLDJaFNXRmlphUdhnxItvWJr5r+2YA9fMz84cJOMT9Cog8sScd
         4rEyV41hn43/g1U8tpOSA+POnpm6fl3on+kIodRJpSztZSXowJa6LdaZfh0McYGp7BbM
         vgNgerUPj+8VqN7jteGhWbX6nb+MJ5CShAZqE1BN9XB3JrsjoXft0W3H96YYwvsXlEhf
         RcCMpyxXAyDYwvLbgNaf/ucJWxFIq+eQmgl2/P87UFPGUKCkKaP/909eA74ui1+PxOOK
         Hi6w==
X-Gm-Message-State: APjAAAVFaTVE9odFKHMDyu92fckE6ngECmboHe2WTfaKCs49gsHFyg+I
        u6wYBMQ3gNSBzigSBia/dIOrHyH6HyLCHATq85sYxw==
X-Google-Smtp-Source: APXvYqxu2T7iSnu7mPFP5shgmJJwU+Lk2c1PmCMfYuntL3saSlnPjON1/gr0hejvmJNaa6JphPyLlaMCz4x3yak0ktk=
X-Received: by 2002:a9d:7d09:: with SMTP id v9mr22403212otn.292.1572945019848;
 Tue, 05 Nov 2019 01:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20191104153841.16911-1-warthog618@gmail.com> <20191104153841.16911-5-warthog618@gmail.com>
 <CAMpxmJUExXZ=ptMyRczvdujc7x9JP62Zy9m+WByYD4=w=1180w@mail.gmail.com>
 <20191104155927.GA17106@sol> <CAMpxmJUTFb_Bxsc8e006ohP6D3PP+kQgFYAPoZA2T1-HA41vSA@mail.gmail.com>
 <20191105020342.GA16739@sol> <20191105060649.GA1302@sol>
In-Reply-To: <20191105060649.GA1302@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 Nov 2019 10:10:08 +0100
Message-ID: <CAMpxmJXbbr=2cSWUwPkpg0TTWyGqDB9_xd-p0wCBREMQuzLfSg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] gpiolib: add support for biasing output lines
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 5 lis 2019 o 07:06 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> On Tue, Nov 05, 2019 at 10:03:42AM +0800, Kent Gibson wrote:
> > On Mon, Nov 04, 2019 at 05:19:14PM +0100, Bartosz Golaszewski wrote:
> > > pon., 4 lis 2019 o 16:59 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > > >
> > > > > Ugh, I missed one thing here - my for-next branch doesn't contain=
 the
> > > > > following commit e735244e2cf0 ("gpiolib: don't clear FLAG_IS_OUT =
when
> > > > > emulating open-drain/open-source") which happens to modify this
> > > > > function.
> > > > >
> > > > > If I provided you with a branch containing it - would it be a lot=
 of
> > > > > effort on your part to rebase it on top of it? If so - I can do i=
t
> > > > > myself.
> > > > >
> > > >
> > > > I can do a rebase - though not until tomorrow (it is getting late h=
ere).
> > > > I would like that commit in as well - I suspect it being missing is
> > > > the reason a couple of the gpiod tests I was working on are failing=
.
> > > > I was in the process of tracking that down when I switched back to =
this.
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > > >
> > >
> > > No problem, it can wait until tomorrow. Please use the following
> > > branch - gpio/for-kent - from my tree.
> > >
> >
> > That was a lot simpler than I expected - it rebased cleanly onto the
> > new branch.  And fixed the gpiod test errors I was trying to track down=
.
> > Will submit v6 shortly.
> >
>
> Maybe I'm missing something, but given that the rebase was clean, was
> there actually any need for v6?
> i.e. anyone can rebase the v5 patch onto gpio/for-kent:
>
> $ git checkout -b pud_rebase brgl/gpio/for-next
> Branch 'pud_rebase' set up to track remote branch 'gpio/for-next' from 'b=
rgl'.
> Switched to a new branch 'pud_rebase'
> $ git am PATCH-v5-0-7-gpio-expose-line-bias-flags-to-userspace.mbox
> Applying: gpio: expose pull-up/pull-down line flags to userspace
> Applying: gpiolib: add support for pull up/down to lineevent_create
> Applying: gpiolib: add support for disabling line bias
> Applying: gpiolib: add support for biasing output lines
> Applying: gpio: mockup: add set_config to support pull up/down
> Applying: gpiolib: move validation of line handle flags into helper funct=
ion
> Applying: gpio: add new SET_CONFIG ioctl() to gpio chardev
> $ git rebase brgl/gpio/for-kent
> First, rewinding head to replay your work on top of it...
> Applying: gpio: expose pull-up/pull-down line flags to userspace
> Applying: gpiolib: add support for pull up/down to lineevent_create
> Applying: gpiolib: add support for disabling line bias
> Applying: gpiolib: add support for biasing output lines
> Using index info to reconstruct a base tree...
> M       drivers/gpio/gpiolib.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/gpio/gpiolib.c
> Applying: gpio: mockup: add set_config to support pull up/down
> Applying: gpiolib: move validation of line handle flags into helper funct=
ion
> Applying: gpio: add new SET_CONFIG ioctl() to gpio chardev
>
> Or was it more about eyeballing and retesting the rebase in case the
> 3-way merge went haywire?
>

Exactly. :)

Thanks for the patches, I'll have time to review them around 3:00pm
and I'll take them through my branch for v5.5.

Bart

> Cheers,
> Kent.
