Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 178A6F07BA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 22:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbfKEVIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 16:08:10 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35058 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEVIK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 16:08:10 -0500
Received: by mail-oi1-f195.google.com with SMTP id n16so18934637oig.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ElNnevYis1FXStsdk/kEzM4gDbVBm+6+SWwf/9Fxs4Q=;
        b=LdW0RIZ0t769NUcSmvEvYhjJyXQ0Z92qvkx13CdYLWjzhrne5T8XjPUdf8kCS3Vlxp
         6MRsmzSRvFrErdRPX41nQYgQ7eP3CyIpIzJx/q7DCdXSpNhKz4g51y/aemqkBeYJEbYI
         Dnv676omi0iVCqVtxPI7XIrrFrbsL/Sdhnss0lSg81EtJDy92st8tLO9DoYcZuV+K/SM
         rOpW1BC89bmSDwTGzOLbzoA/DFZW7kRCIoRmSJRrR3sKyHq+kPKFnUMicWywBwU3AbQV
         Cloio8llsP97jntj0Z4xj6+fQSeIeovuTHWj91IFmR5NRaeQIFH+0HI1OE+sKhG9yjVh
         TiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ElNnevYis1FXStsdk/kEzM4gDbVBm+6+SWwf/9Fxs4Q=;
        b=hbFeTToiDEBhWAge1lQjrLp6jNnHzMi0yzOgo9AeIzSxkOe6JhnlqOKTKAvKL8XU3O
         Pw1SowdKGcX3jYOvATkOZXhOuvd+FI6gCetHtBdmjfjKp8tzU19zx6y1hUoBanaUsXCP
         p1ibdYsKsJXf5vKPyNYiIGyXTs73wObpqny8vguO7vnsQ96VcTZqTgH6Rq5ulM+XMUFi
         mMe+jD8u0evGj57eViCQNXE3+bprIbUjCgC7Tm8QYKPOepBogNsi1lO0pVQnoX3vrDjM
         TS+ay4QBhHwFGhjq2PffQQQhXBrt1BnqmEY7KiQbfB/EWTFIFKiJG5ABRBajuQEcT5+r
         s32w==
X-Gm-Message-State: APjAAAXFF8uWkjUjJirV1luj05CQYrkBy39UAnFBuIeTSQfuvrCd84R0
        YvBrTTGL37FM4sy4Bxa79/689K0Jr3C4ZWueI056Cwwm
X-Google-Smtp-Source: APXvYqx45op8W36+oFnvZeYjBYkaCvlaSgcpFWwtZazVvwtCNCnc3G0Y4lvybymHplPfM5JNcRuRxN22X2o/lAKUvog=
X-Received: by 2002:aca:d904:: with SMTP id q4mr914282oig.21.1572988089165;
 Tue, 05 Nov 2019 13:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com> <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
In-Reply-To: <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 Nov 2019 22:07:58 +0100
Message-ID: <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 5 lis 2019 o 17:24 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> wt., 5 lis 2019 o 16:26 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
> >
> > On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> > > Patches are against Bart's gpio/for-kent branch[1].
> > >
> > > The patch has been successfully tested against gpio-mockup, and
> > > on a Raspberry Pi, in both cases using the feature/pud_set_config
> > > branch of my Go gpiod library[2], as well as with my feature/pud
> > > development branch of libgpiod[3].  Patch 7 has only been tested usin=
g
> > > my gpiod library as libgpiod has not yet been updated to support the
> > > SET_CONFIG ioctl.
> > >
> >
> > I've just pushed a first pass at SET_CONFIG support into my libgpiod
> > feature/pud branch.  It is causing me a bit of grief.  Due to the way
> > the libgpiod API is structured, with the direction flags pulled out int=
o
> > the request type, I thought it would be cleaner to keep changes to dire=
ction
> > orthogonal to changes to the other handle flags.
> >
>
> I'd love to see that branch - is it public?
>
> > So I've added these methods to the API:
> >
> > int gpiod_line_set_config(struct gpiod_line *line, int flags)
> > int gpiod_line_set_direction_input(struct gpiod_line *line)
> > int gpiod_line_set_direction_output(struct gpiod_line *line,
> >                                     int value)
> >
> > along with their bulk equivalents.
> >
> > I've coded that and started adding tests when I tripped over changing
> > bias.  The kernel requires a direction to be set, but I'm setting it
> > as-is in gpiod_line_set_config - so that wont work.
> > Open drain/source are in the same boat - they require output mode.
> >
>
> Ha! Yes this is a problem - how about this:
>
> If the caller of set_config in the kernel doesn't pass any of the
> direction flags, then we read the current direction, set the right
> flag in lflags and only then call the function validating the flags?
>

After another thought: this would be a bit inconsistent with the rest
of the flags. IIRC this was the reason for me to split the
request_type and other flags into two separate fields in libgpiod in
the first place.

When I think about it: the kernel behavior should be as predictable as
possible - if we keep the behavior as is in v6, I don't see why we
couldn't make userspace cache (or re-read) the current direction when
setting flags other than direction? Do you see any trouble in that?
That way we'd avoid having the kernel treat different flags in
different way.

Bart

> > I see these options:
> >  1. set the direction as part of gpiod_line_set_config
> >  2. relax the kernel restriction.
>
> Yes, I don't think we should force users to always pass the direction
> flag in set_config. Good point.
>
> >  3. don't support changing bias or open source/drain.
>
> No! We definitely want to support it in libgpiod.
>
> >  4. rethink the API.
>
> As for libgpiod: I think we should have a low-level
> gpiod_line_set_config() that would set both the direction and other
> flags (it could for instance only accept two request flags: input and
> output) and then a higher-level set_flags(), set_direction_input(),
> set_direction_output() that would call the low-level variant and - for
> set_flags() without the direction argument - it could simply retrieve
> the current direction and pass it to gpiod_line_set_config().
>
> But this is only a vague idea - I'd have to actually start looking at
> the code to be sure. I'd love to see what you came up with so far
> though!
>
> Bart
>
> >
> > The first option requires caching the value set for outputs which I'm a
> > bit hesitant to do, though I'm not sure why - I've already added cachin=
g
> > of the handle flags for the direction functions.
> >
> > Any preferences or suggestions?
> >
> > Cheers,
> > Kent.
