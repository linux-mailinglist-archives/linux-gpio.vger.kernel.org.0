Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110AA23D4F2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 03:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHFBDi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 21:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHFBDh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 21:03:37 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F0CC061574;
        Wed,  5 Aug 2020 18:03:37 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mt12so5784076pjb.4;
        Wed, 05 Aug 2020 18:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QlZTnHH4MPboj0kQ3m7B+Q3697i58hOC0639opdw1Xo=;
        b=uPlfumSBIufUOZJK7Lr5+fR5pxEAgQx4YD1voADNhyBFxm3eKxojoBN2SsTCwjGArP
         RFdkb9nI6hFq0Yp+FV+OuF66HEnm4jh8g5d+U2g58iw9Pnk+8jMb6frdWtFrA6bhBM8A
         9Y6r8VM019y5Xv+sJzXN+fqEzy63qNQMo8ANWpTAmiObkcN2KW7a5/DaJb5au/VkL9Rp
         tkDE81ifhlWaaSlhHjwh/tkJRUgcKwPsT33sKoyTEXtgpll/iG9urPdpTznJHB6ShnO5
         Y0b5FXjjMvYBBKj+2VlLbRaNWApEaGqn6lC2WTurSkhLezl+GWj7iq9L+Qlg/6leafNc
         u3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QlZTnHH4MPboj0kQ3m7B+Q3697i58hOC0639opdw1Xo=;
        b=VpM71G7+ctSM+JrjaergFeIJ2mizUDRJFgvVoODQ8SQcoDO/fk5TQ7kUJgZSCKG8Jq
         hN/Poy8NmtcgHJg1ok1AsqliGZe10MfNpqfihiIP3PE0N8QU2/qkGYFSm9pbOZGODJoJ
         WlbTYEYrLwGiOIFEzPk+V41MRWUds0ippavNwD8M+rTjNtcOMOwGH9CgDMZQcJJb6Do/
         mL+VbWEmyiGVk+OewSBDXPnkUfu45/KmtAwQgsNXgd1Li6WOZwr7S1igh2CKuFYyeN7c
         BZQQ4AvRMMzq/njztJsFVRW28xuvUkBRoJCw8aEUU9PX71pKt4pDRm84lJ4NTJyi3syT
         IgpQ==
X-Gm-Message-State: AOAM533ak7CkPyY8KNjF8kH78YabTghFjWm6kNgJBRuTuVmINcG6nagt
        8rMDYogH7DvyALLZoE7qvX5cm8Wl
X-Google-Smtp-Source: ABdhPJxm2SB5PWnTUnrhX1YK7mAHM0BtklnH6thp09yTGfcGSvYxiF8gPrwOlSYs6FJiRpWgYxtrzg==
X-Received: by 2002:a17:90b:f11:: with SMTP id br17mr6001938pjb.68.1596675816315;
        Wed, 05 Aug 2020 18:03:36 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id g8sm5185122pfo.132.2020.08.05.18.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 18:03:35 -0700 (PDT)
Date:   Thu, 6 Aug 2020 09:03:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/18] gpio: uapi: define uAPI v2
Message-ID: <20200806010330.GA11890@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-3-warthog618@gmail.com>
 <CAMpxmJXocdDTvC7_76UwZ9FONn86p0MjZtorRKTR5bxN7PJy6g@mail.gmail.com>
 <20200805051853.GA122005@sol>
 <CAMpxmJWWmBULX+RdqN3nyXFO4M9sbu2Q6i11UJMiKxomVDr47g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWWmBULX+RdqN3nyXFO4M9sbu2Q6i11UJMiKxomVDr47g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 05, 2020 at 07:47:57PM +0200, Bartosz Golaszewski wrote:
> On Wed, Aug 5, 2020 at 7:19 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> > > >
> > > > +/*
> > > > + * Maximum number of requested lines.
> > > > + *
> > > > + * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
> > > > + */
> > > > +#define GPIOLINES_MAX 64
> > > > +
> > > > +/* The number of __u64 required for a bitmap for GPIOLINES_MAX lines */
> > > > +#define GPIOLINES_BITMAP_SIZE  __KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)
> > > > +
> > >
> > > In what circumstances can this be different than 1? It's worth
> > > documenting here I suppose.
> > >
> >
> > In terms of the API definition, GPIOLINES_MAX can be anything you want
> > and the definitions are still valid.  In practice in the mainline kernel
> > it would always be 1 for ABI compatibility.
> >
> > Chiselling GPIOLINES_MAX <= 64 into stone could simplify things a bit,
> > as all the bitmaps reduce to a single __u64.  Would you prefer that?
> >
> 
> I'm not sure I follow. We need to chisel some max value in stone. Up
> to that point it's been 64. We can make it more and the bitmap API
> would handle it alright but if we don't, then this
> __KERNEL_DIV_ROUND_UP() is unnecessary. Limiting it to 64 makes things
> very simple thanks to fitting into a __u64 though. I've personally
> never needed to request even half that so I guess this value's fine?
> 

By "chiselling in stone" I mean not supporting > 64 lines - even in
custom kernel builds.  The uAPI and definition and implementation would
lock that in.  As it stands a custom build could use > 64 and it should
all still work as the bitmaps would be resized.

I satisfied that 64 is more than enough for what this API is intended for,
so I'll change the bitmaps to a single __u64, and remove
GPIOLINES_BITMAP_SIZE.

[ snip]
> > > > +       __u64 bits[GPIOLINES_BITMAP_SIZE];
> > > > +};
> > > > +
> > >
> > > We can set values only for a subset of requested lines but AFAICT we
> > > can't read values of only a subset of lines. Would it be difficult to
> > > remove this limitation? While reading values always succeeds - even if
> > > the line is in input mode and has edge detected - I think that someone
> > > may want to request the max number of lines without reading all their
> > > values each time. Maybe consider merging this with struct
> > > gpioline_set_values?
> > >
> >
> > That is correct.
> >
> > I considered that corner case to be unlikely, as a major point of
> > requesting lines together is to be able to perform collective operations
> > on them as atomically as possible.  If you only want subsets then
> > request them as separate subsets.
> >
> 
> And yet this version implements heterogeneous config and setting edge
> detection and values of subsets of requested lines. :)
> 

The corner case I was referring to was only wanting to get a subset of
lines and caring that there may be a slight performance gain if the
kernel filters out the lines you aren't interested in :(.

> > Do you have a case in mind where you would have overlapping subsets?
> >
> 
> No, not really but then I also don't have a use-case for setting only
> a certain subset of lines.
> 
> > Not difficult to remove the limitation - I just didn't see sufficient
> > benefit.
> >
> 
> Using the same structure for setting and getting values is a benefit
> IMO. If it's not a difficult task, then I think it's worth adding it.
> 

OK, will add it in.

[ snip]
> > > (maybe even define a special macro to set all bits in mask -
> > > GPIOLINE_CONFIG_ALL_LINES or something) on a first-in-wins basis. I'm
> > > open to other suggestions though.
> > >
> >
> > I think I've addressed this elsewhere, and still think it is worthwhile
> > and very low cost.  I thought it was an easy win when I added it, and
> > still do.
> >
> > Happy to change the attrs to first-in-wins though - the validation of
> > the attrs is still my biggest bugbear with this version.
> 
> Yes, I read your other reply. Ok, makes sense to have default flags
> with an attribute for overrides. This just needs very explicit
> documentation.
> 

I'll add documentation that the attrs associations are on a
first-in-wins basis, and that subsequent associations are ignored.

Cheers,
Kent.
