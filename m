Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30590D1D18
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 01:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfJIX7p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 19:59:45 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43351 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731155AbfJIX7p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 19:59:45 -0400
Received: by mail-pg1-f193.google.com with SMTP id i32so2442184pgl.10
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 16:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cv/tQ2/xgkEGVvwatEvsg/Lz8dPIRoVfpf1/ZyiZ19s=;
        b=J9NERAoTwkrqSrp//ZF32GH3olTtDgIWdBUsyfqguTOICCUS0X+jdovvA9d20+Jlcl
         i0rFpy/q5QvK4ewLZcJBoZWtPNUbZwUaxKwPQVZaEmOLLL+92YyD4w22xlGDTezc+59g
         J4xRyS1FbGXomxQ9hCQKi/EHuYlrCr+XREOAn1v6c7KwC21PsT1vDiGjpgHnzHcyg7FK
         Jaj+C+to0oiUmcyv7rf4bCGX1KqD3zZlkk/DZPXHH5EtoaR7lba6MswsXjbdMjI64lUC
         B9PORbfJD4aL3eJS26DMYk/N4SXIZ5qKfBCyonnFAnH1/fTInvwziAEUcIqtGwtZm0TA
         GbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cv/tQ2/xgkEGVvwatEvsg/Lz8dPIRoVfpf1/ZyiZ19s=;
        b=IoJZsRNQA9K1lI7ZueW8b3Sz5DHL5T+7ccciJaCQGWe7cjjw+udXfvjXqC3oRgZLhI
         JSeqIRDbBMRxQj2aaFetfH6qYBDwOaHN7jNZAon03qFNQmKrYC0B3ePZLhO+3pPGPaiJ
         +R2YxfqoYpWW2NyH8Ebo0YCBitetW+ufJYOPqps+fscFSJOQbEe9fh+6W2Hs1Q83uGLX
         +w7MxPbRHUomcExOUPMdkh2TR7NzvWwLmHX4689Sy2BDMqNA0XjT8fPh6Mi4OF8Hq6Mj
         ECJH3m3qQx8zdazRe4oLzD953Y6x26Ic70+DC2hx33DaUYzov0w6VjZB+eqt4+d8Jhpu
         WsuA==
X-Gm-Message-State: APjAAAXePuiLGD8KlOo7pE4lPgXkI0sZkK1rUyDdP7AvPwTpFLWIO8il
        6j0uTnTR1IP8ApeH9hDmaMsRln1hKV2EvQ==
X-Google-Smtp-Source: APXvYqyWhh53x2OrgaJbPkCuRa0QSlnqP5wzRVpZyI2KHW5wB7XmWGW/V8eFnlp+e6iW5RbNvYT04Q==
X-Received: by 2002:a62:b504:: with SMTP id y4mr6735198pfe.40.1570665584188;
        Wed, 09 Oct 2019 16:59:44 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v19sm3474966pff.46.2019.10.09.16.59.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 16:59:43 -0700 (PDT)
Date:   Thu, 10 Oct 2019 07:59:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009235938.GA10263@sol>
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
> In case it is of any use, I just posted the libgpiod patch for pull-up/down
> flags that I had been using to test with.
> 
> I help maintain Adafruit_Blinka [1] so I would like try testing pull-up/down.
> I already have a Raspberry Pi 3 booting a cross-compiled kernel with my (now
> outdated) patch applied and a patched libgpiod.
> 
It is basically working for me on my Pi4:

pi@quoll:~ $ ./gpiodctl get gpiochip0 7
0
pi@quoll:~ $ ./gpiodctl get -u gpiochip0 7
1
pi@quoll:~ $ ./gpiodctl get gpiochip0 7
1
pi@quoll:~ $ ./gpiodctl get -d gpiochip0 7
0
pi@quoll:~ $ ./gpiodctl get gpiochip0 7
0

That is using the gpiodctl tool from my gpiod library.
My gpiod test suite also passes, but it doesn't do much to
exercise the UAPI.
I was intending to run my uapi test suite, which is more thorough,
but it turns out that only targets gpio-mockup, whereas my gpiod
test suite can target either.
Something else for the todo list.

Hopefully it is obvious what gpiodctl is doing. (-u sets the 
pull-up flag, -d sets the pull-down flag)
Looks like the pulls stick when the line is released, and the
subsequent get, without pull-up set, either doesn't clear the
pull-up/down or the line stays floating at the old pull level.
More investigation required, but that will have to wait til 
I get back to this later in the day.

Oh, and that is running on the rpi-5.3.3 kernel patched with everything
on my topic/gpio-uapi-config branch from 5.4-rc2 onward.

Cheers,
Kent.
