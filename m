Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F75DD26FD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 12:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfJJKO3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 06:14:29 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35191 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfJJKO3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 06:14:29 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so3604565pfw.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 03:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=muldLwH5KNKBceg9CvshXpythMyPkONIDN6qGdgXkRI=;
        b=k1SZv0SognyMyXjqqPpLv9kZfxkqMWNxUR871OY1WQSExveCZY6lIYws3eq6jYPUUh
         W527T65Ou4UXDn4IZXf+jKjgl04C7+9nQefqXYgjblUwOOHX8d0PPC6NGZOyI48ntRap
         C3jvkntPr6d4YzVhipcuVLWp/ndI5B1hUqnSKI5bbTRwoUhXBg9xC9nLdVhisOfS2Q+C
         kvmLK8UI6RWu6gtTvXvvZCx94mawllaoxYuSHpzKYdgkkKiccjDihf0UPcgQeS6WElzE
         Ig4V0ACMKAXCsLQP4Kay3En/hPJTR24R++EJ7tMtfI7YSuyE9vtXgFTpe4dspriW/z6u
         LOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=muldLwH5KNKBceg9CvshXpythMyPkONIDN6qGdgXkRI=;
        b=nttuAFwPO3NvHwFAfrfr49n2ybNS9t4ORASYagB/RsOgqoK/AZHO1ixqNegjrWby5u
         xpq3131ZD12pbN6Y1VQD4sUrzenjQRnz0CDxeOZOIvUwkkR9GxDbRhsOG2JV2oe5dK67
         tLaPpCRGPjb535r16fnnoOZfdDVdnE2FoylvNVdz1LmaD3eYOby2I53s1znx1QS1EX8T
         Ppl5arMpvC8bWgD4RcjuMuV5tYXo2VWkcYlyY/MdJ1mequ37ukeKeE/NIeJFAZ9BT3Yo
         pUhIF5gXbhBtVkvc1Los+zP+GlokacUNTE9JIAFcHQ0/reNfSFFzktFHaMbbFzOcODnq
         xpBg==
X-Gm-Message-State: APjAAAXHD1T0k5reiuVYGy9Sp20pJ/m5gS3PyA/ANxjZGghNf8kaKaSD
        5X9217GkxW3j6WeijIA7sRE=
X-Google-Smtp-Source: APXvYqzAYRBws35gHkjrCW/hHgwQhVrhhq0yAyfd5DbveD1k0b2saWHlMpHnoPdvVAeHwecLEC1G/Q==
X-Received: by 2002:aa7:9156:: with SMTP id 22mr9734594pfi.246.1570702468221;
        Thu, 10 Oct 2019 03:14:28 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id y4sm4942250pga.60.2019.10.10.03.14.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 03:14:27 -0700 (PDT)
Date:   Thu, 10 Oct 2019 18:14:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <pdp7pdp7@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191010101421.GA14692@sol>
References: <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
 <20191009133037.GA17244@x1>
 <20191009235938.GA10263@sol>
 <CAEf4M_D4C2v87XR7oyc4YLN9j9XhSctJcw1NCt8hPcuf0P_=DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4M_D4C2v87XR7oyc4YLN9j9XhSctJcw1NCt8hPcuf0P_=DA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 10, 2019 at 09:47:35AM +0200, Drew Fustini wrote:
> On Thu, Oct 10, 2019 at 1:59 AM Kent Gibson <warthog618@gmail.com> wrote:
> > It is basically working for me on my Pi4:
> >
> > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > 0
> > pi@quoll:~ $ ./gpiodctl get -u gpiochip0 7
> > 1
> > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > 1
> > pi@quoll:~ $ ./gpiodctl get -d gpiochip0 7
> > 0
> > pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> > 0
> >
> > That is using the gpiodctl tool from my gpiod library.
> > My gpiod test suite also passes, but it doesn't do much to
> > exercise the UAPI.
> > I was intending to run my uapi test suite, which is more thorough,
> > but it turns out that only targets gpio-mockup, whereas my gpiod
> > test suite can target either.
> > Something else for the todo list.
> >
> > Hopefully it is obvious what gpiodctl is doing. (-u sets the
> > pull-up flag, -d sets the pull-down flag)
> > Looks like the pulls stick when the line is released, and the
> > subsequent get, without pull-up set, either doesn't clear the
> > pull-up/down or the line stays floating at the old pull level.
> > More investigation required, but that will have to wait til
> > I get back to this later in the day.
> >
> > Oh, and that is running on the rpi-5.3.3 kernel patched with everything
> > on my topic/gpio-uapi-config branch from 5.4-rc2 onward.
> 
> Thanks for sharing your results.
> 
> My Pi 3 had been running 5.3.0-v7+ from September 20th with my
> pull-up/down patch (82fc38f6ab59).
> 
> I removed that patch and just cross-compiled 5.4-rc2 with
> multi_v7_defconfig for the Pi3.
> 
> Are these the commits that I should apply from your topic branch?
> 
> bdc9696a27ed pull up/down requires explicit input mode in lineevent_create
> 14ee636232d4 disallow pull up/down on outputs
> ce03bf5af1ec implement SET_CONFIG_IOCTL
> f38b7554eb52 pull common validation code into linehandle_validate_flags
> 31c0aa53ffc3 Add default values for setting output
> 3c7ec03efcd9 add support for pull up/down to lineevent_create
> 99b85d1c26ea gpio: add new ioctl() to gpio chardev
> 82fc38f6ab59 gpio: expose pull-up/pull-down line flags to userspace
> f6cfbbe2950b gpiolib: sanitize flags before allocating memory in
> lineevent_create()
> 
Those are the ones.

Plus there are now another 3:
625cd0a0df3ad9 actively disable bias on outputs
9d1f9db81b4dc4 actively disable bias on inputs when pull up/down not set
c6d4bf32c05189 add set_config to support pull up/down

Those add pull up/down support to gpio-mockup, and fix the stuck pulls 
I noted earlier - though they still remain applied until the next time
the line is requested.

9d1f9db81b4dc4 doesn't like being applied to the rpi kernel, I assume as
there have been conflicting changes between 5.3.3 and 5.4-rc2, so I
patched that one manually.

Cheers,
Kent.
