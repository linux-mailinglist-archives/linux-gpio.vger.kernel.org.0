Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D2F22D772
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 14:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgGYMNI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 08:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbgGYMNH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 08:13:07 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C75DC0619D3;
        Sat, 25 Jul 2020 05:13:07 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i92so150541pje.0;
        Sat, 25 Jul 2020 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wKglJ+2TyownWFT7HaOkqv+Bov35ZyDaq5YL9iEnTis=;
        b=jsQmAZ/duW2oD3KGtdNP0fMYml9rL25F5uwC1KkGHly9HTVeuYmP6IEYLaZ6in4z4A
         bTNLc4GW8veWQqjdwEyOn7Q6Y/PW8/klLK/EnOQpxFjv0d5TKuvbi/c0z1gWT+bPLHTa
         KOAuwvxUVVM9BfafN3UOoMjZmMwfhX2QdHdOYLkMuWHsvL8pRoWUMP9xEIl80wnsZCHj
         lAfT1QotNTvLvu6n67op5eaWTnhPB40TxM114Cw8zhh8kypuqkki2VSUgLMu/lzNfQtl
         RySoGMqCAx9+tlp+rOJ4mPnyk8GiYgBbbkNxU5DIla1W/k66QGyDwUhIhmTclmMzdmJe
         5Maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wKglJ+2TyownWFT7HaOkqv+Bov35ZyDaq5YL9iEnTis=;
        b=D7aZ/DMHCLqNjNtVke1Qio0VYI5Sj3pID2LWb8iNUdvsLZafGqxlr3GjRs0Kf3+CVn
         MtroQtPNKRw0T9CzhXbcSQHEWbX4OOuKG4siZ8mEYtLQjDxk5U9sXmWBru6+/Ru9r9ng
         3dEWmaCzL0pQlDSqCWvH1RJ6fVb/PFh8kZuklpAu8D4r1pzwVMVJmU2r+5ClwlMLtVSV
         D6vVjbYo5h658My/HDcnZjFzw+RCFo5d+Wl6obaHocK/5Jbjs19nQ2b4FMGYWQEQnUpY
         AizsfkGTXR/CTKtl6O+xP/2Zi6swqrPXbjE69kJJuzDCUEz679qhrsligBT6kJh6/g+D
         7FWg==
X-Gm-Message-State: AOAM533328C07sNgZu/O1a0wip7pSC0tneemF5zsvpZ41+1OKXVakeFz
        61i7x5nQTQBWPfZLYdL/53BwvD56j/VYpkaQThk=
X-Google-Smtp-Source: ABdhPJzOyFwDJ5zRO7UIQcCHcVLZzVWXAj1HxOZVvFxu7i/jdBlMIQ6KBeSTBPgfbSbR+ZA+fCydKe0NCjSQRC7bgpA=
X-Received: by 2002:a17:90a:498b:: with SMTP id d11mr10299786pjh.129.1595679186006;
 Sat, 25 Jul 2020 05:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com> <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
In-Reply-To: <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 25 Jul 2020 15:12:49 +0300
Message-ID: <CAHp75Vdeg6v_yLYjxZPJM7SgDP-fou6SEuaE8+TFCNW4c2r_rA@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 2:03 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
> On Thu, Jul 23, 2020 at 01:03:17PM +0300, Andy Shevchenko wrote:
> > On Thu, Jul 23, 2020 at 04:38:55AM +0300, Serge Semin wrote:

...

> > > 5) Manually select a proper IRQ flow handler directly in the
> > > irq_set_type() callback by calling irq_set_handler_locked() method, since
> > > an ordinary (not Generic) irq_chip descriptor is now utilized.

> > Can you also emphasize that this make no regression to the 6a2f4b7dadd5 ("gpio:
> > dwapb: use a second irq chip")?
>
> In fact I don't really see why that commit had been accepted in the first place.
> Both level and edge triggered IRQ types are implemented by means of the same
> callbacks and the same registers. The only handy thing in our case is the IRQ
> flow handler setting in accordance with the requested IRQ type, but that
> could be done by just calling irq_set_handler_locked() method without two-types
> complication. The commit log says: "So we can have at runtime two users where
> one is using edge and the other level." which isn't really correct since if an IRQ
> line is shared it can only be requested with the same trigger flags (see the
> inline comments in the __setup_irq() method definition). If an IRQ line isn't
> shared, then there can't be more than one user.
>
> Am I missing something?

I didn't investigate myself, but probably it's a history of changes
you are missing.
That said, in time when the above mentioned commit was made there was
no clear approach like we have nowadays.
But I might be mistaken.
In any case, just add a (small) remark that you were aware of that
change and do not see any problems while doing yours.

> > (And I hope you have means to test that scenario, because in my case I have
> >  only one IRQ and it's actually as input from other GPIO IRQ chip).
>
> Alas I have DW APB GPIO with a single IRQ line attached too, so I can't test the
> hierarchical case, but only the cascaded one.

Alas.

...

> > I like the idea, but is it possible to split this?
>
> Yeah, 6) and 7) could be unpinned to dedicated patches. Thanks for noticing
> this. I'll do that. But leaving the changes described before and not applying 8)
> will produce buildable but not working driver. So I'd prefer to leave 8) here.

I see. Yes, we have to have compile time *and* run-time bisectability in place.

...

> > > +           /*
> > > +            * If more than one IRQ line is specified then try to
> > > +            * initialize the hierarchical interrupts. Otherwise it's
> > > +            * a simple cascaded case with a common IRQ signal.
> > > +            */
> > > +           girq->num_parents = pp->irq[1] ? pp->ngpio : 1;
> >
>
> > Can it be sparse in the array? (It's actually the main point why I went with
> > memchr_inv() instead of doing something like above)
>
> According to the DW APB GPIO databook it can be configured to provide either a
> combined IRQ line or multiple interrupt signals for each GPIO. It's up to
> the platform which of those signals are connected to an embedded IRQ
> controller. So I guess theoretically the array values can be sparse.
>
> Anyway now I see it's rather problematic. I didn't forget about the sparse IRQs
> array case. I just thought it would work out-of-box. Before getting your comment
> and digging deeper into the IRQ subsystem I had thought that it wasn't a problem
> passing invalid IRQ numbers to the irq_set_chained_handler_and_data() especially
> seeing zero IRQ number was supposed to be considered as invalid. That method shall
> just ignore the invalid IRQs since the method irq_to_desc() calling radix_tree_lookup()
> will fail to find a descriptor with invalid IRQ value and return NULL. So after
> getting a NULL irq_desc the method irq_set_chained_handler_and_data() would
> have stopped setting the handler. But turns out it may work only for
> CONFIG_SPARSE_IRQ. If that config isn't enabled, then a very first IRQ
> descriptor will be returned for zero IRQ number. That descriptor will be
> initialized with the passed parent_handler callback, which isn't what we want.
>
> So in order to fix the problem we could follow either of the next paths:
> 1) Just make sure the passed IRQs array is not sparse for instance by remapping
>    it to be linear.
> 2) Move "if (gc->irq.parents[i]) irq_set_chained_handler_and_data()" statement to the
>    gpiochip_add_irqchip() method.
>
> What to you think? Linus?

I am okay with either that Linus will like.

...

> > > +           /* This will let us handle the parent IRQ in the driver */
> > > +           girq->parents = NULL;
> > > +           girq->num_parents = 0;
> > > +           girq->parent_handler = NULL;

> > Shan't we do this before request_irq() call (at least for consistency with the
> > rest of the drivers)?
>
> Technically we shan't. Please elaborate which drivers you are referring to?

All of them? Recent patches for IRQ chip template do something like

girq = &...;
girq->foo = bar;
...
ret = request_irq(...);

...and here no more girq->baz = gaz; lines.

> Even the recent Linus' series "Use irqchip template" mostly does it in the
> same order.

Funny, that's what I;m referring to.

-- 
With Best Regards,
Andy Shevchenko
