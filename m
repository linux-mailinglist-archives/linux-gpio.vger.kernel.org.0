Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C12E104E46
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 09:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUIqV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 03:46:21 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:35168 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUIqU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 03:46:20 -0500
Received: by mail-il1-f195.google.com with SMTP id z12so2513134ilp.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 00:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z1QgzGREdqwi8UMPk3jjPPm+iWv36u3lbVAZ8pOOclQ=;
        b=l+uxW1NQzRAFz/7avA42neG2l6SgfqAKmaqIP8rk0/SaKf6/iPeNqbj0Y9NRP4JXme
         qOYXTYAGk3piKNG0KZgIoW3KNscDY+HOhHbkSeRsj/idEy4U7e4/FvZZKaIfINZkxzdY
         6mC29CuzexdQOv3cuz2T6iPPgKUKIY0Kc8LvzdPNVRj6kK7jQycsqgRUIn50zR69jL9j
         xx3rzZl7w+SGpevrURSKHZvVABaiVp9DotFiu97L2i13BA9nMM6mpOEsmcH2kdRsJH2V
         EJuBbqJdMEM7aXd7Wrc7ix0NZnhWIAoi5e8H4ikyDa3ASeUvkhvcZ0Lk6vDiGxXey1qQ
         CiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z1QgzGREdqwi8UMPk3jjPPm+iWv36u3lbVAZ8pOOclQ=;
        b=iPLobMSUei1R/RuND1KVlW+h76ZtuJ8UxkF3OFWaIDh+zLV9Rvpp3QO+o+U/Hrqf9K
         OOexhuKcRfbhPSnVeI3WyxBXiqpM7aTd98JlD1tutInsEk9YAnImo/tgpIOt1KBieXNA
         g+Ehh50sjHl8nBlRR27SV25n0bEAifXMP/hA1m7BZL+nHSAAePzUoG63m8t4wMMTWGwB
         QBllI3EM9INqa0bq/LMhNWoKUPyrUYRwF8WT0nQFISaBlcmcdNMQFyeY/jxvKOkHX0m6
         vkzWUS9r4iVnT4JejIqULzNAYtbbH5Q/loaCC3WXQevIW2rZIjXdw6w4b3f7CDq9woDK
         O2GA==
X-Gm-Message-State: APjAAAWGscs/PZ6eCSH8m5q4XYjxyv+Y29RzC2r3cCXS0d8lt0gtTU+O
        e0xSXTO+4JNaruczp9YXViyvktcN9Lo01xboYFm5gg==
X-Google-Smtp-Source: APXvYqzTCArvXg3gVyY9u9SWwwylvAWvgFYz0iai3WfRfWHsAl41g9ZmgzStERokDsWhtk+3+l/RiTKiKbARsLQjOqk=
X-Received: by 2002:a92:104a:: with SMTP id y71mr8684342ill.220.1574325978165;
 Thu, 21 Nov 2019 00:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20191119155249.GA20834@sol> <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol> <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol> <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol> <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
 <20191121003443.GA7695@sol> <CAMRc=MebbS86gvXytYrCBOyNVr74fTiVXG+NP0sx0F6SkAL_+A@mail.gmail.com>
 <20191121074621.GA17026@sol>
In-Reply-To: <20191121074621.GA17026@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 21 Nov 2019 09:46:07 +0100
Message-ID: <CAMRc=MeOAsOU4PVuUd1CPVLhcTWaj_e7AzQSi4u-m3Gf9m3xqQ@mail.gmail.com>
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

czw., 21 lis 2019 o 08:46 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Nov 21, 2019 at 08:13:42AM +0100, Bartosz Golaszewski wrote:
> > czw., 21 lis 2019 o 01:34 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Wed, Nov 20, 2019 at 04:18:24PM +0100, Bartosz Golaszewski wrote:
> > > > =C5=9Br., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> na=
pisa=C5=82(a):
> > > > >
> > > > > On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > =C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com=
> napisa=C5=82(a):
> > > > > > >
> > > > > > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail=
.com> napisa=C5=82(a):
> > > > > > > > >
> > > > > > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golasze=
wski wrote:
> > > > > > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.=
com> napisa=C5=82(a):
> > > > > > > > > > >
> > > > > > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson=
 wrote:
> > > > > > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz G=
olaszewski
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_lin=
e_bulk *bulk, int flags)
> > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > > > > > +       unsigned int i;
> > > > > > > > > > > > > > +       int direction;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +       line =3D gpiod_line_bulk_get_line(bulk,=
 0);
> > > > > > > > > > > > > > +       if (line->as_is) {
> > > > > > > > > > > > >
> > > > > > > > > > > > > Can you explain the purpose of this as_is field? =
I'm not sure this is
> > > > > > > > > > > > > really needed.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > It is there for gpiod_set_flags, which has to popul=
ate the direction
> > > > > > > > > > > > flags in the SET_CONFIG ioctl. The existing line->d=
irection is
> > > > > > > > > > > > either input or output.  It is drawn from GPIOLINE_=
FLAG_IS_OUT, so
> > > > > > > > > > > > as-is is gets mapped to input.
> > > > > > > > > > > > I didn't want to change the existing line->directio=
n, and adding the
> > > > > > > > > > > > as-is seemed clearer than adding another flavour of=
 direction that
> > > > > > > > > > > > contained all three.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Hmmm, I think I see what you were getting at - the li=
ne->direction is the
> > > > > > > > > > > direction from the kernel, so it doesn't hurt to use =
that value to set the
> > > > > > > > > > > corresponding request flags - even if the original re=
quest was as-is??
> > > > > > > > > > >
> > > > > > > > > > > If that is the case then the line->as_is can be dropp=
ed throughout.
> > > > > > > > > > >
> > > > > > > > > > > Kent.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Yes, this is what I was thinking. Just need to make sur=
e the value
> > > > > > > > > > from the kernel is up-to-date.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > So fail if needs_update?
> > > > > > > > >
> > > > > > > > > Kent.
> > > > > > > >
> > > > > > > > I'd say: do an implicit update before setting config.
> > > > > > > >
> > > > > > >
> > > > > > > So gpiod_line_update if needs_update, and fail if that fails?
> > > > > > >
> > > > > > > Kent.
> > > > > >
> > > > > > Without the if - needs_update is only set if an implicit update=
 fails
> > > > > > in line_maybe_update(). But in this case we need to be sure, so=
 do it
> > > > > > unconditionally.
> > > > > >
> > > > >
> > > > > Given that line_maybe_update is called at the end of request crea=
tion, and
> > > > > whenever set_config is called, how can line->direction be inconsi=
stent
> > > > > with the kernel state - as long as needs_update is false?
> > > > >
> > > >
> > > > I don't think we should call line_maybe_update() on set_config() - =
in
> > > > this case we should call gpiod_line_update() and fail in set_config=
()
> > > > if it fails.
> > > >
> > > > I hope that's clearer.
> > > >
> > >
> > > Not really.  I was already shaky on the needs_update and I'm getting =
more
> > > confused about the overall needs_update handling policy by the minute=
.
> > >
> >
> > Yeah it's not optimal. If you have better ideas on how to handle the
> > fact that the kernel can't really notify us about the changes in
> > line's flags introduced by other processes - I'll be more than glad to
> > give them a try. At some point I was thinking about another ioctl()
> > that - for a requested line - would return a file descriptor which
> > would emit events when a line changes - for instance, it's requested
> > by someone else or its direction is changed etc.
> >
>
> I didn't realise it was possible for a requested line's flags to be
> changed by other processes.  Quite the opposite - I thought that was one
> of the reasons for GPIOD was to allow the userspace to prevent other from
> processes messing with requested lines.
>

Ugh, sorry, was writing it before coffee. I was thinking about a
non-requested line. Something like lineinfo ioctl() but returning an
fd notifying about changes. Maybe we could even consider having
lineinfo2 ioctl() which would be extended with this functionality -
not only would it fill the relevant structure but also pass a new fd
for notification about changes.

Bart
