Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396AC397F53
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 05:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhFBDOr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 23:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhFBDOq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 23:14:46 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B6FC061574
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 20:13:04 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id i22so878723pju.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 20:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CZAO0YULCGB1aPNxgMBqj6c8iXVBCe1UUhxUrx6iGi8=;
        b=bALW+f2R1Zrh3fZJjTK+V6RxZh27TI48GwOwN7RJYg60pYfUoWHMdcMRVIjkl4RBOi
         CfXcvzERoHx4gNGGONkWNx1lRIwjcWc/PBMoVEbUOD1mPET8v3Yt5hfP+BwPtY/qZw1T
         JlyNQfDP49rrtmwC1jj6+Ye7kOS8vRTetZeQd4ZpAMvpWefeSAN/cUZv8nVMuCSXXz7o
         vdFb/FysTO9iKs7AGUHGi+d6e7wL5JUUFxV1qAfNyNy0XkyWQKUd3Cfgqjpa9xO8ockO
         eA+kUIqDmRRKmcxxdhPR14yLpSpClUatXZcuFS6Hwdaa6QeEk3snPxkDqJgzhnmWgBJD
         RsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CZAO0YULCGB1aPNxgMBqj6c8iXVBCe1UUhxUrx6iGi8=;
        b=dRXNSjYY3L22ewS910HU68fSBylVxvt0AdOGzmiZclQHEA/MQE0leWTlOHDJsIqwUw
         eFPQNOa3Kg3GEKVtN5WJ5uzY2un0314dgbc2QmHWHW7ieXYSvpf/Ojl9BKTN13yzc7Ko
         fMQZtv+9brVXFUNq/pZa9HCnTe5mIsLT94U5AG3CPzeVrEO58kmFTc3cbVmytdMeePMp
         9lRSL7Ai2AOic1UM1Bi0DBwy4Txue0oeObQff6UsFVxJM0+4klEHEEHkaz0g5CrUizAu
         UGY+rWbp/XujOxBtTJnipe6jS58bodruMep7U+etoNDWzdH/HkT/+UtgYEPcVt3Lk1/u
         tOJA==
X-Gm-Message-State: AOAM531BuDSLCUpYnpKceNsgInwaaipdPZw/DyRmsrO7WspMLD1U6CEI
        sn3Chpr0DZHJKN/QyeCb7D0YKieX+yE=
X-Google-Smtp-Source: ABdhPJxMmWs51ErgtMvbKg/M8jdYnK8ySrthScIFjbDC3rbpiQmW3AAbjBOd+/O4Vbu2zOu4Ru3m1Q==
X-Received: by 2002:a17:90b:f95:: with SMTP id ft21mr28284758pjb.215.1622603583112;
        Tue, 01 Jun 2021 20:13:03 -0700 (PDT)
Received: from sol (106-69-174-31.dyn.iinet.net.au. [106.69.174.31])
        by smtp.gmail.com with ESMTPSA id q3sm14566784pff.142.2021.06.01.20.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 20:13:02 -0700 (PDT)
Date:   Wed, 2 Jun 2021 11:12:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
Message-ID: <20210602031257.GA6359@sol>
References: <20210518191855.12647-1-brgl@bgdev.pl>
 <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
 <20210528232320.GA5165@sol>
 <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
 <20210530004544.GA4498@sol>
 <CAMRc=McYaPqFrYiQqYnzVq9YAK8sXD_dW=UYwdiWgFOBTJt2iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McYaPqFrYiQqYnzVq9YAK8sXD_dW=UYwdiWgFOBTJt2iA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 01, 2021 at 09:57:08PM +0200, Bartosz Golaszewski wrote:
> On Sun, May 30, 2021 at 2:45 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [peek]
> 
> > > >
> > >
> > > Eek this sounds vague. If that was part of documentation for this
> > > function - as a user I would be confused. Is there any problem with
> > > just implying output for any line for which a default value is set?
> > >
> >
> > What part of "No need for the user to know or care" is too vague?
> > The user does not need to know how libgpiod translates to uAPI - that
> > is your problem not theirs, so don't go there.
> >
> > But for your benefit...
> >
> > There is no global direction setting - the lines are treated
> > independently until the translation to uAPI during the request or
> > reconfigure call, at which point the most common flags setting can be
> > used as the global default.
> >
> 
> I said "vague" for want of a better word but what I mean is this:
> taking the most common setting as the global default does not sound
> intuitive and -  when coding - it would be hard to predict the outcome
> from just looking at the code. I was actually assuming that we'd have
> lines begin with a certain sane, default config (INPUT, active-high,
> no bias, no drive, no edge etc) and every line's config would have to
> be changed explicitly - either via the global mutators or the ones
> that work with a subset of lines (where the subset could actually
> include all the lines - we don't know it before we do the actual
> request because the list of lines to request is passed in a different
> struct).
> 

Ahh, I forgot that you have the req_config and line_config split.
So you have no option but to maintain global flags.  That is used as
the initial value of the flags for a particular line when that one line is
first mutated, either by offset or as part of a subset.
And subsequent changes to the global flags need to be propagated to all
the lines in the config at that time.

Taking the most common flags value as the uAPI default is an optimization
that minimizes the number of lines requiring custom flag attributes in the
uAPI config. It might seem unintuitive to you, but it makes sense to me
that it should be the uAPI default, even if the user wasn't aware that it
should be.
OTOH there are only a few corner cases where it is of real benefit, so
just using the line_config global flags is fine.
FWIW, my Go library doesn't perform that optimization - it uses the
global flags :).  Not sure why I'm still suggesting it here when I
apparently decided it wasn't worth the effort there ¯\_(ツ)_/¯.

> [snip]
> 
> > >
> > >
> > > > I forgot to ask about where gpiod_line_info_get_name() and others that
> > > > return char * fit wrt that pattern.
> > > > So a string isn't a complex object?
> > > > Maybe they should be _peek_ as well?
> > > > Either way, it would be nice for their commentary to describe the lifetime
> > > > of the returned pointer.
> > >
> > > With strings the common sense is to assume that returning char * means
> > > the string is dynamically allocated and must be freed by the caller,
> > > returning const char * means the string is stored in the container. I
> > > can't really recall seeing any other pattern in any sane C library. In
> > > any case - I will add a comment to every function that returns an
> > > object that needs lifetime management from the caller in v3.
> > >
> >
> > Sure, but don't assume common sense - document the behaviour - even if
> > the returned object doesn't require lifetime management by the caller.
> > They might assume they do - and free it for you.
> >
> > And the point was that you still have some gets that return objects while
> > others return a reference - even after renaming some to peek, so the
> > pattern doesn't follow for the whole libgpiod API. Granted that is
> > nitpicking, but I would prefer internal self-consistency over following
> > what other libraries do.
> >
> 
> I don't want to use "peek" for simple types if that's what you're
> hinting at because that would be very confusing to anyone experienced
> with other C linux libraries. I would like to go with "get" for
> functions returning pointers to opaque structs that need management
> and peek for those that return pointers to structs stored in other
> objects. I don't think we need to have additional "copy" functions
> operating on the copied objects.
> 

Fair enough - just another of those minor points that I would do
differently (I'd just stick with get and live with the fact that
returns ownership in some cases and not in others).

> [snip]
> 
> > > >
> > >
> > > Having error-less mutators here would mean something like a hundred
> > > functions just for setting the line config. I think that even with
> > > mutators taking enums we already have enough symbols. Let's keep them.
> > >
> >
> > We don't want separate mutators for each enum value as that would
> > explode the symbol space.  Agreed.
> >
> > To be clear, in my "trade-off" paragraph above I was referring to your
> > existing parameterised error-less mutators, not the parameter-less
> > error-less mutators that I had been assuming.
> > Different paragraph and different things.
> >
> > So, to conclude, I would lean towards keeping your existing mutators that
> > don't return error codes, rather than adding error codes.
> > And only performing the validation when the config is translated to uAPI,
> > not providing some functions to perform interim validation.
> > i.e. wrt error handling I'm fine with the mutators as they are.
> >
> 
> Ok got it.
> 
> I think we're getting close to an agreement. :)
> 

Well that makes one of us ;).

Cheers,
Kent.
