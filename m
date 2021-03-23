Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17618345726
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 06:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhCWFW3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 01:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCWFW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 01:22:28 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5944EC061574;
        Mon, 22 Mar 2021 22:22:28 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so9630091pjv.1;
        Mon, 22 Mar 2021 22:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5d7kvVVMy7MELuXc/Wt0jPV+HQWi2++qw/bDdyFDozc=;
        b=UTq3ORBpzauifc2KeA5bYrxQCCyVAHGrX3PIqU5Z4vxASCKZofFg1gNJIokQ8chrJj
         D99rLpekYw/KoVBuRiUNwSYasysjwwj+qjzrCSDOlM3apBKM2ibwpYHssQ74SS8XwRVU
         hroINNHsHVxI60G5R18zLp48RpgFpNUg/VTOZKRo4wor5spWBkcLb6ce0QyXmXjtGUbY
         tCmb7nYRkaLGgwlijHKlDaQwzbNnjZpg6yGIDbbIyVlxmS3eYRzIeDRr61OFLXFtvCuN
         RcRRlBblqHg4s0892MKX3aKl4ENNXPYpbtMWHJyZpiAd06KS2VyPHlugQ8kd09YM5kor
         mW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5d7kvVVMy7MELuXc/Wt0jPV+HQWi2++qw/bDdyFDozc=;
        b=dT2eWRwl2GX6rPVMeI1rZtmuRKsCB7YPkWjgD0AOUWZn88dljmT64QjafjfUZoY1K/
         sVkcMZA2s2sMlj2LjZEcQ9B8rPSItYrLahr7iop3H17+McO7+GavR1VJ7lk7r/pMxxbw
         A0jYAHLHt1RfB1fWQORyxIE8M/E8LTIkmslVE4oCQXsrf+c/TwLpZRJIO+wYGMdUZmgI
         0oqOnBjiwzql8957F8k5BJc661g8sh9Q5BqSx77jKn1n9cSbUmc5iRX1loXZfYHw4MmC
         FA6e5x+Sbr55d3uELkJ5vZRLwYCwxd42YWhM2cYwj5QPTFgECeCHdqR8FKHY/2V4tnw1
         /rOw==
X-Gm-Message-State: AOAM5300RU7LY79mddBAh5JiqQcqdypoyV8Vq8B9FAt8uXBUzUZNF73r
        W59KSu1CJ738MGz1LITCMn+DdlpDu+I=
X-Google-Smtp-Source: ABdhPJxC60lZNnwamgzDnnvFWeFHZ2S0ra37zsHYq7IHGN90MF4l+DgBFac8G49BoxebHd1SvCFxfQ==
X-Received: by 2002:a17:90a:7a8b:: with SMTP id q11mr2746084pjf.215.1616476947874;
        Mon, 22 Mar 2021 22:22:27 -0700 (PDT)
Received: from sol (106-69-186-212.dyn.iinet.net.au. [106.69.186.212])
        by smtp.gmail.com with ESMTPSA id q10sm15707995pfc.190.2021.03.22.22.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 22:22:27 -0700 (PDT)
Date:   Tue, 23 Mar 2021 13:22:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>
Subject: Re: GTE - The hardware timestamping engine
Message-ID: <20210323052221.GA36246@sol>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
 <20210323003208.GA6105@sol>
 <7961d9df-4120-e37c-d042-528655bd0270@nvidia.com>
 <20210323025933.GA10669@sol>
 <16ff9b8a-15d9-f2fd-24f4-817a7078c40e@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16ff9b8a-15d9-f2fd-24f4-817a7078c40e@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 09:09:50PM -0700, Dipen Patel wrote:
> 
> 
> On 3/22/21 7:59 PM, Kent Gibson wrote:
> > On Mon, Mar 22, 2021 at 06:53:10PM -0700, Dipen Patel wrote:
> >>
> >>
> >> On 3/22/21 5:32 PM, Kent Gibson wrote:
> >>> On Mon, Mar 22, 2021 at 01:21:46PM -0700, Dipen Patel wrote:
> >>>> Hi Linus and Kent,
> >>>>
> > 
> > [snip]
> > 
> >>> In response to all your comments above...
> >>>
> >>> Firstly, I'm not suggesting that other kernel modules would use the
> >>> cdev lineevents, only that they would use the same mechanism that
> >>> gpiolib-cdev would use to timestamp the lineevents for userspace.
> >>>
> >> Sure, I just wanted to mention the different scenarios and wanted to know
> >> how can we fit all those together. Having said that, shouldn't this serve
> >> an opportunity to extend the linevent framework to accommodate kernel
> >> drivers as a clients?
> >>
> >> If we can't, then there is a risk of duplicating lineevent mechanism in all
> >> of those kernel drivers or at least in GTE framework/infrastructure as far
> >> as GPIO related GTE part is concerned.
> >>  
> > 
> > In-kernel the lineevents are just IRQs so anything needing a "lineevent"
> > can request the IRQ directly.  Or am I missing something?
> > 
> 
> In the GPIO context, I meant we can extend line_event_timestamp to kernel
> drivers as well in that way, both userspace and kernel drivers requesting
> particular GPIO for the hardware timestamp would be managed by same
> lineevent_* infrastructure from the gpiolib. Something like lineevent_create
> version of the kernel drivers, so if they need hardware timestamp on the
> GPIO line, they can request with some flags. In that way, GTE can leverage
> linevent* codes from gpiolib to cover its both the GPIO related use cases i.e.
> userspace app and kernel drivers.
> 

I still don't see what that gives you that is better than an IRQ and a
function to provide the timestamp for that IRQ.  What specific features
of a lineevent are you after?

The gpiolib-cdev code is there to provide a palettable API for userspace,
and the bulk of that code is specific to the userspace API.
Reusing that code for clients within the kernel is just introducing
pointless overhead when they can get what they need more directly.

There may be a case for some additional gpiolib/irq helper functions, but
I don't see gpiolib-cdev as a good fit for that role.

> >>> As to that mechanism, my current thinking is that the approach of
> >>> associating GTE event FIFO entries with particular physical IRQ events is
> >>> problematic, as keeping the two in sync would be difficult, if not
> >>> impossible.
> >>>
> >>> A more robust approach is to ignore the physical IRQs and instead service
> >>> the GTE event FIFO, generating IRQs from those events in software -
> >>> essentially a pre-timestamped IRQ.  The IRQ framework could provide the
> >>> timestamping functionality, equivalent to line_event_timestamp(), for
> >>> the IRQ handler/thread and in this case provide the timestamp from the GTE
> >>> event.
> >>>
> >>
> >> I have not fully understood above two paragraphs (except about
> >> lineevent_event_timestamp related part).
> >>
> >> I have no idea what it means to "ignore the physical IRQs and service the
> >> GTE event FIFO". Just like GPIO clients, there could be IRQ clients which
> >> want to monitor certain IRQ line, like ethernet driver wanted to retrieve
> >> timestamp for its IRQ line and so on.
> >>
> > 
> > I mean that in the IRQ framework, rather than enabling the physical IRQ
> > line it would leave that masked and would instead enable the FIFO line to
> > service the FIFO, configure the GTE to generate the events for that
> > line, and then generate IRQs in response to the FIFO events.
> > That way the client requesting the IRQ is guaranteed to only receive an
> > IRQ that corresponds to a GTE FIFO event and the timestamp stored in the
> > IRQ framework would match.
> > 
> 
> I do not think we need to do such things, for example, below is
> the rough sequence how GTE can notify its clients be it GPIO or IRQ
> lines. I believe this will also help understand better ongoing GPIO
> discussions.
> 
> 1. Configure GTE FIFO watermark or threshold, lets assume 1, i.e
>    generate GTE interrupt when FIFO depth is 1.
> 2. In the GTE ISR or ISR thread, drain internal FIFO entries
> 3. Through GTE driver's internal mapping, identify which IRQ or
>    GPIO number this entry belongs to. (This is possible as GTE
>    has predefined bits for each supported signals, for example GTE
>    supports 40 GPIOs and 352 IRQ lines, and it has multliple GTE instances
>    which can take care all of them)
> 4. GTE driver pushes the event data (in this case it will be timestamp and
>    direction of the event ie.rising or falling) to the GTE generic framework
> 5. GTE framework will store per event data to its per client/event sw FIFO
> 6. wake up any sleeping client thread
> 7. Points 3 to 6 are happening in GTE ISR context. 
> 8. gte_retrieve_event (which can block if no event) at later convenient
>    time do whatever it wants with it. We can extend it to non blocking
>    version where some sort of client callbacks can be implemented.
> 

Don't see where that conflicts with my suggestion except that I moved
everything, other than the hardware specific configuration, under the IRQ
umbrella as a lot of the functionality, in the abstract, aligns with IRQ.

If you want to reduce duplication shouldn't GTE be integrated into IRQ
rather than providing a new service?

As I see it, GTE is just another event source for IRQ, and I'd be
exploring that path. But that is just my view.

Cheers,
Kent.

