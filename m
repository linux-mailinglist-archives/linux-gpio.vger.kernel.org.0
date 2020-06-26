Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D9520B30D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 16:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgFZOCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 10:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgFZOCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 10:02:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104E7C03E979;
        Fri, 26 Jun 2020 07:02:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d194so1627437pga.13;
        Fri, 26 Jun 2020 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OwogBhlZPHbNtl4UbEnjQatoIz2yS67pDWCnaqWKRIo=;
        b=BGcHPocrGyifAWVabsdMVOkcxskpXV5B9yZcnhk98FM3deI1SWu7Q8IHksgG8v7SMj
         lLy0z5/oijzicm9xB3C7YV+JGh/UaukIbM2/DggLUs9SSUGdnM+WETe6ByspjfdAJKd5
         bvXzSQFBCskfSz2wegMMNjAnLVr2jfg8S3k7D1PNrE0Fwh7FthT3b6liUONfCMtMs5rV
         LEDIadIKgbS3hVRdeJI7pYJxhhSZj/L8ZuIX/7WfUDv0zVrrik8ztRunKEh5EkPkYXY8
         F8v3ACdPpriHqT2lvbX/qAmNIRzahRRySQfPJmmTVTyc0G+xuQVKT/G5UcB/GOzAEOwn
         GHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OwogBhlZPHbNtl4UbEnjQatoIz2yS67pDWCnaqWKRIo=;
        b=V3xRHu/2EEWwyB0JE6T+xtoFEBSt28SUbkmIq9P24RIwG6j8+iUwy3j46//CvO4kkY
         TSRMJt8ddZBCOlWmvoMKXgw3LYaGYe59QVRcQcpXLBGs/KuPqZJywd0FhTSg0Hgky6nl
         sYnW3bZwVR9LDLnC5j0ZE4hYgsnxwgCIdTVWVIjUqjMIIUQOkZbKcrtJLLEeWESZfhIy
         C04ZzktJRU1ImQZ5yDb7SR9tb7Q5Vg0eH1zkZ5bKhvgQ0whQcL7KxwOVcS365ZQ8jbGE
         8YL0k3Xfo/u34ZIaSLGfB/HaT9NxrvcdEgcZ1M0rbqPJYUz563E6xpqC58LbXvOZbcbB
         4x8w==
X-Gm-Message-State: AOAM530vho8guPGXj4wvXG4s3N14Oue6uWHZcIbfGHglT/KWrmulZjMm
        wdzpge2AOvQ8OBLP1TVmnEA=
X-Google-Smtp-Source: ABdhPJxm+gdSpsA1ZMBwNkq+3Ba2UrmHDNToD3ktgv1HfMTV1ZEHJ2tByJdW7P2/LxAcqCkbJ8TZSA==
X-Received: by 2002:aa7:84d9:: with SMTP id x25mr2997557pfn.300.1593180138205;
        Fri, 26 Jun 2020 07:02:18 -0700 (PDT)
Received: from sol (220-235-108-194.dyn.iinet.net.au. [220.235.108.194])
        by smtp.gmail.com with ESMTPSA id a16sm21694142pgj.27.2020.06.26.07.02.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 07:02:16 -0700 (PDT)
Date:   Fri, 26 Jun 2020 22:02:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 13/22] gpio: uapi: define uAPI V2
Message-ID: <20200626140211.GA29493@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-14-warthog618@gmail.com>
 <CAHp75VcEDnrQk5FeWTZdV3fMnTsLpnmy+hAnL4V3a0Ge0NEe2A@mail.gmail.com>
 <20200624154057.GA8622@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624154057.GA8622@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 11:40:57PM +0800, Kent Gibson wrote:
> On Wed, Jun 24, 2020 at 05:33:26PM +0300, Andy Shevchenko wrote:
> > On Tue, Jun 23, 2020 at 7:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add a new version of the uAPI to address existing 32/64bit alignment
> > 

[ snip ]
> > 
> > I'm wondering how many lines (in average) the user usually changes at
> > once? One? Two?
> > 
> > Perhaps we need to be better with this, something like single line /
> > multiple lines?
> > 
> > So, having a struct for single line change being embedded multiple
> > times would allow to configure atomically several lines with different
> > requirements.
> > For example you can turn directions of the two lines for some kind of
> > half-duplex bit banging protocol.
> > 
> > I'm not sure about the rest, but to me it seems reasonable to have
> > single vs. multiple separation in some of the structures.
> > 
> 

I think you are right about this - we should be taking the opportunity
to remove the homogeneous config restriction, so we can have a mixture
of lines with different configs in the one request.
e.g. I've had a request to have lines with different active low settings.
Your example requires both inputs and outputs.
And for a recent rotary encoder example I would've liked to be able to
have edge detection on one line, but return a snapshot with the state
of several lines in the edge event.

So what I'm thinking is to replace the config that I had proposed with
something like this:

struct attrib {
	/*
	 * the set of lines from request.offsets that this attrib DOESN'T
	 * apply to.  A zero value means it applies to all lines.
     * A set bit means the line request.offsets[bit] does NOT get this
     * attribute.
	 */
	__u64 mask[GPIOLINES_BITMAP_SIZE];

	/*
	 * an attribute identifier that dictates the which of the union
	 * fields is valid and how it is interpreted.
	 */
	__u32 id;

	union {
		__u64 flags; /* similar to v1 handleflags + eventflags */
		__u32 debounce_period;
		__u64 values[GPIOLINES_BITMAP_SIZE]; /* for id == output */
        /* ... */

		/* future config values go here */

		/*
		 * padding to ensure 32/64-bit alignment of attrib
		 *
		 * This must be the largest sized value.
		 */
		__u32 padding[3];
	};
};

/* config is a stack of attribs associated with requested lines. */
struct config {
	/* the number of populated attribs */
	__u32 num_attribs;

	/* for 32/64-bit alignment */
	__u32 padding;

	struct attrib attribs[MAX_CONFIG_ATTRIBS];
};

The idea is a stack of attributes, each of which can be applied to a
subset of the requested lines, as determined by the attrib.mask.
The config for a given attribute on a given line is determined by
finding the first match while walking down the stack, or falling
back to the sensible default if no match is found.

To reduce the number of attributes required, a number of boolean or
boolean-ish fields can be combined into flags, similar to v1.

I'm guessing a handful of attribs would suffice for the vast majority of
cases, so MAX_CONFIG_ATTRIBS would be in the 5-10 range.
(Are we concerned about struct sizes?)

Adding new config attribs in the future would involve adding a new id
and a corresponding value in the union.  So we can potentially add as
many new config attribs as we like - though the user would still be
limited to MAX_CONFIG_ATTRIBS and may have to trade-off attribs in
their particular application.

Does that make any sense?

Cheers,
Kent.
