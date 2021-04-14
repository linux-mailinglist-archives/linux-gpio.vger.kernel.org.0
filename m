Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE4F35F605
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 16:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344641AbhDNOQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 10:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344214AbhDNOQA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 10:16:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC7CC061574
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 07:15:39 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id j7so5087795pgi.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tdFA6HRSXZI0qLHRxH3v9jIVq/32bUptpzL6TS7shvg=;
        b=bJKUrS6mNRfc4XAZ9Aj1joJCInMY6eKRjb0oL4Fpv8UQLLpBz6WLnRXjdthiB+4a36
         I3j90Hm0TWXt5HZLO7VnZ9QOaoUy0/oDziP25gGwg5OlXvpquizx52/d/ztM+nwema7E
         U3mFrI/7/jsHWyOBiJ1ganii8+LfyfXDn5nVaaDmF7CwOZWm5BTJFJ4cWejjwKj10Z+D
         d+pNEcSMzH3NUi7bswvfcLqm3/ZakCNl6BOq25KKNXvoQ+vW/JZTtmnCgVUj0DAM9SG4
         71UYwEUj73XFm/zmKQLZlCNbJtuYHqvRSlfM4u4xbLoC9igsQTVjrI0R7lhm3Ikpkyhv
         tCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tdFA6HRSXZI0qLHRxH3v9jIVq/32bUptpzL6TS7shvg=;
        b=UdienJhf2EzBcgy9E7D1/fbkp3m9CmrpY4D6yW7dNoWinAxUUfNyOqFMPoHdYnY8/+
         Q8wpyDFrjyUg4SS+FqTGwV7B+klW6BoLz6AmMv5iO3tlx3ybDwk+92AMdccB5LhJq83y
         5gfG26w8nzPFgo/0VT22Odrf56PzU7aS4e7MYIyjHxtKMRd+v3OGLyJGhBQRsD9FJUCt
         T6H9S2cbAWAPv1bDG5K9w5nBNCntA1ku7jx8ppd7sucuWjjPh8c1CTk/u9wtrRxm48Wy
         P4NW5XBJkjRFnUUOHuXLbtUUIY2fVIq4Y6Ac6Dotn2pJniGng7FpB/5CaORjjnH9bwWE
         SNTg==
X-Gm-Message-State: AOAM531x9DIl0ONg+b8dV11lu/kmf2S68z0AUeaIBX3IdacoxAMmkuJZ
        fXpGsrg4uINB9lfIStKFCoY=
X-Google-Smtp-Source: ABdhPJzkmFZIUAgm22gk1UTIhvuh2vx9JM/tF2XTPor2gt904WpXZ8bw/cjohSV9KJk/HANZgB/nyg==
X-Received: by 2002:aa7:8e0d:0:b029:214:a511:d88b with SMTP id c13-20020aa78e0d0000b0290214a511d88bmr35185911pfr.2.1618409739010;
        Wed, 14 Apr 2021 07:15:39 -0700 (PDT)
Received: from sol (106-69-169-198.dyn.iinet.net.au. [106.69.169.198])
        by smtp.gmail.com with ESMTPSA id i22sm12567649pfq.170.2021.04.14.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:15:38 -0700 (PDT)
Date:   Wed, 14 Apr 2021 22:15:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
Message-ID: <20210414141534.GA20266@sol>
References: <20210410145157.30718-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410145157.30718-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 10, 2021 at 04:51:51PM +0200, Bartosz Golaszewski wrote:
> This series introduces an entirely reworked API for the core C part of
> libgpiod. It's not fully functional as the bindings are not modified,
> and starting from patch 5, even the tests stop working. This is on
> purpose as I'd like to reach an agreement on the interface before
> spending time on reworking the tests.
> 
> My plan for the development of v2.0 is to keep the changes in a separate
> branch until all bits & pieces are complete and then rearrange them into
> a bisectable series that will be merged into the master branch.
> 
> A couple points regarding the design of the new API:
> - all objects have become opaque and can only be accessed using dedicated
>   functions
> - line objects as well as bulk containers have been removed
> - line requests are now configured using three types of structures: attributes,
>   line config and request config structures, which follows the kernel API
> - line request handles have now a lifetime separate from the parent chips to
>   leverage the separation of chip and request file descriptors
> - line events are now opaque but they can be stored in a dedicated container
>   so that memory allocations are not necessary everytime an event is read from
>   the kernel
> - the library code has been split into several compilation units for easier
>   maintenance
> 
> The new API is completely documented in include/gpiod.h doxygen comments.
> 
> Please let me know what you think. I am aware that these patches are huge and
> difficult to review but I'm really only expecting a general API review - all
> other implementation details can be improved later.
> 

In that vein, I'll lump my comments here, rather than scattering them
throughout the patches...

Overall it feels much tighter and clearer than the old API, though that
could just be personal bias, as it is also closer to the new uAPI.

I find the ownership and lifetime of objects confusing.  I presume you
want to use the reference counting to simplify the object lifecycle, but
that just formalises the possibility that objects are shared - further
confusing the ownership issue.
e.g. gpiod_line_config_add_attribute()
- who owns the attr after the call?  What happens if it is subsequently
modified? Is the attr copied or does ownership pass to the config?
As written it is neither - the attr becomes shared.  How is that
preferable?
Similarly gpiod_line_get_consumer() - who owns the returned pointer and
what is it's lifetime?
I would prefer the opaque objects to be able to be free()d normally, and
for any calls that involve a change of ownership to explicitly document
that fact.
For objects that require additional setup/cleanup, try to make use of 
open()/close() or request()/release() function name pairings.
So gpiod_chip would have open()/close(), gpiod_request_handle would have
request()/release(), and the others would all be new()/free()d.

Conceptually the config for each line can be considered to be independent
- the uAPI encoding using attributes and masks is only there to keep the
uAPI structs to a manageable size. 
At this level you can model it as config per line, and only map
between the uAPI structures when calling the ioctl()s.
So I would drop the gpiod_line_attr, and instead provide accessors and
mutators on the gpiod_line_config for each attr type.
That removes the whole lifecycle issue for attributes, and allows you to
provide a simpler abstraction of the config than that provided in the
uAPI.
For the mutators there can be two flavours, one that sets the config for
the whole set, and another that accepts a subset of applicable lines.
Accessors would provide the config attr for a particular line.
Both accessor and mutator would use chip offsets to identify the lines.

Not sure I like merging the direction and edge into the request_type.
I would tend to keep those separate, with set_direction and
set_edge_detection functions, with the latter forcing input direction.

I would rename gpiod_request_config to gpiod_request_options.  Config
is long lived and can be modified, whereas options are one-off.
And it would reduce any chance of confusion with gpiod_line_config.

gpiod_line_mask should highlight that the bits correspond to lines on
the request, in the order provided to gpiod_request_config_set_offsets(),
not line offsets on the chip.  Perhaps the gpiod_request_config or the
gpiod_request_handle should provide the mask functions for a given a
qchip offset, rather than require the user to track the mapping?
Then the gpiod_line_mask can be opaque as well.

I would rename gpiod_request_handle to gpiod_line_request.
And request.c to options.c, and handle.c to request.c.

gpiod_line_attr_set_debounce() can use a zero period to identify
disabling debounce, so the debounce flag is redundant.

Cheers,
Kent.
