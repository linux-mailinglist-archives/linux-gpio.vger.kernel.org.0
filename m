Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BC62354FA
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Aug 2020 05:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgHBDcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Aug 2020 23:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgHBDcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Aug 2020 23:32:06 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9972CC06174A;
        Sat,  1 Aug 2020 20:32:06 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z188so8576201pfc.6;
        Sat, 01 Aug 2020 20:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NQA5xpV9Vfl3BUSLXPw3JQiC/8GdjqPpOyhk9KwqJ1Q=;
        b=RzjfWU1SmtGiTRUrJ/qYDXji1/9h2sZQKC2J5y1qoyZZ7FVCT7NXQxDeQardydSAQy
         3AlSMbfdWIZ3JqyYHPzxUFdsMfB3rf9+uBF9H+iJWNSpGyMkX/WV+Bu7XZF07FuujW0/
         F+mSrE0SyaERcjG3EiKOUjxSd++ZUiD+amlJ2tQqdG/K1reXsz6ozKGXIE+0EDZdCYuz
         pyyFLislYFDqRfmllKPpjW4QCSsqLF+jjJStDB1aoTPFgQk9msgwwfdAlrWqta4vTi8W
         MInIyNQ1z5lZYaGVj+Nm1Gl6+fKj3QR625LR/JWnTXT1m+eCrvy9SMeeXCxdrv+oicXV
         muvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NQA5xpV9Vfl3BUSLXPw3JQiC/8GdjqPpOyhk9KwqJ1Q=;
        b=lEIMxKBZxw4uRyIch0+xcLcQEnJP6I3k+YpIaSRPlZ9a77axDAYZ6Apf1zn8rQirNU
         TH03jKX1WgG0P1ENbTciFNBYw+k25S8Ms5vabxXhTpqYiBIhGfEKSbzEhabwX/kTF6Ih
         3owmYpBQPDeeuQJe7Z7QFxlKb/fHQKmNORHv06sMHfCXSHnJDP8cINn9pblC6rZWZ4WO
         Rgf9uMnNd2jK7mHyiUCyvrRgE/8ghnxvOIfaaFpt0BAkSQCiZQfV0JTPrfQ8ejW1vYz4
         wUKNagTswoJo3fcRrgj5tmkNcWVc4rKQVRRNGqy+9hBLPeQtDcN6chDGp7FbZ3b5fuva
         JTxA==
X-Gm-Message-State: AOAM532le9ri7Qv7OmDRpUsfomd7yRdBPc5y8rQLMFpAknssjvwyTjxt
        TxDQ28yywXXymhfi0OTwLa4=
X-Google-Smtp-Source: ABdhPJwGr3Aw7529dBCQdHayEQ97tQrT/TiNVZc16m1LcA0UmEvbwc45EEwUm0S4Ope1OJsmfF36YA==
X-Received: by 2002:aa7:9ace:: with SMTP id x14mr273559pfp.216.1596339125659;
        Sat, 01 Aug 2020 20:32:05 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id b24sm14800189pgn.8.2020.08.01.20.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 20:32:04 -0700 (PDT)
Date:   Sun, 2 Aug 2020 11:31:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/18] gpiolib: cdev: support GPIO_GET_LINE_IOCTL and
 GPIOLINE_GET_VALUES_IOCTL
Message-ID: <20200802033158.GA13174@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-6-warthog618@gmail.com>
 <CAHp75VcKtATPDKGAViWqjOJDqukDrgZ13aTU6rTJ1jEeB3vmVw@mail.gmail.com>
 <20200726011244.GA6587@sol>
 <CAMpxmJWaEVwjXSFHTYmwdfA+88upVkJ4ePSQf_ziSOa1YdOUKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWaEVwjXSFHTYmwdfA+88upVkJ4ePSQf_ziSOa1YdOUKQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 31, 2020 at 06:05:10PM +0200, Bartosz Golaszewski wrote:
> On Sun, Jul 26, 2020 at 3:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> > >
> > > > +static bool padding_not_zeroed(__u32 *padding, int pad_size)
> > > > +{
> > > > +       int i, sum = 0;
> > > > +
> > > > +       for (i = 0; i < pad_size; i++)
> > > > +               sum |= padding[i];
> > > > +
> > > > +       return sum;
> > > > +}
> > >
> > > Reimplementation of memchr_inv() ?
> > >
> >
> > I was hoping to find an existing function, surely checking a region is
> > zeroed is a common thing, right?, so this was a place holder as much
> > as anything.  Not sure memchr_inv fits the bill, but I'll give it a
> > try...
> >
> 
> If you don't find an appropriate function: please put your new
> implementation in lib/ so that others may reuse it.
> 

Changed to memchr_inv.

> > > ...
> > >
> > > > +static u64 gpioline_config_flags(struct gpioline_config *lc, int line_idx)
> > > > +{
> > > > +       int i;
> > > > +
> > > > +       for (i = lc->num_attrs - 1; i >= 0; i--) {
> > >
> > > Much better to read is
> > >
> > > unsigned int i = lc->num_attrs;
> > >
> > > while (i--) {
> > >  ...
> > > }
> > >
> >
> > Really? I find that the post-decrement in the while makes determining the
> > bounds of the loop more confusing.
> >
> 
> Agreed, Andy: this is too much nit-picking. :)
> 

I was actually hoping for some feedback on the direction of that loop,
as it relates to the handling of multiple instances of the same
attribute associated with a given line.

The reverse loop here implements a last in wins policy, but I'm now
thinking the kernel should be encouraging userspace to only associate a
given attribute with a line once, and that a first in wins would help do
that - as additional associations would be ignored.

Alternatively, the kernel should enforce that an attribute can only be
associated once, but that would require adding more request validation.

> [snip]
> 
> > > ...
> > >
> > > > +               struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
> > >
> > > I prefer to see this split, but it's minor.
> > >
> > > > +               if (IS_ERR(desc)) {
> > > > +                       ret = PTR_ERR(desc);
> > > > +                       goto out_free_line;
> > > > +               }
> > >
> > > ...
> > >
> > > > +               dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> > > > +                       offset);
> > >
> > > Perhaps tracepoint / event?
> > >
> >
> > Again, a cut-and-paste from V1, and I have no experience with
> > tracepoints or events, so I have no opinion on that.
> >
> > So, yeah - perhaps?
> >
> 
> I think it's a good idea to add some proper instrumentation this time
> other than much less reliable logs. Can you take a look at
> include/trace/events/gpio.h? Adding new GPIO trace events should be
> pretty straightforward by copy-pasti... drawing inspiration from
> existing ones.
> 

You only want tracepoints to replace those dev_dbg()s, so when a line
is requested? What about the release?  Any other points?

Cheers,
Kent.
