Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DDE39491A
	for <lists+linux-gpio@lfdr.de>; Sat, 29 May 2021 01:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhE1XZD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 19:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE1XZC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 19:25:02 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5F3C061574
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 16:23:26 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 29so3644740pgu.11
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 16:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cby0DkQ6ECX+KiT7Ff7wzjdlMonaa8xvfl1YjL/C630=;
        b=sZAqTfBwjL7ANrbHHjbEAOwlT/1LPD8YY/ZeZ2Cf5caVDTgd5qU+w6rtrazWPEbFG0
         taZl66wZi6nPbn8g4k/LYbGLDymJmQcwUinM+4K9dGgy3dWRvg95kPcqo2rMwNn74LFB
         KUCqhXMx8NcfMFhW+Zt0sffPAyAght+bxds1DCwAUR+nRKUWNdPBvLoDBHo+WMR+vPzU
         5PJGE6MMO3kMTHvMLQ6W3v2kaHYulqihuQReNPnaoxJlF31qTJtfFIfqDdGXkc6U2K/8
         60aweY/OiHm6d7jm+vJfoOFkfzbBNkXpX7HKGZUTLlE9Z34jWN9x1/YY43RpjBSDfh11
         Lqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cby0DkQ6ECX+KiT7Ff7wzjdlMonaa8xvfl1YjL/C630=;
        b=jTedYR6km+t5VkBKGvZ19t3Lp8Eyg7tXZ0OszUNYriGLu9Co5kIpefT5RJAgKIzaP6
         nIjw6B1xtUgkwtK3gs8FWsapSLyPF+7MqOugl92rgZwAYdgm2+tEmUxj5/fIrJExkU3f
         ajdqQ85YlmQ2VKEnRQyN4TWbL1pxcAOcqWgOozKx9GBikGqTFSRjjqz8NbnPXF4ePe4v
         0pD9SBK3dsgZ7eHe65X0+s2uhXEjYruCQqRqJhqhyrO11MeoWZoj+CeY6vOhMhoGgDkt
         U/VSJoA1gUsh2nh4gKmgDwsXF+CG/7HyMPI2kJiP6TVczOfPWYsVgM///hLfkWfcuZQ7
         V/QA==
X-Gm-Message-State: AOAM530kDXg3SCyFMZVk6vyYcJVTgiQqBlW9UHb6NjnDcN/vzY9rQeiW
        QXxKzUmnhRc+vdU17VkCi/bZc28WEf+P1Q==
X-Google-Smtp-Source: ABdhPJyDEy8wCwuLed3j/sj5TxOGPDOrO5J5OAu5uGYH52blGdXNUJAUQw6SoebLkG4BeAppUN3zWw==
X-Received: by 2002:a62:2acf:0:b029:2e9:6832:72cc with SMTP id q198-20020a622acf0000b02902e9683272ccmr4997888pfq.10.1622244205522;
        Fri, 28 May 2021 16:23:25 -0700 (PDT)
Received: from sol (106-69-175-91.dyn.iinet.net.au. [106.69.175.91])
        by smtp.gmail.com with ESMTPSA id x19sm1364865pjq.3.2021.05.28.16.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 16:23:24 -0700 (PDT)
Date:   Sat, 29 May 2021 07:23:20 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
Message-ID: <20210528232320.GA5165@sol>
References: <20210518191855.12647-1-brgl@bgdev.pl>
 <20210527112705.GA20965@sol>
 <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 28, 2021 at 03:51:03PM +0200, Bartosz Golaszewski wrote:
> On Thu, May 27, 2021 at 1:27 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, May 18, 2021 at 09:18:55PM +0200, Bartosz Golaszewski wrote:
> > > This is the second shot at the v2.0 C API for libgpiod.
> > >
> > > Special thanks go out to Kent for his valuable advice and suggestions.
> > >
> > > The biggest changes are:
> > >
> > > The concept of attributes has been removed - instead the translation from
> > > configuration options to kernel request happens at the time of the line
> > > request call and can only fail at this stage - the config mutators no
> > > longer return any value.
> > >
> > > If the caller has passed a config that is too complicated, the request
> > > function will set errno to E2BIG which stands for: "Argument list too
> > > long".
> > >
> > > The direction and edge options have been split from the former
> > > request_type.
> > >
> > > The objects are no longer reference counted and no longer can be the
> > > responsibility for their lifetime shared.
> > >
> > > There are many other minor tweaks everywhere.
> > >
> > > One thing I've been contemplating is whether we should expose some
> > > functions allowing callers to check if the line config has already
> > > become too complex or values passed are invalid. This would allow
> > > languages that have exceptions throw them before we actually make the
> > > request call. Does this make sense?
> > >
> >
> > Wrt passing invalid values, I suggested error-less mutators on the
> > assumption they wouldn't have parameters that require range checking.
> > e.g. my Go library has AsInput() and AsOutput(value)
> > Your equivalents are:
> >     gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_INPUT)
> > and
> >     gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_OUTPUT)
> >
> > If you need to perform range checking on the parameters then the mutator
> > should return an error code.
> >
> 
> Isn't this inconsistent with the complexity validation that only
> happens at request-time? You could say that a config could also
> transition from a state with an invalid value to a one where it's
> fine. The error code would indicate the reason for the request
> failure: either E2BIG for too complex config or EINVAL for invalid
> values inside it.
> 

No - they are two different things.  Also, this in response to the
possibility of exposing validation functions, and if you want that for
the parameter ranges then it should be as part of the mutator not as a
separate function.

And from a practical standpoint, a range check on a parameter is simple
and easy, while the complexity check is hard.

> > OTOH, for the active level you provide two error-less mutators,
> > gpiod_line_config_set_active_low() and
> > gpiod_line_config_set_active_high(), which is fine.
> >
> > Wrt exposing complexity validation functions, I don't see the benefit.
> > The config may transition through complex states, so long as at the time
> > the gpiod_chip_request_lines() or gpiod_line_request_reconfigure_lines()
> > is called it isn't too complex and so can be translated to the uAPI.
> > The check has to be performed as part of those functions either way, and
> > validating a transitional config doesn't prove anything.
> >
> 
> Indeed. OTOH with return values in mutators taking integer values we
> would throw errors on invalid values passed. I need to think about it
> some more.
> 

I was assuming separate mutators for each of the enum values, as you do
for the active level but, with the offset and subset variants
multiplying the number of mutators, I can see why you would go with the
parameterized versions.  While you could still perform the range
checking as part of the translation to uAPI, that can more difficult for
the user to debug - depending on how many mutators they have applied.

It is a trade-off, but I still lean towards the error-less mutators as
it simplifies user code - consolidating the error checking into one
place. A parameter being out of range means the user is doing something
stupid, or running a future app against an old libgpiod, in which case
they should be fine with slightly tougher debugging.

> > > This time the new API is in one big patch for easier review. This
> > > changeset doesn't modify the bindings or tests but the tools compile
> > > and pass all tests.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> > >  include/gpiod.h            | 1222 ++++++++++++++++++-----------------
> > >  lib/Makefile.am            |   13 +-
> > >  lib/chip.c                 |  216 +++++++
> > >  lib/core.c                 | 1240 ------------------------------------
> > >  lib/edge-event.c           |  184 ++++++
> > >  lib/helpers.c              |  302 ---------
> > >  lib/info-event.c           |   83 +++
> > >  lib/internal.c             |   58 ++
> > >  lib/internal.h             |   28 +
> > >  lib/line-config.c          |  674 ++++++++++++++++++++
> > >  lib/line-info.c            |  164 +++++
> > >  lib/line-request.c         |  192 ++++++
> > >  lib/misc.c                 |   63 ++
> > >  lib/request-config.c       |   98 +++
> > >  tools/gpio-tools-test.bats |   12 +-
> > >  tools/gpiodetect.c         |   13 +-
> > >  tools/gpiofind.c           |    3 +-
> > >  tools/gpioget.c            |   66 +-
> > >  tools/gpioinfo.c           |   60 +-
> > >  tools/gpiomon.c            |  133 ++--
> > >  tools/gpioset.c            |   75 ++-
> > >  tools/tools-common.c       |    8 +-
> > >  tools/tools-common.h       |    2 +-
> > >  23 files changed, 2607 insertions(+), 2302 deletions(-)
> > >  create mode 100644 lib/chip.c
> > >  delete mode 100644 lib/core.c
> > >  create mode 100644 lib/edge-event.c
> > >  delete mode 100644 lib/helpers.c
> > >  create mode 100644 lib/info-event.c
> > >  create mode 100644 lib/internal.c
> > >  create mode 100644 lib/line-config.c
> > >  create mode 100644 lib/line-info.c
> > >  create mode 100644 lib/line-request.c
> > >  create mode 100644 lib/request-config.c
> > >
> > > diff --git a/include/gpiod.h b/include/gpiod.h
> > > index a4ce01f..bd4689f 100644
> > > --- a/include/gpiod.h
> > > +++ b/include/gpiod.h
> > > @@ -1,12 +1,12 @@
> > >  /* SPDX-License-Identifier: LGPL-2.1-or-later */
> > >  /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
> > > +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> >
> >
> > I'm only going to look at the header here - I'm assuming the other changes
> > just follow from the API changes.
> >
> > <snip>
> >
> > >  /**
> > > - * @brief Get the handle to the GPIO line at given offset.
> > > - * @param chip The GPIO chip object.
> > > + * @brief Get the current snapshot of information about the line at given
> > > + *        offset.
> > > + * @param chip GPIO chip object.
> > >   * @param offset The offset of the GPIO line.
> > > - * @return Pointer to the GPIO line handle or NULL if an error occured.
> > > - */
> > > -struct gpiod_line *
> > > -gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset);
> > > -
> > > -/**
> > > - * @brief Retrieve a set of lines and store them in a line bulk object.
> > > - * @param chip The GPIO chip object.
> > > - * @param offsets Array of offsets of lines to retrieve.
> > > - * @param num_offsets Number of lines to retrieve.
> > > - * @return New line bulk object or NULL on error.
> > > + * @return New GPIO line info object or NULL if an error occurred.
> > >   */
> > > -struct gpiod_line_bulk *
> > > -gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
> > > -                  unsigned int num_offsets);
> > > +struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
> > > +                                              unsigned int offset);
> > >
> >
> > Caller takes ownership of the gpiod_line_info, or are we peeking into
> > the gpiod_chip internals?  Either way, needs a comment.
> >
> 
> Caller takes ownership to underline the fact that it's a non-mutable
> snapshot of the line config at the time when it was retrieved. I'll
> add a comment.
> 
> > <snip>
> >
> > >  /**
> > > - * @brief Get the handle to the GPIO chip controlling this line.
> > > - * @param line The GPIO line object.
> > > - * @return Pointer to the GPIO chip handle controlling this line.
> > > + * @brief Get the pointer to the line-info object associated with this event.
> > > + * @param event Line info event object.
> > > + * @return Returns a pointer to the line-info object associated with this event
> > > + *         whose lifetime is tied to the event object. It must not be freed by
> > > + *         the caller.
> > >   */
> > > -struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line);
> > > +struct gpiod_line_info *
> > > +gpiod_info_event_peek_line_info(struct gpiod_info_event *event);
> > > +
> >
> > Rather than the peek/copy you use here, I would rename the peek to
> > get...
> 
> Ha! I think we'll disagree here again. In most cases in low-level
> linux C libraries, a "get" for complex objects returns a copy (or a
> new reference if we're using shared objects). I would like to stay
> consistent with that pattern. To me "peek" is a good way to
> distinguish those functions that allow you to look into the internals
> of the parent object. If anything - I'd go with the get/peek pattern
> where the former returns a new object over whose lifetime the caller
> takes responsibility and the latter returns a pointer to an object
> stored in the parent. I went with copy/peek because it hints at a
> different behavior than regular get but I can live with get/peek.
> 

Not too fussed about the naming of this function (for that matter most
of my comments are personal preference - I could live with your way),
and distinguishing between get and peek is a valid point, but my main
point was that the copy should operate on the contained type, not the
container - see below.

> >
> > > +/**
> > > + * @brief Get a copy of the line-info object associated with this event.
> > > + * @param event Line info event object.
> > > + * @return Returns a copy of the line-info object associated with this event or
> > > + *         NULL on error. The lifetime of the returned object must be managed
> > > + *         by the caller and the line-info object must be freed using
> > > + *         ::gpiod_line_info_free.
> > > + */
> > >
> > > +struct gpiod_line_info *
> > > +gpiod_info_event_copy_line_info(struct gpiod_info_event *event);
> >
> > ... and change this to
> >
> >  +struct gpiod_line_info *
> >  +gpiod_line_info_copy(struct gpiod_line_info *info);
> >
> > as that is more generally useful.
> >
> > Similarly elsewhere you use the peek/copy pattern.
> >
> > <snip>
> >
> > > +/**
> > > + * @brief Set the output value for a single offset.
> > > + * @param config Line config object.
> > > + * @param offset Offset of the line.
> > > + * @param value Output value to set.
> > > + */
> > > +void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
> > > +                                     unsigned int offset, int value);
> > > +
> >
> > I would rename this to gpiod_line_config_set_output() and have it set
> > the direction (to GPIOD_LINE_CONFIG_DIRECTION_OUTPUT of course) as well
> > as the value.
> >
> 
> I like it but how would that plug into the global direction setting?
> 

You mean the default flags?
You can work that out as part of the translation to uAPI.
It would be whichever applies to the most lines.
No need for the user to know or care.

> > And maybe add a gpiod_line_config_set_input()?
> >
> 
> What about "as is" with this pattern? We agreed that input would be
> the default so we need some way to set "as is" too.
> 

I didn't suggest removing gpiod_line_config_set_direction(), so you would
use that.  The as-is case isn't sufficiently common to warrant its own
short form.

Cheers,
Kent.

> Thanks a lot for the review!
> 
> Bart
> 
> > <snip>
> >
> > Those are the only things that jump out at me at the moment.
> > I much prefer this version over the previous.
> > Sorry I haven't had a chance to look at it earlier.
> >
> > Cheers,
> > Kent.
