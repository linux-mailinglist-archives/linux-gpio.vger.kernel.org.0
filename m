Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A422D2A7FF1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 14:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgKENuo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 08:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKENuo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 08:50:44 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F881C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 05:50:44 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 62so1452381pgg.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 05:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7+MV+ciBb02rkXX9apyCIQVT3yXV8tTP+QNk20RFQcE=;
        b=YnSbXSIk7BnYFe4NKrrR5gxoCg3B+LikUCFPeRCbKDqbVm/sru/EFcMyt+XLOxJr5k
         NWrOqhjWBoHVwNueDAYsHYwUQl/JcZPxBxRNHoAw7XHs2Ufqmnj8Wi/dOhBU1pSYu0Le
         kjAAHhri9DnU8JZc0tsMjtlWgEAJLXGkCi3S8NEZEppcNcUTHYlNYik3PSPtKSwtDmNW
         zxlADYr/Hnbd7lMO9LxFH2NlM8dnf27cbtee311OLZlqr6YrPskd6W5AbVxPv7R/6lcO
         yCaBF/VLXpCG3LBWdL/ShtGLDYZNfXbIZjZ9+eNOweQaUxuxc3KyyGbgiDj6Yov0urnl
         UxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7+MV+ciBb02rkXX9apyCIQVT3yXV8tTP+QNk20RFQcE=;
        b=Uz/OtDsOak3ImPS/l5189fXBCwhrRIiF5sU6F7EOBKqUmbVcLhOZZJCLwJJ5j5TJvt
         VQ+Hoo+HQkVAzrvWMA8E7TDNXwZUGXihktwOZSL5/CVkK0qAj2uFPz6uRcbk9y1MJzzD
         khLWsPM2CRimN5ERhzDItoqv2NDCK14EqpeHvUR29/ek+gGyM5pPvFSy1k9NDaW9TBLe
         wkzLoEk3ouEkQrb2Fm+cMOFoYsan6x0CfXnyKNONjUI2jtwCKyhlJDz35uKCI0Zygnp3
         0i6IQlbPjDCXgYvYbYqBZrBbN0Tpd6GHp+Ko0wIcY+GzAPUB2QF33rmPiWu1gjjLB5AD
         PChA==
X-Gm-Message-State: AOAM530wkMW6Q47e7YRrdkoIBPisC3Na9x2cCmLJt6QjdxFcXsaJQRUK
        FTHNFYc8GzmuYSmtG424TouK8u1h9ngphw==
X-Google-Smtp-Source: ABdhPJxbbkt7IgPGU/9RcW1PxovNe5wwkBXHcAZFLX/4kM7OOlWPG4oH8xyQExNhRhF9btOG9aDQwg==
X-Received: by 2002:a63:4d5c:: with SMTP id n28mr2467858pgl.88.1604584243761;
        Thu, 05 Nov 2020 05:50:43 -0800 (PST)
Received: from sol (106-69-171-141.dyn.iinet.net.au. [106.69.171.141])
        by smtp.gmail.com with ESMTPSA id j12sm2652780pga.78.2020.11.05.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 05:50:43 -0800 (PST)
Date:   Thu, 5 Nov 2020 21:50:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [libgpiod] libgpiod v2.0 API discussion
Message-ID: <20201105135037.GA100212@sol>
References: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
 <20201105030913.GA11741@sol>
 <20201105073248.GA13434@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105073248.GA13434@laureti-dev>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 08:32:48AM +0100, Helmut Grohne wrote:
> On Thu, Nov 05, 2020 at 04:09:13AM +0100, Kent Gibson wrote:
> > Wrt "fast as possible", what are you optimising for - minimal latency or
> > maximal throughput?  For minimal latency you want to read just the next
> > event.  For maximal throughput you want to minimise the number of
> > ioctls/syscalls and so dump the kernel event fifo into a userspace
> > buffer.
> 
> I believe that the target actually is both as you suggest later.
> 
> > The library should allow the user to select what they are optimising
> > for, so you may want to consider two event_read() flavours, one that gets
> > just the next event and another that fills a buffer.  The single form may
> > just call the buffer form with n=1, or it may be able to be slightly
> > optimised as it could avoid buffer range checks.
> > Both should accept the line request fd, rather than the line or line bulk
> > that they currently do.
> > And in both cases the user should provide the space for the event(s) to
> > be written to.
> 
> The C-API does allow this in the released version. It provides
> gpiod_line_event_read with a user-supplied buffer for single-event reads
> and it provides gpiod_line_event_read_multiple with a user-supplied
> array for minimizing the syscall count. Bindings such as C++ also expose
> these (even though the C++ one performs the allocation).
> 
> Of course keeping these properties would be good for the reasons you
> detailed.
> 

So it does - in fact it has a whole family of variants of event_wait()
and event_read().  What I may've worked out here by going off on a
tangent is which one or two of those form the core API.  The rest are
just helper wrappers around those - and can be considered cruft unless
there is a clear use case for them.

As I think I've mentioned elsewhere, my preferred approach for
rethinking the libgpiod API for v2 is to shrink the API to the core
functions, rethink that set wrt how it maps onto and exposes the
features available in uAPI v2, and then expand that revised set with
helpers as appropriate, and then rethink the bindings.

The full libgpiod API as it stands is a bit of a beast.

> > > For config: I believe an opaque request config structure will require
> > > a lot of getter/setter boiler plate code for not much profit.
> > > 
> > 
> > The profit being a guarantee of ABI stability and backward compatibility,
> > while still being free to completely rework the implementation
> > internally?
> 
> I think you can gain this profit without opaqueness.  A user can only
> use those aspects of a config that did exist a the time the code is
> developed. For that reason, there can be multiple versions of a
> configuration type and the consumer can use whatever type they happend
> to see when the code was compiled. The current configuration type can be
> typedefd to a standard name and only needs to be API compatible with
> previous config types (i.e. only add new fields with default
> initializers). In C++, one can leverage function overloads to implement
> that. In C, you can use symbol versioning or do poor-mans-symbol-
> versioning by #defineing the consuming function names to versioned ones.
> 
> The only downside of this seems to be that libgpiod would have to keep
> the old types and overloads for all eternity.
> 

You underestimate the power of the downside...

How do you go about testing all that?
And propagating those multiple versions through the bindings?
And testing those?

I think I'd prefer the boiler plate.

Cheers,
Kent.

> When doing this, it is important that consumers do not pass around
> pointers to a config to code compiled with a different libgpiod as these
> types may be different and have a different storage layout. For the
> config, this seems fairly unlikely.
> 
> Helmut
