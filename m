Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 834F810508B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 11:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKUKcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 05:32:05 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35683 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfKUKcF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 05:32:05 -0500
Received: by mail-oi1-f196.google.com with SMTP id n16so2746209oig.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 02:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TZgYx8JXGfPwAIHJ+nWq/BG6c9+nL97xCXqKuodBuak=;
        b=fNeLbKmYj73sbUMY9Jkh+qfku41Bsp/uddKmLltTpbRC7oTeJ22Jr8M0fQxB/aJqju
         9ZrSjoM2kRka65pptZeN1/v5M2xTxt5evMa+nTx9kZJbqSYoXgYsdGwqgYCp89QvvZ5t
         pNoRpKNuKkjgCe42KZx6A0stIP3X3eKVK+/S7ntedq8tAHfv5NLzTFxdvGUYQofPt10P
         1n4ILXwBQ6RwQdavV+F2qybvuipx9Rna1Ky5sD4hiTwJrDFS1WSTrBZCF4gDsfqazIhL
         YJRrkc725JBf9eBk3ClA4fJJuFd3aegb33J3vyXjLshLITXKgLlIk6q6QxAZIfTUy4Jl
         mXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TZgYx8JXGfPwAIHJ+nWq/BG6c9+nL97xCXqKuodBuak=;
        b=qLg3B+Klfuk1faRlx1b4WbU7hU6hXT+I7XEjM+1V2vD4bC8O39KtPtEKLBi/yLdH60
         QjDWURHMehXbIUVhxvg/EmrkRXa5Uw5mIXA1l86YacoB8Z4TrsysYZBqnH56dGg3e31p
         +xB0Zm2LEnMyu2elqEkEhe9dpxthltdXW4XqrOfhA1NdNvJ9+R6j9TOvs8yu4hQHoEUU
         9Q5lkYpVhZzRXaVz1QLStAI0AgUz/wwLeDiVlFx0v51+hzEKRXpNoPaC9Q5ROZv6HcPJ
         Y6/6+AKaqrji2aAdzPR8TgX/Rgxitg+tRWyc8bPCe3fTIPTQxipGa7MmNu9uMqmGP/Tz
         zJuw==
X-Gm-Message-State: APjAAAU1MajzLArc7AAacsTtDT/tcq5KYhXkEPlfXjMhZuG92n+Gtsqc
        NSmQqJJSLwNkiF2dmbuxxJKJbSSzzCBMu6hnO++pCg==
X-Google-Smtp-Source: APXvYqwAWDgY5V/xvsZrd3aj+16fIso8+jEhD+xIFgQn07Cjax8KYkWf8i7VjZqZx7TxcXhHjjJfo3xXaBure2ybDLw=
X-Received: by 2002:aca:d904:: with SMTP id q4mr7038712oig.21.1574332323541;
 Thu, 21 Nov 2019 02:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20191120141353.GA5154@sol> <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol> <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol> <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol> <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
 <20191121093030.GA19142@sol> <CAMRc=Mcy2yNCZOvX5GN-yped1ZXo13bvvk04S-EyfARpGBcRMQ@mail.gmail.com>
 <20191121101808.GA20627@sol> <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
In-Reply-To: <CAMRc=Mct7O2eA7peQ+teei5L2mma-XTsn8Pj-yRk7NCGX_dfxw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 21 Nov 2019 11:31:52 +0100
Message-ID: <CAMpxmJVKS=JcSOvBU9ZDkWVdgNZ9LVxZ3tvn_Da6a_8JMYBRUw@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 21 lis 2019 o 11:27 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> czw., 21 lis 2019 o 11:18 Kent Gibson <warthog618@gmail.com> napisa=C5=82=
(a):
> >
> > On Thu, Nov 21, 2019 at 11:03:32AM +0100, Bartosz Golaszewski wrote:
> > > czw., 21 lis 2019 o 10:30 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > >
> > > > On Thu, Nov 21, 2019 at 09:46:07AM +0100, Bartosz Golaszewski wrote=
:
> > > > > czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> napi=
sa=C5=82(a):
> > > > > >
> > > > > > On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski w=
rote:
> > > > > > > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> =
napisa=C5=82(a):
> > > > > > > >
> > > > > > > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszews=
ki wrote:
> > > > > > > > > =C5=9Br., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gma=
il.com> napisa=C5=82(a):
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golas=
zewski wrote:
> > > > > > > > > > > =C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <warthog618=
@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz G=
olaszewski wrote:
> > > > > > > > > > > > > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <wartho=
g618@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Barto=
sz Golaszewski wrote:
> > > > > > > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog=
618@gmail.com> napisa=C5=82(a):
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, K=
ent Gibson wrote:
> > > > > > > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100,=
 Bartosz Golaszewski
> > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct=
 gpiod_line_bulk *bulk, int flags)
> > > > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MA=
X_LINES];
> > > > > > > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > +       line =3D gpiod_line_bulk_get_=
line(bulk, 0);
> > > > > > > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Can you explain the purpose of this as_=
is field? I'm not sure this is
> > > > > > > > > > > > > > > > > > really needed.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > It is there for gpiod_set_flags, which ha=
s to populate the direction
> > > > > > > > > > > > > > > > > flags in the SET_CONFIG ioctl. The existi=
ng line->direction is
> > > > > > > > > > > > > > > > > either input or output.  It is drawn from=
 GPIOLINE_FLAG_IS_OUT, so
> > > > > > > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > > > > > > I didn't want to change the existing line=
->direction, and adding the
> > > > > > > > > > > > > > > > > as-is seemed clearer than adding another =
flavour of direction that
> > > > > > > > > > > > > > > > > contained all three.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Hmmm, I think I see what you were getting a=
t - the line->direction is the
> > > > > > > > > > > > > > > > direction from the kernel, so it doesn't hu=
rt to use that value to set the
> > > > > > > > > > > > > > > > corresponding request flags - even if the o=
riginal request was as-is??
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > If that is the case then the line->as_is ca=
n be dropped throughout.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Yes, this is what I was thinking. Just need t=
o make sure the value
> > > > > > > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So fail if needs_update?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Kent.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I'd say: do an implicit update before setting con=
fig.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > So gpiod_line_update if needs_update, and fail if t=
hat fails?
> > > > > > > > > > > >
> > > > > > > > > > > > Kent.
> > > > > > > > > > >
> > > > > > > > > > > Without the if - needs_update is only set if an impli=
cit update fails
> > > > > > > > > > > in line_maybe_update(). But in this case we need to b=
e sure, so do it
> > > > > > > > > > > unconditionally.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Given that line_maybe_update is called at the end of re=
quest creation, and
> > > > > > > > > > whenever set_config is called, how can line->direction =
be inconsistent
> > > > > > > > > > with the kernel state - as long as needs_update is fals=
e?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I don't think we should call line_maybe_update() on set_c=
onfig() - in
> > > > > > > > > this case we should call gpiod_line_update() and fail in =
set_config()
> > > > > > > > > if it fails.
> > > > > > > > >
> > > > > > > > > I hope that's clearer.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Not really.  I was already shaky on the needs_update and I'=
m getting more
> > > > > > > > confused about the overall needs_update handling policy by =
the minute.
> > > > > > > >
> > > > > > >
> > > > > > > Yeah it's not optimal. If you have better ideas on how to han=
dle the
> > > > > > > fact that the kernel can't really notify us about the changes=
 in
> > > > > > > line's flags introduced by other processes - I'll be more tha=
n glad to
> > > > > > > give them a try. At some point I was thinking about another i=
octl()
> > > > > > > that - for a requested line - would return a file descriptor =
which
> > > > > > > would emit events when a line changes - for instance, it's re=
quested
> > > > > > > by someone else or its direction is changed etc.
> > > > > > >
> > > > > >
> > > > > > I didn't realise it was possible for a requested line's flags t=
o be
> > > > > > changed by other processes.  Quite the opposite - I thought tha=
t was one
> > > > > > of the reasons for GPIOD was to allow the userspace to prevent =
other from
> > > > > > processes messing with requested lines.
> > > > > >
> > > > >
> > > > > Ugh, sorry, was writing it before coffee. I was thinking about a
> > > > > non-requested line. Something like lineinfo ioctl() but returning=
 an
> > > > > fd notifying about changes. Maybe we could even consider having
> > > > > lineinfo2 ioctl() which would be extended with this functionality=
 -
> > > > > not only would it fill the relevant structure but also pass a new=
 fd
> > > > > for notification about changes.
> > > > >
> > > >
> > > > Whew - that makes more sense. Had me worried there.
> > > >
> > > > Not sure how useful an async info ioctl would be.  Couldn't you bui=
ld
> > > > something equivalent in userspace with the existing API - as long a=
s you
> > > > don't mind the daemon holding the line, and so having to control th=
e
> > > > line via the daemon.  You want to be able to monitor without reques=
ting
> > > > the line?
> > > >
> > >
> > > I'm not sure if I was expressing myself clearly enough: a hypothetica=
l
> > > daemon calls LINEINFO ioctl(). Now a different program or kernel
> > > driver requests this line. The daemon is not up-to-date on its state
> > > unless it polls the line all the time. If a user now asks the daemon
> > > about this line's state - it will be given outdated info. Listening o=
n
> > > this fd would allow us to be informed about such changes immediately.
> > >
> >
> > I think I understand you - but you might not be getting my meaning...
> > I was thinking the daemon would request the lines it wanted to monitor
> > - which is why you would then have to control the line via the daemon.
>
> No, I don't think requesting the line should be obligatory. In my WiP
> dbus daemon, I expose line info for all lines in the system by reading
> LINEINFO for each one. Then - for unrequested lines - every time the
> client asks for any line info again - I call gpiod_line_update()
> before responding. This could be optimized by this lineinfo fd
> feature.
>
> I don't want to force the user-space to choose between using a single
> central daemon or dealing with lines separately.
>
> > The daemon then always knows the state of the line.
> > That obviously isn't the case if you want to monitor a line without
> > requesting it, hence the "You want to be able to monitor without reques=
ting
> > the line?" question.
> >
>
> In other words: yes.
>

Just to be clear: I mean line info - not values or events. By
monitoring I mean: be notified about changes to the line properties
without requesting it.

As for implementation: I imagine an ioctl() called LINEINFO_FD that
would return an open file descriptor on which read events would arrive
when the line properties change and then we could call regular line
info ioctl() to actually re-read it. Does that make sense? I can try
to prepare an example implementation.

Bart

> >
> > > > I'm still puzzled as to when the existing info ioctl could fail on =
a
> > > > requested line - which is when needs_update gets set in
> > > > line_maybe_update().  Hardware being unplugged?
> > > >
> > >
> > > If the ioctl() can fail, then we're obligated to check the return
> > > value. As you say: unplugging the device is a good example - it may b=
e
> > > a GPIO expander on an HID device (e.g. Silicon Labs CP2112) that can
> > > be easily disconnected from USB.
> > >
> >
> > Fair enough. But for failures of that scale shouldn't the line request
> > fail - rather than just setting needs_update?  Or are there less
> > catastrohpic failure modes?
> >
>
> What if the disconnect happens after the request but before the
> update? It's super unlikely, but again: the lineinfo ioctl() can fail,
> so we need to check the return value. We also can't update line info
> before requesting the line as it's racy - someone can change the state
> between the update and the request.
>
> (I hope I'm getting this right :))
>
> Bart
>
> > Kent.
