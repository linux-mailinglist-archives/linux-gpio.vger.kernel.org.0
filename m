Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2D25D27D9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 13:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732638AbfJJLRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 07:17:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33237 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbfJJLRO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 07:17:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id i76so3472462pgc.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o2Bq/qC+q9x9YNbGUGGpovwBqdWgEaV7EdywSl1LAOw=;
        b=sDUpmn1BwSBuLpDMzHbAVILb9MJrZzs0J/8ZpN6uhC1NlkVXCoucuZ4lQuFjuKk7Nk
         tisVNYeOJUsHtZoX4srVxjc5uJMpLHgP1c43gKJZQGMJkFMUlre+rxPK8rsf/wPM3iZ0
         ijd832djDjJMxpJggMF74pvOL6ERHCvD0Ij5Y6BBB1L2jCf9SxKuHr8wrNAVV+SJsNnP
         cOQyIVU402Sj2fCK6KrRoub/Ef2b7Y3iItE4Dz2mScP8gzydz+MeRJd9irwCp5vSdwu3
         DYfeFjTiPcZOZ6nIR37tdjatVNdUwois0KLx7FfH9JzLmOJOm7p44HdoyBBJCEpywsK2
         Or2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o2Bq/qC+q9x9YNbGUGGpovwBqdWgEaV7EdywSl1LAOw=;
        b=EUD9AKTBpvLsiikGVko+ni9PiN49YOGwMpoCrnD0iUvD/M2hXI3Im8qvKMZDF7QSMe
         qMyngmxgagCg5Kh9vPXXSQ/d55DCgJJtZjrksPgYWJmx0Td9tJxULHBdEpctVoyUAMXJ
         8+DCHTdJPhPnl3d81WNeN7LViYBkd9Z/K20d2AGvaOqKXHnnO6g4mXMDWmMg1ajwMwLY
         BZ4MYz3X1upSDqv5GkMl6FN7hUE3tXckxPv4ZklNjMdfm1baQvBvMb6F1ZJmjHNo9Tdb
         0coJ2rWmaa2Quu4jFc/3IGLrm8R44hnWW8EZ9wnPx2JIdUY6B71q8z/2JNNcID+nZxJe
         6mmg==
X-Gm-Message-State: APjAAAU9TiB5PqJHs/fhzKQvT1i7cZWjjOpOZyz29U+ZapSk32dgac75
        WcX1JpLJdlMAO702jpNhOfdl3Qyy11O0GQ==
X-Google-Smtp-Source: APXvYqzGbTja3tEiZ6EtUREf5RU9fkencjnm6EvBJHHALwPSPWSJ4ybN+IZDJ4AfSoFPa13BxTFSOw==
X-Received: by 2002:a62:ed01:: with SMTP id u1mr10110428pfh.54.1570706231640;
        Thu, 10 Oct 2019 04:17:11 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id w14sm13585297pge.56.2019.10.10.04.17.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 04:17:10 -0700 (PDT)
Date:   Thu, 10 Oct 2019 19:17:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Drew Fustini <pdp7pdp7@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191010111705.GA17666@sol>
References: <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
 <20191009133037.GA17244@x1>
 <20191009235938.GA10263@sol>
 <CAEf4M_D4C2v87XR7oyc4YLN9j9XhSctJcw1NCt8hPcuf0P_=DA@mail.gmail.com>
 <20191010101421.GA14692@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010101421.GA14692@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 10, 2019 at 06:14:21PM +0800, Kent Gibson wrote:
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
The disable bias changes I mentioned above are problematic - they break
ABI backward compatibility by explicitly disabling bias when neither
PULL_UP nor PULL_DOWN are set - which will be the case for legacy apps.

We really need to handle 4 possible bias states - None, Pull Up, Pull
Down and As Is, with the zero default being As Is.
So I intend to reinterpret the pull up and down flags as a two bit field
encoding the following:

0 - AsIs
1 - PullUp
2 - PullDown
3 - PullNone

Any objections?

Cheers,
Kent.
