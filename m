Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D366731C42
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 17:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345041AbjFOPQ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 11:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345153AbjFOPQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 11:16:22 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CD72976
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 08:16:16 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-43b2da5b307so1539966137.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686842175; x=1689434175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nejLt+j3NI9UoP/V3uRsCESQ4X/EGxNfYPhszkdwFQQ=;
        b=Hp94mG2f7QmdaINhQWl/9XXUes5snbUGaxOyYY1Xybk2j37gNaREB6+AjMNMqNq8pa
         oI8MW2NuhoQtxngnZYkeEGNRUulwG/pDTBbFiUsiNyG4ZEQ2drxoe+3DBvIhVLo3EHBu
         P64ncp4g+INPMvYHIIEILDdJMJ3Jy9vzvhCOAPpd5TwojKRInMAyL6RPfr5728iI9zFY
         dG1i6vyPwwo66+LnevNzmxq/CY7W/oJJ0os+I3B3BBXs3fYS5wZvVisH0cwNgMR6uvlt
         aVyGgmpxfIXrcg2vUnTPKAZo65b9wHlgrXGGhnfy1j8BOAjpSKppjX+39B15w+qLOjYp
         +i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686842175; x=1689434175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nejLt+j3NI9UoP/V3uRsCESQ4X/EGxNfYPhszkdwFQQ=;
        b=FzEN8KC6mPt5N2ANXH7KOU5Qgb5ShB8MRGSuZoOI9E/b12OFOTEXleDBWCtbgHDqqD
         NEg7CCOB7r0R8yzxzJRWB11AFklnatzcD2isRAFnIWHg9D0cqdGHVw4iaXvPdf5O/7lv
         Yaz7+zZXaLr+MfdHw5caCGO8elp6q6nfSMjsw9iqiMthRGigPaFk/rCdaa3rkSg+CpTe
         uNKWWWWf8EpXLQdowKQFZtlgBCKqY+eo7jzEyrVYsud7oXARfrxvXnXYJq1kQmjZdglD
         /PR2Q5lb5ujEVEgkj0T9bZnBKCQ2MpwFdB+QtKFwAq+5fXwtQk9uLSNglpQT5579qC9Y
         2XMw==
X-Gm-Message-State: AC+VfDx/Lfzd5Ts631Jcz2eoZQFpudBjuIKAz3Px5Q94U9fOoMVeLn/H
        UKZBRdS+KHMUbzuEtXa8S2mcvJ1xBPCk3KzGWMDodQ==
X-Google-Smtp-Source: ACHHUZ65s4WGozXX4Kf7H9y2EaF4dZ6dua5mx3jven7map3aM1IXSbQKUY+DN8mmulaWpwJoIx39VmgyNiBMGCe1oow=
X-Received: by 2002:a67:ff9a:0:b0:43f:5fc4:fc64 with SMTP id
 v26-20020a67ff9a000000b0043f5fc4fc64mr712779vsq.8.1686842175233; Thu, 15 Jun
 2023 08:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230614035426.15097-1-warthog618@gmail.com> <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
 <ZIm+4qmSUgFrVzLc@sol> <CAMRc=Mc3-SfvYYYvocMyjLtbPk=f=EyAOHXcKj+eFWvVWrGurQ@mail.gmail.com>
 <ZInHSgsfALvbTmAX@sol> <CAMRc=McCKjU9NbarB-0awfUXwECMFna5aKi9yB68pwxHEebUhA@mail.gmail.com>
 <ZInkHSGf/HeBttPc@sol>
In-Reply-To: <ZInkHSGf/HeBttPc@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Jun 2023 17:16:04 +0200
Message-ID: <CAMRc=MdqZtqnBuMjGLKo6FOSfAAanGsYu9aAWiZuhnTgzEVaDA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2023 at 6:00=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Jun 14, 2023 at 05:11:32PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jun 14, 2023 at 3:57=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > Any functionality to add to libgpiod?
> > >
> >
> > I don't think so at the moment. Do you see anything obvious? I know,
> > we spoke about putting the line resolver into libgpiod but I'm not
> > sure we really want it. At least in the core library anyway. The GLib
> > layer on top of libgpiod is a place that would be a good target for
> > such a functionality IMO.
> >
>
> Yeah, making the line resolver generally available is a can of worms.
> Not prepared to take that one on at the moment.
> I'm reasonably content to leave that to the user - as long as they can
> readily iterate over the chips and lines themselves.
> Maybe provide an iterator for all the lines in the system
> available to the user?
>
> > Other than that, I think libgpiod now has everything it needs to cover
> > all use-cases for the uAPI.
> >
>
> The point isn't that coverage is missing, it is to find ways to make
> common tasks simpler.
>
> The ones that spring to mind so far are:
>  - C: requesting a single line as output
>  - C: requesting a single line as input
>  - providing a toggle function for line_value, as it is an enum which is
>    a bit awkward.
>  - the chip iterator in the python tools helpers.py
>  - streaming operators for the enums where they are not automatically
>    provided
>
>
> The C ones are specifically for simple sysfs-like equivalence, as telling
> users they need to replace a single write to a file with ~100 lines of C
> is really hard to sell.

You don't really need 100 LOC for a trivial request in C (it's a bit
over-dramatic :) ) but my thinking is: whether it's 5 lines or 10 or
100 - it doesn't change the fact that it is a fundamental change from
sysfs in that you need to write the code, compile it, link it against
the right libraries etc. etc. It will be so much more work no matter
how much you simplify the API and that is already enough to scare away
a lot of folks used to just writing to a bunch of files.

This is why I'm proposing the DBus API as a way of replacing several
features of sysfs that are so beloved by users: central authority over
GPIOs, easy to use from shell scripts (just replace "echo 223 >
export; echo output > 223/direction" etc. with "gdbus call --system
--dest io.gpiod1 --object-path /io/gpiod1/gpiochip2 --method
io.gpiod1.Chip.RequestLines <args>" which is just a tiny bit more
verbose but achieves the same goal and exposes all uAPI v2 features)
and only requires including the dbus daemon in your system which would
be packaged by most distros shipping libgpiod eventually. DBus has the
advantage of being usable from any language you fancy and still being
relatively fast.

In other words, I'm thinking that packing a lot of "helper" features
into libgpiod will only lead to feature creep but not achieve the goal
of pulling people away from sysfs.

Bart

> The config options would be as minimal as possible.
> I was going to suggest the user could always reconfigure the line later
> if they need extra features, but there is no function to return the
> existing line config :-(.
>
> Cheers,
> Kent.
