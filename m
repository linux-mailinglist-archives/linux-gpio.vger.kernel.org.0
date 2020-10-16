Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EC0290E2A
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Oct 2020 01:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411395AbgJPX13 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 19:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410982AbgJPX13 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 19:27:29 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02773C061755;
        Fri, 16 Oct 2020 16:28:00 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o7so2313713pgv.6;
        Fri, 16 Oct 2020 16:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SP+KBYRsWAwNJ377jSWQRS8cBSibUjlr5j/m3lt9MG0=;
        b=MmThpix+ZzyvfKh2AscddHdUT8I+PNiXIObhOGRWzqNIFPtkXUAqxBQK80QNXl9QxC
         CNDqxePwK+kg2+mQA9VchRGLUwOOpoPAaTWz7qgpB/uFWoZ3TodF2ypMUeSVDeanymBX
         AszBTkjTwu7gWiUGMVVNfj/2rUvWaGS3U3IXsaUwVU/7SrU/mBazUm3OcAtweUnV0Lma
         UW/K9MDDhi0uSY5qupB49MDbT21qmCHXLuDy1CkvDkBxdGgiK2yr1y4HR8655VTG1VkT
         W5P/cXVefZvnnERcIA3VN7Q8meZT3yP5FWeQe6PmhHC3ZiVqFg/bMnWoJHyXz4HokiQq
         CM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SP+KBYRsWAwNJ377jSWQRS8cBSibUjlr5j/m3lt9MG0=;
        b=gi+NwLt39czIgnsimFBA62EA2V3AxuEKR4X97EN14JFtpMNu9B7Vb8PnEUxevDAY2w
         Q2glvCjrHaW9ZQ5J9CsXnxVPZ1fkNhpB1cLgZWKmra3rypv5IPkV7xK70lnNtzmAlPqg
         R4mHUk4hVCbk6js4emzcmVMmwy8qDtsgIFNoC4YnszPQFwtFKNo/MoCH2qXuI8cX3uJY
         UfG7naW6+VU3HJcyFBPmUchmtqc6mqDj7ECEE5aQrrzejdgUo0ChRqYFsDqbsTmxVleQ
         B744tpadcj3o3MEcC4dWZpzG893aC4tZ9E60m96bBo0caycCTSkgjz4GHd3cR/Cju+W8
         vKag==
X-Gm-Message-State: AOAM531F0kMEmbvJdCMrq7Xku7wBXZp1nDNA/qbU0S4L1PzG3rTIqM4h
        3c6lfW1M0m2boao1TlrZifk=
X-Google-Smtp-Source: ABdhPJzcLLpKBCz8VLeE68GhB64WLBu2n95LN54HcIMuSvI2jQXTbJyfcONEoTwkGJRP2gwZ0fiI7g==
X-Received: by 2002:a62:17c2:0:b029:158:ca2e:3cd7 with SMTP id 185-20020a6217c20000b0290158ca2e3cd7mr5868101pfx.43.1602890880311;
        Fri, 16 Oct 2020 16:28:00 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id y4sm3750502pgl.67.2020.10.16.16.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 16:27:59 -0700 (PDT)
Date:   Sat, 17 Oct 2020 07:27:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jack Winch <sunt.un.morcov@gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
Message-ID: <20201016232753.GA5143@sol>
References: <20201014231158.34117-1-warthog618@gmail.com>
 <20201014231158.34117-2-warthog618@gmail.com>
 <CAHp75VcAf8i=jEdDFntpDfLBDMWoJh+ykHBTBRX53B9L+yFNUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcAf8i=jEdDFntpDfLBDMWoJh+ykHBTBRX53B9L+yFNUA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 05:13:22PM +0300, Andy Shevchenko wrote:
> On Thu, Oct 15, 2020 at 6:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Using CLOCK_REALTIME as the source for event timestamps is crucial for
> > some specific applications, particularly those requiring timetamps
> > relative to a PTP clock, so provide an option to switch the event
> > timestamp source from the default CLOCK_MONOTONIC to CLOCK_REALTIME.
> >
> > Note that CLOCK_REALTIME was the default source clock for GPIO until
> > Linux 5.7 when it was changed to CLOCK_MONOTONIC due to issues with the
> > shifting of the realtime clock.
> > Providing this option maintains the CLOCK_MONOTONIC as the default,
> > while also providing a path forward for those dependent on the pre-5.7
> > behaviour.
> 
> ...
> 
> >          GPIO_V2_LINE_DIRECTION_FLAGS | \
> >          GPIO_V2_LINE_DRIVE_FLAGS | \
> >          GPIO_V2_LINE_EDGE_FLAGS | \
> > +        GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
> 
> Wondering if we would have something like
> 
>           GPIO_V2_LINE_CLOCK_FLAGS | \
> 
> here for the sake of consistency.
> 

I considered it, but thought the chance of there ever being another
CLOCK flag to be near zero - the remaining clocks relate to CPU or
thread time which don't have any relevance for external events like
GPIO.  If there ever is one we can split it out then.

And it is consistent with the GPIO_V2_LINE_FLAG_ACTIVE_LOW flag that you
pruned out in your response. i.e. lone flags don't get grouped.

> >          GPIO_V2_LINE_BIAS_FLAGS)
> 
> ...
> 
> > +static u64 line_event_timestamp(struct line *line)
> > +{
> 
> > +       if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
> 
> I dunno if we can actually drop the word EVENT from these definitions.
> I don't think we would have in the near future something similar for
> the non-event data.
> 

I considered this too, as another clock flag seems unlikely.
But if we ever add a non-event clock flag then this one would become
confusing, and the overhead of the long name seemed minor compared to
the clarity it brings with it.

Cheers,
Kent.
