Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2ED2CD124
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 09:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388340AbgLCITi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 03:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388237AbgLCITi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 03:19:38 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27679C061A51
        for <linux-gpio@vger.kernel.org>; Thu,  3 Dec 2020 00:18:58 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id b2so1149931edm.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2020 00:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MFI8X7LTPxfxGnHVnTh7HU5fhkIJdGHe319oXUiaOMg=;
        b=hxDEkT+CnPTTluKPdfjsvD7vZ5oEtmAvD59tEncI4rMof+lmV243KDQUpBZ+usebfw
         PgU1bzfy6bWjMDkq53fYjWsaFfah2AzdvmaGvmeWbOo1AsAbtjbebZzysqBFPlpxjvr/
         Q2IyiKX7/OPD1MzchSNkBrRZne+5aXnTOWl22SBUqUGYUEOHhFJ3rPDEQ/bHq/q4YwNX
         VkbqRrLkaxkoan/8i1lQuJJdFT/uvJPgeW5nYTPe6+NJekju042FHliduluGyxIuFIrR
         0Op0jpddYUQ6ExmXHzFHQLkhDnVwShiMdIqYR2TrKnFmjMchB/Kqb+PV7/SdYAMS/Urr
         ouzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MFI8X7LTPxfxGnHVnTh7HU5fhkIJdGHe319oXUiaOMg=;
        b=Ta8JoyE75EZPKFmrN4JjpnYKCnVymKje3KnLbeLbdsh5aUO8sEXNRMmzM5pZReRwqd
         SFlvCTT/XYi1/rhWKYgRIlwsvsgQldfCzguVyvx12Et7B/tfvN/zbt9wPpc56rJAIFeo
         mT2kInrKhWMfyvutqrhstsEmQJy56djs8ZTvhj7ew8XWKjCweoX7CImzv6AUmDE5QmSf
         37m3muiWcVFtrQjwGtOipAIrZK+j0LvgFQqybbacyMr2qG1ewsuCw08WMcwoNSo59zAp
         VZtQltptaGa+A9GBb4d6zdmUmYioiiYoHjYJkO9DNhnJ71YzMyqiOew0/r5oh/Qi82SY
         g3uA==
X-Gm-Message-State: AOAM5333oVxhWusk/VYqqIG8W1mEAo7o9zhIpgGhi5xYZw0OlVhijR5o
        qwDKwcLkJMidovsh+Oii5MpRQHUp6ApM6IrHwgBuEg==
X-Google-Smtp-Source: ABdhPJzlVZ28tE0cF4tC2Pn9vCk/OZqgnCdO9Uos47a8iakfFul7OT5IcCEOU76VcJI4pRgOkgXNVVPKPg4EXoeAJl8=
X-Received: by 2002:a05:6402:16c8:: with SMTP id r8mr1744893edx.59.1606983536735;
 Thu, 03 Dec 2020 00:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20201203073910.20113-1-biwen.li@oss.nxp.com> <CAMpxmJV97uexBKK3zHuOWfBQ77uorgxadUcrieBP2fLPs0dPeA@mail.gmail.com>
 <DB6PR0401MB243884BFCB97E719642385FA8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0401MB243884BFCB97E719642385FA8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 3 Dec 2020 09:18:46 +0100
Message-ID: <CAMpxmJWzHOZrm90TXy-00do0xSaxPfReiWRuCMj-GwAXN5NbPA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: resolve coverity warnings
To:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
Cc:     Leo Li <leoyang.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 3, 2020 at 9:07 AM Biwen Li (OSS) <biwen.li@oss.nxp.com> wrote:
>
> > On Thu, Dec 3, 2020 at 8:31 AM Biwen Li <biwen.li@oss.nxp.com> wrote:
> > >
> > > From: Biwen Li <biwen.li@nxp.com>
> > >
> > > Resolve coverity warnings as follows,
> > >     cond_at_most: Checking gpio >= 28U implies that gpio may be up
> > >     to 27 on the false branch.
> > >     overrun-call: Overrunning callees array of size 3 by passing
> > >     argument gpio (which evaluates to 27)
> > >     in call to *mpc8xxx_gc->direction_output
> > >
> > >     cond_at_least: Checking gpio <= 3U implies that gpio is at least 4 on
> > >     the false branch.
> > >     overrun-call: Overrunning callee's array of size 3 by passing argument
> > >     gpio (which evaluates to 4) in call to
> > > *mpc8xxx_gc->direction_output
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > >  drivers/gpio/gpio-mpc8xxx.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> > > index a6c2bbdcaa10..12c9a91d87b7 100644
> > > --- a/drivers/gpio/gpio-mpc8xxx.c
> > > +++ b/drivers/gpio/gpio-mpc8xxx.c
> > > @@ -3,6 +3,7 @@
> > >   *
> > >   * Copyright (C) 2008 Peter Korsgaard <jacmet@sunsite.dk>
> > >   * Copyright (C) 2016 Freescale Semiconductor Inc.
> > > + * Copyright 2020 NXP
> >
> > A copyright notice on a two-line change is a bit too much, don't you think?
> Okay, got it. Will remove it in v2.
> >
> > >   *
> > >   * This file is licensed under the terms of the GNU General Public License
> > >   * version 2.  This program is licensed "as is" without any warranty
> > > of any @@ -80,7 +81,7 @@ static int mpc5121_gpio_dir_out(struct
> > > gpio_chip *gc,  {
> > >         struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
> > >         /* GPIO 28..31 are input only on MPC5121 */
> > > -       if (gpio >= 28)
> > > +       if (gpio >= 28U)
> > >                 return -EINVAL;
> >
> > I don't really understand the commit message but looking at the code is even
> > more confusing. What are you fixing here actually?
> Try to fix code warning that generated by coverity scan tool(static code analysis tool)

Please explain what benefit there is to using 28U over 28. No tool is
perfect, that's why you should try to understand what it is it's
trying to fix. I don't see any reason this code could fail.

Bartosz

> >
> > Bartosz
> >
> > >
> > >         return mpc8xxx_gc->direction_output(gc, gpio, val); @@ -91,7
> > > +92,7 @@ static int mpc5125_gpio_dir_out(struct gpio_chip *gc,  {
> > >         struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
> > >         /* GPIO 0..3 are input only on MPC5125 */
> > > -       if (gpio <= 3)
> > > +       if (gpio <= 3U)
> > >                 return -EINVAL;
> > >
> > >         return mpc8xxx_gc->direction_output(gc, gpio, val);
> > > --
> > > 2.17.1
> > >
