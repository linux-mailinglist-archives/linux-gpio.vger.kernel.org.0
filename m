Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866591C8091
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 05:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgEGDkC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 May 2020 23:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgEGDkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2020 23:40:02 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04BF7C061A0F;
        Wed,  6 May 2020 20:40:02 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f15so1512349plr.3;
        Wed, 06 May 2020 20:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hJIjIJDMn8AVxnWxL/QZhgDXlLBiX6hRFdp/Px6tg5w=;
        b=Z+EutZN3jfvopaKwJ1zq0tVBNDRWaNHXlG9VbPE67509xe+6veO34An7Ts/bt0hnDy
         870GPDMqwV/qwJ2qtXqtnAiqY0izMYF810zVps+v5OE79sWDBk452NhrPu/+ZAucLmQB
         DslMv4INmO47bOoC12JJo/g5aueFiDDnY0+OsVq0mre0lu58qh24K5AmLQMyqv0uowvv
         X9iY3/X+D9HURpOHpjEuSLyUj2uwrxBxhPAcwJag9dEkqw4S7tYTD2AbWmwOqTf23IrC
         yI+FwpUYye2kv2+wGTj0aZi9aV5ttmZoUBydW07KSjqJx4fhwJcTvYy9j20h5yQylXaE
         TtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hJIjIJDMn8AVxnWxL/QZhgDXlLBiX6hRFdp/Px6tg5w=;
        b=fSPBsA7JWeqOVQ26t3amhyaInE/mn2g3zcpWJuTZC/Ag/M3XrNyNTAfE64+gjZhAFk
         qWe+ZL947uE7FWao3jlUJhNUIZUzZyu0H0SRnvQb7nauxiFvsOnCPeDFxgqO4c5M3Tio
         8m0imvr8cf95+fbmMtQvuPZm5fjZWHYOZ5SMSQV6UvOt60BJg7Z2u12Cqlax2t/aueIW
         CxLCdwbgHVpk6y+3iQcD6HiKThWKzTfFfA1mCtQI+U7RNinqWHPF0C7XzQu80p7LcBva
         7UDlqkAgIwDacqkO41VUZI4IwfB1L+E2s04I9LUSjjaX677J82EPyK5WMp2nRhKv6cgu
         RWcQ==
X-Gm-Message-State: AGi0PuY8w7on/Kx3iml86rPUxJ0pW1Qu98ZNZUOMIIrMnf/qXyHZU6+L
        /d2eWo2RMTwxq80dAcc82uDOfxj6+8inmQ==
X-Google-Smtp-Source: APiQypJB+6P5EWmx/T9RdTLwgJY1OJ+FNX5Pg4aoBuvhzhPoTLrlxCXHYJfEOI7UD4UQskw3P7Ry6A==
X-Received: by 2002:a17:90b:3444:: with SMTP id lj4mr13631790pjb.37.1588822801382;
        Wed, 06 May 2020 20:40:01 -0700 (PDT)
Received: from sol (220-235-85-217.dyn.iinet.net.au. [220.235.85.217])
        by smtp.gmail.com with ESMTPSA id v9sm5920755pju.3.2020.05.06.20.39.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 20:40:00 -0700 (PDT)
Date:   Thu, 7 May 2020 11:39:54 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "Bujanda, Hector" <Hector.Bujanda@digi.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
Message-ID: <20200507033954.GA13974@sol>
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <CAMRc=MdwSpWkgLTHN+6cOdG7aBAWWYFBC4+tfSNtA2HgX6s_3A@mail.gmail.com>
 <B0E9AFA73AF60B42B6D323E0C4FEB06F01AFAC5A@dor-sms-xch01.digi.com>
 <20200430145844.GA28588@sol>
 <CAMRc=Md5-OgNySDG+XHKow0YSzcZHNtWWPwbmd159fpWL8YAJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md5-OgNySDG+XHKow0YSzcZHNtWWPwbmd159fpWL8YAJA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 04, 2020 at 12:31:57PM +0200, Bartosz Golaszewski wrote:
> czw., 30 kwi 2020 o 16:58 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Thu, Apr 30, 2020 at 01:32:22PM +0000, Bujanda, Hector wrote:
> > > Thanks all for your guidance!
> > >
> > > First saying that this patch request was sent having our platforms in k4.14 in the way of upgrading to k5.4.
> > > In those versions the commit e588bb1eae31be73fbec2b731be986a7c09635a4 "gpio: add new SET_CONFIG ioctl() to gpio chardev" by Kent Gibson was not available.
> > >
> > > I see that you clearly understand the necessity of having a way of configuring debounce from the userspace.
> > > Our platforms make use of hardware debouncing filtering. Up to now we were using the sysfilesystem to let the user handle gpios (including debounce configuration).
> > > We wanted now to get rid of sysfilesystem and start using gpiolib/libgpiod.... but configuring debounce is blocking us.
> > >
> > > Now I clearly see (as pointed by Bartosz Golaszewski) that my suggested GPIO_SET_DEBOUNCE_IOCTL is wrong as it hits the chip file descriptor while 'Modifying any config settings can only happen on lines previously requested too in user-space'.
> > >
> > > I agree with all that a flag is needed to allow configuring debounce to '0' which has always meant disabling it.
> > >
> > > Also agree with 'Kent Gibson' suggestion of  'You might want to add a flag to the GPIOLINE_FLAGs to indicate if debounce is set'.
> > >
> > > I have my doubts if it is compulsory to extend debounce configuration to the gpioevent_requests since the debounce value configured by a user is normally linked to a hardware noise in a line; and that does not change from one gpioevent_requests to another. So I think this configuration would be useful but not compulsory.
> > >
> >
> > Just to clarify on this point, the reason the SET_CONFIG would have to
> > be extended to events is not to alter the debounce on the fly but to set
> > it at all.  Lines are requested as either handles (for outputs or polled inputs)
> > or events (for asynchronous edge events on inputs). We cannot extend
> > either the handle or event request ioctls themselves as there is no provision
> > in their data structures for future expansion.  There is in the
> > SET_CONFIG ioctl - but that doesn't apply to event requests yet...
> >
> 
> Indeed. And as I was thinking about it over the weekend I realized
> that exposing a setter for a config option that's not settable at
> request-time seems wrong. Together with the lineevent structure which
> doesn't work on 64-bit kernel with 32-bit user-space this all makes me
> think we should design v2 of several of the ioctl() calls with more
> care.
> 
> >
> > > I agree with Linus Walleij that 'there is a serious user-facing problem here though, because not all GPIO controllers supports debounce'.
> > > Our platforms have native freescale/NXP gpiochips not supporting hardware debounce and our own gpiochips having hardware debounce.
> > > We have also noticed that 'drivers/input/keyboard/gpio_keys.c contains generic debounce code using kernel timers if the GPIO driver cannot provide debouncing'. That feature is not of our interest (because of having hardware debounce filters) but it would clearly be a very good overall functionality.
> > >
> > > Having said all above, I wonder how you want to proceed.
> > > Our current development in k5.4 and libgpiod1.4.1 is much behind master... what makes collaboration (and reusability) a bit more complex.
> > > Also I see the implementation requires a bigger picture than I initially expected.
> > > So I wonder if you want me to do the initial steps of the development (what I foresee will require some back and forth) or you prefer implementing all pieces.
> > >
> >
> > I totally agree with you on the widening scope.
> >
> > Bart - how do you want to go forward with this?  I'm available to work
> > on it, in part or full.
> >
> 
> Personally I'm super busy with my actual job and adding support for
> line watch ioctl() to libgpiod ATM. I can't really spare any time on
> this. I have some crazy ideas: like storing the debounce time in the
> 16 most significant bits of the flags field but this is just papering
> over bad ABI.
> 
> Ideally we'd have to introduce new versions of gpioevent_request,
> gpioline_request, gpioline_info and gpioevent_data structs - this time
> with enough additional padding and no alignment issues. Then we could
> add the debounce properly.
> 

Agreed - adding setting only via the SET_CONFIG ioctl is a bit of a
hack, and a v2 of the uAPI is required to add it to the requests, and
to add the debounce value to the info.

> This would of course add a lot of cruft to the uAPI code. I'd start by
> moving it out of drivers/gpio/gpiolib.c into a new file:
> drivers/gpio/gpiolib-cdev.c. This way we'd have everything related to
> the character device in one place. It would make it easier to: a) add
> a config option for disabling it entirely and b) add a config option
> to disable the v1 of the ioctl()s.
> 

Ok, that is widening the scope of the change again, but I'm still willing
to have a go at it.  Wrt a v2, I was considering re-organising how the
flag field works, generally using it to indicate the presence of other
fields in the request, rather than trying to encode a capability just in
the flags.  e.g. direction, drive, bias and debounce would each have a
single flag as well as a field, or fields, containing their actual value.

For requests and sets, the flags indicate the capabilities being
explicitly set.  For info it would indicate the fields populated.

This would simplify and clarify what combinations of flags actually make
sense and what is actually being set or left unchanged.

Polarity (ActiveLow) is a bit different, as it is purely a binary and is
always set, one way or the other, so it could remain just a flag.

If we need to add a new capability then we use the next bit in the flags
and some of the padding reserved for future use for the field(s).

Does that make sense?

I am also wondering if we could merge the handle and event requests by
making edge detection just another capability?  Maybe there is something
I'm missing here.  What was the rationale for them being separate?

Cheers,
Kent.

> I also Cc'ed Andy who may have some better ideas.
> 
> Linus: about the software-debounce you mentioned: do you think it
> somehow plugs the hole we identified here?
> 
> Bart
