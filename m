Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE0F276DCC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 11:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbgIXJsU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 05:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbgIXJsU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 05:48:20 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EBDC0613CE;
        Thu, 24 Sep 2020 02:48:19 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 34so1555797pgo.13;
        Thu, 24 Sep 2020 02:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kQiPyurhs5rhqA5JA6J1njXKtCOs2kAEJBL/PJHCkBg=;
        b=eojKqX0yb7ohLHLPYWPcv7mKTeaa2TiR3xLMkj+vSMDEi7iEu/bORv+FAPJJMc+o0s
         PQ9Pi8LN1OC232mOaRyyZqgxsl75xFGXvr/XXQjGNCaiKaFsgPPr4CMHoPQJ2xb/Lksv
         cp/A6EiGf9FSqJuNKX7u6V6ZWxDOS4a8sPmdwcsLvWidk0OoV18bLoexB8JAlMclomC+
         6fV2kpeuLQfw/R0QaVbW6WS9VmmzLPkF7JFpLot9LUNUEoUYzRxljVV7cSaHfDAxJXS/
         /gT1dgAwnR/Wm/d+riURnn/4F4xN8xNkwi9LObXWekaCu+R8GLp4SgwmmGqzw5nsIC86
         xPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kQiPyurhs5rhqA5JA6J1njXKtCOs2kAEJBL/PJHCkBg=;
        b=pAYYZQzUlT/ivYvbyiREMVshVF/0osHF3johqOrRv9VJr/AwjwHkqxg11ZITOMQMIQ
         2onOh2KqXSI76acNKbCXZlcGSvOzbcqjcK+vTWM+i1BuLb7V4Hx0Kosu3hnxwSgBOwz/
         XpCgow4+XBaQWkVUbPNVpwEfzZ/Mgq6P9CegLUipn6w98sdJfVVkHoDZwGOQZ0lfpuvL
         O2dj6a9dMsYmuC7lVPl3Mirqm21d0Ep6lfEwvVFr67oql03cWoy4ITQM+3HgDZPvNNAz
         uCQFQS+gxdbQiYGByUlnBFianDQD/CMD6lcgA1XQdflaM4sHZ3Rh38aIGmVJ2uhi7far
         hRVg==
X-Gm-Message-State: AOAM532dmWxY2Ks1O7WFu9wRqKmZenLN8tlElSJkS+7S8K543wtNUWjt
        9aviYOeZwPQKEP7DBF0dfgM=
X-Google-Smtp-Source: ABdhPJyNRZv45lba9bEArRNK9F71yQE9jmg2y3YhHYdc+YOuQrqRmEth4yRT2ET0nIS5KY5OGr9fTg==
X-Received: by 2002:a65:42c9:: with SMTP id l9mr3156332pgp.41.1600940899256;
        Thu, 24 Sep 2020 02:48:19 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id x185sm2365357pfc.188.2020.09.24.02.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 02:48:18 -0700 (PDT)
Date:   Thu, 24 Sep 2020 17:48:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 08/20] gpiolib: cdev: support
 GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
Message-ID: <20200924094813.GC20188@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-9-warthog618@gmail.com>
 <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
 <20200924023914.GA11575@sol>
 <CAHp75VfoOCJDmpDJ6wTEKTDUO1zFRZ6MRSN7dy3cAdepv0s2rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfoOCJDmpDJ6wTEKTDUO1zFRZ6MRSN7dy3cAdepv0s2rQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 11:39:03AM +0300, Andy Shevchenko wrote:
> On Thu, Sep 24, 2020 at 5:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Wed, Sep 23, 2020 at 06:41:45PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> ...
> 

[snip]
> 
> > > > +static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
> > > > +                                      unsigned int version)
> > > > +{
> > >
> > > > +       int abiv = atomic_read(&cdata->watch_abi_version);
> > > > +
> > > > +       if (abiv == 0) {
> > >
> > > > +               atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
> > > > +               abiv = atomic_read(&cdata->watch_abi_version);
> > >
> > > atomic_cmpxchng() returns a value.
> >
> > Yep, it returns the old value - which we don't care about - see below.
> 
> Then what's the point to read back?..
> 
> > > Also there are no barriers here...
> > >
> >
> > No barriers required - the atomic_cmpxchg() is sufficient.
> >
> > > > +       }
> > > > +       if (abiv != version)
> > > > +               return -EPERM;
> > >
> > > I'm not sure I understand why this is atomic.
> > >
> >
> > The algorithm requires some level of protection and atomic is
> > sufficient.
> >
> > > Also this seems to be racy if cdata changed in background.
> > >
> >
> > Can you provide a case?
> 
> CPU0:                CPU1:
>  xchg()               ...
>  ...                      xchg()
>  ...                      read() -> OK
> read() ->NOK
> 

Lets say CPU0 is setting 1 and CPU1 setting 2, and assuming the xchg()
completes...
Your case is not possible - CPU1 would see the value 1 set by CPU0 in the
read() and so NOK.  Its xchg() would fail as it compares against 0
and that also sees the 1 and so fails.

What am I missing?

> > The atomic_cmpxchg() ensures cdata->watch_abi_version is only set
> > once - first in wins.  The atomic_read() is so we can check that
> > the set version matches what the caller wants.
> > Note that multiple callers may request the same version - and all
> > should succeed.
> 
> So, that's basically what you need when using _old_ value.
> 
> 0 means you were first, right?
> Anything else you simply compare and bail out if it's not the same as
> what has been asked.
> 

Could you provide a complete implementation that behaves as I expect,
rather than snippets and verbage?

> >
> > > Shouldn't be rather
> > >
> > > if (atomic_cmpxchg() == 0) {
> > >   if (atomic_read() != version)
> > >     return ...;
> > > }
> > >
> >
> > My algorithm allows for multiple callers requesting the same version
> > to all succeed.  Yours would fail the first conditional for all but
> > the first, and you haven't provided an else for that case...
> >
> > ... but it would probably look the same so the conditional is pointless,
> > or it would reject the request - which would be wrong.
> >
> > > But here is still the question: why do you expect the version to be
> > > changed on background? And what about barriers?
> > >
> >
> > While it is unlikely that userspace will be attempting to use both ABI
> > versions simultaneously on the same chip request, it is a possiblity and
> > so needs to be protected against. And better to have the watch request
> > fail than the read fail or worse - return the wrong struct version.
> >
> > The atomic_cmpxchg() is sufficient for this algorithm - no barriers
> > required.  It could also be written with a spinlock but I was trying to
> > avoid locks unless they were absolutely necessary.  A spinlock version
> > may arguably be more readable, but it would certainly be more verbose,
> > larger and slower.
> >
> > I'm happy to add some documentation to the function if that would help.
> 
> Yes, I guess documentation is what is eagerly needed here.
> 

No problem.

Cheers,
Kent.
