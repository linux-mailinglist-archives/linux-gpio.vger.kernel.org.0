Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C792CD203
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 10:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387468AbgLCJEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 04:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729951AbgLCJEd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 04:04:33 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16335C061A4D
        for <linux-gpio@vger.kernel.org>; Thu,  3 Dec 2020 01:03:53 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id r17so1195979ilo.11
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2020 01:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8vPrErhs2SeNesKdqnrR0Y61VWgyx6uy7JYVlF36VM=;
        b=SXZC2srFWwAKsc0BkmzUe3oDyV1t88UJZrWOVbdvjiwhC4D0lH4PjkcaYSsSlsJcyJ
         GGwITeELhdiFbZrSHBTiMnuXopk8K0U/qW1KASBGSE4Oon13bAUqSDCauWT12xDV1sjb
         MckjM8hv7w4trjd2KTUlJWEfphZe6ifCygna/zvB97c69b36glBgLZkFXdx7Hsy2flDv
         b6ldEv2HlKt3aFnOANmTIR9UK1EOx7DvIfEbiCnqDbL9Uxhuv3tPxcXc+jIJ0Su/46Ov
         LFOiiQNeDnW/5zVx/acliomw6hF9gX4LXuSi2bKjNDhwNRvSasMGFE3pVtQW1JbJseAH
         Lysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8vPrErhs2SeNesKdqnrR0Y61VWgyx6uy7JYVlF36VM=;
        b=gPGqNs3BK2yRNtXROcZ985qceyn4Tu/iiuvzctoNbx2vMeHwBZ+8C1jd/04/zKwWUJ
         8VtFjMW1m1HJc6HARVpHHr4kfwnrw0epqfvA+h7qgeRSfWeBMLb2Jg6ogoDPJNIZCi9k
         UoTeT3FCK4oNBAR7q0tUMkTarE5Fmpm5AHoC4lN+1PVNKkvshzrgTB6hxnHRSIvlVlBj
         YvsffC+IvZRYnfOgEDwNloBum7rda2dhGzPrpdS1KiyjEQHZzfRBJ0X66XF7LaFspfPs
         zb9huZwX9C2nne7RjsIJv4QLKOdyE5wdpz9QqNa4gcYz3pQ2mlCVCXk81fc4V+XKASlE
         vAUA==
X-Gm-Message-State: AOAM531DTod7+uQ2k5cmKrvOyd3GJ+U8GgD5xsfXE4oneDaGaLQJAHzZ
        9HmG3762zILEBCjmWC61kyMSy7QwvgopCBujjGSM6Q==
X-Google-Smtp-Source: ABdhPJzcSUaEtnlVMu7OoKcTW1g+4zI4gBZdlftEzUdf/MHJcLW/518+6k64ido1TpvpH4cmDC9C5JWlZstEm7yAAd8=
X-Received: by 2002:a92:d1c9:: with SMTP id u9mr2157204ilg.189.1606986232418;
 Thu, 03 Dec 2020 01:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20201203073910.20113-1-biwen.li@oss.nxp.com> <CAMpxmJV97uexBKK3zHuOWfBQ77uorgxadUcrieBP2fLPs0dPeA@mail.gmail.com>
 <DB6PR0401MB243884BFCB97E719642385FA8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <CAMpxmJWzHOZrm90TXy-00do0xSaxPfReiWRuCMj-GwAXN5NbPA@mail.gmail.com> <DB6PR0401MB2438E60B3BE8D6E917B80D0C8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0401MB2438E60B3BE8D6E917B80D0C8FF20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Dec 2020 10:03:41 +0100
Message-ID: <CAMRc=McYHmiZqAp68Sbrmfo4YwO9mr=jFx6qKfOiLAQPPKoSMg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: resolve coverity warnings
To:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Leo Li <leoyang.li@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 3, 2020 at 9:51 AM Biwen Li (OSS) <biwen.li@oss.nxp.com> wrote:
>
> >
> > On Thu, Dec 3, 2020 at 9:07 AM Biwen Li (OSS) <biwen.li@oss.nxp.com> wrote:
> > >
> > > > On Thu, Dec 3, 2020 at 8:31 AM Biwen Li <biwen.li@oss.nxp.com> wrote:
> > > > >
> > > > > From: Biwen Li <biwen.li@nxp.com>
> > > > >
> > > > > Resolve coverity warnings as follows,
> > > > >     cond_at_most: Checking gpio >= 28U implies that gpio may be up
> > > > >     to 27 on the false branch.
> > > > >     overrun-call: Overrunning callees array of size 3 by passing
> > > > >     argument gpio (which evaluates to 27)
> > > > >     in call to *mpc8xxx_gc->direction_output
> > > > >
> > > > >     cond_at_least: Checking gpio <= 3U implies that gpio is at least 4 on
> > > > >     the false branch.
> > > > >     overrun-call: Overrunning callee's array of size 3 by passing argument
> > > > >     gpio (which evaluates to 4) in call to
> > > > > *mpc8xxx_gc->direction_output
> > > > >
> > > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > > ---
> > > > >  drivers/gpio/gpio-mpc8xxx.c | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpio/gpio-mpc8xxx.c
> > > > > b/drivers/gpio/gpio-mpc8xxx.c index a6c2bbdcaa10..12c9a91d87b7
> > > > > 100644
> > > > > --- a/drivers/gpio/gpio-mpc8xxx.c
> > > > > +++ b/drivers/gpio/gpio-mpc8xxx.c
> > > > > @@ -3,6 +3,7 @@
> > > > >   *
> > > > >   * Copyright (C) 2008 Peter Korsgaard <jacmet@sunsite.dk>
> > > > >   * Copyright (C) 2016 Freescale Semiconductor Inc.
> > > > > + * Copyright 2020 NXP
> > > >
> > > > A copyright notice on a two-line change is a bit too much, don't you think?
> > > Okay, got it. Will remove it in v2.
> > > >
> > > > >   *
> > > > >   * This file is licensed under the terms of the GNU General Public License
> > > > >   * version 2.  This program is licensed "as is" without any
> > > > > warranty of any @@ -80,7 +81,7 @@ static int
> > > > > mpc5121_gpio_dir_out(struct gpio_chip *gc,  {
> > > > >         struct mpc8xxx_gpio_chip *mpc8xxx_gc =
> > gpiochip_get_data(gc);
> > > > >         /* GPIO 28..31 are input only on MPC5121 */
> > > > > -       if (gpio >= 28)
> > > > > +       if (gpio >= 28U)
> > > > >                 return -EINVAL;
> > > >
> > > > I don't really understand the commit message but looking at the code
> > > > is even more confusing. What are you fixing here actually?
> > > Try to fix code warning that generated by coverity scan tool(static
> > > code analysis tool)
> >
> > Please explain what benefit there is to using 28U over 28. No tool is perfect,
> > that's why you should try to understand what it is it's trying to fix. I don't see any
> > reason this code could fail.
> This code couldn't fail.
> The variable gpio is unsigned int type, prefer to append "U" for unsigned typed values, this makes is clearer also when comparing values and variables.
> >

This only makes sense if we're using large values that could
potentially overflow a signed int. This is a small constant value so
there's no reason for this churn. NAK

Bartosz

> > Bartosz
> >
> > > >
> > > > Bartosz
> > > >
> > > > >
> > > > >         return mpc8xxx_gc->direction_output(gc, gpio, val); @@
> > > > > -91,7
> > > > > +92,7 @@ static int mpc5125_gpio_dir_out(struct gpio_chip *gc,  {
> > > > >         struct mpc8xxx_gpio_chip *mpc8xxx_gc =
> > gpiochip_get_data(gc);
> > > > >         /* GPIO 0..3 are input only on MPC5125 */
> > > > > -       if (gpio <= 3)
> > > > > +       if (gpio <= 3U)
> > > > >                 return -EINVAL;
> > > > >
> > > > >         return mpc8xxx_gc->direction_output(gc, gpio, val);
> > > > > --
> > > > > 2.17.1
> > > > >
