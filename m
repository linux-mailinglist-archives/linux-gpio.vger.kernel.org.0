Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DBE28CAA6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 10:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404062AbgJMIxQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 04:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404127AbgJMIxQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 04:53:16 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BF7C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:53:16 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a200so16292013pfa.10
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ibtxH0d6mCxSVXvODZ6Rq5N+NBWS2ujaEK7AVUMADsc=;
        b=TvgALXG1lQMbAblF8jBtBw7gtISKAKZxyqXuMIx4TLYiZcWD3xZfQc/lOYZEqmSOKp
         YMy0eJgD3KVOmbXk5TPF9G8V0A1E55K7mBsehMDMXLtMQkwnYvFJIJU1tOfnsS2PF1qT
         AK0n+9Dw0sZGLYrsX9GcfrQA6eorlIUxzMXf2L4BrbCKX3cApDqlmpUfhaPBflMIIyre
         uZ3qYhhJOSqR112ipEwRxBPReyfQW6nWADutJFgqeZMjptk/BIgNvzhfp/ZYznlcWEoW
         1WZlqoJ9bXLBVOBTc/R8TSKngG9yQGDLnoeT10jn6b2YKOuVXl7z1DrPekGrpdowlgsD
         N8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ibtxH0d6mCxSVXvODZ6Rq5N+NBWS2ujaEK7AVUMADsc=;
        b=dA7QHagKKG9o3xmGFqWZ6oQntmlX3NrWsyxYKZ0/cj/ho5zz3a9G6u7UVjkmMFLLbr
         I/GfO5P4BPAwt51V53OJbZ7maGIix34VFl0gNw01oKy3joy5Zj+1ngiondw1w7B5oJb1
         aQIQmUkcU4Po7PWuQwiL1uTiWFxVLFvH+4DYCY4e/IduZEOJerpQo3RD59butqB1K9WC
         tFjL0AyviWI3hfWToUDsHJQBTaQJoFPPeX2n8aVDNEmfrKyiYkI1I04cl2XGP3/AcG5F
         78bnq5Y3uuXGqILKvcOfTbw6q9DsfC/by0HF+Xz1jSa/RUKkIwV7OVPr30Gyt7pZNox1
         k6Rg==
X-Gm-Message-State: AOAM530KmfaQSt5Y0pwNCiWZXFgQh4ZNTNakAXMD7kMCRSFFOhPB/v9w
        K7uf50rlqdA3OU7B42yV1Ac=
X-Google-Smtp-Source: ABdhPJyV6qP/H08wAHsopqIRw4lSRLaCE/3X0ybderUrzvW7Kr2uuxjLrdiqccjm6fGqi7uPp1Utcg==
X-Received: by 2002:a65:528b:: with SMTP id y11mr15988916pgp.17.1602579195754;
        Tue, 13 Oct 2020 01:53:15 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id b1sm21809365pft.127.2020.10.13.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:53:14 -0700 (PDT)
Date:   Tue, 13 Oct 2020 16:53:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
Message-ID: <20201013085310.GB3119809@sol>
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol>
 <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 09:45:04AM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 13, 2020 at 2:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Oct 12, 2020 at 05:15:25PM +0200, Bartosz Golaszewski wrote:
> > > Hi!
> > >
> > > One of the things I'd like to address in libgpiod v2.0 is excessive
> > > stack usage with struct gpiod_line_bulk. This structure is pretty big
> > > right now: it's an array 64 pointers + 4 bytes size. That amounts to
> > > 260 bytes on 32-bit and 516 bytes on 64-bit architectures
> > > respectively. It's also used everywhere as all functions dealing with
> > > single lines eventually end up calling bulk counterparts.
> > >
> > > I have some ideas for making this structure smaller and I thought I'd
> > > run them by you.
> > >
> > > The most obvious approach would be to make struct gpiod_line_bulk
> > > opaque and dynamically allocated. I don't like this idea due to the
> > > amount of error checking this would involve and also calling malloc()
> > > on virtually every value read, event poll etc.
> > >
> > > Another idea is to use embedded list node structs (see include/list.h
> > > in the kernel) in struct gpiod_line and chain the lines together with
> > > struct gpiod_line_bulk containing the list head. That would mean only
> > > being able to store each line in a single bulk object. This is
> > > obviously too limiting.
> > >
> >
> > I don't think I've ever gotten my head fully around the libgpiod API,
> > or all its use cases, and I'm not clear on why this is too limiting.
> >
> 
> For instance: we pass one bulk object to gpiod_line_event_wait_bulk()
> containing the lines to poll and use another to store the lines for
> which events were detected. Lines would need to live in two bulks.
> 

Ahh, ok.  So you want to keep that?  I prefer a streaming interface, but
I guess some prefer the select/poll style?

> > What is the purpose of the gpiod_line_bulk, and how does that differ from the
> > gpio_v2_line_request?
> >
> 
> struct gpiod_line_bulk simply aggregates lines so that we can easily
> operate on multiple lines at once. Just a convenience helper
> basically.
> 
> > > An idea I think it relatively straightforward without completely
> > > changing the current interface is making struct gpiod_line_bulk look
> > > something like this:
> > >
> > > struct gpiod_line_bulk {
> > >     unsigned int num_lines;
> > >     uint64_t lines;
> > > };
> > >
> > > Where lines would be a bitmap with set bits corresponding to offsets
> > > of lines that are part of this bulk. We'd then provide a function that
> > > would allow the user to get the line without it being updated (so
> > > there's no ioctl() call that could fail). The only limit that we'd
> > > need to introduce here is making it impossible to store lines from
> > > different chips in a single line bulk object. This doesn't make sense
> > > anyway so I'm fine with this.
> > >
> > > What do you think? Do you have any other ideas?
> > >
> >
> > Doesn't that place a strict range limit on offset values, 0-63?
> > The uAPI limits the number of offsets requested to 64, not their value.
> > Otherwise I'd've used a bitmap there as well.
> >
> > Or is there some other mapping happening in the background that I'm
> > missing?
> >
> 
> Nah, you're right of course. The structure should actually look more like:
> 
> struct gpiod_line_bulk {
>     struct gpiod_chip *owner;
>     unsigned int num_lines;
>     uint64_t lines;
> };
> 
> And the 'lines' bitmap should actually refer to offsets at which the
> owning chip stores the line pointers in its own 'lines' array - up to
> 64 lines.
> 
> But we'd still have to sanitize the values when adding lines to a bulk
> object and probably check the return value. I'm wondering if there's a
> better way to store group references to lines on the stack but I'm out
> of ideas.
> 

So you are proposing keeping the bulk of the bulk in the background and
passing around a flyweight in its place.  Makes sense.

Cheers,
Kent.
