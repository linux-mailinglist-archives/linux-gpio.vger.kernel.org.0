Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27508103E25
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 16:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbfKTPSh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 10:18:37 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:43149 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbfKTPSh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 10:18:37 -0500
Received: by mail-io1-f68.google.com with SMTP id r2so22870439iot.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 07:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nDogTgp81BEgfJrLbr767iz9NWJwxhR/4maCdTe1Grc=;
        b=TbBcHkMMHrxnRvMVcDQHoweXOok93YsaMt7gZvvwGCG1erBfLljGo+hXV9EkBX/rZM
         llAtWkJVreiiMiIdwCCqkkUd5O1SWmD99+vDZu6p9KqYYwB9ohiBp2viGd8KcJRUJXKV
         rVvlbdt71/tYYoaootP691Oeuv2tWARxjXuro9bbPbtDPlEwzrYrX1nne0ByNG2kj125
         HzXk+8TCCYXtdXKuojOl9GNDip7TIniARNSaydifRTB4fCXFSmNXcxhDpWMdNCzARkk0
         E+yQJ/lXkg9F4Fo77RGeGuCyDNJrrhKVt6HOHPKSbTbJKsFEmc2PYq+z21YtAW17w7I7
         NMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nDogTgp81BEgfJrLbr767iz9NWJwxhR/4maCdTe1Grc=;
        b=E8M5nmI1IiRYHGhZS97JW5F7WIQYdTO1tJwaUu1ZVHQSbWSzB5h24xJcwgB3+K1gBp
         HVaIh99k6m8iZkcQAbrnEsrZAquwY4VNub7br7zWaxBaSpmzGYOM3YGpUKkacul4oJS8
         Gz5dLEqMM+7RjjJXNR7TaAn9EV1++hRbrT/naft24SduesVIk/lGKBbPMW9NHMOaShAt
         aO2pxus0ve7/2bLjGmcCeURkgcWhHjnxFg+KkY5dxtuZ/pwyxrqBS7ycfKM94Ui0cO9C
         8CJFrjDPmNigSZm7o7X8RdaDDNOSY3fDFKc1rKYZEZ/G/9OAKRJwHCBOuocwN0lU6hWu
         kpdQ==
X-Gm-Message-State: APjAAAWFHY0DxfXfGiCuOrUWU5KU6gw2BXweZRUHssQuMc1V7fxOa24g
        +wpTw3ONo0YOyK3NU93uGlrGMTieu+V6YQjm9tmgUKxu
X-Google-Smtp-Source: APXvYqyNcXSPpUNqnqeiP84/Ezkcor6z00gJgQaCEfCDyxYlYFu0wKTL4T1eiU/6B9RqnYNmEfHwZZfl5rhXEjptZ+s=
X-Received: by 2002:a5d:8b83:: with SMTP id p3mr2511030iol.189.1574263114878;
 Wed, 20 Nov 2019 07:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol> <20191119155249.GA20834@sol> <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol> <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol> <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
 <20191120143644.GA5865@sol>
In-Reply-To: <20191120143644.GA5865@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 20 Nov 2019 16:18:24 +0100
Message-ID: <CAMRc=Mex6M9Mmke9ajgLcpy4-Th+GOhycjeEiM+5PMBvmA+Apw@mail.gmail.com>
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

=C5=9Br., 20 lis 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > > > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> na=
pisa=C5=82(a):
> > > > >
> > > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> nap=
isa=C5=82(a):
> > > > > > >
> > > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszews=
ki
> > > > > > > > > > +
> > > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *=
bulk, int flags)
> > > > > > > > > > +{
> > > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > > +       unsigned int i;
> > > > > > > > > > +       int direction;
> > > > > > > > > > +
> > > > > > > > > > +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > > +       if (line->as_is) {
> > > > > > > > >
> > > > > > > > > Can you explain the purpose of this as_is field? I'm not =
sure this is
> > > > > > > > > really needed.
> > > > > > > > >
> > > > > > > >
> > > > > > > > It is there for gpiod_set_flags, which has to populate the =
direction
> > > > > > > > flags in the SET_CONFIG ioctl. The existing line->direction=
 is
> > > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_=
OUT, so
> > > > > > > > as-is is gets mapped to input.
> > > > > > > > I didn't want to change the existing line->direction, and a=
dding the
> > > > > > > > as-is seemed clearer than adding another flavour of directi=
on that
> > > > > > > > contained all three.
> > > > > > > >
> > > > > > >
> > > > > > > Hmmm, I think I see what you were getting at - the line->dire=
ction is the
> > > > > > > direction from the kernel, so it doesn't hurt to use that val=
ue to set the
> > > > > > > corresponding request flags - even if the original request wa=
s as-is??
> > > > > > >
> > > > > > > If that is the case then the line->as_is can be dropped throu=
ghout.
> > > > > > >
> > > > > > > Kent.
> > > > > > >
> > > > > >
> > > > > > Yes, this is what I was thinking. Just need to make sure the va=
lue
> > > > > > from the kernel is up-to-date.
> > > > > >
> > > > >
> > > > > So fail if needs_update?
> > > > >
> > > > > Kent.
> > > >
> > > > I'd say: do an implicit update before setting config.
> > > >
> > >
> > > So gpiod_line_update if needs_update, and fail if that fails?
> > >
> > > Kent.
> >
> > Without the if - needs_update is only set if an implicit update fails
> > in line_maybe_update(). But in this case we need to be sure, so do it
> > unconditionally.
> >
>
> Given that line_maybe_update is called at the end of request creation, an=
d
> whenever set_config is called, how can line->direction be inconsistent
> with the kernel state - as long as needs_update is false?
>

I don't think we should call line_maybe_update() on set_config() - in
this case we should call gpiod_line_update() and fail in set_config()
if it fails.

I hope that's clearer.

Bart

> Kent.
