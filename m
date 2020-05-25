Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72041E117E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391001AbgEYPRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 11:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390998AbgEYPRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 11:17:43 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45459C061A0E;
        Mon, 25 May 2020 08:17:43 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 131so561044pfv.13;
        Mon, 25 May 2020 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JgdxX2C74TdDmjeVY9HQN2a/yq7wOSbOdwxkkYCYXyQ=;
        b=N9adz5zOwkTSECpw8gScK2pWCHzS2JXKrK0SWR5uk5+0ARWhw5rdzsPascizMaKx5J
         Mi5jklMWhTLlXpSZWJPhU8KLwex4X+dJUT8dpDlpb5vwIcWUPbBNi3uz38tNQZKXPSX5
         SLdsG+G5/FitBcp28xwyWZXm+CnuzG/428JvNVcXov2lVq3dd9vNC6mx7j1tgByf2SYl
         Op8bvijIDGefF5eWmo4yx5mh8TbKlHwdmi96W5eqaF3eZm/Wge/ZCZxL8nPIvXaNI19h
         iZMjs0rjfgJ+26iiQK02Hzvvxz9FcTe3qgtqTIkHEchq6EXIVJdjg6xv+6qe3WG/qfVl
         7REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JgdxX2C74TdDmjeVY9HQN2a/yq7wOSbOdwxkkYCYXyQ=;
        b=b67OcIOQKKuPYSF99W6jaYxI8/D/XsC9D7komow8yw+8w4QUEursWOKJHA/Haz8yIY
         OOgKGknbvKsgeao86SQ5xVkVQfpFCjvZ8/+naknou0PZ91c7UOy2ryL3En2vcVowT8/o
         jVh+V2yz7VaJgDjDMvSXfzSSWrX+M+TdoRib9PHKdDEskj95PUDVFibm5MMGTsezyV4r
         8b33dJM/lTWz0AIrXkm+kcJFMJRj/J++x/8jtPcUEz21D2ASlSHsdh/PH0JKTM7eFkS9
         1sv8HoRKsDdnijPzWIcSpJlENfOaCxxyzlTG0xJjBfd31RD3JuJSQX3sS4uBpdRmzSMY
         /+kA==
X-Gm-Message-State: AOAM5324RIA6JBslBR7EWctrWYHPOHvla2VdVLPOHoJlDBmetoMJqXY+
        2zk18GI8qEwMd2wQoNFCeLYh41CDbWA=
X-Google-Smtp-Source: ABdhPJzyrvfjMW1Z89guWcSUG6SP/b4006FtLKB7GKkz56yag7CQCPbh+mpzA+Z+rDjLdjAdA6JcQw==
X-Received: by 2002:aa7:9aa8:: with SMTP id x8mr16954629pfi.182.1590419862613;
        Mon, 25 May 2020 08:17:42 -0700 (PDT)
Received: from sol (220-235-68-201.dyn.iinet.net.au. [220.235.68.201])
        by smtp.gmail.com with ESMTPSA id k4sm5288767pfp.173.2020.05.25.08.17.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 08:17:41 -0700 (PDT)
Date:   Mon, 25 May 2020 23:17:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Bujanda <hector.bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
Message-ID: <20200525151736.GA32461@sol>
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <20200525022252.GA22956@sol>
 <CACRpkdagkhbULGVGJqcS55m=X2EaH_iK0Khr8+6M7ATWrC3hOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdagkhbULGVGJqcS55m=X2EaH_iK0Khr8+6M7ATWrC3hOQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 02:17:41PM +0200, Linus Walleij wrote:
> On Mon, May 25, 2020 at 4:22 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> > You mention timers for the gpio pins that cannot provide debounce,
> > so I'm confused. Could you clarify which strategy you have in mind?
> 
> My idea is that the callback gpiod_set_debounce() for in-kernel consumers
> should more or less always return success. Either the hardware does
> the debounce,  or gpiolib sets up a timer.
> 
> > I've also had a quick look at the possibility of providing the software
> > debounce for in-kernel consumers.
> 
> That is where I think it should start.
> 
> >  Are you anticipating new API for
> > that?  e.g. allowing consumers to request gpio events?  Cos, gpio_keys
> > grabs the irq itself - and that would bypass the software debouncer,
> > or even conflict with it.
> 
> It may be hard or impossible.
> 
> I suppose gpiolib would have to steal or intercept the interrupt
> by using e.g. IRQF_SHARED and then just return IRQ_HANDLED
> on the first IRQ so the underlying irq handler does not get called.
> 

And how would gpiolib ensure that it was first in the chain?

> After the timer times out it needs to retrigger the IRQ.
> 
> So the consuming driver would se a "debounced and ready"
> IRQ so when it gets this IRQ it knows for sure there is
> no bounciness on it because gpiolib already took care
> of that.
> 
> The above is in no way trivial, but it follows the design pattern
> of "narrow and deep" APIs.
> 

Totally agree with the concept - just trying to work out how to
implement it seemlessly given the existing API and usage, and given my
limited knowledge of the kernel internals.

> Failure is an option! Sorry if I push too complex ideas.
> 

I'm not as concerned about complexity as I am about fragility.

I don't see any problem adding debounce for gpiolib-cdev.
Adding a more complete solution to gpiolib itself is certainly
non-trivial, if it is possible at all. 

The path I'll probably be taking is adding a debouncer to gpiolib-cdev,
so at least we have a solution for userspace, then take a longer look at
the more general solution.

Cheers,
Kent.
