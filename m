Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBCD3B52A9
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 11:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhF0J0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 05:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhF0J0c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 05:26:32 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3E0C061574;
        Sun, 27 Jun 2021 02:24:09 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id n11so2930121pjo.1;
        Sun, 27 Jun 2021 02:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5EhXthsWfwEs0xNrl9REBAzPg/Pr0Fd/pP88+OTbnhY=;
        b=dR3BCf8GlgDv63a2yPBk9InUJqLy3eN66Z3Efz4nGNr1sXgKcsTX1da//xiSMcFx0X
         qu9zR9sMoFzGaBKCykIUroGmlCH03ytTWiCSbAu53yEJcgZv+NHAkxU6b9avY7pONbQE
         zqPaUiw+QOMvYcKnmwrwFGuvE/7KmwbK2SZr4bwFBTCJxiEn24UBfNQW7X3tqi6VGJaz
         Gb5vjKrO6Lfj2m7OfWNq8spb1yj5Lns1ErUH/RuxYZOjSSSiAp2OYEZD8gfAFeFxAMNx
         R14q6PpnQxbb31fWWtaoqsz9+XCkeMU1GwHqsr/z23XUGexX2FnoVBKMkLFolJUlfSDC
         OY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5EhXthsWfwEs0xNrl9REBAzPg/Pr0Fd/pP88+OTbnhY=;
        b=SqGoolFa5Xb2mPejk/XObk210CcsCBHJoaGwEVrsekkdyjCEA1vs9NeIvP4xLrk4Xn
         9IIIK4aFY+NMMg1pNv/bbqCWNAk7RzNOEk7mvWajmakdX2ws8gfuYuaVd/YMJVlzqKsW
         VzUQpOqFysK9wm0T1e6Ys52pczgTWdJAyJJEDwVL0fTr0jD9yi++06wUXqH8WhTbcy4N
         pLgYxWY56HcrhIJwp9Rj1FK/v/eNxSyX7xUr5OmsVMP5tp6NISM1BeaGq4AgayKtbtVD
         uS4xoxKhdIgVI9IkHja+xPexlh8jGzZh+5Khpk4TCKl/quK2VZjsSfbEKmeblSy/mWyD
         J9YA==
X-Gm-Message-State: AOAM5322+RFdHOu/3fjyfz0VgzfImFAnpDvCuB+dzQ79vnhC4WtyEfDC
        8CmYLkSH6kIcOAADUDszPDVe4DN2sdrSnF1xLB8=
X-Google-Smtp-Source: ABdhPJz47kq9gELBweOXKA538gw/a2j5+fH45iL5LYjvMg8p/8m4NazZmxGmR94czgZigqM7gFWwknQuiC7I76p0MkY=
X-Received: by 2002:a17:902:fe0a:b029:11d:81c9:3adf with SMTP id
 g10-20020a170902fe0ab029011d81c93adfmr17159686plj.0.1624785848687; Sun, 27
 Jun 2021 02:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com>
 <4c143c8ee65fe52840ccbb4e1b422b6e473563d9.camel@ew.tq-group.com>
 <CAHp75VfVCTj170S_4Lh9JyDYFfUQLjTtnU=O-iXgUVXcycLxwg@mail.gmail.com>
 <38b1191ce594d9fefe9e0e98b3fa8ca0a23ee3ea.camel@ew.tq-group.com>
 <CAHp75VcuD49UgkXCrPL3VKiOsx4qSDsf=zB2vp6yVS1aJCuc2w@mail.gmail.com> <53e222fdbb3d488a99bb24d0205b064d3fe662b0.camel@ew.tq-group.com>
In-Reply-To: <53e222fdbb3d488a99bb24d0205b064d3fe662b0.camel@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Jun 2021 12:23:32 +0300
Message-ID: <CAHp75VdjmwgoWF1pJmWUDMxn0wW7t3N_h5sB4DiQUmhavrKStg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 24, 2021 at 4:44 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
> On Wed, 2021-03-31 at 17:03 +0300, Andy Shevchenko wrote:
> > On Wed, Mar 31, 2021 at 4:36 PM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > > On Wed, 2021-03-31 at 15:39 +0300, Andy Shevchenko wrote:
> > > > On Wed, Mar 31, 2021 at 3:37 PM Matthias Schiffer
> > > > <matthias.schiffer@ew.tq-group.com> wrote:
> > > > > On Wed, 2021-03-31 at 15:29 +0300, Andy Shevchenko wrote:

...

> > > > > I don't understand which part of the code is dead now. I assume the
> > > > > `return irq` case is still useful for unexpected errors, or things like
> > > > > EPROBE_DEFER? I'm not sure if EPROBE_DEFER is relevant for this driver,
> > > > > but just ignoring the error code completely doesn't seem right to me.
> > > >
> > > > platform_get_irq() AFAIK won't ever return such a code.
> > > > So, basically your conditional is always false.
> > > >
> > > > I would like to see the code path which makes my comment wrong.
> > >
> > > EPROBE_DEFER appears a few times in platform_get_irq_optional()
> > > (drivers/base/platform.c), but it's possible that this is only relevant
> > > for OF-based platforms and not x86.
> >
> > Ah, okay, that's something I haven't paid attention to.
> >
> > So the root cause of the your case is platform_get_irq_optional|()
> > return code. I'm wondering why it can't return 0 instead of absent
> > IRQ? Perhaps you need to fix it instead of lurking into each caller.
>
> what's the plan here? "driver core: platform: Make
> platform_get_irq_optional() optional" had to be reverted because it
> broke existing users of platform_get_irq_optional(). I'm not convinced
> that a slightly more convenient API is worth going through the trouble
> of fixing them all - I know we don't care much about out-of-tree
> modules, but subtly changing the behaviour of such a function doesn't
> seem like a good idea to me even if we review all in-tree users.

Why? The problem with this function is either naming or semantics.
It should be fixed and that will require revisiting all current users anyway.

> Should I just rebase my patches with the existing ENXIO handing (and
> fix up the other issues that were noted), or do you intend to give the
> platform_get_irq_optional() revamp another try?

I do intend to give another try, but if you want to be independent of
that, just make sure that in any new / revisited user of
platform_get_irq_optional() the 0 is taken into consideration as an
optional case.


-- 
With Best Regards,
Andy Shevchenko
