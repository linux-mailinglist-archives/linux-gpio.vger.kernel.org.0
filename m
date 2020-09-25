Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DF6278B1C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 16:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgIYOoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 10:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbgIYOoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 10:44:00 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EFCC0613CE;
        Fri, 25 Sep 2020 07:43:59 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id n14so3397351pff.6;
        Fri, 25 Sep 2020 07:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZllkwvXZoFRp2RcT75jfTy3zRZQ8UkSxSKDB72ARDzY=;
        b=bnSgaGdaNBPIJqo8u16PTy1fci9aJ+OfN26NPlXSQsQ0tTyu2TPdNO3co2T7gDdnMX
         /EmgMT2oLbhTrMSMxUPeuXOufQCNHWPzSoboL/5egkX7mN9m3m/Lv2/5IuyGtSFk+Iwn
         DFP+7Z8pnf1lWkMG98AiARBFPGW7AwbXwtQn/F0BboDbARR/afcsCqzVC4qKMeWqNQNn
         ExalgK+N8GitoAHVzXO6V5qsNlBHBVXv2PhjsMMt8SmitEA2/73kNW09AkEA2ExJm0ws
         LDf+asYQWjVzXg6gSPR07cFHKOzBeBA1N82rgwmEOb2rk/5w1CFLX1mS5/fatesq6axo
         4ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZllkwvXZoFRp2RcT75jfTy3zRZQ8UkSxSKDB72ARDzY=;
        b=aF8nBj2ZzI81wcgWJawxVn5sf2Iq0WFiQUt0bqcn1pr39iY+ySYxy4gChZmy17Tdf6
         KJzQHHtaS3yemnr2sgOQbdpXlBgI5suAooKcO65vPQ82vSZwLVa8/lxS4TjtfKNXxftx
         LzlohnMqYdfQGJDMzWqAV3V+RUOOugHqMBLsACyOvXWNI+rLFcaNZwC8HvuJHFCBsqgC
         Z+DlXjgfbUHt6TQVY8qJMKXPsSzu1KvCoIbRCtzil6/iBUGE6D+n0oQKXqC+gJyZBhrB
         +MYBgc+NYV9Ys9XBXLo7KL96VO/R/QKE/h0gV2pbDZ2nqC3XnVspGQfusxukUh4rXRsZ
         +ZOw==
X-Gm-Message-State: AOAM532fosp7YulzptQFNNrIcbVdNLHw1aMSyTM/YAjJ9M06hNaGp+cN
        J12+nETm3/dvy8bGquej1zelDGgwn4CNDcffZWP0yaf94z0Tzw==
X-Google-Smtp-Source: ABdhPJy1gTPAmYQNBlk930ss692jYoCYdpCVAimcfkGZaiqyInDGQ5WNXp3IgFifVOgT87l3n0Ml8CsagPQ3AlTOvsM=
X-Received: by 2002:a17:902:d708:b029:d2:635f:6692 with SMTP id
 w8-20020a170902d708b02900d2635f6692mr4086156ply.17.1601045039428; Fri, 25 Sep
 2020 07:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-9-warthog618@gmail.com>
 <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
 <20200924023914.GA11575@sol> <CAHp75VfoOCJDmpDJ6wTEKTDUO1zFRZ6MRSN7dy3cAdepv0s2rQ@mail.gmail.com>
 <20200924094813.GC20188@sol> <CAHp75VcmJyNdK8hOKneT3T=t8QyRcU+X+UwfmKCL5SJsniev9g@mail.gmail.com>
 <20200925115601.GA216973@sol>
In-Reply-To: <20200925115601.GA216973@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 17:43:41 +0300
Message-ID: <CAHp75VdM-H4Q5sBkx5dV5kFmUNYAs9mUmvRN=yn0KyKcHkt1yQ@mail.gmail.com>
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

On Fri, Sep 25, 2020 at 2:56 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Sep 25, 2020 at 01:12:14PM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 24, 2020 at 12:48 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Thu, Sep 24, 2020 at 11:39:03AM +0300, Andy Shevchenko wrote:
> > > > On Thu, Sep 24, 2020 at 5:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > On Wed, Sep 23, 2020 at 06:41:45PM +0300, Andy Shevchenko wrote:
> > > > > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
>
> [snip]
> > >
> > > Lets say CPU0 is setting 1 and CPU1 setting 2, and assuming the xchg()
> > > completes...
> > > Your case is not possible - CPU1 would see the value 1 set by CPU0 in the
> > > read() and so NOK.  Its xchg() would fail as it compares against 0
> > > and that also sees the 1 and so fails.
> > >
> > > What am I missing?
> >
> > Barriers? That's what documentation says about xchg().
> > https://stackoverflow.com/q/20950603/2511795
> >
>
> Firstly, the answer in Stackoverflow is from someone who explicitly
> acknowledges not being a kernel developer, so they aren't sure.
>
> Secondly, the latest version of the kernel doc [1] says differently than what
> is quoted on Stackoverlow - it indicates implementations of atomic_cmpxchg()
> must provide its own memory barriers.
>
> The relevant section says "This performs an atomic compare exchange operation
> on the atomic value v, with the given old and new values. Like all atomic_xxx
> operations, atomic_cmpxchg will only satisfy its atomicity semantics as long
> as all other accesses of *v are performed through atomic_xxx operations.
>
> atomic_cmpxchg must provide explicit memory barriers around the operation,
> although if the comparison fails then no memory ordering guarantees are required."
>
> Note that this doc is aimed at atomic_cmpxchg() implementors, so I took
> that to mean the operation itself must provide the barriers - not
> the caller.  Also, the sentence only makes sense wrt the
> atomic_cmpxchg() implementation - the caller can't decide on memory barriers
> if the comparison fails or not.
>
> The memory-barriers.txt they quote is also dated - the atomic section they quote
> is moved to atomic_t.txt[2]?
> That says that cmpxchg is a RMW op, and that it will perform an
> ACQUIRE and RELEASE - for the non-failure case anyway.
>
> Again, I took that to mean it will provide the barriers itself.
>
> And even the old text they quote says those operations IMPLY a memory barrier,
> "Any atomic operation that modifies some state in memory and returns
> information about the state (old or new) implies an SMP-conditional
> general memory barrier (smp_mb()) on each side of the actual operation"
> and that "the implicit memory barrier effects are necessary".
>
> Again that indicates the barrier is a part of the op, as it is implicit,
> and not necessary to be added separately.

Okay!
Thanks for digging into it.

> > > > > The atomic_cmpxchg() ensures cdata->watch_abi_version is only set
> > > > > once - first in wins.  The atomic_read() is so we can check that
> > > > > the set version matches what the caller wants.
> > > > > Note that multiple callers may request the same version - and all
> > > > > should succeed.
> > > >
> > > > So, that's basically what you need when using _old_ value.
> > > >
> > > > 0 means you were first, right?
> > > > Anything else you simply compare and bail out if it's not the same as
> > > > what has been asked.
> > > >
> > >
> > > Could you provide a complete implementation that behaves as I expect,
> > > rather than snippets and verbage?
> >
> > if (atomic_cmpxchg(&cdata..., version) == 0)
> >  return 0; // we were first!
> > return -EPERM; // somebody has changed the version before us!
> >
>
> Which can fail if two callers are requesting the same version - in a
> race the second one will get a fail - independent of the version they
> are requesting.
>
> I keep flip-flopping and twiddling with the implementation of this -
> my current one is:
>
> /*
>  * returns 0 if the versions match, else the previously selected ABI version
>  */
> static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
>                                        unsigned int version)
> {
>         int abiv = atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
>
>         if (abiv == version)
>                 return 0;
>
>         return abiv;
> }
>
>
> Does that work for you? (assuming no explicit barriers are necessary)

Perfectly!

> [1] https://www.kernel.org/doc/html/v5.8/core-api/atomic_ops.html
> [2] https://www.kernel.org/doc/Documentation/atomic_t.txt

-- 
With Best Regards,
Andy Shevchenko
