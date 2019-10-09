Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B40D10EB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 16:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbfJIOLn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 10:11:43 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41623 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfJIOLn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 10:11:43 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so1490150pga.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TTZbhErBd2O/4Ybpp1phQUS4h+mMrFOAMzZ1+RmuShM=;
        b=BaFGRW5oEb9PeStlW/O2Ier+12DRGweaoA6DCPpybzKMNIige4pZZ5JytkCa5HpHy5
         FAVmqh9CowpC2DfKsvcWcVw10q25iLNBBWjZ8vI/VbOKfzaU83GDwQpxd/fQbnv1VJMY
         1+a1AGnoA/RJo/FJwPgCvEz0ZQuq/pRTpDKG3xdDj4A/aNrX2UGqVf3qoYvb+B9EjyPY
         x28mlsZZb6lGPHsMbT8lg2J45y4sZDTgrQT+/mVICgY2QGwL+rg/FJRHtKqYYod3nRLa
         61lc1d/JNf2PoI13nInL7o2tqhCiqUQ9Y4G6MFrWp5FBnNViYKpK3mKhICGY+t3VQY2i
         GlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TTZbhErBd2O/4Ybpp1phQUS4h+mMrFOAMzZ1+RmuShM=;
        b=mWFvHGBmLchmCz28L7g/rn3gX7Z0768X2e3U0/A3N1D+Oh0d0t5ymIG8kbLBpS1IwB
         6JPnLAhviaxszFv6jRROLzKDfAYwyk6gPxowSzH0dvWWkLdrCcmZfzDJKi4nOTp311ps
         N+9et5uvBjMvsHJjOAo14KWlQGICwdJ1v9NBWSUCqpg5Gfcd+81M53toyUgLH3aQL6lg
         6rFP6a23dB0lugKotvSZ25jDADc2Z8vJDVoVJJeSLTcMYx4zaigJrjqopVpok0ZO/j++
         JMIGt2Zv9WfwvNWOYYjEUD7giZOwEjXCV6wp29YJYpJVVqWSdvwhPdUMnOSYWgeN6xDR
         hNew==
X-Gm-Message-State: APjAAAXeEyQwVhWyOJkMJOxfgP93hpoLp1lyVNxmsL9iI1E4F4AG5AQZ
        oSp9oyB3J1krhEQRlnmvXiE=
X-Google-Smtp-Source: APXvYqyZQr6BezK5cpKmHC36yyTYum5O0UcqvXSI60r8ahpYVysXh9tPZlGgm1XlhQjVlKpywY3twg==
X-Received: by 2002:a17:90a:b304:: with SMTP id d4mr4482838pjr.27.1570630300788;
        Wed, 09 Oct 2019 07:11:40 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id l1sm4932747pja.30.2019.10.09.07.11.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 07:11:39 -0700 (PDT)
Date:   Wed, 9 Oct 2019 22:11:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009141134.GB22016@sol>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
 <20191009133037.GA17244@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009133037.GA17244@x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 03:30:37PM +0200, Drew Fustini wrote:
> On Wed, Oct 09, 2019 at 02:55:24PM +0800, Kent Gibson wrote:
> > Safe to assume your code is in your topic/gpio-uapi-config branch?
> > I hope so, cos I've forked from that into github.com/warthog618/linux 
> > and have started working on it.
> 
> Do you also have a fork of libgpiod that you are working in?
> 
Actually not yet - I'm using my Go equivalent of libgpiod to drive the
kernel for my tests.  That is also on github - it is in the uapi
directory of the feature/pud branch of my gpiod repo.

> In case it is of any use, I just posted the libgpiod patch for pull-up/down
> flags that I had been using to test with.
> 
> I help maintain Adafruit_Blinka [1] so I would like try testing pull-up/down.
> I already have a Raspberry Pi 3 booting a cross-compiled kernel with my (now
> outdated) patch applied and a patched libgpiod.
> 
Go nuts.  I hope to be testing on one of Pis, but I don't think I have a
recent kernel build handy, so I'll be a while.

Cheers,
Kent.
