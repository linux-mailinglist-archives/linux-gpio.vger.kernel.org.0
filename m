Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00092077BD
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 17:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404155AbgFXPlH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 11:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403781AbgFXPlH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 11:41:07 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AB8C061573;
        Wed, 24 Jun 2020 08:41:07 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id z5so1595369pgb.6;
        Wed, 24 Jun 2020 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HW/FQFSdJlyBIjq6IaelwmTZ5z7Zqk+MnAi7g2JKw7M=;
        b=GgSfFc00O6zjlTacLseBBgnitdHmB8txnnqcbsV8vMzQsL2qi3N6Q33iYraMK2hMBQ
         lJI6HipKiv/oYmJaJ2y5NaTNKzShVAkkYCzHKLaeFw0uywJcxSq6w7287rZ7Xe/ch+n5
         hi3C5cnG50rrPKtkE0fRsNwapwD3QaDopZK8TA8GrJREtEVnXL4UJiQeq6q0PJ3c97i9
         O5AdiJ6AkuyjAPfdbNEWJ96IcHLNEFZ3jRqmrIzqzhQ8pC1Pzxhqb32HCkAAqbcEmQKx
         ckaKzyBKBzTYOyUL63InRBaQSdHnhNsYyLKFZsThNBI/AXONMPaNksihj5C/wwSFTJqN
         kcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HW/FQFSdJlyBIjq6IaelwmTZ5z7Zqk+MnAi7g2JKw7M=;
        b=FBKd+S54CDuyYCgJC4RN16WvYwFZP0AoWmFk6cNJNcik0/4K4b35D59tKIztWAAcf8
         14rYhs1hMquTtErzi5bG1umqSgR1I53JYw489ImcR1WfZ6UJ5KC2FXNcZyDsLiWbpQLY
         p/C+EXuTpi0pG7WqJhLL1SFiAKRNlXAXlhJIG1Pkih5/mjzdC86AH7lGHE7IXdp3a5s6
         FeMcjfEt5NzSdIenOLZX8f48dLXsdXROnBrtRqlznosWgoRo01ygyjDd8GL1mIT/68lK
         QpjmEpglNKlmSxr4neEcl4XbQ9/KnQyJrjDDxvdEhsOs9IGbaCgW6JltqRA9WP2tOqDS
         TXMQ==
X-Gm-Message-State: AOAM532tPGCW2CyTK/VMUkdg68uqnSscA2OS64kD6Bcn7Y4s8tuYNV5A
        1XXWkrHLYCeOz/jK4XGwi5FYpPpUebHbzw==
X-Google-Smtp-Source: ABdhPJxlQ/kzE4kQDWh6C8r/cXJDwz65lClu5ttuh+zhE585JieRgeyfL8hI/ZyGGHvvlQvTuhW4bQ==
X-Received: by 2002:a63:384a:: with SMTP id h10mr22252188pgn.176.1593013266763;
        Wed, 24 Jun 2020 08:41:06 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id q22sm20088580pfg.192.2020.06.24.08.41.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 08:41:05 -0700 (PDT)
Date:   Wed, 24 Jun 2020 23:40:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 13/22] gpio: uapi: define uAPI V2
Message-ID: <20200624154057.GA8622@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-14-warthog618@gmail.com>
 <CAHp75VcEDnrQk5FeWTZdV3fMnTsLpnmy+hAnL4V3a0Ge0NEe2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcEDnrQk5FeWTZdV3fMnTsLpnmy+hAnL4V3a0Ge0NEe2A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 05:33:26PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 23, 2020 at 7:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add a new version of the uAPI to address existing 32/64bit alignment
> 
> I think using - would be nice, like 32/64-bit (or at least space like
> 32/64 bit) as a common practice.
> 

Fair enough.  And you don't need to point out every single case - a
catch all is sufficient.

[ snip ]
> 
> > +#include <linux/kernel.h>
> 
> Perhaps keep it in order?
> 

Haha, I didn't notice that one.

> ...
> 
> > + * Must be a multiple of 8 to ensure 32/64bit alignment of structs.
> 
> Dash. And same for all cases like this.
> 

And you are repeating yourself.  Again ;-).

> ...
> 
> > +/* the number of __u64 required for a bitmap for GPIOLINES_MAX lines */
> 
> the -> The ?
> 
> > +#define GPIOLINES_BITMAP_SIZE  __KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)
> 
> Not sure we need this definition. The problem is that definitions in
> the uAPI header are also part of uAPI. Here is just a calculus which
> can be done manually since if anybody changes MAX, they will anyway
> have to check if everything else is consistent. And yes, I'm not in
> favour of including kernel.h here and there.
> 

We are talking about include/uapi/linux/kernel.h, right?
I thought headers in uapi/linux were fair game for other uapi headers.
That is what they are there for right?

Similarly, I thought those macros were there to avoid having the recalc
manually.

> ...
> 
> > +/*
> > + * Struct padding sizes.
> > + *
> > + * These are sized to pad structs to 64bit boundaries.
> > + * To maintain 32/64bit alignment, any arbitrary change must be even, as
> > + * the pad elements are __u32.
> > + */
> > +#define GPIOLINE_CONFIG_PAD_SIZE               7
> > +#define GPIOLINE_REQUEST_PAD_SIZE              5
> > +#define GPIOLINE_INFO_V2_PAD_SIZE              5
> > +#define GPIOLINE_INFO_CHANGED_V2_PAD_SIZE      5
> > +#define GPIOLINE_EVENT_PAD_SIZE                        2
> 
> I'm not sure they (definitions) should be part of UAPI. Can't you
> simple hard code numbers per case?
> 

Ironically they are there as you wanted the padding sizes, and their
impact on alignment, documented and it made sense to me to group them
like this.

> ...
> 
> > +/**
> > + * struct gpioline_config - Configuration for GPIO lines
> > + */
> > +struct gpioline_config {
> > +       struct gpioline_values values;
> > +       __u32 flags;
> > +       /* Note that the following four fields are equivalent to a single u32. */
> > +       __u8 direction;
> > +       __u8 drive;
> > +       __u8 bias;
> > +       __u8 edge_detection;
> > +       __u32 debounce_period;
> 
> > +       __u32 padding[GPIOLINE_CONFIG_PAD_SIZE]; /* for future use */
> 
> I would just put minimum here. If you need to extend you have to use
> sizeof(struct) as a version of ABI.
> 

That is doable, but gets complicated when you have embedded structs, as
this one is in gpioline_request and gpioline_info_v2.

To keep decoding simple on the kernel side, we would have to explode all
the struct definitions so new fields are always added to the end.
Or we would end up with rather complex decoding on the kernel side.

We can always use that as a fallback if we run out of padding.

> > +};
> 
> I'm wondering how many lines (in average) the user usually changes at
> once? One? Two?
> 
> Perhaps we need to be better with this, something like single line /
> multiple lines?
> 
> So, having a struct for single line change being embedded multiple
> times would allow to configure atomically several lines with different
> requirements.
> For example you can turn directions of the two lines for some kind of
> half-duplex bit banging protocol.
> 
> I'm not sure about the rest, but to me it seems reasonable to have
> single vs. multiple separation in some of the structures.
> 

I agree in general, but not sure where to draw the line (pun not
indended).
Or how to provide a coherent API at a higher layer for that matter.

Do you have a concrete use case you need a solution for?

> ...
> 
> > +/*
> > + *  ABI V1
> 
> V1 -> v1
> 
> And below V2 -> v2.
> 

Fair enough.

Cheers,
Kent.

