Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF19276D41
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 11:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgIXJ0d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 05:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbgIXJ03 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 05:26:29 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0045CC0613CE;
        Thu, 24 Sep 2020 02:26:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f2so1553633pgd.3;
        Thu, 24 Sep 2020 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iWU3zIvwO08AFxP76LNIjlZpqXWxIPusRl5qwBLz4uA=;
        b=j27E7SbymGOCewdPhssZnR8noviCNZM2Qpq82u5n4tWOK/Pgf1RO7YVz/0+nZNOjvG
         kQ/Dd4vOr63NZvAgVHd5RS2SanI2l8z2JB0wGXOvOAZBJUxMZYfyteVzxKYcIGCbJLWs
         IdJzUqIo9fZGqt3lObaieFp9VvAhnKQfSQFax3OWi/+IjJSYLuVRmzi/bnWZcR9m2SV5
         m/bVXTfsAqy3x+EirHceXL7n9E+U72APgUTYqFVq9XkO7780rvh9Y6Dm7/bX6nTM6m8R
         SDzMOYRMUCHv5SYPxl3eG5c16oS/ELyQQ0K+Cu1TH0H1Ch8zoozcOl/sIjIaCr1Td3vV
         GWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iWU3zIvwO08AFxP76LNIjlZpqXWxIPusRl5qwBLz4uA=;
        b=MBi/523Avbr59hZ1xapt/V/wAY1OPVttWXUFXHtFnnrt21FaPkgmKVm2VY4iLRoJmF
         dD4t1Y8H9IY5JMvStIj9Ey/BYyEFYdVDSWgInvuf9GrHpIlqH0aumRLakRxK29KFCsTX
         UPBvStkIkV3/avMcHY4yxJRKRKhYeBj19TsN4D7tfOy3dgKEjEd6hGKmwYMfCJEL5qeL
         MvRTiCobRxsk7Luz9ALc5G3u7jblde8X/harf5LiFhoqEcVz0No1r08R53LQETmigZrg
         ud6E6KeeCO0gpfARWmE0vUhum/x7RqrRQ01MOAmsk8xFWutVGoVQXbj9vrMFreb31NXz
         3zDw==
X-Gm-Message-State: AOAM531+cnzJ/qAjnBQmUNs26ClzEEHOoVEm/DANbcF/7MwcJ/hCnijt
        /rhSIup1pnqxl3UGhj1Nj5g=
X-Google-Smtp-Source: ABdhPJwkKiJIbaS7X2xDqi2WG4LKaOxInCZfJgMjCkdtje7/IsKXB4hQ7rmsTw810qVgiQfakZaiqA==
X-Received: by 2002:a63:104d:: with SMTP id 13mr3155912pgq.445.1600939588409;
        Thu, 24 Sep 2020 02:26:28 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id r4sm1820846pjf.4.2020.09.24.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 02:26:27 -0700 (PDT)
Date:   Thu, 24 Sep 2020 17:26:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 10/20] gpiolib: cdev: support
 GPIO_V2_LINE_SET_CONFIG_IOCTL
Message-ID: <20200924092622.GB20188@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-11-warthog618@gmail.com>
 <CAHp75VdaPR+iihenPYos1mAGLbDhJPvCfDTtURpk_MBa=3wYEg@mail.gmail.com>
 <CAHp75Vcktxp1C6NTOrW-WEnfueOu0UvtquFLpsL5+vv6Fdaajw@mail.gmail.com>
 <20200924032414.GC11575@sol>
 <CAHp75Vd1=CpsMecw=dua66i-P992e71uQcOzWR7tvd6ZGyKWoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd1=CpsMecw=dua66i-P992e71uQcOzWR7tvd6ZGyKWoA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 11:26:49AM +0300, Andy Shevchenko wrote:
> On Thu, Sep 24, 2020 at 6:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Wed, Sep 23, 2020 at 07:15:46PM +0300, Andy Shevchenko wrote:
> > > On Wed, Sep 23, 2020 at 7:14 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > Add support for GPIO_V2_LINE_SET_CONFIG_IOCTL, the uAPI v2
> > > > > line set config ioctl.
> > >
> > > > > +static long linereq_set_config_unlocked(struct linereq *lr,
> > > > > +                                       struct gpio_v2_line_config *lc)
> > > > > +{
> > > > > +       struct gpio_desc *desc;
> > > > > +       unsigned int i;
> > > > > +       u64 flags;
> > > > > +       bool polarity_change;
> > > > > +       int ret;
> > > > > +
> > > > > +       for (i = 0; i < lr->num_lines; i++) {
> > > > > +               desc = lr->lines[i].desc;
> > > > > +               flags = gpio_v2_line_config_flags(lc, i);
> > > >
> > > > > +               polarity_change =
> > > > > +                       (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
> > > > > +                        ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));
> > > >
> > > > Comparison
> > >
> > > Comparison between int / long (not all archs are agreed on this) and
> > > boolean is not the best we can do.
> > >
> >
> > There is no bool to int comparision here.
> 
> test_bit() returns int or long depending on arch... Then you compare
> it to bool (which is a product of != 0).
> 

Really - I thought it returned bool.
It is a test - why would it return int or long?
Surely it is guaranteed to return 0 or 1?

> > There are two comparisons - the inner int vs int => bool and the
> > outer bool vs bool.  The "!= 0" is effectively an implicit cast to
> > bool, as is your new_polarity initialisation below.
> >
> > > What about
> > >
> > >   bool old_polarity = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
> > >   bool new_polarity = flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW;
> > >
> > >   old_polarity ^ new_polarity
> >
> > So using bitwise operators on bools is ok??
> 
> XOR is special. There were never bitwise/boolean XORs.
> 

We must live in different universes, cos there has been a bitwise XOR in
mine since K&R.  The logical XOR is '!='.

> > > and move this under INPUT conditional?
> > >
> >
> > It has to be before the gpio_v2_line_config_flags_to_desc_flags() call,
> > as that modifies the desc flags, including the new polarity, so
> > polarity_change would then always be false :-).
> 
> I really don't see in the code how polarity_change value is used in
> FLAG_OUTPUT branch below.
> 

It isn't.  But desc->flags is modified before both - and so the
polarity_change initialization has to go before both SINCE IT TESTS
THE FLAGS.

Cheers,
Kent.
