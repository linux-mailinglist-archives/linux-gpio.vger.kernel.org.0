Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618F91D0612
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 06:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgEMEdl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 00:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725837AbgEMEdl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 00:33:41 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C907C061A0C;
        Tue, 12 May 2020 21:33:41 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u15so2377151plm.2;
        Tue, 12 May 2020 21:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SpeVlvoHtplfi+oUdsBTfyUIXeujKWYPsXxeQ/08g2Y=;
        b=aZL0Qe9mJBvc8mpi6POVeAbEttQw2apSZ0LmznYTKYfpz/3OdJadhuABLPS6768kHM
         UTZyVv6pYvF+bLh1H/ibC/o+7+KFC2OnMJECvBYLIi0T6qlwoT3FtwDJlaeQGWGi/Th2
         8XLTjg13pxBKftDAOZtT6VxwmDFPCLrp2c1o7fBERVeq+0Op647Mjm4ygiKNlVmT6OKy
         hWp0fD1Glp0L6AXXDBUIHrHPNRgUcd2YS9etByIhva0Zr38BtN+64971+5LnVTiEVARf
         V06s1uSVP9OqkL29dJbTJ8vAG+jTJvGYXcAYqStNur7LjKMESIXNWUegN+dXysQEJKAU
         iapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SpeVlvoHtplfi+oUdsBTfyUIXeujKWYPsXxeQ/08g2Y=;
        b=Fh2sU4OgAQKL4GiUG4V0Bkcr7Hjk0iVRNAZQfJOM468cXhEDLkAck7ucD2XNWWWINE
         xmyPK6BpKu9AsAQ4uV5Fec8BtHgVYtjZsJZh3+1ME/AdK6fiW2K/CW2zDw/fJl26cH5s
         aH6aW1P40AT7NwO2s7itsSPJXpnaVu58thnbE6qq5LD9N/UTwxvXL+q9bXmV6WTlf47H
         X6Aw9Ef6nXe6ypgH6qaOH11hTzw6bEZOhzkUQ2AY39MHSW2mFrh3j0GSwKqNlQC7Fcnz
         f9CtE3aahVF2bXDrN56nT2P8RMiJY10x/2CGfVwWdqsiK1V79rRKgS8Ffs3GnC/Cp3fk
         ElBg==
X-Gm-Message-State: AGi0PuY/QOciAhZMKct6wZfzPdMoIxnByZCzT01wC4Dwnpi+dKBwPGip
        GUo+Y6upRjOsviXA98nZKBibV/nw1zc=
X-Google-Smtp-Source: APiQypL18DxG/LOoifVUnCYCiAztnWetyuawD7zKxILZO4c+zjlQCcq/VP4Xv930X36sUcV4yVLsLw==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id cx12mr31791989pjb.211.1589344420770;
        Tue, 12 May 2020 21:33:40 -0700 (PDT)
Received: from sol (220-235-91-3.dyn.iinet.net.au. [220.235.91.3])
        by smtp.gmail.com with ESMTPSA id p9sm4695992pgb.19.2020.05.12.21.33.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 21:33:40 -0700 (PDT)
Date:   Wed, 13 May 2020 12:33:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "Bujanda, Hector" <Hector.Bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
Message-ID: <20200513043333.GA10419@sol>
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <CAMRc=MdwSpWkgLTHN+6cOdG7aBAWWYFBC4+tfSNtA2HgX6s_3A@mail.gmail.com>
 <B0E9AFA73AF60B42B6D323E0C4FEB06F01AFAC5A@dor-sms-xch01.digi.com>
 <20200430145844.GA28588@sol>
 <CAMRc=Md5-OgNySDG+XHKow0YSzcZHNtWWPwbmd159fpWL8YAJA@mail.gmail.com>
 <CACRpkdbZPhkzuUvwDnBWTvweBukQRcWx0w=2seQsVBEP8Fv_BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbZPhkzuUvwDnBWTvweBukQRcWx0w=2seQsVBEP8Fv_BA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 07:55:42PM +0200, Linus Walleij wrote:
> On Mon, May 4, 2020 at 12:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 

I hope Bart doesn't mind if I jump in here, but I've started working on
this so hopefully I can address most of your points...

> > Ideally we'd have to introduce new versions of gpioevent_request,
> > gpioline_request, gpioline_info and gpioevent_data structs - this time
> > with enough additional padding and no alignment issues. Then we could
> > add the debounce properly.
> 
> Hm that sounds massive. Is it really that bad?
> 

Agreed - it is massive - we end up replacing the majority of the
existing structs and ioctls.

If we want to be able to set debounce in the request(s), not just in
SET_CONFIG, then we need new requests as there is no room in the
existing.  If we want to be able to report that config in the info then
we need new infos for the same reason.  The info_changed contains an
info so that has to change as well. And the event_data has a 32/64bit
alignment issue so it was already up for replacement.

So it could be worse, but not much.

> > This would of course add a lot of cruft to the uAPI code. I'd start by
> > moving it out of drivers/gpio/gpiolib.c into a new file:
> > drivers/gpio/gpiolib-cdev.c. This way we'd have everything related to
> > the character device in one place. It would make it easier to: a) add
> > a config option for disabling it entirely and b) add a config option
> > to disable the v1 of the ioctl()s.
> 
> Its good to break out for code maintenance no matter what we do
> with it :)
>

It definitely is, and I'll submit a patch soon, that hopefully can be
applied immediately before the next dev window opens, to do just that.

> I would however not make it in any way totally optional, because the
> big win with the character device over the legacy sysfs is to always
> be available.
> 

And if you build it into your kernel, which will be the default, it
still will be.

But maybe there are specific applications that don't need cdev and
would be interested in reducing kernel bloat?

> > Linus: about the software-debounce you mentioned: do you think it
> > somehow plugs the hole we identified here?
> 
> Hm, I don't quite understand what the hole is I guess...
> 

I'll leave this one for Bart - the more I re-read the thread the less
certain I am as well.

I will note that Bart correctly mentioned that the uapi doesn't return
an error if the user requests bias that is not supported by the driver
- gpio_set_bias absorbs the error.

That isn't by intent - it is the way gpiod_direction_input
behaved before I added bias to cdev. It was left that way as I was
unsure on the broader implications of changing it, and wasn't keen on
implementing a cdev specific gpiod_direction_input either.
I'm open to suggestions if you would like to change that.

Cheers,
Kent.
