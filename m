Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D3648C967
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 18:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355623AbiALRaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 12:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355662AbiALRaQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jan 2022 12:30:16 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2725AC06175B
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 09:30:10 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id 19so4697023ioz.4
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TmZAL/MnV8LbmVbiqZ1OEFiVcEbxLNyGgtkt/9M4QU0=;
        b=FLOGaZc2wTV6XBpJcacBYlCynB6FFXF14cszYTrxhWcv5mNGRR2Db9ED+T0wg2L0Vj
         Lm7QY0Oem0iipFvDBwZ4QzPR3K6ShEN0F76bRom/Royfpxz7gK+J78T+BYKYAB8UALp/
         N+gdJqarZLYDIzzCo+ib++M2GMA21w8F/EbRwFflBUiawF3Sn9dCIj8CAWvh8jFSyfX6
         Mj8Zo0f+s9liVMVi2TfPz/MEP9p40uUxD/nxnNnPPDGpLTyn2hUsjXmG1+vHPelTaQ6X
         xplDhZyV80aR8NjWHqaUpQIcg2E3xkp1Gk1SgMdnmu3gQMsU9TFoAhHihMJgzWou4KvW
         FjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TmZAL/MnV8LbmVbiqZ1OEFiVcEbxLNyGgtkt/9M4QU0=;
        b=cM0iDva3WOsrYO5KmW/z0mE5EvfgVvI0jULcpoeL+CdhbhO6Fta+K9NPimrRccVAyz
         qx4c1pGRxkvJSTAFyWR1BMl7m1Sn9abQrnFu0qgOvNSw41bNdqgE/JlyasJr5rAZjKVR
         mits6cWO6PivEWp157qJg3YxRwVChZ9heEKFe2wO8iGPEBHocAGVXIbJPfDIjxYxnNG+
         TbPPbtPmeIrvOtwLzcdPaVqz/yVv0SqYNXJ/Td/L/AjPg4nU6ukx0gqT9wXgNo3QCMoc
         sHJq4h9k9FMiJ1bDXFIS4A0hnBz6wEos6tP07r54Kq4Q8QQtVwrNEup3RnWZScmacDSH
         jAZg==
X-Gm-Message-State: AOAM530ZPAwMZ79buCse5KUiXm6+WEP//Xg6W7kDQEm2CDNtBiYKsfko
        NR8kaz9V9Yd3iM6BP92XKWxaKwK8FZf4Th55ZGvvWg==
X-Google-Smtp-Source: ABdhPJzSrj3kHAvQucrazGglk9hPLl53CQun0JOjQBpWSjEDktGiXUalv1+0pCIKGWg9btvGY6uBst7hRXXrHG66Zas=
X-Received: by 2002:a05:6638:2054:: with SMTP id t20mr374221jaj.87.1642008609578;
 Wed, 12 Jan 2022 09:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20211109113239.93493-1-robert.marko@sartura.hr>
 <20211109113239.93493-3-robert.marko@sartura.hr> <CA+HBbNGH9ih5RovU9YHL91osFxDJbWw2Qk=ed30GGQvndNJPKw@mail.gmail.com>
 <33ab37f5b30252e41f3e0769c7702764a9e77d7f.camel@pengutronix.de>
 <CA+HBbNH5Hq7WC7PkpFt=hUsTRstP3KrNCsbWWy5QaZRFDvZDKA@mail.gmail.com> <YbL81TEMp8CA7Sam@google.com>
In-Reply-To: <YbL81TEMp8CA7Sam@google.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 12 Jan 2022 18:29:59 +0100
Message-ID: <CA+HBbNGnB=zHOvn3gh_bAPr_3=74K0pyAcgHxz2QKKisqasyUw@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] dt-bindings: reset: Add Delta TN48M
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>,
        Luka Perkov <luka.perkov@sartura.hr>, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 10, 2021 at 8:08 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 09 Dec 2021, Robert Marko wrote:
>
> > On Thu, Dec 9, 2021 at 10:40 AM Philipp Zabel <p.zabel@pengutronix.de> =
wrote:
> > >
> > > Hi Robert,
> > >
> > > On Wed, 2021-12-01 at 22:28 +0100, Robert Marko wrote:
> > > > On Tue, Nov 9, 2021 at 12:32 PM Robert Marko <robert.marko@sartura.=
hr> wrote:
> > > > >
> > > > > Add header for the Delta TN48M CPLD provided
> > > > > resets.
> > > > >
> > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > ---
> > > > >  include/dt-bindings/reset/delta,tn48m-reset.h | 20 +++++++++++++=
++++++
> > > > >  1 file changed, 20 insertions(+)
> > > > >  create mode 100644 include/dt-bindings/reset/delta,tn48m-reset.h
> > > > >
> > > > > diff --git a/include/dt-bindings/reset/delta,tn48m-reset.h b/incl=
ude/dt-bindings/reset/delta,tn48m-reset.h
> > > > > new file mode 100644
> > > > > index 000000000000..d4e9ed12de3e
> > > > > --- /dev/null
> > > > > +++ b/include/dt-bindings/reset/delta,tn48m-reset.h
> > > > > @@ -0,0 +1,20 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > +/*
> > > > > + * Delta TN48M CPLD GPIO driver
> > > > > + *
> > > > > + * Copyright (C) 2021 Sartura Ltd.
> > > > > + *
> > > > > + * Author: Robert Marko <robert.marko@sartura.hr>
> > > > > + */
> > > > > +
> > > > > +#ifndef _DT_BINDINGS_RESET_TN48M_H
> > > > > +#define _DT_BINDINGS_RESET_TN48M_H
> > > > > +
> > > > > +#define CPU_88F7040_RESET      0
> > > > > +#define CPU_88F6820_RESET      1
> > > > > +#define MAC_98DX3265_RESET     2
> > > > > +#define PHY_88E1680_RESET      3
> > > > > +#define PHY_88E1512_RESET      4
> > > > > +#define POE_RESET              5
> > > > > +
> > > > > +#endif /* _DT_BINDINGS_RESET_TN48M_H */
> > > > >
> > > >
> > > > Does anybody have any comments on the patch as the reset driver got=
 reviewed and
> > > > the bindings have not?
> > >
> > > Not much to review here, I can't tell if the indices are correct.
> > >
> > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > >
> > > To be merged with the rest of the series. Or do you want me to pick u=
p
> > > the reset parts individually? In that case you'd have to split out th=
e
> > > reset bindings into a separate patch.
> >
> > Thanks,
> > It has to go with the rest of the series as it all depends on the MFD.
> >
> > We are just waiting for the MFD dt-bindings to be reviewed.
>
> We need Rob to review the set.  Then I'll happily take it.

Hi,

Rob, can you please review the dt-bindings?
Everything else is ready to go.

Regards,
Robert
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
