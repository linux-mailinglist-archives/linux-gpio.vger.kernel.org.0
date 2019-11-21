Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25FDD104B23
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 08:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfKUHNz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 02:13:55 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:36889 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKUHNz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 02:13:55 -0500
Received: by mail-il1-f196.google.com with SMTP id s5so2288252iln.4
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 23:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H5eZbelhZBusLtNbHD4GUAhb1UqQXeIIxNeX4fuaWJI=;
        b=xhRJ4su+pFMh3Ig+tS1kda+KpNAcsF0spbrTzK8/w3ve8QHlbgqX8OBworsJuPXtoR
         +IBLs9YV7eSRbt82j5VYGQ1jefzf/KtsD7YhpzbhK1sJlz5yYQvTkzd1AUcxYUIqGxh3
         x+PrJaQSbhW7lquyEa3FGa25Sa6xw2Jzz0a7vFBtM4sOZ3d3Pmf+gDEFHEUG3JLRgtE8
         LPgD4dd8FJrCQt+SgeXCSifQK9G+lMLYQCL4tvPfeLW4AgUPCx7n54vdeT+Pj/RkTSvV
         t4Gj7rpLC0AanAxrBEggExFzAj7SsEuUwuaDUlr6ckdT8SCW+lynwwYuS9oIn7+duMPk
         s6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H5eZbelhZBusLtNbHD4GUAhb1UqQXeIIxNeX4fuaWJI=;
        b=RFGjVGXToCGHbyIIWHctUAIAkdU+rbHeRjH+RTtHKFKwNzEswtEY3/HyGmFYkV86tW
         Nvmb+NAadZnGAOOeaNhbMlP00ESXqKv/j1XKehbjouvnqEfEWJTRs35rMkrkEFSUP4hT
         mp8B1so4yp1hrLeUsxU7Yu1HJPFSGkGJ/vZ/2c7kUH5wIZLD1mEBufpr98saNygS1M8t
         EzmQgvj1fnfeZ4Dy5ChPzaLe4vqDJ9xLUkB6Ldym70A+8tzTK7auSGok+VmyPVyexbX6
         SwGVmSoOH/To7eCKF/hObsBAT7+Y9kRVfFnL9BW2V3GnUvqcPvO5OonTwmImiVpQqdR4
         OckQ==
X-Gm-Message-State: APjAAAUGQuJKNxqVPkXMSyLkl3ylFyrqe85rHaPMgB5XZoSCJusErRgh
        5YaBUOOzhaqDR77ifEhEoAjQIapydgqjKFRfSYbLOA==
X-Google-Smtp-Source: APXvYqwmHTcwmxDDgxgCcXOPv0UXWw0Zne4yWCbzNyYSvPETpb01ApA8lgWUOqoIwxrFCmJ6uF9JTd5o5Mnof8bBsUo=
X-Received: by 2002:a92:ba09:: with SMTP id o9mr8984784ili.6.1574320433350;
 Wed, 20 Nov 2019 23:13:53 -0800 (PST)
MIME-Version: 1.0
References: <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol> <20191119155249.GA20834@sol> <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol> <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol> <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol> <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol>
In-Reply-To: <20191121003443.GA7695@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 21 Nov 2019 08:13:42 +0100
Message-ID: <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> > > > =C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> na=
pisa=C5=82(a):
> > > > >
> > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com=
> napisa=C5=82(a):
> > > > > > >
> > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com>=
 napisa=C5=82(a):
> > > > > > > > >
> > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wro=
te:
> > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golas=
zewski
> > > > > > > > > > > > +
> > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bu=
lk *bulk, int flags)
> > > > > > > > > > > > +{
> > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > +
> > > > > > > > > > > > +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > >
> > > > > > > > > > > Can you explain the purpose of this as_is field? I'm =
not sure this is
> > > > > > > > > > > really needed.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > It is there for gpiod_set_flags, which has to populate =
the direction
> > > > > > > > > > flags in the SET_CONFIG ioctl. The existing line->direc=
tion is
> > > > > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG=
_IS_OUT, so
> > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > I didn't want to change the existing line->direction, a=
nd adding the
> > > > > > > > > > as-is seemed clearer than adding another flavour of dir=
ection that
> > > > > > > > > > contained all three.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hmmm, I think I see what you were getting at - the line->=
direction is the
> > > > > > > > > direction from the kernel, so it doesn't hurt to use that=
 value to set the
> > > > > > > > > corresponding request flags - even if the original reques=
t was as-is??
> > > > > > > > >
> > > > > > > > > If that is the case then the line->as_is can be dropped t=
hroughout.
> > > > > > > > >
> > > > > > > > > Kent.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yes, this is what I was thinking. Just need to make sure th=
e value
> > > > > > > > from the kernel is up-to-date.
> > > > > > > >
> > > > > > >
> > > > > > > So fail if needs_update?
> > > > > > >
> > > > > > > Kent.
> > > > > >
> > > > > > I'd say: do an implicit update before setting config.
> > > > > >
> > > > >
> > > > > So gpiod_line_update if needs_update, and fail if that fails?
> > > > >
> > > > > Kent.
> > > >
> > > > Without the if - needs_update is only set if an implicit update fai=
ls
> > > > in line_maybe_update(). But in this case we need to be sure, so do =
it
> > > > unconditionally.
> > > >
> > >
> > > Given that line_maybe_update is called at the end of request creation=
, and
> > > whenever set_config is called, how can line->direction be inconsisten=
t
> > > with the kernel state - as long as needs_update is false?
> > >
> >
> > I don't think we should call line_maybe_update() on set_config() - in
> > this case we should call gpiod_line_update() and fail in set_config()
> > if it fails.
> >
> > I hope that's clearer.
> >
>
> Not really.  I was already shaky on the needs_update and I'm getting more
> confused about the overall needs_update handling policy by the minute.
>

Yeah it's not optimal. If you have better ideas on how to handle the
fact that the kernel can't really notify us about the changes in
line's flags introduced by other processes - I'll be more than glad to
give them a try. At some point I was thinking about another ioctl()
that - for a requested line - would return a file descriptor which
would emit events when a line changes - for instance, it's requested
by someone else or its direction is changed etc.

I then thought that nobody is requesting this yet and so it may be overkill=
.

Bart

> Perhaps it will be more productive to go to the code.
> I'll send out what I have as v2 and we can go from there.
>
> Cheers,
> Kent.
