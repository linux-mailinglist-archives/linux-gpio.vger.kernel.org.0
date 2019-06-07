Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE28397C2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 23:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbfFGV3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 17:29:39 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43652 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbfFGV3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 17:29:39 -0400
Received: by mail-lf1-f68.google.com with SMTP id j29so2642169lfk.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 14:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIMrqKW25YRU/lsjOLblvs15sgdsKLwySWVm5NwcunE=;
        b=LEyPoWvUT06FfHbItCfBI2qmi3bYEZELMr+9Pni7GDUF94Agfqp1YHfqhKChaPNy0S
         ZRrr2fMOaZXZKxSe6aofGIFR7LjwntjDu4Ymu/9AejpBfm408pcV/eJjScMUPAbkOdDl
         Fl0vtL8xKw368lF1ANwXcdukr5iT+Ccm/zrjm2KLPABaM0HEHaQHCgk8hsv9jL8fU6H4
         85psQUYFehCz4IH7rMAck/TXvTavh+f/raVZ8jY4XrxX4uMm2glO06/Lv6sfMBqqXsE5
         LX9Folqn1I+2HshKmbo6eQUAYCMFskiJNPWGp8sTSUUYbP1Qb2lMPRPL6Ix9DzuB4hcN
         dKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIMrqKW25YRU/lsjOLblvs15sgdsKLwySWVm5NwcunE=;
        b=FZg4xq6qLBqT/Y25KBuBmzeRed2fTTW3Yc0NbDP9vPw37qHiy5Ct9J1Uti9QjJjc7a
         PxG4hD6D1WlCq40FmWcKQHCxnraBKOgAFKBqK5K5M+uGdRPFZfLRODqQAcbxgUAf//Nr
         zDnbBEZw399OSZKTZZjplf8b0S+16ahRLS3dqi+LMhePje6xTTeDregfp83whpMtFmoj
         X6y0tVwsOFcM7pg66UE38DKSjNnjwtlT3Ucg4eecHyfhzB1iiyFIocYyDZJ1gih8ojhK
         BIV9gDdZteMxwSXeW0AcUWxa2VS6fMXWP2EXdSj9SMBZe7GTqx4bx76JW0p9rWdaD9ba
         XCjg==
X-Gm-Message-State: APjAAAVszHu0R8NEGcdLmTTGLPUJNHzAKAvadCn5BSoPf73RDNvnYdeE
        jreg6fweLw79sZOUwOcPNewQc4idTRx85XvBEoAmEA==
X-Google-Smtp-Source: APXvYqxu7/X7NjUFxX6W5IcQz4mZnT/YMlUAhiF61ildOXzlhB4NdGWiAz3/p9m7nmRJn/dhPT/KUQv4XTm38jdKvEo=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr27329569lfh.92.1559942977232;
 Fri, 07 Jun 2019 14:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190602210918.32741-1-linus.walleij@linaro.org>
 <CAMuHMdX8idAx9QnOMYyS0htYFw66Zs08pbGb7OEf5ED7Egv9rg@mail.gmail.com> <20190604084545.GA1129@kroah.com>
In-Reply-To: <20190604084545.GA1129@kroah.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:29:29 +0200
Message-ID: <CACRpkdY-HCGd_ScGNNDAOqY66jvfQZ9Gjm7o9tj+YUuxwV8i4g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Fix SPDX tags
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 10:45 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Jun 04, 2019 at 10:26:06AM +0200, Geert Uytterhoeven wrote:
> > Hi Linus,
> >
> > On Sun, Jun 2, 2019 at 11:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > Some files were missing the appropriate SPDX tags so
> > > fixed it up.
> > >
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > >  drivers/pinctrl/nomadik/Kconfig           | 2 ++
> > >  drivers/pinctrl/nomadik/pinctrl-ab8500.c  | 5 +----
> > >  drivers/pinctrl/nomadik/pinctrl-ab8505.c  | 5 +----
> > >  drivers/pinctrl/nomadik/pinctrl-abx500.c  | 6 +-----
> > >  drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 +----
> > >  5 files changed, 6 insertions(+), 17 deletions(-)
> >
> > Please note this conflicts with commit ec8f24b7faaf3d47 ("treewide: Add
> > SPDX license identifier - Makefile/Kconfig") upstream, which added
> > (different) tags.
> >
> > > diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
> > > index c3efe7d7e91f..749466fa8f97 100644
> > > --- a/drivers/pinctrl/nomadik/Kconfig
> > > +++ b/drivers/pinctrl/nomadik/Kconfig
> > > @@ -1,3 +1,5 @@
> > > +# SPDX-License-Identifier: GPL-2.0
>
> The tags added mean the same thing, what is there today is
> "GPL-2.0-only" and this "GPL-2.0" is stating the identical thing, but in
> a different way.
>
> So all is good for when the merge happens.

I guess I could tag on "-only" to cut down the buzz and make git
resolution happier.

Yours,
Linus Walleij
