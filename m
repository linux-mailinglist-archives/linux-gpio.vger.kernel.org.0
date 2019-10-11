Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0811BD4067
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 15:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbfJKNGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 09:06:55 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35552 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbfJKNGz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 09:06:55 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so7006927lfl.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 06:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2hKy9c4W9Cse7AfGT70vO97RetLFCIyUo8gZ/HnCw70=;
        b=RYtCTVAwz7yuSFTYrnYTH9JslaH+PBa/vPUjQRF+hnFz/60jBvlhJ7Yf575Rlz+VVB
         oAmPdLoEJpkh53CJr+IuerwiQF/4hlhR5e9DiqHNsLUvI4RmLS4EQmQkRsj1tJrJn+L7
         zWwMN6CDTbAoMWklpbn7N01sJfcARAygsbwR6G6/yWPetRMezlMK6US0boCnXBuKu+DV
         mStbNp0MQ1k4R+WykAR+TWMglchYkneX2spPjBPwPtZ0gcEZ8r430eHPolW/eqs/skRG
         hovrsCSofPx/mVjLH/Mr7u19++JKINBt71+VAVpCZxcgKfqq7IxMEG6ihVO2MJYSxlHY
         /1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hKy9c4W9Cse7AfGT70vO97RetLFCIyUo8gZ/HnCw70=;
        b=kKg/qDh4LzhYpvSfBZHI1+aLONtlyuUHhuGp6SXqIpp/daofs5XNY+qUPkq6/pcdt2
         /EXxphf9vnlRGZryqZp5XEI3LKDY9+R5nmT9J7Uv2KDgDzenZKzD95Tsasiq00mFKS6T
         DFXFTY4XCUOm39OAZaQ+wqQe1mEQLEzXeggB58e4LOJGRAx2q56R4UMR4OknDPeL6t1U
         npEBHFurWYBFZJY2uuoKUjNwpg85ehelvwMgWC3UlDWSdh6UGu3Hy6Kp0v3rW4IraKkb
         AN8/GSg7We2C6cS0j49kAPep82Tc9PwA2A1y/e81AnUnjiwrsGdf7ZZA4EbHA2LU8pEq
         YjFg==
X-Gm-Message-State: APjAAAUAbfVHNwbpfqnQ1takEctNRT2Rvf0yHTyC+WzGHasX/x8Pd8eI
        PkvS4GnOdKUJzdm0IUijagYPFFNnFXMgONdSqtlp/YoOArKRoA==
X-Google-Smtp-Source: APXvYqywwiklhTNITKiUHFyDftJZCDUAwKppLCwiPjuesAHZDNW1PApmWRl306IGSc7YH6pGcDUqE3b2S4DqwuzRA10=
X-Received: by 2002:a19:5204:: with SMTP id m4mr8625160lfb.121.1570799212640;
 Fri, 11 Oct 2019 06:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol> <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol> <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol> <20191009065524.GA4061@sol> <20191009133037.GA17244@x1>
 <20191009235938.GA10263@sol> <CAEf4M_D4C2v87XR7oyc4YLN9j9XhSctJcw1NCt8hPcuf0P_=DA@mail.gmail.com>
 <20191010101421.GA14692@sol>
In-Reply-To: <20191010101421.GA14692@sol>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Fri, 11 Oct 2019 15:06:41 +0200
Message-ID: <CAEf4M_Av=kgwgqWOT+-4YAwxOKFvMnPs8AvnNFdaGTu5yd90+A@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

I noticed there are some additional commits in your branch including:
7f0bcb88f583  pull up/down on output is actually a valid option

Do you know what the result would be when the line is an output?

I seem to recall some chips might do High-Z when some pull-up/down is
set and direction is out.

thanks,
drew

On Thu, Oct 10, 2019 at 12:14 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Oct 10, 2019 at 09:47:35AM +0200, Drew Fustini wrote:
> > On Thu, Oct 10, 2019 at 1:59 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > It is basically working for me on my Pi4:
> > >
> > > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > > 0
> > > pi@quoll:~ $ ./gpiodctl get -u gpiochip0 7
> > > 1
> > > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > > 1
> > > pi@quoll:~ $ ./gpiodctl get -d gpiochip0 7
> > > 0
> > > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > > 0
> > >
> > > That is using the gpiodctl tool from my gpiod library.
> > > My gpiod test suite also passes, but it doesn't do much to
> > > exercise the UAPI.
> > > I was intending to run my uapi test suite, which is more thorough,
> > > but it turns out that only targets gpio-mockup, whereas my gpiod
> > > test suite can target either.
> > > Something else for the todo list.
> > >
> > > Hopefully it is obvious what gpiodctl is doing. (-u sets the
> > > pull-up flag, -d sets the pull-down flag)
> > > Looks like the pulls stick when the line is released, and the
> > > subsequent get, without pull-up set, either doesn't clear the
> > > pull-up/down or the line stays floating at the old pull level.
> > > More investigation required, but that will have to wait til
> > > I get back to this later in the day.
> > >
> > > Oh, and that is running on the rpi-5.3.3 kernel patched with everything
> > > on my topic/gpio-uapi-config branch from 5.4-rc2 onward.
> >
> > Thanks for sharing your results.
> >
> > My Pi 3 had been running 5.3.0-v7+ from September 20th with my
> > pull-up/down patch (82fc38f6ab59).
> >
> > I removed that patch and just cross-compiled 5.4-rc2 with
> > multi_v7_defconfig for the Pi3.
> >
> > Are these the commits that I should apply from your topic branch?
> >
> > bdc9696a27ed pull up/down requires explicit input mode in lineevent_create
> > 14ee636232d4 disallow pull up/down on outputs
> > ce03bf5af1ec implement SET_CONFIG_IOCTL
> > f38b7554eb52 pull common validation code into linehandle_validate_flags
> > 31c0aa53ffc3 Add default values for setting output
> > 3c7ec03efcd9 add support for pull up/down to lineevent_create
> > 99b85d1c26ea gpio: add new ioctl() to gpio chardev
> > 82fc38f6ab59 gpio: expose pull-up/pull-down line flags to userspace
> > f6cfbbe2950b gpiolib: sanitize flags before allocating memory in
> > lineevent_create()
> >
> Those are the ones.
>
> Plus there are now another 3:
> 625cd0a0df3ad9 actively disable bias on outputs
> 9d1f9db81b4dc4 actively disable bias on inputs when pull up/down not set
> c6d4bf32c05189 add set_config to support pull up/down
>
> Those add pull up/down support to gpio-mockup, and fix the stuck pulls
> I noted earlier - though they still remain applied until the next time
> the line is requested.
>
> 9d1f9db81b4dc4 doesn't like being applied to the rpi kernel, I assume as
> there have been conflicting changes between 5.3.3 and 5.4-rc2, so I
> patched that one manually.
>
> Cheers,
> Kent.
