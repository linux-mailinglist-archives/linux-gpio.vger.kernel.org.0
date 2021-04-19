Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E493363907
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Apr 2021 03:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhDSBS0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Apr 2021 21:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236929AbhDSBSX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Apr 2021 21:18:23 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E27DC06174A
        for <linux-gpio@vger.kernel.org>; Sun, 18 Apr 2021 18:17:51 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id s20so998722plr.13
        for <linux-gpio@vger.kernel.org>; Sun, 18 Apr 2021 18:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yrr1FZoyEEy3BR5xL6NBYsMzEmqJU/Se4Ax5U+fXQZg=;
        b=BFKM2YWdFvO9yF1/wrrKhsDkDgTxeIKM42F8QF/ei4f4R9ZbsCEnTCcZbfAnm3FqOK
         K3yYIcA/3As11cHr9g5UACHHRz02ko/bzRtYazrtZ3lvIj073Vn+2UoJfVfAO0NS0FJ5
         S8bAR9ICzvqnrKDkGas7fQzOJTcej207vrye5SL0y+93QKXJs8JBAityLwQ+u6KMbDhE
         PJYVfpfYUMJuiC8V9NjMQHVjVJA/WoXNlGR/GQBXqm/bCRoTJkLrWw0yF/SY9B79eZZ3
         S1Zs4f1ioc1Z0fTK5scya8ve6fkasVhMeHJ4PjqBCyWymLqchJ4V6MUyeGXc4LvjCr6k
         Cwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yrr1FZoyEEy3BR5xL6NBYsMzEmqJU/Se4Ax5U+fXQZg=;
        b=QpwrfY9qVSzNYmKqvAG0+/UK1phP3PsBUnKhiwvJm5rk1ED9Ei+4fddTiOjQv5i0L8
         wNTUbWq22p4XoSAXueBTifqUNw0j17eIp3ws2ECiW+JUO8mUJFNNrt81mf1Ti7tDT0pW
         nN/GNfHi1eqkO/xo/ys1BIORSYuMKiegECgbVLIuZDbY+hQZGvi6EtypTZrBl9gOupLz
         AqpMGwah/Drpj1C+cxwPFCkDIh8rVJQIAhCZxJ4cwv4gkpEiLAMiHl3T/FMJ8UFQmton
         ifWQaLsEuLrqAd3rqR34JfZIEXJUkcUVkL5RApLkAEqREqY36rlgP3Z2ak4awKYUeM5a
         mXRw==
X-Gm-Message-State: AOAM530gVa32f/acBG9Mz0mShiyG5uVTOyM9UEvZhn57xE6ajnAYvICx
        mzTWLyMK3ShSytjLFQMugHfmvl6Hg6g=
X-Google-Smtp-Source: ABdhPJxzXi8AkkQO5Dl8q+NMgt8JRV71YFQ/6X7OU9ChvRZK1fGyAlYvr11OCfz2sml/t9iHXmbE9A==
X-Received: by 2002:a17:90a:f2c7:: with SMTP id gt7mr22934034pjb.157.1618795070829;
        Sun, 18 Apr 2021 18:17:50 -0700 (PDT)
Received: from sol (106-69-169-198.dyn.iinet.net.au. [106.69.169.198])
        by smtp.gmail.com with ESMTPSA id i22sm11756002pgj.90.2021.04.18.18.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 18:17:49 -0700 (PDT)
Date:   Mon, 19 Apr 2021 09:17:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
Message-ID: <20210419011746.GA4766@sol>
References: <20210410145157.30718-1-brgl@bgdev.pl>
 <20210414141534.GA20266@sol>
 <CAMRc=MeUR=9oohM29ZX_HPdBubd0ERn6KvoFfWZGg+r_u5WsYg@mail.gmail.com>
 <20210417072326.GA12853@sol>
 <CAMRc=McOiBo9ENieObtF8fy93PZBoQSYBLFgnM_ST=j5_SzoyA@mail.gmail.com>
 <20210418034810.GA9261@sol>
 <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md8S=CayttjiEVw7f6LYUZzUO9EE-kv6iyUkDqi_5GE3w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 18, 2021 at 11:12:24PM +0200, Bartosz Golaszewski wrote:
> On Sun, Apr 18, 2021 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> >

[snip!]

> >
> > I forgot to add that wrt the config mutators, you need to allow
> > overriding of existing config, rather than returning an error on
> > conflict, so that you can change config for the set_config ioctl().
> > Hence the last-in-wins approach.  And as a consequence the mutator is
> > always right and so needs no return code.
> >
> 
> This sounds good in theory but how do we handle a situation that
> requires more than 10 attributes? Override the first one? The last
> one? What if the line offsets passed to the request config repeat
> themselves? I think some sanitization of input is in order.
> 

Repeating of lines is equivalent to repeatedly setting a bit, so the
subsequent instances are ignored. In practice I don't even need to check
- if the user includes the line multiple times then it gets set multiple
times - to the same thing.

The case where a complex config can't be mapped to the uAPI, e.g. due to
too many attributes on too many lines, is handled at the time of the
request_lines() or set_config() itself when that mapping is performed.
Those will return an "overly complex config" error.

> Regarding offsets: I was thinking about how to approach referring to
> lines in configs and requests by offsets only (in order to hide the
> whole masking logic) and while for a request (for example: when
> setting/reading line) this is straightforward (as long as we make sure
> the offsets are never duplicated), the line config structure doesn't
> really know the concept of offsets. So when we set a config option for
> a specific line, we need to carry the offset information somehow in
> the structure until the request is actually made. How do you deal with
> this in your library? Did you expose any of the bitmap details in your
> API? Can we really avoid dealing with indexing of lines in a request?
> 

In the request config I use a map of offset to line config to avoid 
duplication. A config change that alters any existing setting just
overwrites the old.

The line config is similar to your struct gpiod_line_config.
The line config for a particular line is only created and added to the
map if there is a config change specific to that line.
Each attribute has a "not set" value, in which case the request-wide
default is used.

The request-wide default config is stored separately from the map.
And there is a function to reset a line config back to the default,
i.e. drop that line config from the map.

The request_lines() and set_config(), that accept the config, also have
the list of offsets available (provided to the request_lines() and
subsequently stored as part of the request struct for the set_config())
and so can map from offsets to indices to build the bitmap.
The bitmap and indices themselves are never exposed.

That is a high level description - the details are actually a little
different as the Go implementation uses functional options, so the
initial config settings become parameters to the request, and bundles
the config into the request object itself.

> > And you might want to add a copy() for config to allow the user to
> > easily create two slightly different configurations.
> >
> > > I was on the fence wrt reference counting but then realized that in
> > > C++ or Python we still need to provide a mechanism for unconditional
> > > closing of chips and releasing of requests. For the former it's
> > > because otherwise we'd need to make the object go out of scope
> > > manually (probably by storing it in another object that would be
> > > "closed" -> pointless abstraction) and in the latter case: Python
> > > doesn't even guarantee that the destructor will be called at any
> > > specific point.
> > >
> >
> > Hmmm, ok, I was assuming the C++ bindings would wrap the C objects in C++
> > objects, and the C++ destructor would release any associated resources.
> >
> 
> Yes, but what if the user wants to close the chip or release the
> request without the underlying object going out of scope? I think we
> need to keep that possibility.
> 

Then you also provide a close() method.  They aren't mutually exclusive.

Cheers,
Kent.

