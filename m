Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142F1305A37
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 12:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbhA0LqM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 06:46:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:37522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236852AbhA0LoJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 06:44:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC1BE2075B;
        Wed, 27 Jan 2021 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611747808;
        bh=/5nIAIDUtEaoz4kHWH0BEbwNsK21CQq+sbChjoihsg0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IQGMBmbx/vgvQtqOxbD6IG97hoY57wV3FdhxibxhGqPgmt9iqaEKFoPLat+ZgkfCP
         VIyyU37TTlxzq8t4qmpqgS/S3tyLytZVPjk7eC2nCJnWd2COygBH9lV54o4ukxCrDV
         x9bV36pKir6kBGyzarJEetS3VWfVvx/e4qx3dqsw=
Date:   Wed, 27 Jan 2021 12:43:25 +0100
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
Message-ID: <YBFR3bwLyrc1a6Ln@kroah.com>
References: <20210111133426.22040-1-brgl@bgdev.pl>
 <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com>
 <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
 <20210125055527.GA344851@sol>
 <CAMRc=Mc4gK6BXKV8-b9qBTgm8m5DqW35UPxPWn7PbfJ-8LB4Yw@mail.gmail.com>
 <YBBNSzKHYNXki6NY@kroah.com>
 <CAMRc=MeQ2gNgCEuf9apUgmzxeCUUPjD5oAChXXVOw=JmoqqaGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeQ2gNgCEuf9apUgmzxeCUUPjD5oAChXXVOw=JmoqqaGA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 08:08:01PM +0100, Bartosz Golaszewski wrote:
> On Tue, Jan 26, 2021 at 6:11 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jan 26, 2021 at 04:07:47PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Jan 25, 2021 at 6:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > > [snip!]
> > >
> > > > >
> > > > > I don't like the ifdef hell so I prefer to bundle the header. I'm open
> > > > > to other suggestions, although I can't come up with anything else.
> > > > >
> > > >
> > > > Going off on a bit of a tangent, but I'm trying to add support for
> > > > decoding the GPIO ioctls into strace and am running up against a similar
> > > > issue.
> > > >
> > > > The way strace does it is to check the uAPI header on the host and use
> > > > it if possible.  To handle where it may be stale, local types are
> > > > defined that mirror any types that may have been added since the header
> > > > was originally released.  If the corresponding type is available in the
> > > > linux header then it is used, else the local type.
> > > >
> > > > This obviously creates a lot of pointless boilerplate code and
> > > > preprocessor chicanery so I floated the idea of just including the latest
> > > > header in the strace tree, as you are doing here for libgpiod.
> > > > But that raised the issue of licencing, specifically if you copy the
> > > > linux/gpio.h into a source tree does that mean that the whole project
> > > > becomes GPL 2.0?  That is an issue for strace as it is LGPL 2.1 - as is
> > > > libgpiod.
> > > >
> > > > The Linux uAPI headers are under the GPL-2.0 WITH Linux-syscall-note,
> > > > which is also not totally clear on this point[1].
> > > >
> > > > My gut feeling was that using and even copying API headers doesn't
> > > > constitute a derived work, as per the FSF view quoted in [1], and
> > > > ethically might even be less of a violation than copying and re-defining
> > > > individual types, but I'd rather not rely on a gut feeling.
> > > >
> > > > Is there some clear opinion or precedent on this point?
> > > > i.e. are libgpiod and strace in legal licence jeopardy if they include
> > > > gpio.h in their source tree?
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > > > [1] https://lkml.org/lkml/2020/2/21/2193
> > >
> > > Thanks for pointing that out. I lack the legal knowledge to have an
> > > opinion of my own on this.
> > >
> > > Cc'ing Greg KH for help.
> > >
> > > Greg: do you know if it's fine to bundle a 'GPL-2.0 WITH
> > > Linux-syscall-note' uAPI header together with an LGPL-v2.1-or-later
> > > user-space shared library?
> >
> > How would you "bundle" such a thing as that is not what is in the kernel
> > source tree?  If you are going to copy files out of the kernel and do
> > other things with them, well, I recommend asking a lawyer as I am not
> > one :)
> >
> > good luck!
> >
> > greg k-h
> 
> By "bundling" I mean - copying the kernel uAPI header verbatim from
> the kernel tree into the project repository. The reason for that is
> the fact that always relying on the toolchain kernel headers leads to
> build issues if we want to support more recent kernel features in the
> library while the supplied headers don't define all required symbols.
> 
> We can either make the latest supported version of linux headers a
> hard requirement for building (I did that and buildroot folks yelled
> at me because two stable versions of the library had different kernel
> headers requirements) or redefine certain symbols (new symbols since
> the oldest supported kernel version) or - and this is preferred unless
> it's against the linux license - include the kernel headers in the
> source tarball of the library.
> 
> I hope this is not a stupid question but obviously I don't know any
> lawyer well versed in software copyright: can we direct this question
> to anyone at the Linux Foundation maybe?

Ok, first off, I am not a lawyer so don't take legal advice from me.

But, if you copy the .h file directly, and keep the same license on the
file, that should be fine as you would be using it under the "GPLv2 with
syscall note" license for your userspace program, right?

So there shouldn't be an issue there that I can determine, as we want
userspace programs to be free to use those headers to interact with the
kernel.

It's come up in the past that we might want to somehow make this much
more obvious, and we have talked about this with the legal community,
but that's only in the context of making it more obvious that we want
people to write programs of any license to talk to the kernel, not that
we would want to keep anyone from doing that :)

thanks,

greg k-h
