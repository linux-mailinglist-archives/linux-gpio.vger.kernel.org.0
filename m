Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C6D1F0431
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2020 03:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgFFB45 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 21:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgFFB45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2020 21:56:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD0BC08C5C2;
        Fri,  5 Jun 2020 18:56:56 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y17so4379127plb.8;
        Fri, 05 Jun 2020 18:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9XJUfzg4tRpMg9UJ384v0VHvTRvHdUSTkka3ZJEqC9M=;
        b=IWoJ6w/Qpb3nZiqDq3Ynp13vOQYhEZdr8MaxRXp3UjappWMEWzxEvZuCG3tMUiy50/
         srEIpFUMqFtznBVeuTQQrEPWO07t64Ca07GaIU5IynWYWAJkHVOA+3+wWDyuphqms7Zh
         +asvR/xQBzSLVXp8kvdc7Zwl9gQuH3+BA8wSiT3EO+wv0+uKTuKLUAyLD7UtRWqGZTvh
         YXfWE5jPfXJTOeN18ooL70g9yKYk0MvjqA/p5GYBwLxX+pCR8RQwYVDQWf2iY5hxJ9GW
         KXSiu7FsA3ilxvZ3zisyxJ5y3Nm5qAcz8ZOxSLXFlIjMKvW3SDMVVw0Hw4skumWpX3Tk
         HgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=9XJUfzg4tRpMg9UJ384v0VHvTRvHdUSTkka3ZJEqC9M=;
        b=Jup7eqH9bsIFzK3iUuSHrnlwxLTUZHBFcUOplOQMu4xVwnxFCP+xOdlsQCU3rEk0u4
         SnqLELkiDuFnHMOdwehGoaD1zRAdJZdRXEvoYIyChaj/5YuF6fw16re/7KI1XHd9JkHw
         nKsvVeMSuYtxqpuS05ogaNS1AZGVsmOV0K0JQT5vOOsVm9lpvwk8szN33tudpPPVwhKz
         1yRhRhunF1+keHDyWOG7TW6dMlknyy+jB0gLkiAGc2K1OzIBFtlVqz+cH5MWDGm5ZjAS
         sl8YfROV6G7V+JjUI89X5nmpT3LL6yk1EaJQv/mrANBvLZMwwhPN1uRMgXrGT2TY/0rP
         GnLQ==
X-Gm-Message-State: AOAM533ny6Bl71a3YEOTlDL2kJ7zTgQhakeYHxh0f2EQdAlBXbFWLeXN
        dAoSVxpQcao2eLvmyN0jG4kdykz4//A=
X-Google-Smtp-Source: ABdhPJxihHCwMe4Rc94oKUVZ0w87/fMya+7tPhbp69ffS1XGYAkZFAkdumBhEwOX5RkxU2wj+t0o/A==
X-Received: by 2002:a17:90a:49c5:: with SMTP id l5mr6057712pjm.31.1591408615346;
        Fri, 05 Jun 2020 18:56:55 -0700 (PDT)
Received: from sol (220-235-66-207.dyn.iinet.net.au. [220.235.66.207])
        by smtp.gmail.com with ESMTPSA id l2sm601411pga.44.2020.06.05.18.56.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 18:56:53 -0700 (PDT)
Date:   Sat, 6 Jun 2020 09:56:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
Message-ID: <20200606015647.GA8099@sol>
References: <20200516064507.19058-1-warthog618@gmail.com>
 <CAMpxmJUbC4qmUGM0Z-6hXsYPRSpEpNM7iXgc7XbMcf_epi0Lig@mail.gmail.com>
 <20200604160006.GA5730@sol>
 <CAMRc=MfS1sCTU3vs5Gq_6+Ubt_89HX34mqabtpGbAASo+SfzSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfS1sCTU3vs5Gq_6+Ubt_89HX34mqabtpGbAASo+SfzSw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 05, 2020 at 11:53:05AM +0200, Bartosz Golaszewski wrote:
> czw., 4 cze 2020 o 18:00 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> 
> [snip!]
> 
> > > > +
> > > > +enum gpioline_edge {
> > > > +       GPIOLINE_EDGE_NONE              = 0,
> > > > +       GPIOLINE_EDGE_RISING            = 1,
> > > > +       GPIOLINE_EDGE_FALLING           = 2,
> > > > +       GPIOLINE_EDGE_BOTH              = 3,
> > > > +};
> > >
> > > I would skip the names of the enum types if we're not reusing them anywhere.
> > >
> >
> > I thought it was useful to name them even if it was just to be able to
> > reference them in the documentation for relevant fields, such as that in
> > struct gpioline_config below, rather than having to either list all
> > possible values or a GPIOLINE_EDGE_* glob.
> >
> > And I'm currently using enum gpioline_edge in my edge detector
> > implementation - is that sufficient?
> >
> 
> The documentation argument is more convincing. :)
> 

I know - but your criteria was reuse... ;-).

> > > > +
> > > > +/* Line flags - V2 */
> > > > +#define GPIOLINE_FLAG_V2_KERNEL                (1UL << 0) /* Line used by the kernel */
> > >
> > > In v1 this flag is also set if the line is used by user-space. Maybe a
> > > simple GPIOLINE_FLAG_V2_USED would be better?
> > >
> >
> > Agreed - the _KERNEL name is confusing.
> > In my latest draft I've already renamed it GPIOLINE_FLAG_V2_BUSY,
> > as EBUSY is what the ioctl returns when you try to request such a line.
> > Does that work for you?
> > I was also considering _IN_USE, and was using _UNAVAILABLE for a while.
> >
> 
> BUSY sounds less precise to me than USED or IN_USE of which both are
> fine (with a preference for the former).
>

OK, USED it shall be.

> [snip!]
> 
> > > > +
> > > > +/**
> > > > + * struct gpioline_values - Values of GPIO lines
> > > > + * @values: when getting the state of lines this contains the current
> > > > + * state of a line, when setting the state of lines these should contain
> > > > + * the desired target state
> > > > + */
> > > > +struct gpioline_values {
> > > > +       __u8 values[GPIOLINES_MAX];
> > >
> > > Same here for bitfield. And maybe reuse this structure in
> > > gpioline_config for default values?
> > >
> >
> > Can do.  What makes me reticent is the extra level of indirection
> > and the stuttering that would cause when referencing them.
> > e.g. config.default_values.values
> > So not sure the gain is worth the pain.
> >
> 
> I'd say yes - consolidation and reuse of data structures is always
> good and normally they are going to be wrapped in some kind of
> low-level user-space library anyway.
> 

Ok, and I've changed the values field name to bitmap, along with the change
to a bitmap type, so the stuttering is gone.

And, as the change to bitmap substantially reduced the size of
gpioline_config, I now embed that in the gpioline_info instead of
duplicating all the other fields.  The values field will be zeroed
when returned within info.

> > And I've renamed "default_values" to just "values" in my latest draft
> > which doesn't help with the stuttering.
> >
> 
> Why though? Aren't these always default values for output?
> 

To me "default" implies a fallback value, and that de-emphasises the
fact that the lines will be immediately set to those values as they
are switched to outputs.
These are the values the outputs will take - the "default" doesn't add
anything.

> [snip!]
> 
> > > > +
> > > > +/**
> > > > + * struct gpioline_event - The actual event being pushed to userspace
> > > > + * @timestamp: best estimate of time of event occurrence, in nanoseconds
> > > > + * @id: event identifier with value from enum gpioline_event_id
> > > > + * @offset: the offset of the line that triggered the event
> > > > + * @padding: reserved for future use
> > > > + */
> > > > +struct gpioline_event {
> > > > +       __u64 timestamp;
> > >
> > > I'd specify in the comment the type of clock used for the timestamp.
> > >
> >
> > Agreed - as this one will be guaranteed to be CLOCK_MONOTONIC.
> >
> > I'm also kicking around the idea of adding sequence numbers to events,
> > one per line and one per handle, so userspace can more easily detect
> > mis-ordering or buffer overflows.  Does that make any sense?
> >
> 
> Hmm, now that you mention it - and in the light of the recent post by
> Ryan Lovelett about polling precision - I think it makes sense to have
> this. Especially since it's very easy to add.
> 

OK.  I was only thinking about the edge events, but you might want it
for your line info events on the chip fd as well?

> > And would it be useful for userspace to be able to influence the size of
> > the event buffer (currently fixed at 16 events per line)?
> >
> 
> Good question. I would prefer to not overdo it though. The event
> request would need to contain the desired kfifo size and we'd only
> allow to set it on request, right?
>

Yeah, it would only be relevant if edge detection was set and, as per
edge detection itself, would only be settable via the request, not
via set_config.  It would only be a suggestion, as the kfifo size gets
rounded up to a power of 2 anyway.  It would be capped - I'm open to
suggestions for a suitable max value.  And the 0 value would mean use
the default - currently 16 per line.

If you want the equivalent for the info watch then I'm not sure where to
hook it in.  It should be at the chip scope, and there isn't any
suitable ioctl to hook it into so it would need a new one - maybe a
set_config for the chip?  But the buffer size would only be settable up
until you add a watch.

Cheers,
Kent.
