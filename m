Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E381F372D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 11:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgFIJns (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 05:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbgFIJnr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2020 05:43:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44758C05BD1E;
        Tue,  9 Jun 2020 02:43:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id n9so7841773plk.1;
        Tue, 09 Jun 2020 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rG9bj0Rk4HLuqYKMJ8hA9K5BLyYcd1l0KtxuRbOj+DU=;
        b=dE+75IOY5zF45wWlrTsfWdV+Vz8Ep5r0YYkywl8qMt796I2nPspLjz/+7BnudzW0oE
         pFioB6FL3xIFuxSDBwuipeMoiSDT9xu7cpco2Np7XeKfdeo48gEkGtlBfmkrMaxOSc7/
         JHYnym+10nMDlGCCcJLQDuXIYVacZuRP6X8S7L/HeRykC4AUi/BPJvfAbkafteo2VfDI
         5hd6BiJoucBq65Pd9qxXJ/QC/MNr04ml9ssoCvoVMjDjbvc1aHmr1Ex7Nml0HPR341uN
         HNQXeTA1YyfpEx95hbzuQTFEiMTUULVVY16589IvdQefKJirF5PB7bcQEJApOel48q+i
         BtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rG9bj0Rk4HLuqYKMJ8hA9K5BLyYcd1l0KtxuRbOj+DU=;
        b=MIhXtPrGJjj3TirTIbKfKgq3A/BXmP5RiwQ2zqNegFkzfHVau1So789YW1ImUcJhxj
         jeQiEpxCSGi1ENWgm0VskojBpXYFUIBM5gouBdVhN/mJQplqfx9RRykeWHzi4V3hxSXr
         ugX1Ww3i/6StJY7v0HEpGgDtSB/nLUlCcFQRmivbiNQKHMaNcnFYOLZMOmIcZsRa3+/2
         +1M4dyptk5ZBxSzDHBsKOeKNTS7OeXxXgZhQbjtTqP4FhuYSR2rAjulU8EoNj1madmF7
         6VmYwaIgeoqMXl/zBUeF+7pke00KT7Tb1cBQEbMTdlCqqu8EZAZeSddDk9HdglJsTHr1
         U7xw==
X-Gm-Message-State: AOAM531lcflKeFSwYIpgLwOvPzI37tqpEXn2F5RdF14jvNg6gdj1RqVN
        KeYtp+JdJ4PQ3/QdFAlEjdA=
X-Google-Smtp-Source: ABdhPJycI+sSTud0As9bjzcPNtGvxac9T1UKNQo5oaXs/r+WUEgTbCRmQCZs55VD4cX2nzJi3/T2yg==
X-Received: by 2002:a17:902:122:: with SMTP id 31mr2011227plb.182.1591695825589;
        Tue, 09 Jun 2020 02:43:45 -0700 (PDT)
Received: from sol (220-235-122-244.dyn.iinet.net.au. [220.235.122.244])
        by smtp.gmail.com with ESMTPSA id gq8sm2011469pjb.14.2020.06.09.02.43.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 02:43:44 -0700 (PDT)
Date:   Tue, 9 Jun 2020 17:43:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
Message-ID: <20200609094338.GA16448@sol>
References: <20200516064507.19058-1-warthog618@gmail.com>
 <CAMpxmJUbC4qmUGM0Z-6hXsYPRSpEpNM7iXgc7XbMcf_epi0Lig@mail.gmail.com>
 <20200604160006.GA5730@sol>
 <CAMRc=MfS1sCTU3vs5Gq_6+Ubt_89HX34mqabtpGbAASo+SfzSw@mail.gmail.com>
 <20200606015647.GA8099@sol>
 <CAMRc=Mdz__0TD8Qa33KRK9PE6jLvxa_O_dDjA54MHBLOeMxWfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdz__0TD8Qa33KRK9PE6jLvxa_O_dDjA54MHBLOeMxWfg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 09, 2020 at 10:03:42AM +0200, Bartosz Golaszewski wrote:
> sob., 6 cze 2020 o 03:56 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> 
> [snip!]
> 
> > >
> > > I'd say yes - consolidation and reuse of data structures is always
> > > good and normally they are going to be wrapped in some kind of
> > > low-level user-space library anyway.
> > >
> >
> > Ok, and I've changed the values field name to bitmap, along with the change
> > to a bitmap type, so the stuttering is gone.
> >
> > And, as the change to bitmap substantially reduced the size of
> > gpioline_config, I now embed that in the gpioline_info instead of
> > duplicating all the other fields.  The values field will be zeroed
> > when returned within info.
> >
> 
> Could you post an example, I'm not sure I follow.
> 

The gpioline_info_v2 now looks like this:

/**
 * struct gpioline_info_v2 - Information about a certain GPIO line
 * @name: the name of this GPIO line, such as the output pin of the line on
 * the chip, a rail or a pin header name on a board, as specified by the
 * gpio chip, may be empty
 * @consumer: a functional name for the consumer of this GPIO line as set
 * by whatever is using it, will be empty if there is no current user but
 * may also be empty if the consumer doesn't set this up
 * @config: the configuration of the line.  Note that the values field is
 * always zeroed.
 * @offset: the local offset on this GPIO device, fill this in when
 * requesting the line information from the kernel
 * @padding: reserved for future use
 */
struct gpioline_info_v2 {
	char name[GPIO_MAX_NAME_SIZE];
	char consumer[GPIO_MAX_NAME_SIZE];
	struct gpioline_config config;
	__u32 offset;
	__u32 padding[GPIOLINE_INFO_V2_PAD_SIZE]; /* for future use */
};

Previously that had all the fields from config - other than the values.

When that is populated the config.values will always be zeroed.

[snip!]
> 
> > > >
> > > > I'm also kicking around the idea of adding sequence numbers to events,
> > > > one per line and one per handle, so userspace can more easily detect
> > > > mis-ordering or buffer overflows.  Does that make any sense?
> > > >
> > >
> > > Hmm, now that you mention it - and in the light of the recent post by
> > > Ryan Lovelett about polling precision - I think it makes sense to have
> > > this. Especially since it's very easy to add.
> > >
> >
> > OK.  I was only thinking about the edge events, but you might want it
> > for your line info events on the chip fd as well?
> >
> 
> I don't see the need for it now, but you never know. Let's leave it
> out for now and if we ever need it - we now have the appropriate
> padding.
> 

OK. It is a trivial change - I've already got the patch for it.

> > > > And would it be useful for userspace to be able to influence the size of
> > > > the event buffer (currently fixed at 16 events per line)?
> > > >
> > >
> > > Good question. I would prefer to not overdo it though. The event
> > > request would need to contain the desired kfifo size and we'd only
> > > allow to set it on request, right?
> > >
> >
> > Yeah, it would only be relevant if edge detection was set and, as per
> > edge detection itself, would only be settable via the request, not
> > via set_config.  It would only be a suggestion, as the kfifo size gets
> > rounded up to a power of 2 anyway.  It would be capped - I'm open to
> > suggestions for a suitable max value.  And the 0 value would mean use
> > the default - currently 16 per line.
> >
> 
> This sounds good. How about 512 for max value for now and we can
> always increase it if needed. I don't think we should explicitly cap
> it though - let the user specify any value and just silently limit it
> to 512 in the kernel.
> 

It will be an internal cap only - no error if the user requests more.
I was thinking 1024, which corresponds to the maximum default - 16*64.

> > If you want the equivalent for the info watch then I'm not sure where to
> > hook it in.  It should be at the chip scope, and there isn't any
> > suitable ioctl to hook it into so it would need a new one - maybe a
> > set_config for the chip?  But the buffer size would only be settable up
> > until you add a watch.
> >
> 
> I don't think we need this. Status changes are naturally much less
> frequent and the potential for buffer overflow is miniscule here.
> 

Agreed.

Cheers,
Kent.
