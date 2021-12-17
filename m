Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD735478829
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbhLQJyT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbhLQJyS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:54:18 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F77DC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:54:18 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id m15so1598864pgu.11
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UnWMz+Jwe0GvNUp24gp+13lrIYF/68v2f6oYYxFmL9w=;
        b=f+/imBERVIaehMfldAlw4o83bEYH1/4MzJ1a8/FXCQGY08ypdlhyrnhlRov6GlKJNp
         XAgvaApvHIkdXcxKuiFWiWlNVHVFUgSImFKQ91JpvfAg6Ow9HbEWeqbcy/gDy8SOXazX
         FzmSuZhNMUepOjAS2zUH1PiUMMu50xQCSMy0wFpMz1P57OLriZoUdV4FxsMV3a3jHtcT
         cc8TP4mUEoG9VFc7QrJP557Y6DFsVtsjw28Duby4YKhjgP6MPtnxkAyLtkzmzq80GFvh
         W2aFf+f27HUU1kXJaGMQDDvPr2FUVkHmc9Xk80PHq/Id1b8QCpLL6mCTx2MGSCuhf5+o
         74Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UnWMz+Jwe0GvNUp24gp+13lrIYF/68v2f6oYYxFmL9w=;
        b=xE9uetUbFaNInIz9aWnna0KvrZxgrbNGQHkWnfeYrXcu8/dhDvPz0v4DOCAaWtmbgk
         BkmcYts1A0rxEMQfKMM5xFdwMd0ERPtVg2vssQtBzDwf4XJRsMxh29gfQcei/GMlBzLq
         HT5yTbmq8+7cqbU5WQ8I0t7lWCz9m78R3NKop3v7jh+mVsNmU7+/VUjW7L/hF5xL9jsW
         God5CPJx2Qj3y0tT1qsxbFa4gRbUXdVz9TUkoO3Uy/IHb9QnXsP33xzW4YMiRWon27WF
         +G28CoF9oq3Tl2W37mlMrBDwId7SJSVXANYLquLa2GZ2GRf/DmRn+ntXvdydyuHCSVtQ
         dk3A==
X-Gm-Message-State: AOAM531syZbJv7ViFKJVrqMkjAhgQJSWUuzJ3cTkOr+ytVDwOrVPf260
        65bkxWIAlEWIk6j9uzLleMQPOg==
X-Google-Smtp-Source: ABdhPJy9gMD32GupKwBd+pmvyN86pYAJzYZmtpXTu2+FPC+7cosulAP1B6exssfoVE0ZKJm8iEtkJQ==
X-Received: by 2002:a63:90c4:: with SMTP id a187mr2225449pge.106.1639734857813;
        Fri, 17 Dec 2021 01:54:17 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id y191sm8264648pfb.124.2021.12.17.01.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 01:54:17 -0800 (PST)
Date:   Fri, 17 Dec 2021 15:24:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211217095415.axgq7t6pni5sb7rp@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
 <CAMRc=MeP7xPsaiEoJ4ML8SNMo7BH9pb34eUkG6+3SLf+A=biMA@mail.gmail.com>
 <20211217093239.to4u5b5zorr2hpee@vireshk-i7>
 <CAMRc=Md33nLhMMOSQgQXW5hzXFbkPE3P9Drkj6DK543-cSjCaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md33nLhMMOSQgQXW5hzXFbkPE3P9Drkj6DK543-cSjCaA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 10:43, Bartosz Golaszewski wrote:
> On Fri, Dec 17, 2021 at 10:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 17-12-21, 10:12, Bartosz Golaszewski wrote:
> > > No, it's a different story altogether. In C the buffer allocates
> > > memory for events and when you "get" an event, you only have a pointer
> > > to the memory space in the buffer that you must not free. But you can
> > > "copy" an event with gpiod_edge_event_copy() which returns you a deep
> > > copy of the event that will survive the parent and that must be freed
> > > with gpiod_edge_event_free(). This is done so that by default we try
> > > to limit the number of allocations (as there can be a lot of events)
> > > unless the user decides to manually copy the event.
> > >
> > > In C++ I used that mechanism together with the buffer's const
> > > event_get() and event's copy assignment operator. "Getting" an event
> > > returns a const reference to the event (still in buffer's memory) but
> > > copying it triggers a deep copy. The memory management is of course
> > > handled by the destructor.
> > >
> > > This is not used in Python as speed is no longer a concern and we'd be
> > > creating new python objects anyway. But in Rust, I think it makes
> > > sense to reuse this mechanism.
> >
> > Ahh, what about this then, it just caches all the values when the event is
> > requested ?
> >
> > pub struct EdgeEvent {
> >     event_type: LineEdgeEvent,
> >     timestamp: Duration,
> >     line_offset: u32,
> >     global_seqno: u64,
> >     line_seqno: u64,
> > }
> >
> 
> Then does it make sense to make it a binding to libgpiod? :)

Yes, because EdgeEvent::new() gets all these values from the internal C libgpiod
library itself. We are going to make the same copy of data, either at the C
library level, or here.

> I don't know Rust that well to be able to come up with an idea off the
> top of my head but I assume inheritance in one way or another exists
> in rust? Can you have an EdgeEvent interface implemented by two
> specialized structs, one that's stored in the buffer (stores a pointer
> to the internal event)

This is what my initial patch had, right? It isn't safe. There is no way for
libgpiod-rust to guarantee that the users don't access the EdgeEvent after the
buffer is freed and this needs to be made safer at libgpiod itself.

> and one that stores the copy (and frees it when
> it goes out of scope)?

I don't understand what we will get out of such a scheme? Is there any benefit
of getting these values via the pointer to the internal C event ?

Any user that wants to use the edge-event data, needs to call the edge-event
APIs at least once and this is what the new version does, just calls them from
new() itself.

-- 
viresh
