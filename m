Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638522784CE
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 12:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgIYKMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 06:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgIYKMc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 06:12:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1D0C0613CE;
        Fri, 25 Sep 2020 03:12:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k13so2731609pfg.1;
        Fri, 25 Sep 2020 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ul4FWsiiwY8Jo4Eq8juNVSqvOl3DuvcCHfuOSOchXXY=;
        b=GhIDGWa+iwIgA3l9KGa+mgFl1Oz+IHjEWTANtQMqpmt96UP66EV51q5qwBglajoGwZ
         7oxFiyMf4SA49jfxMSS3vJtk+yHcN7FT0Fv+UIpMwgB4+9bG4k6FW1TlmWY8eLuQ/In8
         TxT13hjIUbV67qSVgKW1emZIzbjnSfpTYp30OK/5IXG+k1vM8Ph5Udaq4LJu3s3ZenOC
         ELb1kfjHDHi+kpxTpB2vikTJ2GUqgGW13+rbxThsFWdf9Qe/OWFGrSgmj/+QfwmICxS4
         4vnZiFIr+3ZcXowpXoD/R89zn/zzsOT4wiVanVR7I5qOoaxMXqpjoeAaRihrxGroiw7h
         voww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ul4FWsiiwY8Jo4Eq8juNVSqvOl3DuvcCHfuOSOchXXY=;
        b=A368QPsSUAJu8QaYb/PrvdbWbKXDDEB4ZUuSe+0nOkfozGnPJ+P+Mtox0CaLrTkj3/
         nYRlGEI2XFfBeezJeBLPTbGjc4HdHxZCwiwwGTlBR6+rttvfcO4Ar5Ha6CxHNB9nlUt8
         Hwv1g6kimfxmxtmfM/ym5YxIG6blWfZZ5fJZKlkWPXd9uYKt71yHoYbDPFiAEONbE/eH
         3jqkkbPNcszmn+FzDz1KnkMsXKTvYGu+Dsln9ubYrVtwm59b09tpm7IWpfJrUnFgOjzB
         oZUaEJVZDCjQvK3hSVVjbNFnyTwnMtxCrvCdKcr2Tt27s5/yReyt3XvQ5dJb9RjT60Z1
         fDwg==
X-Gm-Message-State: AOAM530W+fgiFBfyYd8lv7UVQfSUihdzUrmJoFkqIvdGpc5MkW6sHuU5
        GrbgVBMYLUM0SYWD2zFsgv+o5QcLGKypM0gC0UY=
X-Google-Smtp-Source: ABdhPJzQ5GrWtzE+JZxiH04u2PFEx58tfLNqY1MiAlIXjH4oX/s+YC7jERywZWOXfAi14X4Gjzb9xJi4/gX6DxSi73E=
X-Received: by 2002:a17:902:d708:b029:d2:635f:6692 with SMTP id
 w8-20020a170902d708b02900d2635f6692mr2992572ply.17.1601028752161; Fri, 25 Sep
 2020 03:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-9-warthog618@gmail.com>
 <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
 <20200924023914.GA11575@sol> <CAHp75VfoOCJDmpDJ6wTEKTDUO1zFRZ6MRSN7dy3cAdepv0s2rQ@mail.gmail.com>
 <20200924094813.GC20188@sol>
In-Reply-To: <20200924094813.GC20188@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 13:12:14 +0300
Message-ID: <CAHp75VcmJyNdK8hOKneT3T=t8QyRcU+X+UwfmKCL5SJsniev9g@mail.gmail.com>
Subject: Re: [PATCH v9 08/20] gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL
 and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 12:48 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Thu, Sep 24, 2020 at 11:39:03AM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 24, 2020 at 5:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Wed, Sep 23, 2020 at 06:41:45PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > > > > +static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
> > > > > +                                      unsigned int version)
> > > > > +{
> > > >
> > > > > +       int abiv = atomic_read(&cdata->watch_abi_version);
> > > > > +
> > > > > +       if (abiv == 0) {
> > > >
> > > > > +               atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
> > > > > +               abiv = atomic_read(&cdata->watch_abi_version);
> > > >
> > > > atomic_cmpxchng() returns a value.
> > >
> > > Yep, it returns the old value - which we don't care about - see below.
> >
> > Then what's the point to read back?..
> >
> > > > Also there are no barriers here...
> > > >
> > >
> > > No barriers required - the atomic_cmpxchg() is sufficient.
> > >
> > > > > +       }
> > > > > +       if (abiv != version)
> > > > > +               return -EPERM;
> > > >
> > > > I'm not sure I understand why this is atomic.
> > > >
> > >
> > > The algorithm requires some level of protection and atomic is
> > > sufficient.
> > >
> > > > Also this seems to be racy if cdata changed in background.
> > > >
> > >
> > > Can you provide a case?
> >
> > CPU0:                CPU1:
> >  xchg()               ...
> >  ...                      xchg()
> >  ...                      read() -> OK
> > read() ->NOK
> >
>
> Lets say CPU0 is setting 1 and CPU1 setting 2, and assuming the xchg()
> completes...
> Your case is not possible - CPU1 would see the value 1 set by CPU0 in the
> read() and so NOK.  Its xchg() would fail as it compares against 0
> and that also sees the 1 and so fails.
>
> What am I missing?

Barriers? That's what documentation says about xchg().
https://stackoverflow.com/q/20950603/2511795

> > > The atomic_cmpxchg() ensures cdata->watch_abi_version is only set
> > > once - first in wins.  The atomic_read() is so we can check that
> > > the set version matches what the caller wants.
> > > Note that multiple callers may request the same version - and all
> > > should succeed.
> >
> > So, that's basically what you need when using _old_ value.
> >
> > 0 means you were first, right?
> > Anything else you simply compare and bail out if it's not the same as
> > what has been asked.
> >
>
> Could you provide a complete implementation that behaves as I expect,
> rather than snippets and verbage?

if (atomic_cmpxchg(&cdata..., version) == 0)
 return 0; // we were first!
return -EPERM; // somebody has changed the version before us!

> > > > Shouldn't be rather
> > > >
> > > > if (atomic_cmpxchg() == 0) {
> > > >   if (atomic_read() != version)
> > > >     return ...;
> > > > }
> > > >
> > >
> > > My algorithm allows for multiple callers requesting the same version
> > > to all succeed.  Yours would fail the first conditional for all but
> > > the first, and you haven't provided an else for that case...
> > >
> > > ... but it would probably look the same so the conditional is pointless,
> > > or it would reject the request - which would be wrong.
> > >
> > > > But here is still the question: why do you expect the version to be
> > > > changed on background? And what about barriers?
> > > >
> > >
> > > While it is unlikely that userspace will be attempting to use both ABI
> > > versions simultaneously on the same chip request, it is a possiblity and
> > > so needs to be protected against. And better to have the watch request
> > > fail than the read fail or worse - return the wrong struct version.
> > >
> > > The atomic_cmpxchg() is sufficient for this algorithm - no barriers
> > > required.  It could also be written with a spinlock but I was trying to
> > > avoid locks unless they were absolutely necessary.  A spinlock version
> > > may arguably be more readable, but it would certainly be more verbose,
> > > larger and slower.
> > >
> > > I'm happy to add some documentation to the function if that would help.
> >
> > Yes, I guess documentation is what is eagerly needed here.
> >
>
> No problem.

-- 
With Best Regards,
Andy Shevchenko
