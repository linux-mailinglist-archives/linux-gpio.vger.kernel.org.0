Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5082766C0
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 05:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgIXDHj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 23:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgIXDHj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 23:07:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A37DC0613CE;
        Wed, 23 Sep 2020 20:07:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jw11so832130pjb.0;
        Wed, 23 Sep 2020 20:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=28rWiNQJ/fpGKXwaU4oq3+MWQ6cwmeiJ+gEw2jDm8bE=;
        b=jvp972loJko1MqJdsF1tHXqlak+G9sJxeKOc+E3em5MoUsphFutjlqWPAkLdQTJLNE
         TDqw1Qp1sxN0jd9ODfJoe/4oXfgOXR5g2Gxp0shPsUOSNWcq44tTCgLRYhQp6wcAR8iA
         tnPKVeFYP157WehQUP2ev6f8arC4zb3dFVrvmeEe0qt5Yp+QH7xbQZ9BctNCJDupxdyf
         H8xh5zOS8KwTN/oTq9uAKQWi4l344RNLOs4hlNH4JZGliCMXGTGPQAJT5jD0i72u9NnE
         oFED9A9Hv+pRz4B654AvZrU7w/MHXAFO+fqfLAYT7stIaMm+aJm+VOMKbvr2dcghpuJz
         zQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=28rWiNQJ/fpGKXwaU4oq3+MWQ6cwmeiJ+gEw2jDm8bE=;
        b=dXIqONMGyr87Z7ljMmvCQMHM8CQIj8FaNZbwkPnj9TkwQrKyKGKFFp7mqRHqKU3lk1
         s/Ozacwk1+J61BxI+bDXvLgAUG9z6RmmezGQkxSx4AXF6hXSchimOnVP8YQItRvbOI1A
         6pOLOj2DxpKrLgssH/dzLMj6ODC+9uDkJxd4gAaZ5Hbr78nTjwj0a3t5BpsgHw4L2M6u
         tJ9DmEyfsVRvCBwiA/ZlgKTDgwHaotT5jmA/mppZSJEZhG/NE7C+fiWFxFuUxG3Beb/S
         eAyLXptO6s91/vSnmviwt0m2Ynfssk1ziF4x7KAhKUaj1kAU1pjZzY2eklYl210VK1o6
         gA4Q==
X-Gm-Message-State: AOAM532bPdCk6P6igwrX2zX7T1jNqNtL234EHDIiIHeVu4/YizWv0sqy
        CsGkJRwTh4WXl76BzHQndDs=
X-Google-Smtp-Source: ABdhPJzB2NhqfH84NSZzCkbPKtBLOcVSi4wFvBuDQTbmh1DGZfZw214naR0IxCv/jm1wKGNk6HKcAg==
X-Received: by 2002:a17:90a:1905:: with SMTP id 5mr2004147pjg.169.1600916859059;
        Wed, 23 Sep 2020 20:07:39 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id ep24sm693690pjb.2.2020.09.23.20.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 20:07:38 -0700 (PDT)
Date:   Thu, 24 Sep 2020 11:07:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 09/20] gpiolib: cdev: support edge detection for uAPI
 v2
Message-ID: <20200924030732.GB11575@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-10-warthog618@gmail.com>
 <CAHp75VdyOodxqkJCgmrdmcppyjVkDTyHDB-fqjoKS1g-88-umQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdyOodxqkJCgmrdmcppyjVkDTyHDB-fqjoKS1g-88-umQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 06:47:28PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for edge detection to lines requested using
> > GPIO_V2_GET_LINE_IOCTL.
> >

[snip]
> 
> 
> > +       if (!overflow)
> > +               wake_up_poll(&lr->wait, EPOLLIN);
> > +       else
> > +               pr_debug_ratelimited("event FIFO is full - event dropped\n");
> 
> Under positive conditionals I meant something like this
> 
>        if (overflow)
>                pr_debug_ratelimited("event FIFO is full - event dropped\n");
>       else
>                wake_up_poll(&lr->wait, EPOLLIN);
> 

Ahh, ok.  I tend to stick with the more normal path being first, and the
overflow is definitely the abnormal path.

Also, this code is drawn from lineevent_irq_thread(), which is ordered
this way.

> > +}
> > +
> > +static irqreturn_t edge_irq_thread(int irq, void *p)
> > +{
> > +       struct line *line = p;
> > +       struct linereq *lr = line->req;
> > +       struct gpio_v2_line_event le;
> > +
> > +       /* Do not leak kernel stack to userspace */
> > +       memset(&le, 0, sizeof(le));

> > +       /*
> > +        * We may be running from a nested threaded interrupt in which case
> > +        * we didn't get the timestamp from edge_irq_handler().
> > +        */
> > +       if (!line->timestamp_ns) {
> > +               le.timestamp_ns = ktime_get_ns();
> > +               if (lr->num_lines != 1)
> > +                       line->req_seqno = atomic_inc_return(&lr->seqno);
> > +       } else {
> > +               le.timestamp_ns = line->timestamp_ns;
> > > +       }
>
> Ditto.

Firstly, drawn from lineevent_irq_thread() which is structured this way.

In this case the comment relates to the condition being true, so
re-ordering the if/else would be confusing - unless the comment were
moved into the corresponding body??


[snip]
> > +static int edge_detector_setup(struct line *line,
> > +                              u64 eflags)
> > +{
> > +       unsigned long irqflags = 0;
> > +       int irq, ret;
> > +
> > +       if (eflags && !kfifo_initialized(&line->req->events)) {
> > +               ret = kfifo_alloc(&line->req->events,
> > +                                 line->req->event_buffer_size, GFP_KERNEL);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +       line->eflags = eflags;
> > +
> > +       if (!eflags)
> > +               return 0;
> > +
> > +       irq = gpiod_to_irq(line->desc);
> > +       if (irq <= 0)
> > +               return -ENODEV;
> 
> So, you mean this is part of ABI. Can we return more appropriate code,
> because getting no IRQ doesn't mean we don't have a device.
> Also does 0 case have the same meaning?

Firstly, this code is drawn from lineevent_create(), so any changes
here should be considered for there as well - though this may
constitute an ABI change??

I agree ENODEV doesn't seem right here. Are you ok with ENXIO?

From gpiod_to_irq():

		/* Zero means NO_IRQ */
		if (!retirq)
			return -ENXIO;

so it can't even return a 0 :-| - we're just being cautious.

Cheers,
Kent.
