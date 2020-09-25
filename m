Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FDD27845D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgIYJuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgIYJuI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 05:50:08 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58835C0613CE;
        Fri, 25 Sep 2020 02:50:08 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d6so2641210pfn.9;
        Fri, 25 Sep 2020 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZZgw+N+0uZC3jHwut6sPtyPqViOL0NE3WEuYPgaX/8=;
        b=pawLkd/lBuMBWO3j1Yl5tYxIkULtDrTFQkC07XwKu9z8vQPVF8b8XteMJjhkSeuFc6
         PM4YCufiyZgrztbY4IUWt/3wpqwPNlZicqsz8cZh7VdFd75dHccBombrygrmC7PbLCyH
         VKsh892nzf0JTfwX4yC+IT4GOn2v9QrIM9hajuNpvKRjzAfv2wUEfXlWrD/J7SYGcWf2
         a3a/vF4WUNmJxCTsraBZHVjO+U+A71aL8FyCzbjz5Yd1diZ8dRshpgPQ1PtTG0gfmm6f
         3+B69A99/Kh2wV+n4k6XfIVkkhpefTUgGWXAorX9LOAuM53QA4DvzWkbSI3HjNI5eKvh
         jQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZZgw+N+0uZC3jHwut6sPtyPqViOL0NE3WEuYPgaX/8=;
        b=LxkSEEwQXMyyTesIkM3nBiRXEeD02cWCMwHLYbGeXf0B1qpFzfNpzbawneEkvmSqQt
         53+avwSbF6DfWtxud2Fby+4EsQNN6jnnhs2iCXvVwbhvZGMgTGgEqhyvRsY3Fc7PLW3o
         OZSaB87HMJ1e9W5CEXJJGaDdWbD3ZlZlRoq8HuPO5WJHuD9xzuKqVFNYnTLNYcG6SoVk
         rqEkLdJ760UThtVCmgnVmaSLLi9m8wLU6mTu9yoDHa1TbsjxH/N6cWdqmVpEe4Dmukvu
         LF1mocloHT7iebGtwXaSsWfctT8dWw2IHqEXIQWPCxG4P4/i/WVZ9/+y0gPI4RDB0/i8
         9PCA==
X-Gm-Message-State: AOAM531G+UWfVoHa0zyhNou8WFdAjtXmyFCSPSa06mlokbDDWW9n4BRJ
        8pBYb59zTS2TB6wG5ME7DMwJwG8YtgCP2Oi2Wdw=
X-Google-Smtp-Source: ABdhPJya6yifLcctrFVoCT1VRlSUaWfGGb4t9hw7J/ZoL/zdhKGAgFnHt+W/eNXttgV38F0QwHTCVs/+tAwJ2tIejiI=
X-Received: by 2002:a17:902:d708:b029:d2:635f:6692 with SMTP id
 w8-20020a170902d708b02900d2635f6692mr2900886ply.17.1601027407841; Fri, 25 Sep
 2020 02:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-11-warthog618@gmail.com>
 <CAHp75VdaPR+iihenPYos1mAGLbDhJPvCfDTtURpk_MBa=3wYEg@mail.gmail.com>
 <CAHp75Vcktxp1C6NTOrW-WEnfueOu0UvtquFLpsL5+vv6Fdaajw@mail.gmail.com>
 <20200924032414.GC11575@sol> <CAHp75Vd1=CpsMecw=dua66i-P992e71uQcOzWR7tvd6ZGyKWoA@mail.gmail.com>
 <20200924092622.GB20188@sol>
In-Reply-To: <20200924092622.GB20188@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 12:49:49 +0300
Message-ID: <CAHp75Vd8PjODZkAjDrpqdeGT8-j7zbnBB_HALAWvQ2xoH24nzQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
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

On Thu, Sep 24, 2020 at 12:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Thu, Sep 24, 2020 at 11:26:49AM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 24, 2020 at 6:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Wed, Sep 23, 2020 at 07:15:46PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Sep 23, 2020 at 7:14 PM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> > > > > > +               polarity_change =
> > > > > > +                       (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
> > > > > > +                        ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));
> > > > >
> > > > > Comparison
> > > >
> > > > Comparison between int / long (not all archs are agreed on this) and
> > > > boolean is not the best we can do.
> > > >
> > >
> > > There is no bool to int comparision here.
> >
> > test_bit() returns int or long depending on arch... Then you compare
> > it to bool (which is a product of != 0).

> Really - I thought it returned bool.
> It is a test - why would it return int or long?

I assume due to arch relation. Some archs may convert test_bit() to a
single assembly instruction that returns a register which definitely
fits long or int depending on case.

> Surely it is guaranteed to return 0 or 1?

Not sure about this, it's all in arch/* and needs to be investigated.
Would be nice to have it cleaned up if there is any inconsistency (and
document if not yet). But It's out of scope of this series I believe.

> > > There are two comparisons - the inner int vs int => bool and the
> > > outer bool vs bool.  The "!= 0" is effectively an implicit cast to
> > > bool, as is your new_polarity initialisation below.
> > >
> > > > What about
> > > >
> > > >   bool old_polarity = test_bit(FLAG_ACTIVE_LOW, &desc->flags);
> > > >   bool new_polarity = flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW;
> > > >
> > > >   old_polarity ^ new_polarity
> > >
> > > So using bitwise operators on bools is ok??
> >
> > XOR is special. There were never bitwise/boolean XORs.
> >
>
> We must live in different universes, cos there has been a bitwise XOR in
> mine since K&R.  The logical XOR is '!='.

Oops, you are right, It was never boolean XOR because it's the same as
a simple comparison.

...

> > > > and move this under INPUT conditional?
> > >
> > > It has to be before the gpio_v2_line_config_flags_to_desc_flags() call,
> > > as that modifies the desc flags, including the new polarity, so
> > > polarity_change would then always be false :-).
> >
> > I really don't see in the code how polarity_change value is used in
> > FLAG_OUTPUT branch below.
>
> It isn't.  But desc->flags is modified before both - and so the
> polarity_change initialization has to go before both SINCE IT TESTS
> THE FLAGS.

I see now. Sorry for being too blind.

-- 
With Best Regards,
Andy Shevchenko
