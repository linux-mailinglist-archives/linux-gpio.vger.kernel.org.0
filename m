Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01356478ABF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 13:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhLQMCU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 07:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhLQMCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 07:02:19 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5B1C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 04:02:19 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id z7so6828813edc.11
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8wosAwyrR6VljhsOchzxVh5KWh7HJDzHnE4J5mt7FHg=;
        b=tmTj3awKHY9kcPxpujnh8QbOSwUOY+Jy9mnHn2OQxKDofrzsonypHL1gKYaQY/ier/
         JxCsS2PlcludPEnJq49qlOFvIhAGg+6rus3QMewxstmn/Dzpv08YYkPNQpbOToZxnwdu
         MS4tPmVBbMiy08jw1e3Pl251w2rW5+pDgLzvRiFZKiRSWqkAu6qK357otiVDqMwHTf/5
         O5Bouw/jznxFlDGXGyVeMLbwL8OQ352l5qU/VkSOHIqHhwE2UMjeQ4E5TVVP4RdOS76+
         g7MrWfsPZofwkj1PMlPkhqkfiGiLE6MAZIJV8SXUmm+QZeluy0HNJ+96MjZWVdhxin0a
         Z5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8wosAwyrR6VljhsOchzxVh5KWh7HJDzHnE4J5mt7FHg=;
        b=uTpG6tloaqFK+4amB32G0OUz5qMR/1p5ZCRXTj4UzAtxzctymVqKy4nYidnpOxTYNp
         s/FpVzRsvttJ5yOdLygZQdpGHYPGtiSJ4F8WW9jBdLWdSaG3BU62sDoutcJAxWZ3s9c/
         bL0tFUQCQjd9Qg/Fn3hAPh+UA9R6XNAaqm0wa1BEi6jG/bTQceugc2SPRpwVL3MJT4rJ
         JZfhDAre4fGTFnF8+gHrMHW1Drr/qd2o3sHWnC30BzckzE7EepFZq2S7pUi5GbfHqhcC
         xUCQ6XGPMjKncASriMSuqfRCyB622WaNdV1ZfNhMLDlbjQ2JA4FPkWKyGwH5bmdtbze2
         OD3Q==
X-Gm-Message-State: AOAM530GU6C0mfBDKxz7K58ioy2aaMJutP1RS1YILYiqyBwlT7h9HUnO
        Z6vefT7hs6pMfu5+tOl84tPWyOe2zVC3wTYKXdLM9g==
X-Google-Smtp-Source: ABdhPJwFvVPgA/7AyXMJsVCU8BCQiz8GLsFtRImYMU7p58YFBEMo0V9sXLerXYFhfSN4UDeghqWKMKfKciMXFR1Vjlk=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr2296463ejb.492.1639742537689;
 Fri, 17 Dec 2021 04:02:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7> <CAMRc=MeP7xPsaiEoJ4ML8SNMo7BH9pb34eUkG6+3SLf+A=biMA@mail.gmail.com>
 <20211217093239.to4u5b5zorr2hpee@vireshk-i7> <CAMRc=Md33nLhMMOSQgQXW5hzXFbkPE3P9Drkj6DK543-cSjCaA@mail.gmail.com>
 <20211217095415.axgq7t6pni5sb7rp@vireshk-i7>
In-Reply-To: <20211217095415.axgq7t6pni5sb7rp@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Dec 2021 13:02:06 +0100
Message-ID: <CAMRc=Meh7Q=01PpM6vuwMf2S5at2OsSyNT5jXqnUE_f+n0vzXg@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 10:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-12-21, 10:43, Bartosz Golaszewski wrote:
> > On Fri, Dec 17, 2021 at 10:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 17-12-21, 10:12, Bartosz Golaszewski wrote:
> > > > No, it's a different story altogether. In C the buffer allocates
> > > > memory for events and when you "get" an event, you only have a pointer
> > > > to the memory space in the buffer that you must not free. But you can
> > > > "copy" an event with gpiod_edge_event_copy() which returns you a deep
> > > > copy of the event that will survive the parent and that must be freed
> > > > with gpiod_edge_event_free(). This is done so that by default we try
> > > > to limit the number of allocations (as there can be a lot of events)
> > > > unless the user decides to manually copy the event.
> > > >
> > > > In C++ I used that mechanism together with the buffer's const
> > > > event_get() and event's copy assignment operator. "Getting" an event
> > > > returns a const reference to the event (still in buffer's memory) but
> > > > copying it triggers a deep copy. The memory management is of course
> > > > handled by the destructor.
> > > >
> > > > This is not used in Python as speed is no longer a concern and we'd be
> > > > creating new python objects anyway. But in Rust, I think it makes
> > > > sense to reuse this mechanism.
> > >
> > > Ahh, what about this then, it just caches all the values when the event is
> > > requested ?
> > >
> > > pub struct EdgeEvent {
> > >     event_type: LineEdgeEvent,
> > >     timestamp: Duration,
> > >     line_offset: u32,
> > >     global_seqno: u64,
> > >     line_seqno: u64,
> > > }
> > >
> >
> > Then does it make sense to make it a binding to libgpiod? :)
>
> Yes, because EdgeEvent::new() gets all these values from the internal C libgpiod
> library itself. We are going to make the same copy of data, either at the C
> library level, or here.
>
> > I don't know Rust that well to be able to come up with an idea off the
> > top of my head but I assume inheritance in one way or another exists
> > in rust? Can you have an EdgeEvent interface implemented by two
> > specialized structs, one that's stored in the buffer (stores a pointer
> > to the internal event)
>
> This is what my initial patch had, right? It isn't safe. There is no way for
> libgpiod-rust to guarantee that the users don't access the EdgeEvent after the
> buffer is freed and this needs to be made safer at libgpiod itself.
>

I'm not sure it had the same thing. In libgpiod it's simple a matter
of definition. The docs state that a pointer retrieved using
gpiod_edge_event_buffer_get_event() must not be freed while one
obtained with gpiod_edge_event_copy() does have to be disposed of. In
C++ it's safe because either you hold a const reference to the object
stored in the event buffer or you have copied it and now it will
survive the parent meaning the user can access the event even after
the buffer was deleted.

> > and one that stores the copy (and frees it when
> > it goes out of scope)?
>
> I don't understand what we will get out of such a scheme? Is there any benefit
> of getting these values via the pointer to the internal C event ?
>

You avoid allocating memory for those objects. The memory exists in
the C buffer. In order to keep a similar level of performance you'd
need to replicate the behavior of the buffer in rust as well.

Bart

> Any user that wants to use the edge-event data, needs to call the edge-event
> APIs at least once and this is what the new version does, just calls them from
> new() itself.
