Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059FD7BAF1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 09:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfGaHus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 03:50:48 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36734 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfGaHus (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 03:50:48 -0400
Received: by mail-oi1-f196.google.com with SMTP id q4so20856962oij.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 00:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Tv+IRLOH9igBfgPJ1ufegAFfrElfA5jMRnFRzKPa6Cw=;
        b=AMbwVCdrU2w7vHSlg8MJHuNbODD9PHAIeZUu3Z9IQx9Ns1UMCTRVZzPO3CxT7DYLcd
         HSiIwcMZpqMMfRgiI8jqG8oIXMcfrFi4k9cYCFHBRzuVRFy76nMOdVS4mgM+9cpRqa+/
         dw5ZEljBzgwDp6dJvF15dL285SBWfz/IZgkHlMFIirwh/eQOT6+ctBK9bawSkv2DyprX
         iyhaiBdE+u3nKD1gkl4UO6bnMB6HZmT2HRs3O/OrHDSIrzTtDTbnY0/7AFwgsGsvZv9M
         loU5XfQz/iXaj9ripnFRQrmugiqmFa7XXhk6uSG4/zLTZeeVXuFD6DikccQ8b8GjArCW
         c+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Tv+IRLOH9igBfgPJ1ufegAFfrElfA5jMRnFRzKPa6Cw=;
        b=BCGLgHV50q5DbtC3rDXKg4vYxIkKiMDwdSmAc35Wd56t+iwXS7AEMqhF735JYfl2gx
         c6E+oCuHkxNZ1+l2pjBtXlpiW0hgOf5+jruOsdA5l5alBlLMLGUxglcds/t/6zV9F5lD
         hO6kytObw0N7P4ea4PfEv522fo1/EAk0gKFVFu/RIOeQFfoBwIhBsv2bjZYjmnuHz88A
         ikdWrmMSWSbgA8D+WCndPpy+wvSzdlnm0ZIZgz2tgUQ/mDkDvkiScAVI/Hvy6KkSN+O8
         bT3id2N0kUD/UKodvHYQ7s+De8FafCPvSrzMEDfEXmwqDWsyYzv6XIbs45D2dX51Ioo8
         yNCw==
X-Gm-Message-State: APjAAAVUWjW3ag9VhofDIyjffzFcmeaRwE9oMryPWULs2en4BmRJxtoo
        K536w3zwPVpfPXXFewNUSU5svohjIl0N/67mQNrpboV0
X-Google-Smtp-Source: APXvYqyKOaC+hkTSWTKm1Xc5Eb/ylgQQPSAaD5PQf9dq92yXvBw54i9adPKJqxKXycso0C2s0LxdT3J6wIgZm27y29U=
X-Received: by 2002:aca:450:: with SMTP id 77mr24844768oie.114.1564559446839;
 Wed, 31 Jul 2019 00:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190730190410.24786-1-rfried.dev@gmail.com> <CAMpxmJUXbxjGqaw+qTiwvAKicjC-MC58BOr6_hw-L76JHWOg0g@mail.gmail.com>
 <CAGi-RUJ7FHt5LbGD22rcO-=vjaeAWdjGWt+TO6HUACvEkpBHAg@mail.gmail.com>
In-Reply-To: <CAGi-RUJ7FHt5LbGD22rcO-=vjaeAWdjGWt+TO6HUACvEkpBHAg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Jul 2019 09:50:35 +0200
Message-ID: <CAMpxmJWhF8mA9Yfof+4TbKqHwGjQCc0gCahMqDGs5oiTufGj+w@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH] gpioinfo: mark kernel claimed lines as used
To:     Ramon Fried <rfried.dev@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 31 lip 2019 o 09:48 Ramon Fried <rfried.dev@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Jul 31, 2019 at 10:44 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > wt., 30 lip 2019 o 21:04 Ramon Fried <rfried.dev@gmail.com> napisa=C5=
=82(a):
> > >
> > > In case where the GPIOLINE_FLAG_KERNEL flag was set because of muxing=
,
> > > The used column was still showing the pin as "unused"
> > > Fix that by writing "used".
> > >
> > > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > > ---
> > >  tools/gpioinfo.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> > > index bb17262..85f8758 100644
> > > --- a/tools/gpioinfo.c
> > > +++ b/tools/gpioinfo.c
> > > @@ -119,8 +119,11 @@ static void list_lines(struct gpiod_chip *chip)
> > >                      : prinfo(&of, 12, "unnamed");
> > >                 printf(" ");
> > >
> > > -               consumer ? prinfo(&of, 12, "\"%s\"", consumer)
> > > -                        : prinfo(&of, 12, "unused");
> > > +               if (gpiod_line_is_used(line) && !consumer)
> > > +                       prinfo(&of, 12, "used");
> > > +               else
> > > +                       consumer ? prinfo(&of, 12, "\"%s\"", consumer=
)
> > > +                                : prinfo(&of, 12, "unused");
> > >                 printf(" ");
> > >
> > >                 prinfo(&of, 8, "%s ", direction =3D=3D GPIOD_LINE_DIR=
ECTION_INPUT
> > > --
> > > 2.22.0
> > >
> >
> > Good catch! I think we can make it even more readable by first calling
> > gpiod_line_is_used() and printing 'unused' if it returns false and
> > then checking the consumer string.
> OK, I'll send v2.
> Thanks,
> Ramon.
> >
> > Bart

Cool, I'm also thinking that we need to distinguish somehow regular
consumer strings from lines used by kernel. Maybe a string like
'[kernel]' instead of 'used' would be nice?

Bart
