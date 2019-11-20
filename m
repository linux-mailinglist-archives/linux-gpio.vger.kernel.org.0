Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C85A7103D22
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 15:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729000AbfKTOSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 09:18:48 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:43320 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730197AbfKTOSs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 09:18:48 -0500
Received: by mail-io1-f68.google.com with SMTP id r2so22631460iot.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 06:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u0tXWcaLK9RphDIRSTBrzvKOjRpD5+gtuBsfF9O5zPg=;
        b=WQAUQ3UI+iB+gY0QSO4I2QNW3f2v+cWdTFfwE1Ln5nTrPze0IiGQxNEBHZfeQOumx2
         Uye7/sZFbi6NzKFpB8UtShjgH9x0nf+6Eh++h0G06PXLjWX7AYkSdJ8/T7qKKRJfWqbv
         ugK+o/V4X3CYCKoeK51A4zlGR08E1R3zRkc3myPuplanZDSGBPUPUPhtz2xq4frmHeKt
         iCivql2iGX+kD7BNRDF2kKHdoexqfDUPtXm4DMTsNXnqh/b/ASddCUT35oSdve5vChMy
         OHj8Shyw/q2/8YOQgCuHDsL5NjMdWOebNaOGcB2Kh4lGUF7GI4efsFInGdR9TnB8B+Xr
         a8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u0tXWcaLK9RphDIRSTBrzvKOjRpD5+gtuBsfF9O5zPg=;
        b=eb+eznJZv4wru/KkPbAkMYRYd6nJPet6Jj+khRv/ut9tOWc0L0qYOFhnXy4XDEG/MX
         XAGQcBhIWARTwEKwgm1jrOOK7knDS0MxyRWR+RVIx7SfCbLelwJwz34cfErXk6ggoQUG
         Clc2vMvcpiQGql/kgK9nfdoKzNjZlv3FoM8n5yiFKK1eucXn/a8ZvO2HlRTZuVJQ6pca
         S2zLbC+sinH1ghrERSa5uekGhSILw0shiGgbpfcj+KBe2NbgDzKhdoVL2Hxpke8rFhgL
         SKKooaOTHFowYiT65VfYt4J9Q0kwKvW11oM1ZcYnZma0ILAWjgqwbkxfKJFANtZtvmuK
         6pcg==
X-Gm-Message-State: APjAAAXIz6HDSMgJEqNGocX98NfCjInDz7kre7cp+XPGtWRPMzpEzP2a
        deo7wqKmepSv6YIM/lMvBVba+ePeCRWehbqU+Wh1gw==
X-Google-Smtp-Source: APXvYqwdouWkdBwNq11GGD8KgvEnnfWmwZ/DP8AwqX8ECJjD2TOOklk53+xAej0cbaAiorTxpg92A79E6lo9DhbZYpg=
X-Received: by 2002:a02:3f1e:: with SMTP id d30mr3241354jaa.102.1574259527482;
 Wed, 20 Nov 2019 06:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol> <20191119155249.GA20834@sol> <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol> <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol>
In-Reply-To: <20191120141353.GA5154@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 20 Nov 2019 15:18:36 +0100
Message-ID: <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
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

=C5=9Br., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > > >
> > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > > +
> > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk=
, int flags)
> > > > > > > > +{
> > > > > > > > +       struct gpiod_line *line;
> > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > +       unsigned int i;
> > > > > > > > +       int direction;
> > > > > > > > +
> > > > > > > > +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > +       if (line->as_is) {
> > > > > > >
> > > > > > > Can you explain the purpose of this as_is field? I'm not sure=
 this is
> > > > > > > really needed.
> > > > > > >
> > > > > >
> > > > > > It is there for gpiod_set_flags, which has to populate the dire=
ction
> > > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT,=
 so
> > > > > > as-is is gets mapped to input.
> > > > > > I didn't want to change the existing line->direction, and addin=
g the
> > > > > > as-is seemed clearer than adding another flavour of direction t=
hat
> > > > > > contained all three.
> > > > > >
> > > > >
> > > > > Hmmm, I think I see what you were getting at - the line->directio=
n is the
> > > > > direction from the kernel, so it doesn't hurt to use that value t=
o set the
> > > > > corresponding request flags - even if the original request was as=
-is??
> > > > >
> > > > > If that is the case then the line->as_is can be dropped throughou=
t.
> > > > >
> > > > > Kent.
> > > > >
> > > >
> > > > Yes, this is what I was thinking. Just need to make sure the value
> > > > from the kernel is up-to-date.
> > > >
> > >
> > > So fail if needs_update?
> > >
> > > Kent.
> >
> > I'd say: do an implicit update before setting config.
> >
>
> So gpiod_line_update if needs_update, and fail if that fails?
>
> Kent.

Without the if - needs_update is only set if an implicit update fails
in line_maybe_update(). But in this case we need to be sure, so do it
unconditionally.

Bart
