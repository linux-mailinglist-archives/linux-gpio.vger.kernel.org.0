Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C48A20974B
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 01:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387974AbgFXX7G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 19:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387959AbgFXX7F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 19:59:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC31DC061573;
        Wed, 24 Jun 2020 16:59:05 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y18so1895784plr.4;
        Wed, 24 Jun 2020 16:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=by+7EPJlnqYx44tYINgzJBoZS06YWSNmrp17oSSjLy0=;
        b=F5xEoB84Hg6/8ekdHbNtJATPpHAUT9Pm9YhGAVkZ6vVwCzPyHtJO/RpC1LhGVMGuqq
         2W0HVf5G9lbnQJVu2sCsrS/yvz0vXHO4nRIr4ZVQRs2rW5xtAxtUrxY+Pt7kd9VX6mYV
         78WH6aqgLSzEtEbbNLuvzPjjs86Rl1OmlLXZIwjBKqoqnSOz/4NFQcrYkqRrXPBzda/Y
         WEOGykZFeSxrQItIEcvpU+KCKQO9XpnIpiQV6/iH1a939Sehgddi0tv8wk4+4AhJ73Y4
         185E0ZPNJxj3942llxxZXxIX0u/tpy6miI5c1W/usXlT4XcsuFEwe9fR/fJLLH+emFkR
         d3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=by+7EPJlnqYx44tYINgzJBoZS06YWSNmrp17oSSjLy0=;
        b=IVvd1YGjy83nou6xbxik737lgQNZY1U27VWr1SiWDjVh7U1CrQXQG7Q4JyHcoQ/HTq
         qghCbV/4Tl/Gbf8nf+1oEFDaaAfv/P8kSTw1wpSFtgHp3WI8oeoKzH9zj80WL0CCIpog
         6PYXmZrjiWmPjiLTpGoFYPMUZmE/vBHXJZs8n5v9tQuZyoqOQlCOfHoHH8MJ9k+vJr3u
         gD4H8R8dWoOViN51aWpdlBkbmKBl4eo4UX5bI/aAb2wWvo1BMozkNtjfd/blEF0/vkaO
         Y38NIdZwiVoypJ+GxsdYZ3Z2uPfFAKpepDk9o74fehqCPvF5t2I5GbY3MMTIlwlzKiVj
         rkKg==
X-Gm-Message-State: AOAM53384U0Wv1hYDJ/QdLrV7MefThqrrY0OtZYf9AepHaW5XQiKUkZi
        SWyKA8vJRTw3RD5ZGC55NAA=
X-Google-Smtp-Source: ABdhPJzPdjSkcD3nGW9/u/oee4GH1uUkvgf56hK5O+fMdlKC+V8LTFK1Sp4bpuHfHgJdl9ed4iQ9DA==
X-Received: by 2002:a17:90a:9f81:: with SMTP id o1mr280805pjp.139.1593043144892;
        Wed, 24 Jun 2020 16:59:04 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id z140sm21940578pfc.135.2020.06.24.16.59.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 16:59:03 -0700 (PDT)
Date:   Thu, 25 Jun 2020 07:58:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 13/22] gpio: uapi: define uAPI V2
Message-ID: <20200624235858.GB6751@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-14-warthog618@gmail.com>
 <CAMpxmJVf2NpRJN8cNuVxVpuy45xzH037JsT-wxRREM8YJ1mJpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVf2NpRJN8cNuVxVpuy45xzH037JsT-wxRREM8YJ1mJpA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 04:36:22PM +0200, Bartosz Golaszewski wrote:
> wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
[ snip ]
> > +
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
> > +
> 
> Did someone request such definitions? IMO it's one of those rare
> instances where I'd prefer to see magic numbers used in the structs.
> I'm not sure if we need this indirection.
> 

Not explicitly.  Andy requested documentation on the pad sizes, which
seemed reasonable, and it also seemed reasonable to me to group them in
the one place rather than repeat the doco for each struct.

But having the size of the pad visible in the struct definition is
preferable, as it is only really relevant to that struct.
And everyone wants to keep the uAPI definitions as short possible, so
will drop these in v2.

> > +/**
> > + * struct gpioline_values - Values of GPIO lines
> > + * @bitmap: a bitmap containing the value of the lines, set to 1 for active
> > + * and 0 for inactive.  Note that this is the logical value, which will be
> > + * the opposite of the physical value if GPIOLINE_FLAG_V2_ACTIVE_LOW is
> > + * set in flags.
> > + */
> > +struct gpioline_values {
> > +       __u64 bitmap[GPIOLINES_BITMAP_SIZE];
> > +};
> 
> Ok so now when embedding this structure we get something like
> "config.values.bitmap". This looks fine with the exception that "bits"
> would be even shorter and the information about this field being a
> bitmap is not necessary. I hope this isn't too much bikeshedding. :)
> 

Fair enough - bits it is.

> > +
> > +/**
> > + * struct gpioline_config - Configuration for GPIO lines
> > + * @values: if the direction is GPIOLINE_DIRECTION_OUTPUT, the values that
> > + * the lines will be set to.  This field is write-only and is zeroed when
> > + * returned within struct gpioline_info.
> > + * @flags: flags for the GPIO lines, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
> > + * GPIOLINE_FLAG_V2_DIRECTION etc, OR:ed together
> > + * @direction: if GPIOLINE_FLAG_V2_DIRECTION is set in flags, the desired
> > + * direction for the requested lines, with a value from enum
> > + * gpioline_direction
> > + * @drive: if GPIOLINE_FLAG_V2_DRIVE is set in flags, the desired drive for
> > + * the requested lines, with a value from enum gpioline_drive
> > + * @bias: if GPIOLINE_FLAG_V2_BIAS is set in flags, the desired bias for
> > + * the requested lines, with a value from enum gpioline_bias
> > + * @edge_detection: if GPIOLINE_FLAG_V2_EDGE_DETECTION is set in flags, the
> > + * desired edge_detection for the requested lines, with a value from enum
> > + * gpioline_edge
> > + * @debounce_period: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the
> > + * desired debounce period for the requested lines, in microseconds
> > + * @padding: reserved for future use and must be zero filled
> > + */
> > +struct gpioline_config {
> > +       struct gpioline_values values;
> > +       __u32 flags;
> > +       /* Note that the following four fields are equivalent to a single u32. */
> > +       __u8 direction;
> > +       __u8 drive;
> > +       __u8 bias;
> > +       __u8 edge_detection;
> 
> Limiting the size of these enum fields doesn't improve performance in
> any measurable way. We already have 4 possible values for events. I'm
> afraid that at some point in the future we'll add support for level
> events or something else etc. and we'll run into a problem because we
> only have 8 bits available. If there are no objections, I'd make it 32
> bits wide.
> 

Agreed - the reduction in size isn't worth the effort.

> For the same reason I was thinking that making flags 64 bits wouldn't
> hurt either.
> 

OK

[ snip ]
> > + * struct gpioline_event - The actual event being pushed to userspace
> > + * @timestamp: best estimate of time of event occurrence, in nanoseconds.
> > + * The timestamp is read from CLOCK_MONOTONIC and is intended to allow the
> > + * accurate measurement of the time between events.  It does not provide
> > + * the wall-clock time.
> > + * @id: event identifier with value from enum gpioline_event_id
> > + * @offset: the offset of the line that triggered the event
> > + * @seqno: the sequence number for this event in the sequence of events for
> > + * all the lines in this line request
> > + * @line_seqno: the sequence number for this event in the sequence of
> > + * events on this particular line
> > + * @padding: reserved for future use
> > + */
> > +struct gpioline_event {
> > +       __u64 timestamp;
> > +       __u32 id;
> > +       __u32 offset;
> > +       __u32 seqno;
> > +       __u32 line_seqno;
> > +       __u32 padding[GPIOLINE_EVENT_PAD_SIZE]; /* for future use */
> 
> Any reason for only having 64 bits of padding? 128 wouldn't change much, right?
> 

No, as I mentioned in the commentary, I'm concerned that I've gone
too small with the padding, so happy to bump that.
And I'm open to suggestions on the other pads as well.

Cheers,
Kent.

