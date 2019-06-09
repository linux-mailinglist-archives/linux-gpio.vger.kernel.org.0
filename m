Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6371B3A664
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 16:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbfFIOg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 10:36:26 -0400
Received: from condef-04.nifty.com ([202.248.20.69]:46917 "EHLO
        condef-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbfFIOg0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 10:36:26 -0400
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-04.nifty.com with ESMTP id x59EUYNQ023720
        for <linux-gpio@vger.kernel.org>; Sun, 9 Jun 2019 23:30:34 +0900
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x59EUPdw001203
        for <linux-gpio@vger.kernel.org>; Sun, 9 Jun 2019 23:30:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x59EUPdw001203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560090626;
        bh=Ux6Drtn3f9GnEIbTOne3OsP078Vk/vvWggBCGA/snnA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Drd+DVJiDUyCCSrdK7EJrw5NjCOudwVGifS0KQOPahxMKdNZJWRG0GtFPUSCr9j7x
         SHV2POnwgQq/mzI397KmEnhCG5RvhXPKLVKMXDJ7lsA6l5AJnnRvLk/wcxgtH2ElGT
         Gsq2In16ne+g/R6SopSH+w4PJA9Yr6/DQYBS3oTiPKI/Lmc8y/kx2KNxwedjIaECqy
         +Gc0eM5iVwpJCGdCX1Uj/LbaT33a5HIRoVtl3grFKIU608ysjjoZJwUmc5XseZoCW0
         jROvlb9mxfmdWU/F5zM4HVbUDjKXfkUXEOoNCg5T176qRIw+05/5/fXeW3acGrnSAD
         C1utQuozf5Ejg==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id n2so3863011vso.6
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2019 07:30:26 -0700 (PDT)
X-Gm-Message-State: APjAAAU3Ekg/2TFEoMBb2OgSXigYp1ktbpZ7Z2x6PdxKrijNqUofe0Ue
        kJgXdT7hLE99Psk+THQ3gJV6QxeO1l+IOh0LfaA=
X-Google-Smtp-Source: APXvYqw1RWt3QfmI5niyxk54CiX2Qj+S6bPbstWWAoBy4yjWG691YaDVHG3lzuM6d59VBBzv7ELimoCFaDWhzRZ1lYg=
X-Received: by 2002:a67:ed04:: with SMTP id l4mr15152598vsp.179.1560090625075;
 Sun, 09 Jun 2019 07:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190602210918.32741-1-linus.walleij@linaro.org>
 <CAMuHMdX8idAx9QnOMYyS0htYFw66Zs08pbGb7OEf5ED7Egv9rg@mail.gmail.com>
 <20190604084545.GA1129@kroah.com> <CACRpkdY-HCGd_ScGNNDAOqY66jvfQZ9Gjm7o9tj+YUuxwV8i4g@mail.gmail.com>
In-Reply-To: <CACRpkdY-HCGd_ScGNNDAOqY66jvfQZ9Gjm7o9tj+YUuxwV8i4g@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 9 Jun 2019 23:29:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT0rMF5U8mOTeA1uggJJUDOArW4JO3Bz9Tf=hQk_64D8Q@mail.gmail.com>
Message-ID: <CAK7LNAT0rMF5U8mOTeA1uggJJUDOArW4JO3Bz9Tf=hQk_64D8Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Fix SPDX tags
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 8, 2019 at 7:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jun 4, 2019 at 10:45 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jun 04, 2019 at 10:26:06AM +0200, Geert Uytterhoeven wrote:
> > > Hi Linus,
> > >
> > > On Sun, Jun 2, 2019 at 11:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > Some files were missing the appropriate SPDX tags so
> > > > fixed it up.
> > > >
> > > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > > ---
> > > >  drivers/pinctrl/nomadik/Kconfig           | 2 ++
> > > >  drivers/pinctrl/nomadik/pinctrl-ab8500.c  | 5 +----
> > > >  drivers/pinctrl/nomadik/pinctrl-ab8505.c  | 5 +----
> > > >  drivers/pinctrl/nomadik/pinctrl-abx500.c  | 6 +-----
> > > >  drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 +----
> > > >  5 files changed, 6 insertions(+), 17 deletions(-)
> > >
> > > Please note this conflicts with commit ec8f24b7faaf3d47 ("treewide: Add
> > > SPDX license identifier - Makefile/Kconfig") upstream, which added
> > > (different) tags.
> > >
> > > > diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
> > > > index c3efe7d7e91f..749466fa8f97 100644
> > > > --- a/drivers/pinctrl/nomadik/Kconfig
> > > > +++ b/drivers/pinctrl/nomadik/Kconfig
> > > > @@ -1,3 +1,5 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> >
> > The tags added mean the same thing, what is there today is
> > "GPL-2.0-only" and this "GPL-2.0" is stating the identical thing, but in
> > a different way.
> >
> > So all is good for when the merge happens.
>
> I guess I could tag on "-only" to cut down the buzz and make git
> resolution happier.

You do not need to apply this patch.
No sense to add the equivalent changes via different trees.

-- 
Best Regards
Masahiro Yamada
