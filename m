Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1132B3057D4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313191AbhAZXIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:08:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:33648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727787AbhAZRMh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 12:12:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E47C20829;
        Tue, 26 Jan 2021 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611681101;
        bh=1RqLaKLn0eWSVef+4izSGoIe6A285ci13nIaK3dV0A8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y4B18Toq0y7SywC7KsFkurt5MSgt3OXB7WP5LnPCeMi5ywl3E8e1OBeyKUjILu8x6
         G9OR8nUAhrpnjW88XRzwZRqrNfvUpzqUrtWEso5ei58iTvtPnA5OR854KC2Hm4Mp64
         mpfzX5/SyWgZiq2zaSf7bTxhZCghos+FF4sC9kWM=
Date:   Tue, 26 Jan 2021 18:11:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the
 repository
Message-ID: <YBBNSzKHYNXki6NY@kroah.com>
References: <20210111133426.22040-1-brgl@bgdev.pl>
 <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com>
 <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
 <20210125055527.GA344851@sol>
 <CAMRc=Mc4gK6BXKV8-b9qBTgm8m5DqW35UPxPWn7PbfJ-8LB4Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc4gK6BXKV8-b9qBTgm8m5DqW35UPxPWn7PbfJ-8LB4Yw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 04:07:47PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 25, 2021 at 6:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip!]
> 
> > >
> > > I don't like the ifdef hell so I prefer to bundle the header. I'm open
> > > to other suggestions, although I can't come up with anything else.
> > >
> >
> > Going off on a bit of a tangent, but I'm trying to add support for
> > decoding the GPIO ioctls into strace and am running up against a similar
> > issue.
> >
> > The way strace does it is to check the uAPI header on the host and use
> > it if possible.  To handle where it may be stale, local types are
> > defined that mirror any types that may have been added since the header
> > was originally released.  If the corresponding type is available in the
> > linux header then it is used, else the local type.
> >
> > This obviously creates a lot of pointless boilerplate code and
> > preprocessor chicanery so I floated the idea of just including the latest
> > header in the strace tree, as you are doing here for libgpiod.
> > But that raised the issue of licencing, specifically if you copy the
> > linux/gpio.h into a source tree does that mean that the whole project
> > becomes GPL 2.0?  That is an issue for strace as it is LGPL 2.1 - as is
> > libgpiod.
> >
> > The Linux uAPI headers are under the GPL-2.0 WITH Linux-syscall-note,
> > which is also not totally clear on this point[1].
> >
> > My gut feeling was that using and even copying API headers doesn't
> > constitute a derived work, as per the FSF view quoted in [1], and
> > ethically might even be less of a violation than copying and re-defining
> > individual types, but I'd rather not rely on a gut feeling.
> >
> > Is there some clear opinion or precedent on this point?
> > i.e. are libgpiod and strace in legal licence jeopardy if they include
> > gpio.h in their source tree?
> >
> > Cheers,
> > Kent.
> >
> > [1] https://lkml.org/lkml/2020/2/21/2193
> 
> Thanks for pointing that out. I lack the legal knowledge to have an
> opinion of my own on this.
> 
> Cc'ing Greg KH for help.
> 
> Greg: do you know if it's fine to bundle a 'GPL-2.0 WITH
> Linux-syscall-note' uAPI header together with an LGPL-v2.1-or-later
> user-space shared library?

How would you "bundle" such a thing as that is not what is in the kernel
source tree?  If you are going to copy files out of the kernel and do
other things with them, well, I recommend asking a lawyer as I am not
one :)

good luck!

greg k-h
