Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF6FD103CFA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 15:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730758AbfKTOJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 09:09:11 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:43828 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728541AbfKTOJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 09:09:11 -0500
Received: by mail-io1-f65.google.com with SMTP id r2so22593973iot.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0jPoWJUOAeZZL/BKxoL/eHjzOZMO0QPQjJsWPDITgN4=;
        b=oiibsstRJNihshZRNnVLHZmj5PAHMW9EQMwziX2WCDSnoiSlfhyBB+D68xCPtoYI4u
         KMgbPetHE5F6lLJlfz99EP7XPLtEir6RAQt+ZGHLvjU2qnEUWpqG/aQLj4AWTME2RBd9
         eJ9ffOOtSuAFUTJuQ4coW5pAQ2o90h7zJankZGYJLOTzCZ+Oj/0v0biZHZTejQ7QMatv
         eBjWf8HESpzQJRxQHCKEi8GNMzYnysspMVtC1DMJ4GiSl/doy1KzP6h/3CWFctHEF8D+
         bOyR9n3JKAZ7B17RL4CF5zgpe3SXOORy5pPn+gdXZLbRSIxfwdX0UWQSjCG7rO7v+f0R
         WQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0jPoWJUOAeZZL/BKxoL/eHjzOZMO0QPQjJsWPDITgN4=;
        b=LFlRN1D6SZESlcvoTCY1K9SNnogvGl/cVCQftY49HjBhnS4BnFVs1sfWdC3Rr+KKAQ
         Vo6/wBGT30UZnvg9mxsHAxh3xNeWgu/zVNXBTIQNeBZR/+5glrSlaWbM9E6qxNIBS3nz
         EcnPka3CUxiBddKTs8DacDKe5YANqbC9cWU4s3WolQNGh0VLsR+kQJRZd6Ppp1brRvYm
         xXwwHsw7R7bZcTumDrWDu307iMamiCNWWTh40P8vKYj33icGOPsVxpoECQOy1ELO77+j
         8Dd5bMo3RfgwlaZniAwST/xeyhXfgiZMWDOUUaQ1QIvx+FxknIHEtA7to+i1dZDejGAp
         DDsQ==
X-Gm-Message-State: APjAAAW51lru9AfNbXL1AxKkI+0efpP2r+GRo6VJS9f+BF4o9Whr8Kla
        2CbSq07d+uE6mk+HFHQFk3br4GW/263q7S7ZOCfzu+Iy
X-Google-Smtp-Source: APXvYqw8l8dma/eUp0KGEVhJBdTZykoKAgt5syU2WXEIR5X+1GPaizUAycFyFbPsSTqf1pxgRVqHJY1Gi1GWHLLcQdY=
X-Received: by 2002:a6b:ef0d:: with SMTP id k13mr2231289ioh.220.1574258948430;
 Wed, 20 Nov 2019 06:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol> <20191119155249.GA20834@sol> <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol>
In-Reply-To: <20191120135857.GA4218@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 20 Nov 2019 15:08:57 +0100
Message-ID: <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
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

=C5=9Br., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > +
> > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, in=
t flags)
> > > > > > +{
> > > > > > +       struct gpiod_line *line;
> > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > +       unsigned int i;
> > > > > > +       int direction;
> > > > > > +
> > > > > > +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> > > > > > +       if (line->as_is) {
> > > > >
> > > > > Can you explain the purpose of this as_is field? I'm not sure thi=
s is
> > > > > really needed.
> > > > >
> > > >
> > > > It is there for gpiod_set_flags, which has to populate the directio=
n
> > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > as-is is gets mapped to input.
> > > > I didn't want to change the existing line->direction, and adding th=
e
> > > > as-is seemed clearer than adding another flavour of direction that
> > > > contained all three.
> > > >
> > >
> > > Hmmm, I think I see what you were getting at - the line->direction is=
 the
> > > direction from the kernel, so it doesn't hurt to use that value to se=
t the
> > > corresponding request flags - even if the original request was as-is?=
?
> > >
> > > If that is the case then the line->as_is can be dropped throughout.
> > >
> > > Kent.
> > >
> >
> > Yes, this is what I was thinking. Just need to make sure the value
> > from the kernel is up-to-date.
> >
>
> So fail if needs_update?
>
> Kent.

I'd say: do an implicit update before setting config.

Bart
