Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0A2CD04BB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 02:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbfJIAWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 20:22:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40995 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbfJIAWU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 20:22:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so407201pfh.8
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2019 17:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AiYzWi6nbFYHNznXGX+vxldSiG2OsgxXGw1oCdvTgec=;
        b=E2fp4lZyfZFn0mjlrm9FYmZrAG/BXyl7o+dxX81rqqsailAafvn3oW9zsJCGkP9KaP
         uElEWUYBZMCkb2rI6HZQP5TacfQDmaBfRtHwvpfSJG0XB4wY/+ODXgaIGAYAnXWOE5ve
         /WGngyQ0ZdruJwwZKuAyXSVEcHYs5Fc04HXcCTpPJQC9ynN0pz9Uco/EiZ6WNiWTNu4n
         8SpQrAJHntJxbjCLb33YFIF4FJELL/w6kzh11RGNvlN3r8+snJGeRIbqW8ipSTutlGvP
         QTrXkw8fnD14h1d0/7EPEX5r+GNE5JyUFnfz6+yKDOGwuP+opbZlPGf3zgysgzUl4Al3
         iM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AiYzWi6nbFYHNznXGX+vxldSiG2OsgxXGw1oCdvTgec=;
        b=dp+o6as5r86WGo7Uta+Z1IIU6SxmLD9Ib7d3Hv7OYVZT42EHroieIpTYQgVRyK/940
         DJUkwNXHnsqJmaFths83Al7RqB3X04wVD3sXQdvAr+3r15jznQ6uE6EeZ4MI9laUGAOJ
         zjSk88yKQoUEEOMecN+8974dJBeIuL6f/WQEJDCNkPj1y64Hr9q0w3njY9S9RIilaE22
         wy+w3KJtFG4vjvsH3cV5pfluCLPmJOIKYAU1lTYyEGZemcIMAZjMsvVaRO8MhL1cz8sD
         /26FuDavVfy5LCuLROf94cmrYgVo3RHqFZYKWhUzmIPLsyl6ucLTlQcovlTcuWxVfJyb
         /Ufw==
X-Gm-Message-State: APjAAAVK2cEqDJ/9nkhi77KNEqet+WWHmRk7LFQMz0kxazDDryBt1LL+
        yHbhrjS7sv1NuEmUjSwQjxQ=
X-Google-Smtp-Source: APXvYqzINRElTTxcDLYeDxCdHg6fNOFB8CIhJ/SpmaZ7jSir7craZUN7ONmRZLd+SfJAJ4YeH93wPg==
X-Received: by 2002:a63:3e4a:: with SMTP id l71mr1253073pga.253.1570580537826;
        Tue, 08 Oct 2019 17:22:17 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id z4sm256436pfn.45.2019.10.08.17.22.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 17:22:17 -0700 (PDT)
Date:   Wed, 9 Oct 2019 08:22:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009002211.GA11168@sol>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 02:03:58AM +0200, Bartosz Golaszewski wrote:
> śr., 9 paź 2019 o 01:56 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Oct 09, 2019 at 01:30:18AM +0200, Bartosz Golaszewski wrote:
> > > śr., 9 paź 2019 o 01:21 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Tue, Oct 08, 2019 at 10:56:18PM +0200, Bartosz Golaszewski wrote:
> > > > > wt., 8 paź 2019 o 08:15 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Sat, Sep 21, 2019 at 12:25:23PM +0200, Drew Fustini wrote:
> > > > > > > Add pull-up/pull-down flags to the gpio line get and
> > > > > > > set ioctl() calls.  Use cases include a push button
> > > > > > > that does not have an external resistor.
> > > > > > >
> > > > > > > Addition use cases described by Limor Fried (ladyada) of
> > > > > > > Adafruit in this PR for Adafruit_Blinka Python lib:
> > > > > > > https://github.com/adafruit/Adafruit_Blinka/pull/59
> > > > > > >
> > > > > > > Signed-off-by: Drew Fustini <drew@pdp7.com>
> > > > > > > ---
> > > > > > >  drivers/gpio/gpiolib.c    | 12 ++++++++++++
> > > > > > >  include/uapi/linux/gpio.h |  4 ++++
> > > > > > >  2 files changed, 16 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > > > index d9074191edef..9da1093cc7f5 100644
> > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > @@ -427,6 +427,8 @@ struct linehandle_state {
> > > > > > >       (GPIOHANDLE_REQUEST_INPUT | \
> > > > > > >       GPIOHANDLE_REQUEST_OUTPUT | \
> > > > > > >       GPIOHANDLE_REQUEST_ACTIVE_LOW | \
> > > > > > > +     GPIOHANDLE_REQUEST_PULL_UP | \
> > > > > > > +     GPIOHANDLE_REQUEST_PULL_DOWN | \
> > > > > > >       GPIOHANDLE_REQUEST_OPEN_DRAIN | \
> > > > > > >       GPIOHANDLE_REQUEST_OPEN_SOURCE)
> > > > > > >
> > > > > > > @@ -598,6 +600,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> > > > > > >                       set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> > > > > > >               if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
> > > > > > >                       set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> > > > > > > +             if (lflags & GPIOHANDLE_REQUEST_PULL_DOWN)
> > > > > > > +                     set_bit(FLAG_PULL_DOWN, &desc->flags);
> > > > > > > +             if (lflags & GPIOHANDLE_REQUEST_PULL_UP)
> > > > > > > +                     set_bit(FLAG_PULL_UP, &desc->flags);
> > > > > > >
> > > > > > >               ret = gpiod_set_transitory(desc, false);
> > > > > > >               if (ret < 0)
> > > > > > > @@ -1102,6 +1108,10 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> > > > > > >               if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
> > > > > > >                       lineinfo.flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
> > > > > > >                                          GPIOLINE_FLAG_IS_OUT);
> > > > > > > +             if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> > > > > > > +                     lineinfo.flags |= GPIOLINE_FLAG_PULL_DOWN;
> > > > > > > +             if (test_bit(FLAG_PULL_UP, &desc->flags))
> > > > > > > +                     lineinfo.flags |= GPIOLINE_FLAG_PULL_UP;
> > > > > > >
> > > > > > >               if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> > > > > > >                       return -EFAULT;
> > > > > > > @@ -2475,6 +2485,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
> > > > > > >               clear_bit(FLAG_REQUESTED, &desc->flags);
> > > > > > >               clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
> > > > > > >               clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
> > > > > > > +             clear_bit(FLAG_PULL_UP, &desc->flags);
> > > > > > > +             clear_bit(FLAG_PULL_DOWN, &desc->flags);
> > > > > > >               clear_bit(FLAG_IS_HOGGED, &desc->flags);
> > > > > > >               ret = true;
> > > > > > >       }
> > > > > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > > > > > > index 4ebfe0ac6c5b..c2d1f7d908d6 100644
> > > > > > > --- a/include/uapi/linux/gpio.h
> > > > > > > +++ b/include/uapi/linux/gpio.h
> > > > > > > @@ -33,6 +33,8 @@ struct gpiochip_info {
> > > > > > >  #define GPIOLINE_FLAG_ACTIVE_LOW     (1UL << 2)
> > > > > > >  #define GPIOLINE_FLAG_OPEN_DRAIN     (1UL << 3)
> > > > > > >  #define GPIOLINE_FLAG_OPEN_SOURCE    (1UL << 4)
> > > > > > > +#define GPIOLINE_FLAG_PULL_UP        (1UL << 5)
> > > > > > > +#define GPIOLINE_FLAG_PULL_DOWN      (1UL << 6)
> > > > > > >
> > > > > > >  /**
> > > > > > >   * struct gpioline_info - Information about a certain GPIO line
> > > > > > > @@ -62,6 +64,8 @@ struct gpioline_info {
> > > > > > >  #define GPIOHANDLE_REQUEST_ACTIVE_LOW        (1UL << 2)
> > > > > > >  #define GPIOHANDLE_REQUEST_OPEN_DRAIN        (1UL << 3)
> > > > > > >  #define GPIOHANDLE_REQUEST_OPEN_SOURCE       (1UL << 4)
> > > > > > > +#define GPIOHANDLE_REQUEST_PULL_UP   (1UL << 5)
> > > > > > > +#define GPIOHANDLE_REQUEST_PULL_DOWN (1UL << 6)
> > > > > > >
> > > > > > >  /**
> > > > > > >   * struct gpiohandle_request - Information about a GPIO handle request
> > > > > > > --
> > > > > > > 2.20.1
> > > > > > >
> > > > > > Sorry for the late feedback, but I'm still not sure whether this patch
> > > > > > is on track to be applied or not.  I had thought not, at least not yet,
> > > > > > but just in case...
> > > > > >
> > > > >
> > > > > It still needs some fixes, but Linus seems to be fine with the general idea.
> > > > >
> > > > > > You have added the flags to linehandle_create, but not lineevent_create.
> > > > > > Given that your primary use case is push buttons, isn't the event request
> > > > > > at least as important as the handle request?  Even ignoring your use
> > > > > > case, I'd add them to lineevent_create just to maintain symmetry.
> > > > > >
> > > > > > Also, is it valid to set PULL_UP and PULL_DOWN simulaneously?
> > > > > > I would think not, but I could be wrong.
> > > > > > If not then that combination should be rejected with EINVAL.
> > > > > >
> > > > >
> > > > > Yes, some validity checks of the flags must be added. I even did it in
> > > > > my local branch[1].
> > > > >
> > > > Your changes for linehandle_create look ok, but for lineevent_create
> > > > you explicitly disabled PULL_UP and PULL_DOWN, and in a block labelled
> > > > "This is just wrong: we don't look for events on output lines" at that.
> > > >
> > >
> > > Yeah, feel free to change it.
> > >
> > Yeah, you see I didn't feel free to change it, as I thought the
> > appropriate etiquette was to send comments to the original author.
> > At least until the patch has been applied.
> > Or are RFCs a special case?
> >
> 
> So either you review it and the author changes it and resends, or - if
> for example you want to build on top of someone else's changes - you
> take the patch, keep the original authorship, modify it and add your
> signed-off-by tag with a small note on your changes in square
> brackets.
> 
Ok, but I'd still expect some feedback to the author to that effect.
Maybe I missed it.

> > > > > Re: direction and configuration changes on requested lines: I think
> > > > > it's quite useful to add in the form of a new ioctl():
> > > > > GPIOHANDLE_SET_CONFIG_IOCTL or something. I started hacking on this
> > > > > but eventually got more busy this week than I anticipated. I'm still
> > > > > planning on sending an RFC by the end of the week though.
> > > > >
> > > > I have the reverse problem - bored and looking for something to do, so
> > > > more than willing to help out - if you want it.
> > > >
> > >
> > > Sure, in that case let's just wait for your patches. You can just
> > > extend what I started, if you wish.
> > >
> > Yep, you sound tired.
> > Are we talking about the SET_CONFIG here?  If you have a link to what
> > you've started I'll take a look, but as I've already said - I'm not
> > about to go writing new ioctls without approval and guidance from you
> > and Linus.  If you have the ioctl defined I'm happy to take it from
> > there. Well happy-ish.
> >
> 
> But there's absolutely nothing wrong with writing code even if you're
> not sure about the solution - it's even encouraged[1]. It's much
> easier to discuss existing code than potential solutions.
> 
> [1] https://lkml.org/lkml/2000/8/25/132
> 
Exactly - show me your code.

> > > > And while we're talking, does the gpio-mockup support pull up/down
> > > > being set from the kernel side?
> > > >
> > >
> > > No, but feel free to add it.
> > >
> > Ok, will have a look - cos I would like to add tests for the above and
> > that will require the mockup supporting it as wel
> 
> Do you also plan on extending libgpiod by any chance?
> 
Well I thought that was your baby and was going to extend my Go library,
and leave libgpiod to you.  But I can help out with libgpiod as well.
I suppose you'll want the Python and C++ bindings updated to match?

Cheers,
Kent.
