Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86264FBA16
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 12:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244472AbiDKKwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 06:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239480AbiDKKwQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 06:52:16 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFF3275F8
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 03:50:02 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g20so17818187edw.6
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8qVaxxM4VrfYFiYGh5sXPnkTylpFC03GWqDVpTOp9ow=;
        b=49GQojuqsWxcfIA5Xf3XtxJAUH1r1tazCvpUpO9/sdgWINT6royZHGd65u9VXkoD3s
         udpKd1GEx3EACKa3JrXAMz8AACnjmU5YkYTHMEbzJ47/mpXdSJFZMVtC/59H3y4Xzhs3
         o2P+3b05a/BZ3MGsKQLCMDmSARHER/1mGaWho1xsnDB3HlZXNIXK6gsplLcKnh/Io/us
         cGlfA6OLtucM4eBdXuoPQ8M9SpvZrbxAEVHxaPLNYYNeZ181u5SGkneXq+nZYP5+kHaZ
         WrXio/g+i0mqY2T/Fwet0f5QEWyUOoDg76PnPlPHim7GkO9/wvWBbR0eW8Q9m91X2m6t
         EKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qVaxxM4VrfYFiYGh5sXPnkTylpFC03GWqDVpTOp9ow=;
        b=0Bq+FWVg8pBrq3ppMhf67gnQ6RAkc0zbkaWtmU+38EMsmDWMu7k9ONt6w0a3tjOZd+
         5B5RvuzeQy+0AW4R2xJIm6X10kQZjFAO5lU6Zd88w1zx0LrCV6LhEA3pq5rarMuhWKND
         0rxncMS+6tsF69LL0yIrqt6E9FxlzK5N0sZKVVXvtaDLmGwA8JHipUwYRvWi2+g/9aBg
         GelmDogYCJrnMhs412fIkg/t5ZbnDqVMBOn342TacneKNkvmOh6UXUR4Fr/LYxDvS6nN
         RBV3mJzNQPRS+AcaWOa9AsV9EwERfJ2OzGCQO1UxgpLD3pStvtRmlOJ017fXoLxZ7CJQ
         ejPA==
X-Gm-Message-State: AOAM5307B4GHKHFxk8zyYnGeWdlAxraNjLRmSjWalmNeSDmODiOYA4Yd
        T8p9C7V8evOTvy4i4OQEGHvTGCgiXOqCJ+gDJUsD1w==
X-Google-Smtp-Source: ABdhPJzRC2Gw4YRScgWVWughlCBY3EG0KU6yr8i3BZYa6C/5LdP/ggZvfogD0qhcwbrb0BTuUOgGrr7++AvsSNvF5nk=
X-Received: by 2002:a05:6402:22b5:b0:41d:7637:98b8 with SMTP id
 cx21-20020a05640222b500b0041d763798b8mr7522869edb.69.1649674200709; Mon, 11
 Apr 2022 03:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220409205134.13070-1-brgl@bgdev.pl> <CAHk-=wgQbb0cvOnX1W5_Ho_SvpYqS4GuEo=gxhbw-UCjOaEpQg@mail.gmail.com>
In-Reply-To: <CAHk-=wgQbb0cvOnX1W5_Ho_SvpYqS4GuEo=gxhbw-UCjOaEpQg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Apr 2022 12:49:50 +0200
Message-ID: <CAMRc=McoUsyrpFsF6UooiTCcLeEwiKAs9aDy3z1OnqnA3peqWg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.18-rc2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 10, 2022 at 6:27 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Apr 9, 2022 at 10:51 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > Here's a single fix for a race condition between the GPIO core and consumers of
> > GPIO IRQ chips.
>
> I've pulled this, but it's horribly broken.
>
> You can't just use a compiler barrier to make sure the compiler orders
> the data at initialization time.
>
> That doesn't take care of CPU re-ordering, but it also doesn't take
> care of re-ordering reads on the other side of the equation.
>
> Every write barrier needs to pair with a read barrier.
>
> And "barrier()" is only a barrier on that CPU, since it is only a
> barrier for code generation, not for data.
>
> There are multiple ways to do proper hand-off of data, but the best
> one is likely
>
>  - on the initialization side, do
>
>         .. initialize all the data, then do ..
>         smp_store_release(&initialized, 1);
>
>  - on the reading side, do
>
>         if (!smp_load_acquire(&initialized))
>                  return -EAGAIN;
>
>         .. you can now rely on all the data having been initialized ..
>
> But honestly, the fact that you got this race condition so wrong makes
> me suggest you use proper locks. Because the above gives you proper
> ordering between the two sequences, but the sequences in question
> still have to have a *lot* of guarantees about the accesses actually
> then being valid in a lock-free environment (the only obviously safe
> situation is a "initialize things once, everything afterwards is only
> a read" - otherwise y ou need to make sure all the *updates* are
> safely done too).
>
> With locking, all these issues go away. The lock will take care of
> ordering, but also data consistency at updates.
>
> Without locking, you need to do the above kinds of careful things for
> _all_ the accesses that can race, not just that "initialized" flag.
>
>                  Linus

Cc'ing Shreeya

Thanks, we'll see about a follow-up with a better solution.

Bart
