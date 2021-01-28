Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1077F306B9E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 04:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhA1D1h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 22:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhA1D13 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 22:27:29 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC697C061573
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 19:26:48 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id v19so3352931pgj.12
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 19:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R66zOuCYjyxE14zU4p+ese6gpbRrTVPCfY5iGrt7N1A=;
        b=FzZGzgFm4WyFhXSqJFXfIoqIDM2QogD0SSJe/yWVhrDarY6JYzLbIwlLba/OwzxtIv
         4EAqwOTFQf7nVmKqQn/QczrtJd2wTAUxzzHck5bmNoBfU7lnrLam8MAPcRdeZFiRl07Z
         xK8S8BeiuMhwrJJkXBskpDVgf8s9pBO5mOhSbf2G/t4Ynez4+18HPOIWvQ8Q4VuOvRVR
         8IoSGEZSLWkvdjHJZZYe4QlZP2eDOp0flXjGp0F8VYFCcaPifdY5PXVOIzlMkIl3lycN
         ag/xWdUNq4cOdzz+zU7/tBdqePLGGM79aGhi/tB+s1MAnd9+GlqcRMQbYnnkOPhmfyb5
         bEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R66zOuCYjyxE14zU4p+ese6gpbRrTVPCfY5iGrt7N1A=;
        b=aq8Aj6PEpXgb1EVESLP4JVo1AaID0+64ZIDd5HK6/KwP7oOFcVuYgG0MfHWTWPbbLW
         4jftd9ApGkNBo97A2WytU9lOStN0P5/i0LAZxcw5kLv5KbTh75h0ysN56ZvjJvR+cm2g
         kzr3onXbCVnzBLIbF7g0rHm5NwHCKIkHs6KiQ9pwoeDL7LDfGXgxyxV7vaU975EKwTDj
         iokVnJEqUbDJxMGKING1ECtFsLnt1YtE6rhVGIfAKQai4uWzcEoO/WezoBxSx2BrpZ86
         sMognl1r5N4ARmUWFTMXJ2/wsUWMOzII3eqcJPKSR5E6XgpJ18SdhTsM06A7u2LuyaN4
         EW+Q==
X-Gm-Message-State: AOAM5303t6Yea9ACx06BQQpVq1Vcp3YVYA9K0aCV52XnppPZ3WVPYIXc
        NESKBCwGhrjXIK8sHL1LSxE=
X-Google-Smtp-Source: ABdhPJxNiyRYwwe5veY2JqHbyMJV9DA0ynEDbZljZCqhgqH6Em1wyssYDWZAOo/FqvXHSJalZeF0qw==
X-Received: by 2002:a62:2aca:0:b029:1bb:4349:f889 with SMTP id q193-20020a622aca0000b02901bb4349f889mr13842630pfq.26.1611804408312;
        Wed, 27 Jan 2021 19:26:48 -0800 (PST)
Received: from sol (106-69-169-43.dyn.iinet.net.au. [106.69.169.43])
        by smtp.gmail.com with ESMTPSA id x81sm3901445pfc.46.2021.01.27.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 19:26:47 -0800 (PST)
Date:   Thu, 28 Jan 2021 11:26:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Dmitry V. Levin" <ldv@altlinux.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the
 repository
Message-ID: <20210128032641.GA11655@sol>
References: <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com>
 <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
 <20210125055527.GA344851@sol>
 <CAMRc=Mc4gK6BXKV8-b9qBTgm8m5DqW35UPxPWn7PbfJ-8LB4Yw@mail.gmail.com>
 <YBBNSzKHYNXki6NY@kroah.com>
 <CAMRc=MeQ2gNgCEuf9apUgmzxeCUUPjD5oAChXXVOw=JmoqqaGA@mail.gmail.com>
 <YBFR3bwLyrc1a6Ln@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBFR3bwLyrc1a6Ln@kroah.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 12:43:25PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 26, 2021 at 08:08:01PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Jan 26, 2021 at 6:11 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jan 26, 2021 at 04:07:47PM +0100, Bartosz Golaszewski wrote:
> > > > On Mon, Jan 25, 2021 at 6:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > >
> > > > [snip!]
> > > >
> > > > > >
> > > > > > I don't like the ifdef hell so I prefer to bundle the header. I'm open
> > > > > > to other suggestions, although I can't come up with anything else.
> > > > > >
> > > > >
> > > > > Going off on a bit of a tangent, but I'm trying to add support for
> > > > > decoding the GPIO ioctls into strace and am running up against a similar
> > > > > issue.
> > > > >
> > > > > The way strace does it is to check the uAPI header on the host and use
> > > > > it if possible.  To handle where it may be stale, local types are
> > > > > defined that mirror any types that may have been added since the header
> > > > > was originally released.  If the corresponding type is available in the
> > > > > linux header then it is used, else the local type.
> > > > >
> > > > > This obviously creates a lot of pointless boilerplate code and
> > > > > preprocessor chicanery so I floated the idea of just including the latest
> > > > > header in the strace tree, as you are doing here for libgpiod.
> > > > > But that raised the issue of licencing, specifically if you copy the
> > > > > linux/gpio.h into a source tree does that mean that the whole project
> > > > > becomes GPL 2.0?  That is an issue for strace as it is LGPL 2.1 - as is
> > > > > libgpiod.
> > > > >
> > > > > The Linux uAPI headers are under the GPL-2.0 WITH Linux-syscall-note,
> > > > > which is also not totally clear on this point[1].
> > > > >
> > > > > My gut feeling was that using and even copying API headers doesn't
> > > > > constitute a derived work, as per the FSF view quoted in [1], and
> > > > > ethically might even be less of a violation than copying and re-defining
> > > > > individual types, but I'd rather not rely on a gut feeling.
> > > > >
> > > > > Is there some clear opinion or precedent on this point?
> > > > > i.e. are libgpiod and strace in legal licence jeopardy if they include
> > > > > gpio.h in their source tree?
> > > > >
> > > > > Cheers,
> > > > > Kent.
> > > > >
> > > > > [1] https://lkml.org/lkml/2020/2/21/2193
> > > >
> > > > Thanks for pointing that out. I lack the legal knowledge to have an
> > > > opinion of my own on this.
> > > >
> > > > Cc'ing Greg KH for help.
> > > >
> > > > Greg: do you know if it's fine to bundle a 'GPL-2.0 WITH
> > > > Linux-syscall-note' uAPI header together with an LGPL-v2.1-or-later
> > > > user-space shared library?
> > >
> > > How would you "bundle" such a thing as that is not what is in the kernel
> > > source tree?  If you are going to copy files out of the kernel and do
> > > other things with them, well, I recommend asking a lawyer as I am not
> > > one :)
> > >
> > > good luck!
> > >
> > > greg k-h
> > 
> > By "bundling" I mean - copying the kernel uAPI header verbatim from
> > the kernel tree into the project repository. The reason for that is
> > the fact that always relying on the toolchain kernel headers leads to
> > build issues if we want to support more recent kernel features in the
> > library while the supplied headers don't define all required symbols.
> > 
> > We can either make the latest supported version of linux headers a
> > hard requirement for building (I did that and buildroot folks yelled
> > at me because two stable versions of the library had different kernel
> > headers requirements) or redefine certain symbols (new symbols since
> > the oldest supported kernel version) or - and this is preferred unless
> > it's against the linux license - include the kernel headers in the
> > source tarball of the library.
> > 
> > I hope this is not a stupid question but obviously I don't know any
> > lawyer well versed in software copyright: can we direct this question
> > to anyone at the Linux Foundation maybe?
> 
> Ok, first off, I am not a lawyer so don't take legal advice from me.
> 
> But, if you copy the .h file directly, and keep the same license on the
> file, that should be fine as you would be using it under the "GPLv2 with
> syscall note" license for your userspace program, right?
> 
> So there shouldn't be an issue there that I can determine, as we want
> userspace programs to be free to use those headers to interact with the
> kernel.
> 
> It's come up in the past that we might want to somehow make this much
> more obvious, and we have talked about this with the legal community,
> but that's only in the context of making it more obvious that we want
> people to write programs of any license to talk to the kernel, not that
> we would want to keep anyone from doing that :)
> 
> thanks,
> 
> greg k-h

Including Dmitry as he orignally raised the issue and has an interest in
its resolution.

Greg: thanks for providing your view.  You may not be a lawyer (which is
a very good thing, btw), but your opinion carries a lot of weight, and
combined with what we already knew I think we're on very solid ground
distributing the kernel headers in the libgpiod and strace repositories.

Bart and Dmitry: I submit that we are good to copy the headers into the
repositories, but we should take a few steps just to make clear that we
are in full compliance with the GPL v2.

Firstly, we are distributing the headers under Section 1 (distribution)
of the GPL, so we should keep the headers in a separate directory that
contains its own COPYING file as well as the GPL v2 and Linux syscall note
- unless they are already available elsewhere in the repo.

The headers must be copied verbatim so as to not trigger Section 2
(modification).  And it is probably good to include in the commit
comment what kernel version or commit they were drawn from so that can
be easily confirmed.

Section 3 still doesn't apply, as any resulting object code or
executables are no more a derived work due to the availability of the
header than they were previously.  And I don't think anyone is claiming
that the repo itself is a derived work - in this context it is just a
distribution medium.

The COPYING file, or equivalent, for the project should explicitly
exclude any claim on the kernel header directory to make clear we are
not trying to sublicense the headers as LGPL - which could breach
Section 4.

Other than those points, I don't see anywhere we may be in breach.

As with Greg, IANAL so this is not legal advice.  Feel free to
disregard any or all of the above if you still consider the legal
standing uncertain or too risky.

Cheers,
Kent.
