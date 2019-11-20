Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E26D103827
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 12:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbfKTLA7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 06:00:59 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:36457 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfKTLA7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 06:00:59 -0500
Received: by mail-il1-f195.google.com with SMTP id s75so23020399ilc.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 03:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H0VLEOr+BWjv22xyhzHOVMVtFGXE+eKLBLoRttzCdOg=;
        b=U8Yo5fHHbkW6Bamkyg9owxx1B9yjJ+Y/+fEac5i7X/Oslx6NbcPDit2T16Qz+NOgO+
         EIfXpRNy/8PJiiK62gJFWMc4zvHz+FPHq8GJeaygn0LgNNjW5uOSEZObrzQfOrqWQZnB
         wCPqv1pX/OYaCTVdUpglGAIGwHx691NXh7vV5ZtvycWo9BrGjSmP1xnhxAhb0Wg1z3rb
         cZbwSHqUwKSuanNcQIdpMnk++MT/RDbBQfsYyhF936wpwovi0939jYqLxMgHJgH/9ps6
         ADufUiFhxk4sGewr3wJGlUPe1FYIZNO91WDpqynVUWe/9ORbee+oe6oiBoUMXmES9QYb
         pcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H0VLEOr+BWjv22xyhzHOVMVtFGXE+eKLBLoRttzCdOg=;
        b=c+zo0UarynqUgiIwNbfcPrhiKKQvyWw3PzGp/arCa2xPELUodCGhODXkeXqpWd+8sn
         2dBSkLixwBJmfds1a6wVdjIUy6BkSndQ+xxaDd3feZYy7kjdhVFyiI9eKsBKmPdLW/yn
         BmVTtHImp9SYpJpR9slzF1QsTVFwKFLWOk0vhyvdt0d2ULpwaJWi+lRGmOkeYG/uZMA8
         a9Hnb+zLZ0j34xpxEI9cnp9e6X2fbxspVBWiiMpOKan4zLhbdJGNjzyv058tP4KI+k0r
         XPtw3uHi/uirgHxzb6k5WYKm9b6lP9g23R/oGzpvxpIVfhcWTRRNNRrcNN5lAzA5ghKe
         39Ow==
X-Gm-Message-State: APjAAAXzBle04Fg7h/4xxYCmU4BXj6w/LcpyYL3p4dyLBaXmgBXk0ahD
        cJiwLyZarDp8biZ+g+FLl4cZgYqPQnwPPdTlQLWvGg==
X-Google-Smtp-Source: APXvYqybonlhKZufb761b1oGb7TQRku4HYAHxtaGfzQ8BApdrDFXQs9tGZV42qsn1k5nSjseqRKUWYZafsn/t8UU36g=
X-Received: by 2002:a92:9a17:: with SMTP id t23mr2827381ili.40.1574247656059;
 Wed, 20 Nov 2019 03:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol> <20191119155249.GA20834@sol>
In-Reply-To: <20191119155249.GA20834@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 20 Nov 2019 12:00:45 +0100
Message-ID: <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
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

wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > +
> > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int fl=
ags)
> > > > +{
> > > > +       struct gpiod_line *line;
> > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > +       unsigned int i;
> > > > +       int direction;
> > > > +
> > > > +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> > > > +       if (line->as_is) {
> > >
> > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > really needed.
> > >
> >
> > It is there for gpiod_set_flags, which has to populate the direction
> > flags in the SET_CONFIG ioctl. The existing line->direction is
> > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > as-is is gets mapped to input.
> > I didn't want to change the existing line->direction, and adding the
> > as-is seemed clearer than adding another flavour of direction that
> > contained all three.
> >
>
> Hmmm, I think I see what you were getting at - the line->direction is the
> direction from the kernel, so it doesn't hurt to use that value to set th=
e
> corresponding request flags - even if the original request was as-is??
>
> If that is the case then the line->as_is can be dropped throughout.
>
> Kent.
>

Yes, this is what I was thinking. Just need to make sure the value
from the kernel is up-to-date.

Bart
