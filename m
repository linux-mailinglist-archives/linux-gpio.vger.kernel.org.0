Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CD7394DA3
	for <lists+linux-gpio@lfdr.de>; Sat, 29 May 2021 20:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhE2SVX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 May 2021 14:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhE2SVX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 May 2021 14:21:23 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4D6C061574
        for <linux-gpio@vger.kernel.org>; Sat, 29 May 2021 11:19:45 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j9so8571141edt.6
        for <linux-gpio@vger.kernel.org>; Sat, 29 May 2021 11:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ieTNcLaJgzUHitJINi8BSy9FIGrC8U8q1V9qrg+CSA=;
        b=Yn6+Y5lqVKwKwFtsMo3eC/eLKTrAKV7yXkPHwFe1+8v0kWp+kfzUhDGIpt+x7o3fwz
         wBU+jKPH8UDV+h9hKdd1l/gvS/DfBMM5H4ZVCUvlL13t+h0fM/iJR/39z9zfk9mX9Wia
         gTbr9BWdLEjArFbMgqSQkCs0IajLMQIIFf/Y7GznDkRa6OYuWXUZqarIjzCgXSzOw9dZ
         WZjeZ6KhojbuYsW+reUveG+XFsV32VuqIOsk3q9551U/cZM6zaL9+I++RbRkKgR7O4gG
         4xUptQkUm197Hlx3U02UqfMODWoLjMrTiZC2ebGeRfOyyiVE82OWePk4zPnO0yqQzOaU
         zNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ieTNcLaJgzUHitJINi8BSy9FIGrC8U8q1V9qrg+CSA=;
        b=rDeyoGn1tHQEz0HKaXDJbCyPI3qWObkTVlbpXmekoIAa25vSf+qw+YFKjY0Y+8NSTW
         tp2CAo2wdEBXZKkMUa/OubyQa46vwSoVDzLTsSsZPV2orb8G4M1iUtlxSoSIbxh1qwHv
         SRwzQ1C53IujWcqxUm7jNf/fEN+d9L6vl4j5+YDiz/qmGW74HImQrATfT6ZQpPhoZWOD
         Y7a2OrzXYjfkXBWK9vnJmg08P/EkQuLxQEHnKcXtt2u3cseVZeAy961n1jlJN3o4IOjQ
         V8OL+mnhtTfg+8J5GtmvFDWnh8pMKG9GilaN7UfjhfltOOdpNWOq75ZbAYt05XfbdviX
         Fscg==
X-Gm-Message-State: AOAM530XsOtWHSgUXyO73N9FwertCugC0jg61BDU+GVvR2mWHesxDOll
        ylAR9g5CBBUJgYzFuA0eZLHmpCp+/tEyr5Hz6Kl7YYRjbSb32g==
X-Google-Smtp-Source: ABdhPJwJ21VIOpEjbP5ubRCzKfCXrHSDpxw0EkOaZdPjJ9Y1bwTNR9ePCkJ06xslWUuvoBeGIPnRr5TO4yez/NfChtM=
X-Received: by 2002:a05:6402:35d4:: with SMTP id z20mr16692140edc.164.1622312383019;
 Sat, 29 May 2021 11:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210518191855.12647-1-brgl@bgdev.pl> <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com> <20210528232320.GA5165@sol>
In-Reply-To: <20210528232320.GA5165@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 May 2021 20:19:32 +0200
Message-ID: <CAMRc=MfP5jEDqONYA0b7Dmm1hi38C8V1XSaX6xm03Cv4mpCJMQ@mail.gmail.com>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 29, 2021 at 1:23 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> >
> > Isn't this inconsistent with the complexity validation that only
> > happens at request-time? You could say that a config could also
> > transition from a state with an invalid value to a one where it's
> > fine. The error code would indicate the reason for the request
> > failure: either E2BIG for too complex config or EINVAL for invalid
> > values inside it.
> >
>
> No - they are two different things.  Also, this in response to the
> possibility of exposing validation functions, and if you want that for
> the parameter ranges then it should be as part of the mutator not as a
> separate function.
>
> And from a practical standpoint, a range check on a parameter is simple
> and easy, while the complexity check is hard.
>

Fair enough.

> > > OTOH, for the active level you provide two error-less mutators,
> > > gpiod_line_config_set_active_low() and
> > > gpiod_line_config_set_active_high(), which is fine.
> > >
> > > Wrt exposing complexity validation functions, I don't see the benefit.
> > > The config may transition through complex states, so long as at the time
> > > the gpiod_chip_request_lines() or gpiod_line_request_reconfigure_lines()
> > > is called it isn't too complex and so can be translated to the uAPI.
> > > The check has to be performed as part of those functions either way, and
> > > validating a transitional config doesn't prove anything.
> > >
> >
> > Indeed. OTOH with return values in mutators taking integer values we
> > would throw errors on invalid values passed. I need to think about it
> > some more.
> >
>
> I was assuming separate mutators for each of the enum values, as you do
> for the active level but, with the offset and subset variants
> multiplying the number of mutators, I can see why you would go with the
> parameterized versions.  While you could still perform the range
> checking as part of the translation to uAPI, that can more difficult for
> the user to debug - depending on how many mutators they have applied.
>
> It is a trade-off, but I still lean towards the error-less mutators as
> it simplifies user code - consolidating the error checking into one
> place. A parameter being out of range means the user is doing something
> stupid, or running a future app against an old libgpiod, in which case
> they should be fine with slightly tougher debugging.
>

Having error-less mutators here would mean something like a hundred
functions just for setting the line config. I think that even with
mutators taking enums we already have enough symbols. Let's keep them.

[snip]

> >
> > Ha! I think we'll disagree here again. In most cases in low-level
> > linux C libraries, a "get" for complex objects returns a copy (or a
> > new reference if we're using shared objects). I would like to stay
> > consistent with that pattern. To me "peek" is a good way to
> > distinguish those functions that allow you to look into the internals
> > of the parent object. If anything - I'd go with the get/peek pattern
> > where the former returns a new object over whose lifetime the caller
> > takes responsibility and the latter returns a pointer to an object
> > stored in the parent. I went with copy/peek because it hints at a
> > different behavior than regular get but I can live with get/peek.
> >
>
> Not too fussed about the naming of this function (for that matter most
> of my comments are personal preference - I could live with your way),
> and distinguishing between get and peek is a valid point, but my main
> point was that the copy should operate on the contained type, not the
> container - see below.
>

I'm not seeing anything related below but I see what you mean -
gpiod_line_event_copy(event). Not sure if this makes sense/is needed
though. I'll switch to providing get and peek and have them operate on
the container.

[Snippy McSnipface]

> > >
> > > > +/**
> > > > + * @brief Set the output value for a single offset.
> > > > + * @param config Line config object.
> > > > + * @param offset Offset of the line.
> > > > + * @param value Output value to set.
> > > > + */
> > > > +void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
> > > > +                                     unsigned int offset, int value);
> > > > +
> > >
> > > I would rename this to gpiod_line_config_set_output() and have it set
> > > the direction (to GPIOD_LINE_CONFIG_DIRECTION_OUTPUT of course) as well
> > > as the value.
> > >
> >
> > I like it but how would that plug into the global direction setting?
> >
>
> You mean the default flags?
> You can work that out as part of the translation to uAPI.
> It would be whichever applies to the most lines.
> No need for the user to know or care.
>

Eek this sounds vague. If that was part of documentation for this
function - as a user I would be confused. Is there any problem with
just implying output for any line for which a default value is set?

> > > And maybe add a gpiod_line_config_set_input()?
> > >
> >
> > What about "as is" with this pattern? We agreed that input would be
> > the default so we need some way to set "as is" too.
> >
>
> I didn't suggest removing gpiod_line_config_set_direction(), so you would
> use that.  The as-is case isn't sufficiently common to warrant its own
> short form.
>


> I forgot to ask about where gpiod_line_info_get_name() and others that
> return char * fit wrt that pattern.
> So a string isn't a complex object?
> Maybe they should be _peek_ as well?
> Either way, it would be nice for their commentary to describe the lifetime
> of the returned pointer.

With strings the common sense is to assume that returning char * means
the string is dynamically allocated and must be freed by the caller,
returning const char * means the string is stored in the container. I
can't really recall seeing any other pattern in any sane C library. In
any case - I will add a comment to every function that returns an
object that needs lifetime management from the caller in v3.

Thanks!
Bart
