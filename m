Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF2F28CDCA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 14:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgJMMFr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 08:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgJMMFr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 08:05:47 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227DFC0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 05:05:47 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id n6so22050839ioc.12
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YPGmpy6WrXed+dWGHBjrouGmphYuzNHOdsiBLaGVz+c=;
        b=i0HMoAzXx9AgfRQztnpyPmNhDhCLat/qKh2LUpzYzBhJVRhlq1Pzwr1LwkPMQwMwrl
         aJf6vPHx4CkbEJmLaiCpN47klAVmNBCQjqwZpU8a62FfjO0UAPgOu6qaRoq+SH8W+rqQ
         /dFv0YTDIgkLKbFNNEv3QwtgrVtFiQlHh1x+iX6RsTJYV/oUjknbQ3Xc6oRxd7za6N5K
         5IBBkW1znCYrXqL1ehVtkunuJQdjfeIsQSlAZHW0n/LqnoYOHnXL/L/1+YpM3nUwnqU2
         r4+PXbJ4a/h0XuI659iGn3Cw+w8C65V2eU9k9AFqNwF9tWnF2ctkLYUD68GxYKGEPN2N
         2Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YPGmpy6WrXed+dWGHBjrouGmphYuzNHOdsiBLaGVz+c=;
        b=GzTpW607S6STzRzxqG62UMCbdRnOF16jvw0aVtepEYHNltipCmeP1eVuRHpKRHiA76
         2oeENd1Hq9EpFs5otHsrU8WDTSiat//nogwYRJqawtqJIicpZsavaOkkzSOGTv2geTFN
         PfXxouTJcS5qyuNUFiNBd+F7Jl7tHYlEk7sGBossufOk9NaJyQXkfHk++1TiXwtiC4kv
         haZ/V/kJmrbmLK0eXVom/iLoxJPVoF09PvYFEIwum6FJ3TF6lz7BYygmu1Q26ONHfF4u
         YawbaDczV3dzRTh7ujkq25FMP08FZOEbAeLVyMQr7zsJb48hWwCUKDDlpbPtazXa1vSD
         rcKA==
X-Gm-Message-State: AOAM532hvs7HkcVc1rDPpFtJqyBcgeWn/EJ6f8J+qhpEDb9/DF2d6krU
        ejpCOO2QupZgwVw/7q5YF1RnDs8KNX3oToF0YodTHg==
X-Google-Smtp-Source: ABdhPJy7vtrh8FpO4m53Eoh6OnkjGH82KHVDAItyOobhe0KICa8Fu6/0xOp8K1rZef9/Iiwe8hJPSMTzC6ORBLsTEDY=
X-Received: by 2002:a6b:8f8d:: with SMTP id r135mr20391832iod.130.1602590746324;
 Tue, 13 Oct 2020 05:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol> <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
In-Reply-To: <20201013085310.GB3119809@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Oct 2020 14:05:35 +0200
Message-ID: <CAMRc=McbDOQ1=SBfj6DbsMQ+fcRtZ9n4eiEqVeY74frcOM=wVw@mail.gmail.com>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 10:53 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 09:45:04AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 13, 2020 at 2:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Mon, Oct 12, 2020 at 05:15:25PM +0200, Bartosz Golaszewski wrote:
> > > > Hi!
> > > >
> > > > One of the things I'd like to address in libgpiod v2.0 is excessive
> > > > stack usage with struct gpiod_line_bulk. This structure is pretty big
> > > > right now: it's an array 64 pointers + 4 bytes size. That amounts to
> > > > 260 bytes on 32-bit and 516 bytes on 64-bit architectures
> > > > respectively. It's also used everywhere as all functions dealing with
> > > > single lines eventually end up calling bulk counterparts.
> > > >
> > > > I have some ideas for making this structure smaller and I thought I'd
> > > > run them by you.
> > > >
> > > > The most obvious approach would be to make struct gpiod_line_bulk
> > > > opaque and dynamically allocated. I don't like this idea due to the
> > > > amount of error checking this would involve and also calling malloc()
> > > > on virtually every value read, event poll etc.
> > > >
> > > > Another idea is to use embedded list node structs (see include/list.h
> > > > in the kernel) in struct gpiod_line and chain the lines together with
> > > > struct gpiod_line_bulk containing the list head. That would mean only
> > > > being able to store each line in a single bulk object. This is
> > > > obviously too limiting.
> > > >
> > >
> > > I don't think I've ever gotten my head fully around the libgpiod API,
> > > or all its use cases, and I'm not clear on why this is too limiting.
> > >
> >
> > For instance: we pass one bulk object to gpiod_line_event_wait_bulk()
> > containing the lines to poll and use another to store the lines for
> > which events were detected. Lines would need to live in two bulks.
> >
>
> Ahh, ok.  So you want to keep that?  I prefer a streaming interface, but
> I guess some prefer the select/poll style?
>

Yeah I wanted to keep it. Why? We allow plugging into external event
loops by providing a helper for accessing the underlying file
descriptor but I think we still should have some basic wrappers for
poll(). What exactly are you referring to as "streaming interface"?

> > > What is the purpose of the gpiod_line_bulk, and how does that differ from the
> > > gpio_v2_line_request?
> > >
> >
> > struct gpiod_line_bulk simply aggregates lines so that we can easily
> > operate on multiple lines at once. Just a convenience helper
> > basically.
> >
> > > > An idea I think it relatively straightforward without completely
> > > > changing the current interface is making struct gpiod_line_bulk look
> > > > something like this:
> > > >
> > > > struct gpiod_line_bulk {
> > > >     unsigned int num_lines;
> > > >     uint64_t lines;
> > > > };
> > > >
> > > > Where lines would be a bitmap with set bits corresponding to offsets
> > > > of lines that are part of this bulk. We'd then provide a function that
> > > > would allow the user to get the line without it being updated (so
> > > > there's no ioctl() call that could fail). The only limit that we'd
> > > > need to introduce here is making it impossible to store lines from
> > > > different chips in a single line bulk object. This doesn't make sense
> > > > anyway so I'm fine with this.
> > > >
> > > > What do you think? Do you have any other ideas?
> > > >
> > >
> > > Doesn't that place a strict range limit on offset values, 0-63?
> > > The uAPI limits the number of offsets requested to 64, not their value.
> > > Otherwise I'd've used a bitmap there as well.
> > >
> > > Or is there some other mapping happening in the background that I'm
> > > missing?
> > >
> >
> > Nah, you're right of course. The structure should actually look more like:
> >
> > struct gpiod_line_bulk {
> >     struct gpiod_chip *owner;
> >     unsigned int num_lines;
> >     uint64_t lines;
> > };
> >
> > And the 'lines' bitmap should actually refer to offsets at which the
> > owning chip stores the line pointers in its own 'lines' array - up to
> > 64 lines.
> >
> > But we'd still have to sanitize the values when adding lines to a bulk
> > object and probably check the return value. I'm wondering if there's a
> > better way to store group references to lines on the stack but I'm out
> > of ideas.
> >
>
> So you are proposing keeping the bulk of the bulk in the background and
> passing around a flyweight in its place.  Makes sense.
>

Precisely that.

Bartosz
