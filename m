Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95BC3A3198
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 18:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhFJRAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 13:00:13 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:39882 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhFJRAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 13:00:13 -0400
Received: by mail-il1-f178.google.com with SMTP id h16so2517582ila.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0X69O8OJs898lKTihB59RN3w4SBwx9KHHnsAenVewI4=;
        b=MrDWnNTX6UU0dgPyVnPoaAwTdlrdSYBcFnMHsFmtnT5nmCLJZBqoxDdFl00SFduCeW
         fqk+vlydPeX9YBL3b+ulXL23uiuGPCVZtV4S90UCLscus1N0mm/jxeR7MHbyBQ8E2QxD
         jF0Nj0hhQ6HFsy7QrKDV1SgUHCWUwGWVfotwBtADyV+QHZwPkuCwTqq+HD83OYgrQOBn
         zjKzIMbJ3IxW903rDc/kU8TK49lWRCQ8dK9BYL6hqFqRmOHldjMuDcoHRfbqyE3lKzSs
         HO8YOIsWMkwxsUdX1KkZK00lqMvHCe3seWkcDIWMsEmskwgwO+tDyZkAh4pL0mG6fA2J
         1k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0X69O8OJs898lKTihB59RN3w4SBwx9KHHnsAenVewI4=;
        b=dcc3xud4mmJ8kXfP4II2xUnvE7d9XUCNEz/zH8MtFOyHGFyxDQkDa1EBM48SI3zbhS
         wXVAa43kFlg+FU8m8PRUJA8Fh1iAoI3IPawtiqkbdL0vPcQln1/SoUD3BCoX+INzrowU
         cytmohEqRKsT+ej4WJc2zGrpPQSwakutNk6fbRyyLiCFvw30Lq7RiJneVarT621hTRhF
         xF4C6VFkbAEYEuGayQIDFtXvyA4bHIrCGezBN05bUTr8P8+AHGGpLbDnb6VnRt+b07u2
         pN1Gz6kUMICG/c5ciVVrVvblDpZ4KPL3T4ku6Y/+oBa0o7Ay3a5yicuV51oFkHzFCWqj
         9Cew==
X-Gm-Message-State: AOAM530k4juUTV89pV+03hDo4MxL0r8PG76E8Ab+zswq1KhFUF+78nK1
        woCS3nhWOI1aaXPuh0rjvF9ttiO6GC1sADaWkGCPqQ==
X-Google-Smtp-Source: ABdhPJzvvpd9vpgMr61oKKUPqSKUbzq+CFCSV14x8+buD6sK508dF1frWVtuvrj42uvJsInWXupzdjC/cqHeREHAuvc=
X-Received: by 2002:a92:7607:: with SMTP id r7mr4800102ilc.31.1623344236838;
 Thu, 10 Jun 2021 09:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <96994f4c-8755-90a8-0c50-4e21c436f137@metux.net>
In-Reply-To: <96994f4c-8755-90a8-0c50-4e21c436f137@metux.net>
From:   Viresh Kumar <viresh.kumar@linaro.org>
Date:   Thu, 10 Jun 2021 22:27:05 +0530
Message-ID: <CAKohpokxSoSVtAJkL-T_OOoS8dW-gYG1Gs5=_DwebvJETE48Xw@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Enrico,

On Thu, 10 Jun 2021 at 21:24, Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 10.06.21 14:16, Viresh Kumar wrote:
> > From: "Enrico Weigelt, metux IT consult" <info@metux.net>
> >
> > This patch adds a new driver for Virtio based GPIO devices.
> >
> > This allows a guest VM running Linux to access GPIO device provided by
> > the host. It supports all basic operations for now, except interrupts
> > for the GPIO lines.
>
> What exactly did you change here from my original driver ?

I didn't write it from scratch and used your patch only to start with, and so
you are still the Author of this particular patch.

This just followed the specification updates and so changes only the stuff
that was different from your original specs. Apart from that as you know,
the irqs weren't working in your case as they needed to be implemented
differently (patch 2 does that) here.

> Your already changed the spec havily (w/o consulting me first),

Isn't that what we are doing on the list? I believe that's why the lists
exist, so people don't need to discuss in person, offline. I am happy to
make changes in spec if you want to suggest something and if something
breaks it for you.

> so I guess this driver hasn't so much in common w/ my original design.

It actually has as I said earlier, it is still based on your patch.

> Note that I made my original design decisions for good reaons
> (see virtio-dev list).

I tried to follow your patches from December on the Linux kernel list
and the ID allocation one on virtio-comments list. I wasn't able to search
for any other attempt at sending the specification, so may have missed
something.

I do understand that there were reasons why you (and me) chose a
particular way of doing things and if there is a good reason of following
that, then we can still modify the spec and fix things for everyone.
We just need to discuss our reasoning on the list and get through with
a specfication which works for everyone as this will become a standard
interface for many in the future and it needs to be robust and efficient
for everyone.

> It already support async notifications
> (IOW: irqs), had an easy upgrade path for future additions, etc.

I haven't changed irqs path, we still have a separate virtqueue
(named "interrupt" vq) which handles just the interrupts now. And so
will be faster than what you initially suggested.

In your original design you also received the responses for the requests
on this virtqueue, wihch I have changed to get the response synchronously
on the "command" virtqueue only.

This is from one of your earlier replies:

"
I've been under the impression that queues only work in only one
direction. (at least that's what my web research was telling).

Could you please give an example how bi-directional transmission within
the same queue could look like ?
"

It is actually possible and the right thing to do here as we aren't starting
multiple requests together. The operation needs to be synchronous anyway
and both request/response on the same channel work better there. Also that
makes the interrupts reach faster, without additional delay due to responses.

> Note #2: it's already implemented and running in the field (different
> kernels, different hypervisors, ...) - it just lacked the going through
> virtio comitte's formal specification process, which blocked mainlining.

I understand the pain you would be reqiured to go through because of this,
but this is how any open source community will work, like Linux.

There will be changes in specification and code once you post it and any
solutions already working in the field won't really matter during the
discussion.
That is why it is always the right thing to _upstream first_, so one can avoid
these problems later on. Though I understand that the real world
needs to move faster than community. But no one can really help in that.

> Is there anything fundamentally wrong w/ my original design, why you
> invented a completely new one ?

Not much, and I haven't changed a lot as well.

Lemme point out few things which have changed in specification since
your earlier
version (the code just followed the specification, that's it).

- config structure
  - version information is replaced with virtio-features.
  - Irq support is added as a feature, as you suggested.
  - extra padding space (24 bytes) removed. If you see this patch we can
    now read the entire config structure in a single go. Why should
anyone be required
    to copy extra 24 bytes? If we need more fields later, we can
always do that with help
    of another feature-flag. So this is still extendable.

- Virtqueues: we still have two virtqueues (command and interrupt),
just responses are
  moved to the command virtqueue only, as that is more efficient.

- Request/response: Request layout is same, added a new layout for response as
  the same layout is inefficient.

- IRQ support: Initial specification had no interface for configuring
irqs from the guest,
  I added that.

That's all I can gather right now.

I don't think that's a lot and it is mostly improvements only. But if
there is a good reason
on why we should do things differently, we can still discuss that. I
am open to suggestions.

Thanks

--
Viresh
