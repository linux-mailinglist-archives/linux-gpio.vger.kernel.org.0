Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2AAD13DF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731751AbfJIQTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:19:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35499 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731083AbfJIQTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 12:19:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id p30so1731064pgl.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=a+I4pUKM4VI8MaFR/5H7lLYnaGlyVI8IL4klXef86DE=;
        b=tMwrQONCNsjlGiiycuD7cqp3gySKLq3VRsF5b9qSe7EWK7nr2jUf02pIMCkysxXY4+
         U2ULGS47ojAj263g57yWf7R+GVpLULtp9T8DgnkA8UfwKmZTPQJr8v4WFmQyp0jhvmXX
         17usXBhPy6vZBbzcn4vWtHcIhj51fcqJJ/gcxALhZ6U869Z5Byu/hAqV6Lya9pXh4LDr
         aA6Mg0rsdOIVXoyO7ByuVPhCM0hrhI8WykBPVucY1LU9RFko6ZbTP3kc9vmWxI7wiXJu
         pjrgsSb5AZj+mjYAovUQWG3WYEWPBKyn2y9ArtRMedKsRDFOu3heTPjhgoen4IifNx5i
         2Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=a+I4pUKM4VI8MaFR/5H7lLYnaGlyVI8IL4klXef86DE=;
        b=HBvKdSlSRYeBpt0qABlUhLeFHQMMRTA3UyMui1yDQtwEbzscychweqMq9tuQ5sSw59
         yrDI8dja4KBjZ1e7uD0LJAdU+51uIfGm+zKdFr1eho2N9DOamgty84S2/wRXHPW+sVCE
         3ejIzlU9ZXVWWpZJaQn/9QRvi5vanGHRdaIM1IIevH88TwQ5q0w99/8jYep0XR1e/xux
         W7H7QLNeQTvjxr1pEr4rTYKsEeVwHLNugs8EyJkjK7wRhL9N9eW9IYvMRYqQxpxkl85V
         t/1YixxXLrCciJHARbq6TaWT+o1v75AmVKj8Nhzi1MlQKsZE5twloHJvJfco91K0aV/X
         VIFg==
X-Gm-Message-State: APjAAAWDR2exfd/cXmLLXsCljsrXbksCOHjzzk2hr3w5pUHI2+KHHNr3
        z8vcAdMP58Wcjg7LlHaRwpo=
X-Google-Smtp-Source: APXvYqwoO9gk+YOZO/X+OuiVBp9MnrGwYrkJ/eHwiXP1j9qFb18mjdl2asKvOFVkn+suj5XciqBRkg==
X-Received: by 2002:a62:31c3:: with SMTP id x186mr4646088pfx.260.1570637976278;
        Wed, 09 Oct 2019 09:19:36 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id 192sm4274457pfb.110.2019.10.09.09.19.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:19:35 -0700 (PDT)
Date:   Thu, 10 Oct 2019 00:19:29 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009161929.GA1976@sol>
References: <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
 <20191009133037.GA17244@x1>
 <20191009141134.GB22016@sol>
 <CAMRc=MetgRSK6+4eFkEiVuL4-D+++LZ_trr9yUqQ-H_e1POiFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MetgRSK6+4eFkEiVuL4-D+++LZ_trr9yUqQ-H_e1POiFw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 05:50:00PM +0200, Bartosz Golaszewski wrote:
> śr., 9 paź 2019 o 16:11 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Oct 09, 2019 at 03:30:37PM +0200, Drew Fustini wrote:
> > > On Wed, Oct 09, 2019 at 02:55:24PM +0800, Kent Gibson wrote:
> > > > Safe to assume your code is in your topic/gpio-uapi-config branch?
> > > > I hope so, cos I've forked from that into github.com/warthog618/linux
> > > > and have started working on it.
> > >
> > > Do you also have a fork of libgpiod that you are working in?
> > >
> > Actually not yet - I'm using my Go equivalent of libgpiod to drive the
> > kernel for my tests.  That is also on github - it is in the uapi
> > directory of the feature/pud branch of my gpiod repo.
> >
> > > In case it is of any use, I just posted the libgpiod patch for pull-up/down
> > > flags that I had been using to test with.
> > >
> > > I help maintain Adafruit_Blinka [1] so I would like try testing pull-up/down.
> > > I already have a Raspberry Pi 3 booting a cross-compiled kernel with my (now
> > > outdated) patch applied and a patched libgpiod.
> > >
> > Go nuts.  I hope to be testing on one of Pis, but I don't think I have a
> > recent kernel build handy, so I'll be a while.
> >
> > Cheers,
> > Kent.
> 
> Hey guys, just one thing: don't send patches as replies - just send a
> new version as a separate series. Also: please aggregate all the
> patches (pull-up/down, set config, gpio-mockup changes if any) into a
> single series.
> 
I think the only patch I've sent you was direct to you for feedback,
not to the list, and so not intended to be applied. And that was only
cos I thought you might prefer that to looking at the diffs on github.

Would it be ok to create two patch series - one for pull up/down and the
other for set config, if one still needs a lot more work?  
And is it ok to base them on your lineevent_create gotos tidy up
(f6cfbbe2950b2)?

Cheers,
Kent.
