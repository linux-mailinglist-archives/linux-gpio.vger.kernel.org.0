Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4877E276C28
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 10:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgIXIjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 04:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgIXIjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 04:39:20 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2D8C0613CE;
        Thu, 24 Sep 2020 01:39:20 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d19so1327844pld.0;
        Thu, 24 Sep 2020 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVyFBXyqmDS4jB1M2eyvEy1BeQ0zCzl71j0vO3zYwBw=;
        b=QVtEZrwkNtcAmHs0xtRsmirz8bEp8ZPqq6D9HGs+VvSMMYMrB9tSbOfA+zdrOEvf6b
         GozITFVBL9ZLQRvTMEKGwFQvGz5Ng6Ax8YrzcDmKe4Khrg6sygvbUQ3AeXT4bBhRrBIz
         acthhHowDXBtrwfLrltzZ6fHmDF5lJ1kRbj/5l9TXDwR/8k7P+u2WHiUaJgp2nMRO00F
         IHU28vtI/mICjjsjZ79VEy5xJuYZJj4htLvjZgelDJp0GoWFSq8yUqz9bM48RBMwXJYp
         qHMwSYEZZMw5zjijr2kR8kM+P/3iVA+YvTvrnlw0s7sgdPWRMriN9NSRoLmIN/1autdc
         e16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVyFBXyqmDS4jB1M2eyvEy1BeQ0zCzl71j0vO3zYwBw=;
        b=dxtZ8SwXoMliR1DGxJT/TGm+r1/j3aKaIO6ipgfTvAJDmeCzM7UNqK0Afbc+O2P6zw
         3XDAf0cPD4se5MBwFzWhi8gTGWpFRS2Z6ho6ES2TedoFj3PIUbAFMigr2lH6EwXuuONx
         MA4mdfxK/Z1K5nAStcPL2SbsDjfbBpJBy4aIbqwyanAAwHVmZrqJlokVEjaAQp1z1x8A
         FoFUmpyRCyDMP25/1M5VlM2qwMX+uhFap+TKVC3ali15O0QlNytjka8i1hNw8syzfai8
         sTb5CQCTLnqxprob5ZyyiYit1ceTdoTwSoGysuCtspg10CseCwqhRSlrpNxeQTYD7pHd
         JCgA==
X-Gm-Message-State: AOAM532BdtomIhEXOWejZqbdFfIih6XNDLQqKzvu0uNUCQyQ2NNBszvi
        gAkHGBPX+KPR1SbH/UTLKOYK+TNYaTkzQfJEfUe5cJ7CQ/3Zyw==
X-Google-Smtp-Source: ABdhPJzqswI1RqWyqBhOjtQbrq3ic5WuBjxt7ikt4SYNyO5ywmfbno3rJvDKJFQlcYX+Q7WVYylEidSbPEclXHPl46I=
X-Received: by 2002:a17:902:c14c:b029:d2:4345:5a9 with SMTP id
 12-20020a170902c14cb02900d2434505a9mr3615948plj.0.1600936759578; Thu, 24 Sep
 2020 01:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-9-warthog618@gmail.com>
 <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com> <20200924023914.GA11575@sol>
In-Reply-To: <20200924023914.GA11575@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Sep 2020 11:39:03 +0300
Message-ID: <CAHp75VfoOCJDmpDJ6wTEKTDUO1zFRZ6MRSN7dy3cAdepv0s2rQ@mail.gmail.com>
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

On Thu, Sep 24, 2020 at 5:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 06:41:45PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > > +       memcpy(info_v1->consumer, info_v2->consumer,
> > > +              sizeof(info_v1->consumer));
> >
> > One line?
> >
>
> It can be now the line length limit has been raised - it just breaks the
> old 80 character limit.

I really wouldn't care about this if it's only for a couple of characters.

...

> > > +static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
> > > +                                      unsigned int version)
> > > +{
> >
> > > +       int abiv = atomic_read(&cdata->watch_abi_version);
> > > +
> > > +       if (abiv == 0) {
> >
> > > +               atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
> > > +               abiv = atomic_read(&cdata->watch_abi_version);
> >
> > atomic_cmpxchng() returns a value.
>
> Yep, it returns the old value - which we don't care about - see below.

Then what's the point to read back?..

> > Also there are no barriers here...
> >
>
> No barriers required - the atomic_cmpxchg() is sufficient.
>
> > > +       }
> > > +       if (abiv != version)
> > > +               return -EPERM;
> >
> > I'm not sure I understand why this is atomic.
> >
>
> The algorithm requires some level of protection and atomic is
> sufficient.
>
> > Also this seems to be racy if cdata changed in background.
> >
>
> Can you provide a case?

CPU0:                CPU1:
 xchg()               ...
 ...                      xchg()
 ...                      read() -> OK
read() ->NOK

> The atomic_cmpxchg() ensures cdata->watch_abi_version is only set
> once - first in wins.  The atomic_read() is so we can check that
> the set version matches what the caller wants.
> Note that multiple callers may request the same version - and all
> should succeed.

So, that's basically what you need when using _old_ value.

0 means you were first, right?
Anything else you simply compare and bail out if it's not the same as
what has been asked.

>
> > Shouldn't be rather
> >
> > if (atomic_cmpxchg() == 0) {
> >   if (atomic_read() != version)
> >     return ...;
> > }
> >
>
> My algorithm allows for multiple callers requesting the same version
> to all succeed.  Yours would fail the first conditional for all but
> the first, and you haven't provided an else for that case...
>
> ... but it would probably look the same so the conditional is pointless,
> or it would reject the request - which would be wrong.
>
> > But here is still the question: why do you expect the version to be
> > changed on background? And what about barriers?
> >
>
> While it is unlikely that userspace will be attempting to use both ABI
> versions simultaneously on the same chip request, it is a possiblity and
> so needs to be protected against. And better to have the watch request
> fail than the read fail or worse - return the wrong struct version.
>
> The atomic_cmpxchg() is sufficient for this algorithm - no barriers
> required.  It could also be written with a spinlock but I was trying to
> avoid locks unless they were absolutely necessary.  A spinlock version
> may arguably be more readable, but it would certainly be more verbose,
> larger and slower.
>
> I'm happy to add some documentation to the function if that would help.

Yes, I guess documentation is what is eagerly needed here.

> > > +       return 0;
> > > +}
> > > +#endif
> > > +
> > > +static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
> > > +                       bool watch)
> > > +{
> > > +       struct gpio_desc *desc;
> > > +       struct gpio_v2_line_info lineinfo;
> > > +
> > > +       if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
> > > +               return -EFAULT;
> > > +
> > > +       if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
> > > +               return -EINVAL;
> > > +
> > > +       desc = gpiochip_get_desc(cdev->gdev->chip, lineinfo.offset);
> > > +       if (IS_ERR(desc))
> > > +               return PTR_ERR(desc);
> > > +
> > > +       if (watch) {
> > > +#ifdef CONFIG_GPIO_CDEV_V1
> >
> > > +               if (lineinfo_ensure_abi_version(cdev, 2))
> > > +                       return -EPERM;
> >
> > Can't you propagate error code from the function?
> >
>
> You mean:
> +               ret = lineinfo_ensure_abi_version(cdev, 2)
> +               if (ret)
> +                       return ret;
>
> That seems more verbose and less clear.  And I'd need to conditionally
> declare a ret - as this test is compiled out if CDEV_V1 is not defined.
>
> I did flip-flop on what lineinfo_ensure_abi_version() should return -
> either a bool or an error code.
>
> If a bool then the code would include the dreaded negative conditional
> ;-(:
>
> +               if (!lineinfo_is_abi_version(cdev, 2))
> +                       return -EPERM;
>
> so I eventually settled for the error code.  But I'm on the fence on
> this one and happy to change it if you think the bool form is clearer.
>
> Cheers,
> Kent.



-- 
With Best Regards,
Andy Shevchenko
