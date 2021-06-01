Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0132397AE5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 21:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhFAT7D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 15:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbhFAT7C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 15:59:02 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7D4C061574
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 12:57:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id cb9so55772edb.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COP0uYuoX+qoH7k91jT8dxdiCjJyhnKnOk7YsdAx+4s=;
        b=wfqfpziIydKgM7kUOdwWRlbyBVWctvtJqbzifXNekxBNpA3d5S3j9Ivvi81m+PwYxj
         3HZcZ7wW71ILp/P28NtALBCJHZWr7OkYJNT2aOxFSDhLFi9GB7BnUxBeP3v1uWh3jHNv
         FdKwKWwmlJp5mW3K7mfngRkuCd+IFxvQPpUaNrtLFg5OHP4p8nwZlv2y5W+tSqloj3vZ
         tIK9/WC05cNS4xypdd4RVPXd0j4d27IVrtR8Dr2uGK798zR0VTM6fASQw8pxKG1/YGyo
         dKPNaKhIvz68q6xddNJzvawmmQZKddn3rYrzJW21soaVDGYRetyemT/PgxzvU7tpBjMq
         SKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COP0uYuoX+qoH7k91jT8dxdiCjJyhnKnOk7YsdAx+4s=;
        b=uMV/fUFnFy5LQy/ygPS1yuaCdudFVZchNnC1fY9X2PebhE3PKpeyCZ3prca1ljOkyT
         rzvSb1O8E7xkH8dgVGh7H2HXU22T2KS8l8MMUZonvNNe6XIJexNeAUnqR29RfGs54rMV
         2DpwMVMfbK92ePMrGRtIgw1ljqPESoZUGxKmJc1A4FNeqJuxuE8y4c3IwmGYYdRyllnV
         CcS4XjXYXzVQcJ3uU6AoFb/NV3zQH/VckR10XCDdOmLgZ+KAKa3LhFBoOJj9g/BQYZn6
         oXCZQiI9+F3QR4k0KozL6pX0rFQ40cyRB5XNaFfbcFmuccFh4YCjcaU3hdASZt1C+jzc
         PBPw==
X-Gm-Message-State: AOAM533i5qcoTnHniMscGF3kl+fm1vWtz56mTzlzNE0VZm4pJrc14KER
        yf9EElwBmWtsDrpoPcvPPuF+Kn3yoLDd+qV7Pjfe7Q==
X-Google-Smtp-Source: ABdhPJy37ovtEHI63ADQ9fBG7on32ue6N6YVKgBcgN0irZAJC9EB4Ol8f8iVxwhM2r774oR0VeFRpAuP8p/jH9wGkBY=
X-Received: by 2002:a05:6402:1158:: with SMTP id g24mr34299054edw.134.1622577439158;
 Tue, 01 Jun 2021 12:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210518191855.12647-1-brgl@bgdev.pl> <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
 <20210528232320.GA5165@sol> <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
 <20210530004544.GA4498@sol>
In-Reply-To: <20210530004544.GA4498@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Jun 2021 21:57:08 +0200
Message-ID: <CAMRc=McYaPqFrYiQqYnzVq9YAK8sXD_dW=UYwdiWgFOBTJt2iA@mail.gmail.com>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 30, 2021 at 2:45 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[peek]

> > >
> >
> > Eek this sounds vague. If that was part of documentation for this
> > function - as a user I would be confused. Is there any problem with
> > just implying output for any line for which a default value is set?
> >
>
> What part of "No need for the user to know or care" is too vague?
> The user does not need to know how libgpiod translates to uAPI - that
> is your problem not theirs, so don't go there.
>
> But for your benefit...
>
> There is no global direction setting - the lines are treated
> independently until the translation to uAPI during the request or
> reconfigure call, at which point the most common flags setting can be
> used as the global default.
>

I said "vague" for want of a better word but what I mean is this:
taking the most common setting as the global default does not sound
intuitive and -  when coding - it would be hard to predict the outcome
from just looking at the code. I was actually assuming that we'd have
lines begin with a certain sane, default config (INPUT, active-high,
no bias, no drive, no edge etc) and every line's config would have to
be changed explicitly - either via the global mutators or the ones
that work with a subset of lines (where the subset could actually
include all the lines - we don't know it before we do the actual
request because the list of lines to request is passed in a different
struct).

[snip]

> >
> >
> > > I forgot to ask about where gpiod_line_info_get_name() and others that
> > > return char * fit wrt that pattern.
> > > So a string isn't a complex object?
> > > Maybe they should be _peek_ as well?
> > > Either way, it would be nice for their commentary to describe the lifetime
> > > of the returned pointer.
> >
> > With strings the common sense is to assume that returning char * means
> > the string is dynamically allocated and must be freed by the caller,
> > returning const char * means the string is stored in the container. I
> > can't really recall seeing any other pattern in any sane C library. In
> > any case - I will add a comment to every function that returns an
> > object that needs lifetime management from the caller in v3.
> >
>
> Sure, but don't assume common sense - document the behaviour - even if
> the returned object doesn't require lifetime management by the caller.
> They might assume they do - and free it for you.
>
> And the point was that you still have some gets that return objects while
> others return a reference - even after renaming some to peek, so the
> pattern doesn't follow for the whole libgpiod API. Granted that is
> nitpicking, but I would prefer internal self-consistency over following
> what other libraries do.
>

I don't want to use "peek" for simple types if that's what you're
hinting at because that would be very confusing to anyone experienced
with other C linux libraries. I would like to go with "get" for
functions returning pointers to opaque structs that need management
and peek for those that return pointers to structs stored in other
objects. I don't think we need to have additional "copy" functions
operating on the copied objects.

[snip]

> > >
> >
> > Having error-less mutators here would mean something like a hundred
> > functions just for setting the line config. I think that even with
> > mutators taking enums we already have enough symbols. Let's keep them.
> >
>
> We don't want separate mutators for each enum value as that would
> explode the symbol space.  Agreed.
>
> To be clear, in my "trade-off" paragraph above I was referring to your
> existing parameterised error-less mutators, not the parameter-less
> error-less mutators that I had been assuming.
> Different paragraph and different things.
>
> So, to conclude, I would lean towards keeping your existing mutators that
> don't return error codes, rather than adding error codes.
> And only performing the validation when the config is translated to uAPI,
> not providing some functions to perform interim validation.
> i.e. wrt error handling I'm fine with the mutators as they are.
>

Ok got it.

I think we're getting close to an agreement. :)

Bart
