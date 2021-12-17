Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256554787FF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhLQJoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhLQJoL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:44:11 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26DDC061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:44:10 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id x15so5675712edv.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S69u0FcthZA663GUNx3M7sgiqpITSGaqUjyxG1mJFuA=;
        b=RiuIFWeB/KEif+XV3snJtlOOteFWp/Hd0UenB6ZN+/C2zSGX2xT9fEZsvPcVX1fs4T
         Li2gi4vNIpygF4VfW1SoqiMHGAx4HDljADlulMstdaofSrFY4wUwDxk9Yn0C3wDVRzIp
         9ChG99lUKBUo1kl66IRiKcisfmm5j0m1vAo/G5+8AyWdJeFLjZEabOFLr3b6lsMGsNrS
         BDe3b5P9ji1qitYZksBb9qLHqkQ4y/70iKyYGXjOhoR3kTz7BNKiI2DkGaoJdHYfqamT
         ct6XyHljKC5vEU68NO63BSwNguxS+XaB3cH5fdTqaTfefiikpqNINIz/t/Vj4pj1eJNB
         zGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S69u0FcthZA663GUNx3M7sgiqpITSGaqUjyxG1mJFuA=;
        b=C+XcZ8tFsscT/B2hVLcE1GpWbueoh7uGhhNNwMieQdE2U4ln03skcd5tdMwUlEi8qJ
         fiPZOWTGMSXRuBTdD6TdsPIxrl0z6rkasNSdXA2E0Xjo6TeidRFj/7pXU+yP4InhxbF0
         kobLzddfyA3Vy1nNaniSLM+Vo540DOB7/ttpK+/+5GoZ/BmcRD+cb9umipn6wMZAq2+w
         +g91ApTkj8wvBnRy2oBTpJ7IHf1FQ4kMoBIZrJrbl8yr/FkrCAHvKtdgN3hS3J8AP7rT
         gO6ae34w3N9Na7C4iUbqGnKoY49BWPBRsnTqUEe927cjTkBDD/0M9p95nuVpVieYSyAj
         Dpow==
X-Gm-Message-State: AOAM5316sZuHB5amN/m9FCLy8wSZ9EmsvXcCunMFGrk5kZfEpJAC+e1z
        0Chy8le1ehnyV+cJzE5ksbFUDh3tmC96IgrXSq5UDQ==
X-Google-Smtp-Source: ABdhPJwDS9FT9mlpVP3OJpeujmyd0XHEI1fuE0If2kIMzDSGXFIAcPybcnshsvGjmkExqzwKmjNDuR+84oYohj30O4M=
X-Received: by 2002:a50:e611:: with SMTP id y17mr2116296edm.270.1639734249343;
 Fri, 17 Dec 2021 01:44:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7> <CAMRc=MeP7xPsaiEoJ4ML8SNMo7BH9pb34eUkG6+3SLf+A=biMA@mail.gmail.com>
 <20211217093239.to4u5b5zorr2hpee@vireshk-i7>
In-Reply-To: <20211217093239.to4u5b5zorr2hpee@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Dec 2021 10:43:58 +0100
Message-ID: <CAMRc=Md33nLhMMOSQgQXW5hzXFbkPE3P9Drkj6DK543-cSjCaA@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

On Fri, Dec 17, 2021 at 10:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-12-21, 10:12, Bartosz Golaszewski wrote:
> > No, it's a different story altogether. In C the buffer allocates
> > memory for events and when you "get" an event, you only have a pointer
> > to the memory space in the buffer that you must not free. But you can
> > "copy" an event with gpiod_edge_event_copy() which returns you a deep
> > copy of the event that will survive the parent and that must be freed
> > with gpiod_edge_event_free(). This is done so that by default we try
> > to limit the number of allocations (as there can be a lot of events)
> > unless the user decides to manually copy the event.
> >
> > In C++ I used that mechanism together with the buffer's const
> > event_get() and event's copy assignment operator. "Getting" an event
> > returns a const reference to the event (still in buffer's memory) but
> > copying it triggers a deep copy. The memory management is of course
> > handled by the destructor.
> >
> > This is not used in Python as speed is no longer a concern and we'd be
> > creating new python objects anyway. But in Rust, I think it makes
> > sense to reuse this mechanism.
>
> Ahh, what about this then, it just caches all the values when the event is
> requested ?
>
> pub struct EdgeEvent {
>     event_type: LineEdgeEvent,
>     timestamp: Duration,
>     line_offset: u32,
>     global_seqno: u64,
>     line_seqno: u64,
> }
>

Then does it make sense to make it a binding to libgpiod? :)

I don't know Rust that well to be able to come up with an idea off the
top of my head but I assume inheritance in one way or another exists
in rust? Can you have an EdgeEvent interface implemented by two
specialized structs, one that's stored in the buffer (stores a pointer
to the internal event) and one that stores the copy (and frees it when
it goes out of scope)?

Bart
