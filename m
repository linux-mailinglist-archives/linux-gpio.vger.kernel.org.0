Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9009A119F92
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 00:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfLJXgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 18:36:14 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44100 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbfLJXgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 18:36:13 -0500
Received: by mail-pf1-f196.google.com with SMTP id d199so692930pfd.11;
        Tue, 10 Dec 2019 15:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tMFsoiQ1JTdEjW5nt4kb9CZsuPmur1i5swl5XGfNWeY=;
        b=sp74goInBTBfTcbH0vLZAwSCtJ56DLPWfReGLpiKGB3Jpidrwusb1uTOlah0vlFG7P
         iiMfeVV3ZnLflfMASfTwvgJLfi4oe18CiJThdCp3LQTMB+Uqq7YU6tuKOQQC2OtD2eeK
         E4vIMgmRLO48yCOh3xFQNkVD2BES6kd8SUZwwzmdAUjy5alfxzzj7quz8ylT/mbsVCkk
         U80UboAGBt/zh1N9lsvgEh/K+T44f7sj9IkngsBzlC+Go3T+pM7rdpJZbIVi5dtyAThN
         xWyJEVOq07L41aBuyRc9/OsSb9Vp5fzlVFwMtFnzqnhtohMk5eoiz7shZ/tGpqoHE5l/
         Ia/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tMFsoiQ1JTdEjW5nt4kb9CZsuPmur1i5swl5XGfNWeY=;
        b=raLZ64yFGHdvKfJq4ZGXO8NFaxZeDR7nxRnJC2XJoO3jOuoKRMcdnT5gRw24HKXaD4
         yVEzwikJnZOpcL/0BDK3qI35a6QimER2hUlIfRvUpuyeWFCkwCKwde5NTVl87NmW5Vfg
         hXoRxi0Yr9iNfoJaKVb6uqZYb9GP2bdWaFLaDWmDeUcfdMOFj0Sex5jcjDnbnNoOsCKL
         jsLqvd1joY0a/CAbvy+GOwmzFJOibGocY4TJy/SYrOvE5EKrkJO78zjkmnQD1jscDNnM
         LfWvBWPhgfAVjsTS+86myhrn3ZAiQIJ14yon3VFok1mP0g1nIkt7lQjnMOAwvpQ1anQ8
         OUNw==
X-Gm-Message-State: APjAAAVPYOoBEdzOMMMCYjW1rNERd95wSgkm0L/cCLq1vsrsY4vQIg0k
        JApVz4O4EIVGvhItCKDX+sE=
X-Google-Smtp-Source: APXvYqxvy9S6VzhXvVGLJSoj3Hh+to8+tYICGolfMw0db5XfVda3a5TkrjHCP5cqKugIKy1hvShRjA==
X-Received: by 2002:a62:7683:: with SMTP id r125mr535411pfc.132.1576020972280;
        Tue, 10 Dec 2019 15:36:12 -0800 (PST)
Received: from sol (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id x4sm127947pff.143.2019.12.10.15.36.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 15:36:11 -0800 (PST)
Date:   Wed, 11 Dec 2019 07:36:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Subject: Re: [PATCH] gpio: gpio-mockup: Fix usage of new GPIO_LINE_DIRECTION
Message-ID: <20191210233605.GA4640@sol>
References: <20191210021525.13455-1-warthog618@gmail.com>
 <CAMRc=Md4PmbcGAKxP1LG08bREtWCtsXbt=ZgL50PrizF4F4pxg@mail.gmail.com>
 <20191210145515.GB3509@sol>
 <CAMRc=MemKDFDHpEdq2OKvEduBTdi2c3oQmgeYF8qX1rcc-rk8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MemKDFDHpEdq2OKvEduBTdi2c3oQmgeYF8qX1rcc-rk8A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 04:34:21PM +0100, Bartosz Golaszewski wrote:
> wt., 10 gru 2019 o 15:55 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Tue, Dec 10, 2019 at 03:11:12PM +0100, Bartosz Golaszewski wrote:
> > > wt., 10 gru 2019 o 03:15 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > Restore the external behavior of gpio-mockup to what it was prior to the
> > > > change to using GPIO_LINE_DIRECTION.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > > >
> > > > Fix a regression introduced in v5.5-rc1.
> > > >
> > > > The change to GPIO_LINE_DIRECTION reversed the polarity of the
> > > > dir field within gpio-mockup.c, but overlooked inverting the value on
> > > > initialization and when returned by gpio_mockup_get_direction.
> > > > The latter is a bug.
> > > > The former is a problem for tests which assume initial conditions,
> > > > specifically the mockup used to initialize chips with all lines as inputs.
> > > > That superficially appeared to be the case after the previous patch due
> > > > to the bug in gpio_mockup_get_direction.
> > > >
> > > >  drivers/gpio/gpio-mockup.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > > > index 56d647a30e3e..c4fdc192ea4e 100644
> > > > --- a/drivers/gpio/gpio-mockup.c
> > > > +++ b/drivers/gpio/gpio-mockup.c
> > > > @@ -226,7 +226,7 @@ static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
> > > >         int direction;
> > > >
> > > >         mutex_lock(&chip->lock);
> > > > -       direction = !chip->lines[offset].dir;
> > > > +       direction = chip->lines[offset].dir;
> > > >         mutex_unlock(&chip->lock);
> > > >
> > > >         return direction;
> > > > @@ -395,7 +395,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
> > > >         struct gpio_chip *gc;
> > > >         struct device *dev;
> > > >         const char *name;
> > > > -       int rv, base;
> > > > +       int rv, base, i;
> > > >         u16 ngpio;
> > > >
> > > >         dev = &pdev->dev;
> > > > @@ -447,6 +447,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
> > > >         if (!chip->lines)
> > > >                 return -ENOMEM;
> > > >
> > > > +       for (i = 0; i < gc->ngpio; i++)
> > > > +               chip->lines[i].dir = GPIO_LINE_DIRECTION_IN;
> > > > +
> > > >         if (device_property_read_bool(dev, "named-gpio-lines")) {
> > > >                 rv = gpio_mockup_name_lines(dev, chip);
> > > >                 if (rv)
> > > > --
> > > > 2.24.0
> > > >
> > >
> > > Hi Kent,
> > >
> > > I was applying and testing your libgpiod series and noticed that the
> > > gpio-tools tests fail after applying patches 16 & 17 (with linux
> > > v5.5-rc1). Is this fix related to this?
> > >
> >
> > I don't think so.  I've only been able to trip this problem with a
> > couple of corner cases in my Go uapi test suite.
> > I have been unable to reproduce it with the tools as it requires
> > multiple requests with the same chip fd, including an as-is, to trip.
> >
> > And running the libgpiod tests against v5.5-rc1 works for me.
> > Can you provide more details as to the errors you are seeing?
> >
> 
> Hmm whatever that was, it's gone now. Must have been some leftovers
> from previous builds. All works now.
> 
> > Btw, I was writing tests for your LINEINFO_WATCH patch v2, which I was
> > applying to v5.5-rc1, when I ran across this.  That works ok if I
> > __packed the changed struct.
> 
> These things can still change, so don't spend too much time on it yet. :)
> 

Absolutely.  But as this is an ABI addition I wanted to have something
to give it a decent workout before it gets applied.
So far the only problems I've found are the alignment and isolation
issues already mentioned.

> Since the lineinfo struct is not __packed, I'd prefer to not use it
> for any struct embedding it. I'll just add appropriate padding for
> 64-bit alignment.
> 

Explicit padding for 64-bit alignment makes sense to me.

> > And I can confirm that patch v2 doesn't isolate watches on different
> > chip fds.
> >
> 
> Yeah, I'll fix this.

One more thing - since it is possible to lose change events due to fifo
overflow, how about adding a seqnum?  And if you do end up doing a v2 of
the event ABI to fix its alignment, adding one there as well.

Kent.

