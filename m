Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF02716606E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 16:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgBTPGx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 10:06:53 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:39256 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728133AbgBTPGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 10:06:52 -0500
Received: by mail-il1-f195.google.com with SMTP id f70so23953139ill.6
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 07:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NSsjYT9fUOPTYQbcZ94+27Yah30PB6aLnA5rRBloM9w=;
        b=AMkCVSuPnLYTvcYBNs48cuzP2SkK2PmblIXOa1jvv9Tda9NX7AIkiOV8KobbP7bihb
         rnqOrKl1ZaGEjq9URnuifGN91nXEZGIdJHLqvL7OYeDSEfMF+kghEJY+adUyNBhqQ8ui
         R4+HqjKjLTwH5Mb0Lkh+2jIH2+kr6nFb74B9B6pLKzA1s5XvLD66gvBmgi1SfINz5JFo
         zITxK3Dxv3FW6dFMrMLdDE/QTEMDBaXgNaUufM3sW9BK2NpOAvkk2JCg+o2PFwgmMaa1
         d89lJA4IQQAM3S5StzASp5aE3znqUP7EO8ayXWaM5TaawpzasSD2Dmu6fSxlJIuWpBLs
         l7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NSsjYT9fUOPTYQbcZ94+27Yah30PB6aLnA5rRBloM9w=;
        b=Rr4Clkqon01S/SH0xMIQOF6uNS/HIKPH5r8nw8SUEEXajN32llCCJ129qnWJnckKDy
         wlSth/SlemVLfItr1YhA5cum1QB5sr42DJ1V79+CxmhEfhSvEzex8CgokGp1xeA1H23v
         /TVlMVSjEFGQ62xkgpI5UAj9+F2P2tYbg91qrrfrDAm/3DHD1AccllVGBTIm1cxLVlQN
         gDm7/Scba1rBj6UZQNf96E+zYRuKWh48HSwBgc6cAQabMZOztv+TAczsVovinlr6NubE
         M7t6/fBcrSBPp1V8ojmTmpFvyWny7fJquBSBTj0lxIzsbOchEJRD7vU+RzpSXcPJ+oGh
         KgjA==
X-Gm-Message-State: APjAAAXARjqDQdKnqovfUB3Lm7BViEFfQMrxEVYaekh2XQjg4b4a9r2U
        LTt4ITLaIA6NYcT3333yaduWTxSmFZbkcQDphwhqlw==
X-Google-Smtp-Source: APXvYqw/ESa882FKikl90NHlXA23Rwaxm14tT/lk+8qF+IBJFaZYq8TAqRQU3v/u6jl8rS37gg41y0CM3iOxGrVsFvk=
X-Received: by 2002:a92:9c1c:: with SMTP id h28mr28240919ili.189.1582211212217;
 Thu, 20 Feb 2020 07:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20200211091937.29558-1-brgl@bgdev.pl> <20200211091937.29558-7-brgl@bgdev.pl>
 <CACRpkdZNyCBxQF_pVPGENob5EKZfYjuaNq5bLNA42XjraXzNZg@mail.gmail.com>
 <CAMRc=MfkbJ=zTvgpaxFC7L7APEhfC7J_PcncGaQ_AQUA9uw2Fw@mail.gmail.com> <CACRpkdZE0F_E1o-psXdOh93j1JAS8uqT=ZOf4-mrj5WKoKcD6A@mail.gmail.com>
In-Reply-To: <CACRpkdZE0F_E1o-psXdOh93j1JAS8uqT=ZOf4-mrj5WKoKcD6A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Feb 2020 16:06:41 +0100
Message-ID: <CAMRc=Mc-nS+U2=NbYnschQTAe+GROgXDLqQ1yyWZveyRAKhGOw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 6/7] gpiolib: add new ioctl() for monitoring
 changes in line info
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 20 lut 2020 o 16:03 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Wed, Feb 12, 2020 at 12:00 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > On Tue, Feb 11, 2020 at 10:19 AM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> > > A question:
> > >
> > > Bartosz, since you know about possible impacts on userspace,
> > > since this code use the preferred ktime_get_ns() rather than
> > > ktime_get_ns_real(), what happens if we just patch the other
> > > event timestamp to use ktime_get_ns() instead, so we use the
> > > same everywhere?
> > >
> > > If it's fine I'd like to just toss in a patch for that as well.
> > >
> >
> > Arnd pointed out it would be an incompatible ABI change[1].
>
> Yeah, I was thinking more about this specific answer from Arnd:
>
> > "It is an incompatible ABI change, the question here is whether anyone
> > actually cares. If nothing relies on the timestamps being in
> > CLOCK_REALTIME domain, then it can be changed, the question
> > is just how you want to prove that this is the case."
>
> So the question is if userspace really cares.
>
> What happens with libgpiod or users of it? Are they assuming
> the weirdness of CLOCK_REALTIME, or are they simply assuming
> something that is monotonic increasing and just lucky that they
> didn't run into anything jumping backwards in time even though
> they *could*.
>
> I think I'll propose a change and see what people say.
>

Libgpiod doesn't care about the value really - it just forwards
whatever it reads.

Bart

> > However - I asked Khouloud who's working on v2 of the line event
> > interface to use ktime_get_ns().
>
> That's great!
>
> Yours,
> Linus Walleij
