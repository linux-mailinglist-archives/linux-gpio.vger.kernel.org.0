Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79ECFFAD5F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 10:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKMJnn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 04:43:43 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33382 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfKMJnn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 04:43:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id t5so1830573ljk.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tob4NUIEyeUP7V9jsc2clQN8jhX7CphW3Ia2IjUxawA=;
        b=Zhr1yGg/Gml6ges5UVzkCbHlI3VU740oZKlKsq+3ks3G07T96WUdqlVEssPAGtuuA4
         b5+zELhFaSbfW3uozVJN3YzRA+D2kKPJwLRxPHDti3gGI01abUD2z9+q+W2uR8IOnZNv
         TekBQe44pXsxfZcKX2t/nAgK1DxBbXBuoAK8tYASQqwrK2N3cCbMphPdWQ59erQ30xIs
         iypjGsz1FyeMKPbYA0YQTRKq1woWumKqELZb3h3h+X3TdjHaVyCEbWzpxRsaYLD6xrwg
         94BDtnMKgivsyIl+nkuwHGBCI+OQg9UUFVJ4trXQWcf3NOeoq9PkDrTUgbKMyZ4chOSX
         mFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tob4NUIEyeUP7V9jsc2clQN8jhX7CphW3Ia2IjUxawA=;
        b=cWEKsKNh761KunIKPDQrOvZd1NA5E2GQL4KDguTwYURxhCmg+1LRmuGgBwEosIBNJq
         Y2sPnl+JcdgeD4tPFNEOMt3EW17xn3PoWC9ltcrOzeFieU4KlBeLX6givJM65ZELWQGQ
         iJiN8UUBvoCjRH9kpiHM9cuKiV6jzk4Q6jrErn8JNrg+C8dsWhlRCK9ZtV5j/iuJdJDZ
         3lJ8EtCVBwjlw8/Ax3VANLrOLCDsD2tSBldsFZN5I8AFqQzSTKHNponMO+PKiqWcc2gO
         Zdf6MNSq71DojXZ9YNF1tkwTjWi1IATvqMkOgYAcjN0XQYWbO5Ayn3tve2A75cERCNTi
         X9DA==
X-Gm-Message-State: APjAAAUyWsBH5330KNEdRcZvLkZ2xuO//hYW5IITC/Hh72iukNZfQFKF
        zIwKV82/PJBZN8zTRb3dK0ccrPty1Usd9kg4jKIGAQ==
X-Google-Smtp-Source: APXvYqzb6EBU7wkpcoRHVc9srXm8XeZArDePpI8IeuQOu1aqagoxQEmrhMgNfUPDWuuIazdke2zfl6/zI0ATrSBNSks=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr1837732lji.251.1573638221305;
 Wed, 13 Nov 2019 01:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191106173055.GQ32742@smile.fi.intel.com> <CACRpkdaAxY-8A7gindeA8fsQ9rEdnwp8k90CyULxNs4J5VBSBw@mail.gmail.com>
 <20191108133942.GH32742@smile.fi.intel.com>
In-Reply-To: <20191108133942.GH32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 10:43:28 +0100
Message-ID: <CACRpkdZWh7MD+psE9zndg4S59Eq-PRcmgrs-ABUaTGHnm7S4Sw@mail.gmail.com>
Subject: Re: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping registration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 8, 2019 at 2:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Nov 08, 2019 at 10:40:47AM +0100, Linus Walleij wrote:
> > On Wed, Nov 6, 2019 at 6:30 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Linus, I think it would be good if we have first 3 (okay, I noticed you have
> > > pushed first one to your devel branch) patches to go to v5.4. It will reduce
> > > dependency burden in v5.5.
> >
> > At this point in the kernel release cycle I can really only apply
> > patches for serious regressions. That's the policy I need to keep
> > to.
> >
> > It also causes a problem if I put dependencies on Torvald's
> > tree this late in the kernel cycle, because I need to get the
> > changes back into my tree in order to base new stuff on them.
> > I can't really do that until he releases an -rc that I can merge
> > back.
> >
> > At this point I'd maybe have to merge back v5.4 and that doesn't
> > feel good at all.
> >
> > So far I applied patches 1 & 2 for v5.5.
>
> Thanks! Does it mean that the rest is material for v5.6?

No, if they work for you and Hans both I have 100% trust in you
guys so just send me a big pull request for all of it for v5.5.
Besides Torvalds is talking about an -rc8 this next weekend.

Please base your pull request on my "devel" branch though,
since I already applied some of the patches (sorry for the mess!)

We can certainly hash out any remaining nits during the v5.5
kernel cycle.

Yours,
Linus Walleij
