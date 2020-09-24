Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3731127668D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 04:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgIXCjV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 22:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgIXCjV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 22:39:21 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E4EC0613CE;
        Wed, 23 Sep 2020 19:39:21 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so959632pfk.2;
        Wed, 23 Sep 2020 19:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nar2pR4R+4N4I+J3Yeaz/2PYgrCQWHTEQCIr9stVDXM=;
        b=mSqlfjmmdQ8ek3QwYwp721YRLGdTG92Rro42aRXUyCc6Fr9PSXa8vU+MbAVfupfGBn
         S5A7h6ZkCB3ginYD16kvgBcbZAvGt5DOpugRd7DkGF1tUamGiAEoBiDVyUDCZyUS7oAN
         JMRDeS9XHymQTyEeOxyp3aD8IbAeeLyV4aAsE3wPDdnRR72TYGaulEgI26jk4lgS79KS
         59hX7LXHeiIXDLUTT880ObT47Z+7BbbNzZ3jg4ce/zlFqnXKk7BEyhX0iBgiWSjk2dUB
         SUMhzaYkF6VOuF1XaroeILZvb5lSbyOweIVRn+GkGbvnlDc0TRkZ4cErnEgl8omJUkRY
         n6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nar2pR4R+4N4I+J3Yeaz/2PYgrCQWHTEQCIr9stVDXM=;
        b=DshC1T93JKhSRX9+n9snYfggpaAPKwGumn/W+Utq7yy8trif4ZAhDnCoUfLlAMCqcY
         m8OCcFzO2BKDcFdH2mBZTw5bToMGhlM5BIuxo1e+Mg1c0yryLJI+f2YMj32cmxsDHk2z
         pHObpAg3S7Ah1IFhbdwA5UcERyeF0Bu7/pPseordrImiBbFni3pVsQIFPgmty0NAmtwd
         j91WYSl6LBcOeb27J97q55gd3AC8BD6A0oP1M+TJN9sqKoPL1PIpgBXhxR0TxW4nfN4n
         oRvLm/eTq2nNWJtG1KGlDEzXAQdHAMQBdQaGUg9Xi9xZgJWrHkIYwqr+NR80LYtGKPLa
         y4EQ==
X-Gm-Message-State: AOAM5326mIx5xdC7T6W4281VxDGgawubFucZ7C6v+J2VPlkzlfVSb/2C
        qPDzf23Kgw0j0tLfD9d9HW0=
X-Google-Smtp-Source: ABdhPJygiQRBkMqHn/X/kbmF+60VF2uqTh/zseBhqo4yOe1wW+U69tmecXudzCPGIOIFFWTueTfZSQ==
X-Received: by 2002:a63:5566:: with SMTP id f38mr2286754pgm.9.1600915160707;
        Wed, 23 Sep 2020 19:39:20 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id x13sm888734pff.152.2020.09.23.19.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 19:39:20 -0700 (PDT)
Date:   Thu, 24 Sep 2020 10:39:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 08/20] gpiolib: cdev: support
 GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
Message-ID: <20200924023914.GA11575@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-9-warthog618@gmail.com>
 <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 06:41:45PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for GPIO_V2_GET_LINEINFO_IOCTL and
> > GPIO_V2_GET_LINEINFO_WATCH_IOCTL.
> >

[snip]

> >
> > +static void gpio_v2_line_info_to_v1(struct gpio_v2_line_info *info_v2,
> > +                                   struct gpioline_info *info_v1)
> > +{
> > +       u64 flagsv2 = info_v2->flags;
> > +
> > +       memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
> 
> > +       memcpy(info_v1->consumer, info_v2->consumer,
> > +              sizeof(info_v1->consumer));
> 
> One line?
> 

It can be now the line length limit has been raised - it just breaks the
old 80 character limit.

[snip]
> >
> > +#ifdef CONFIG_GPIO_CDEV_V1
> > +static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
> > +                                      unsigned int version)
> > +{
> 
> > +       int abiv = atomic_read(&cdata->watch_abi_version);
> > +
> > +       if (abiv == 0) {
> 
> > +               atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
> > +               abiv = atomic_read(&cdata->watch_abi_version);
> 
> atomic_cmpxchng() returns a value.

Yep, it returns the old value - which we don't care about - see below.

> Also there are no barriers here...
> 

No barriers required - the atomic_cmpxchg() is sufficient.

> > +       }
> > +       if (abiv != version)
> > +               return -EPERM;
> 
> I'm not sure I understand why this is atomic.
> 

The algorithm requires some level of protection and atomic is
sufficient.

> Also this seems to be racy if cdata changed in background.
> 

Can you provide a case?

The atomic_cmpxchg() ensures cdata->watch_abi_version is only set 
once - first in wins.  The atomic_read() is so we can check that
the set version matches what the caller wants.
Note that multiple callers may request the same version - and all
should succeed.

> Shouldn't be rather
> 
> if (atomic_cmpxchg() == 0) {
>   if (atomic_read() != version)
>     return ...;
> }
> 

My algorithm allows for multiple callers requesting the same version
to all succeed.  Yours would fail the first conditional for all but
the first, and you haven't provided an else for that case...

... but it would probably look the same so the conditional is pointless,
or it would reject the request - which would be wrong.

> But here is still the question: why do you expect the version to be
> changed on background? And what about barriers?
> 

While it is unlikely that userspace will be attempting to use both ABI
versions simultaneously on the same chip request, it is a possiblity and
so needs to be protected against. And better to have the watch request
fail than the read fail or worse - return the wrong struct version.

The atomic_cmpxchg() is sufficient for this algorithm - no barriers
required.  It could also be written with a spinlock but I was trying to
avoid locks unless they were absolutely necessary.  A spinlock version
may arguably be more readable, but it would certainly be more verbose,
larger and slower.

I'm happy to add some documentation to the function if that would help.

> > +       return 0;
> > +}
> > +#endif
> > +
> > +static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
> > +                       bool watch)
> > +{
> > +       struct gpio_desc *desc;
> > +       struct gpio_v2_line_info lineinfo;
> > +
> > +       if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
> > +               return -EFAULT;
> > +
> > +       if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
> > +               return -EINVAL;
> > +
> > +       desc = gpiochip_get_desc(cdev->gdev->chip, lineinfo.offset);
> > +       if (IS_ERR(desc))
> > +               return PTR_ERR(desc);
> > +
> > +       if (watch) {
> > +#ifdef CONFIG_GPIO_CDEV_V1
> 
> > +               if (lineinfo_ensure_abi_version(cdev, 2))
> > +                       return -EPERM;
> 
> Can't you propagate error code from the function?
> 

You mean:
+               ret = lineinfo_ensure_abi_version(cdev, 2)
+               if (ret)
+                       return ret;

That seems more verbose and less clear.  And I'd need to conditionally
declare a ret - as this test is compiled out if CDEV_V1 is not defined.

I did flip-flop on what lineinfo_ensure_abi_version() should return -
either a bool or an error code.

If a bool then the code would include the dreaded negative conditional
;-(:

+               if (!lineinfo_is_abi_version(cdev, 2))
+                       return -EPERM;

so I eventually settled for the error code.  But I'm on the fence on
this one and happy to change it if you think the bool form is clearer.

Cheers,
Kent.
