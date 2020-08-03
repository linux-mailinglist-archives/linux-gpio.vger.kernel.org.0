Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA94823B099
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 01:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbgHCXBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 19:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgHCXBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 19:01:25 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAF3C06174A;
        Mon,  3 Aug 2020 16:01:25 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e8so21007526pgc.5;
        Mon, 03 Aug 2020 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U7xiOKnF5k9oqaGDQtytgIU1Bk6rutKSQp8jZmHwNQg=;
        b=NJ/Vah5oFAXMdxGjQfGtDZXVctjmbmqQjP1Dls4q3txj6UUYGvZc0d6tXc4BgsFVZk
         fcS5Xp11H2UvtfyKHl0msaJhuCOD0Ly7h6453x9X5/v0BEYtY2v8ZghT4uHU7MxdFZW4
         o8Y106lgQF3O9gHRSbKe/c3QEwstOAa7O5E9iAuUm55wQw8WJaZEBPRwNI1eF+gooqhV
         0OGVj7m+siFojAZW0FDGq9LdrPUpi9Y3w1iPH73wqATJ4fxi8NgnJSDxhDEA9Li/bGrj
         audsvrFWQPHpAXBXgkZ+9OU0dd8w5XRfksI4jmNn1zOmHoDJ9fKymKiwITeoK7egUvRF
         Dzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U7xiOKnF5k9oqaGDQtytgIU1Bk6rutKSQp8jZmHwNQg=;
        b=plr9Vwx2H5HvbY41E9ae83rs79VhZ/dDwK6L3XWxoA0u8i9/KRGBC1uliNxIOCskDi
         i8ifnI/YQdsYgaokBY/qecsbK7E0e4upzAf818EU6h+ttqZhXGtRGRUQNps9oQVM/lZD
         zScOfcjVRz6sQTNqBSGzuCen+nYZKuc9PbrPBSj4g9pjHBLJZzPjE/URzgeRUTEBika1
         KMe3NbqKIYDGELNle/yTQj/KzsxfyV0VQtt2c1GGPqQP+raIad67HKnGyPZiNKkEg8mS
         8umCv1UpadED113CNaxZniAOfjJc+YMkSIM02LheBn9kit5/7zWYp6Akk0WuNjU+aAEQ
         Cg1g==
X-Gm-Message-State: AOAM532EHWVxnAS0KDx4q+/pe1aAFr/h1qbFvbhXiQXyfCo9fJ1Rpzdd
        Ob/Ul//gAPrOKggWidrGXiw=
X-Google-Smtp-Source: ABdhPJzwwOjM0lONrtRAMUe5g5xvjho9AMf3gJldLUkDQbeRGRx/akjn5cgtQ13iFfpMITqJZG5p8Q==
X-Received: by 2002:aa7:97a3:: with SMTP id d3mr17719806pfq.178.1596495684606;
        Mon, 03 Aug 2020 16:01:24 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id w187sm12000763pfd.87.2020.08.03.16.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 16:01:23 -0700 (PDT)
Date:   Tue, 4 Aug 2020 07:01:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200803230118.GA3650@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol>
 <CAMpxmJWaEVwjXSFHTYmwdfA+88upVkJ4ePSQf_ziSOa1YdOUKQ@mail.gmail.com>
 <20200802033158.GA13174@sol>
 <CAMpxmJWZpMFbrMBkLiR9q7chdamVnjw0geDf-pgKrz=AWD8mNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWZpMFbrMBkLiR9q7chdamVnjw0geDf-pgKrz=AWD8mNg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 03, 2020 at 10:02:50PM +0200, Bartosz Golaszewski wrote:
> On Sun, Aug 2, 2020 at 5:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jul 31, 2020 at 06:05:10PM +0200, Bartosz Golaszewski wrote:
> > > On Sun, Jul 26, 2020 at 3:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> [snip!]
> 
> > > > >
> > > > > > +static u64 gpioline_config_flags(struct gpioline_config *lc, int line_idx)
> > > > > > +{
> > > > > > +       int i;
> > > > > > +
> > > > > > +       for (i = lc->num_attrs - 1; i >= 0; i--) {
> > > > >
> > > > > Much better to read is
> > > > >
> > > > > unsigned int i = lc->num_attrs;
> > > > >
> > > > > while (i--) {
> > > > >  ...
> > > > > }
> > > > >
> > > >
> > > > Really? I find that the post-decrement in the while makes determining the
> > > > bounds of the loop more confusing.
> > > >
> > >
> > > Agreed, Andy: this is too much nit-picking. :)
> > >
> >
> > I was actually hoping for some feedback on the direction of that loop,
> > as it relates to the handling of multiple instances of the same
> > attribute associated with a given line.
> >
> > The reverse loop here implements a last in wins policy, but I'm now
> > thinking the kernel should be encouraging userspace to only associate a
> > given attribute with a line once, and that a first in wins would help do
> > that - as additional associations would be ignored.
> >
> > Alternatively, the kernel should enforce that an attribute can only be
> > associated once, but that would require adding more request validation.
> >
> 
> I guess this would result in a lot of churn to do validation which is
> largely unnecessary? To me the first in wins sounds more consistent.
> 

Fully validating the attrs would involve a lot of tedious looping, which
would be pointless 99.99% of the time, so I was hoping to avoid it.
OTOH we're interacting with hardware so I don't want to be doing
anything that userspace hasn't explicitly requested.

But I would be satisfied with clearly documenting the behaviour - and
in most cases libgpiod will be taking care of it anyway...

> Also: I just started going through the patches - nice idea with the
> GPIO attributes, I really like it. Although I need to give it a longer
> thought tomorrow - I'm wondering if we can maybe unify them and the
> flags.
> 

I had an earlier draft that did just that - and that is partially why
the loop is last in wins - I was using slot 0 as the default flags.
But the default flags cover a lot of use cases, including all of v1, and
it was simple and cheap to provide a default - and it simplified the
initial port of libgpiod to v2...

Cheers,
Kent.

