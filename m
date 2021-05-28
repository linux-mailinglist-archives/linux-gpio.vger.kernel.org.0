Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB92394392
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 15:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbhE1Nww (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 09:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhE1Nwv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 09:52:51 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C28C061574
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 06:51:15 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b17so5000715ede.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 06:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vA9BPn1u/SMT26woi45DlmBHyGiUFfRY0lVFNY8i9w=;
        b=gSki4WTvAPBcVOdfHO8b2uFjqP25YXYfMa7QDqgHMfs1Lrra1xVIY98PsG1kp6lcD3
         st7Ngq5YsPCR2OHzZUjHWKEhamVSlN9fgAFbGnrosGxIDYQ8lxYfrpsFqac+3n4ZSdFO
         1RzK8iHhv895E8yk59aTVH0hl3aIGnqCKvTeFCAEENV+TmEeEfUlQhli858gmpYLrL/G
         RWs2xUTSy+ipmUP4vNUkpCQFlIZQaB9tegwchbxqNSkSh0NJY0Ms0sJ7UJeer9j9AIxt
         /blUFz5TOBbte+60xbW/x/rXhNFc0wHNFVNEgUAM48hIF5aFFEKpqsfd+GcN/m/jqrM1
         1U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vA9BPn1u/SMT26woi45DlmBHyGiUFfRY0lVFNY8i9w=;
        b=jbKvk4p9pe37lqYe5EBlgsicpGsg5P1X1ndqkD5Wpu8rUbIzG8AK0quFrI/31IG4Hv
         zEc5dz8/NZ74WepPrErm9G6TshUKdhStYYbdf0edkzWW1tICKD7c7DCAZkBNf5WTB1VP
         yApdWLMnP5IdSpXxKXESeZvhhvwbQ69ijayf/xA3jjjvi92hZeyKNP/tGvDRhat1oxel
         3zUTN/WmUxx5X/PyTAhq9fiSsn3ZnmvqBs45MRBQnP8ZTqR5QRxZNFsB9t5dSzQ3XlaP
         tVFPTOgIIefgCoIUx9KX9e+ywZIFqLbwDtwbjHrY8G9o7MmeH02r96x4BCMNxhXad/KX
         Nm6w==
X-Gm-Message-State: AOAM530gIk6mATnNG+Mncejz5u3gx22LKchKc4oNCM4C/T1UyInGE0Y8
        t7KtNcmSTU6pHhu5ArFp6lNPaYJ7l7EyRj3NrSvmYA==
X-Google-Smtp-Source: ABdhPJwwsaBS3sCeZVL6Sa8pvnymxQPLxtlq5EK51j5gQmvPfyNCiPmXGbP3Ptf0wb8kBu6qymDwvuzNt9WLKQWi+k4=
X-Received: by 2002:a05:6402:5216:: with SMTP id s22mr9903483edd.232.1622209874168;
 Fri, 28 May 2021 06:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210518191855.12647-1-brgl@bgdev.pl> <20210527112705.GA20965@sol>
In-Reply-To: <20210527112705.GA20965@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 28 May 2021 15:51:03 +0200
Message-ID: <CAMRc=Mff+=PNNqZUGO7Mq=OdmywYgS8+QuTqVYr4eOmA6Et_5g@mail.gmail.com>
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 1:27 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, May 18, 2021 at 09:18:55PM +0200, Bartosz Golaszewski wrote:
> > This is the second shot at the v2.0 C API for libgpiod.
> >
> > Special thanks go out to Kent for his valuable advice and suggestions.
> >
> > The biggest changes are:
> >
> > The concept of attributes has been removed - instead the translation from
> > configuration options to kernel request happens at the time of the line
> > request call and can only fail at this stage - the config mutators no
> > longer return any value.
> >
> > If the caller has passed a config that is too complicated, the request
> > function will set errno to E2BIG which stands for: "Argument list too
> > long".
> >
> > The direction and edge options have been split from the former
> > request_type.
> >
> > The objects are no longer reference counted and no longer can be the
> > responsibility for their lifetime shared.
> >
> > There are many other minor tweaks everywhere.
> >
> > One thing I've been contemplating is whether we should expose some
> > functions allowing callers to check if the line config has already
> > become too complex or values passed are invalid. This would allow
> > languages that have exceptions throw them before we actually make the
> > request call. Does this make sense?
> >
>
> Wrt passing invalid values, I suggested error-less mutators on the
> assumption they wouldn't have parameters that require range checking.
> e.g. my Go library has AsInput() and AsOutput(value)
> Your equivalents are:
>     gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_INPUT)
> and
>     gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_OUTPUT)
>
> If you need to perform range checking on the parameters then the mutator
> should return an error code.
>

Isn't this inconsistent with the complexity validation that only
happens at request-time? You could say that a config could also
transition from a state with an invalid value to a one where it's
fine. The error code would indicate the reason for the request
failure: either E2BIG for too complex config or EINVAL for invalid
values inside it.

> OTOH, for the active level you provide two error-less mutators,
> gpiod_line_config_set_active_low() and
> gpiod_line_config_set_active_high(), which is fine.
>
> Wrt exposing complexity validation functions, I don't see the benefit.
> The config may transition through complex states, so long as at the time
> the gpiod_chip_request_lines() or gpiod_line_request_reconfigure_lines()
> is called it isn't too complex and so can be translated to the uAPI.
> The check has to be performed as part of those functions either way, and
> validating a transitional config doesn't prove anything.
>

Indeed. OTOH with return values in mutators taking integer values we
would throw errors on invalid values passed. I need to think about it
some more.

> > This time the new API is in one big patch for easier review. This
> > changeset doesn't modify the bindings or tests but the tools compile
> > and pass all tests.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  include/gpiod.h            | 1222 ++++++++++++++++++-----------------
> >  lib/Makefile.am            |   13 +-
> >  lib/chip.c                 |  216 +++++++
> >  lib/core.c                 | 1240 ------------------------------------
> >  lib/edge-event.c           |  184 ++++++
> >  lib/helpers.c              |  302 ---------
> >  lib/info-event.c           |   83 +++
> >  lib/internal.c             |   58 ++
> >  lib/internal.h             |   28 +
> >  lib/line-config.c          |  674 ++++++++++++++++++++
> >  lib/line-info.c            |  164 +++++
> >  lib/line-request.c         |  192 ++++++
> >  lib/misc.c                 |   63 ++
> >  lib/request-config.c       |   98 +++
> >  tools/gpio-tools-test.bats |   12 +-
> >  tools/gpiodetect.c         |   13 +-
> >  tools/gpiofind.c           |    3 +-
> >  tools/gpioget.c            |   66 +-
> >  tools/gpioinfo.c           |   60 +-
> >  tools/gpiomon.c            |  133 ++--
> >  tools/gpioset.c            |   75 ++-
> >  tools/tools-common.c       |    8 +-
> >  tools/tools-common.h       |    2 +-
> >  23 files changed, 2607 insertions(+), 2302 deletions(-)
> >  create mode 100644 lib/chip.c
> >  delete mode 100644 lib/core.c
> >  create mode 100644 lib/edge-event.c
> >  delete mode 100644 lib/helpers.c
> >  create mode 100644 lib/info-event.c
> >  create mode 100644 lib/internal.c
> >  create mode 100644 lib/line-config.c
> >  create mode 100644 lib/line-info.c
> >  create mode 100644 lib/line-request.c
> >  create mode 100644 lib/request-config.c
> >
> > diff --git a/include/gpiod.h b/include/gpiod.h
> > index a4ce01f..bd4689f 100644
> > --- a/include/gpiod.h
> > +++ b/include/gpiod.h
> > @@ -1,12 +1,12 @@
> >  /* SPDX-License-Identifier: LGPL-2.1-or-later */
> >  /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
> > +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
>
>
> I'm only going to look at the header here - I'm assuming the other changes
> just follow from the API changes.
>
> <snip>
>
> >  /**
> > - * @brief Get the handle to the GPIO line at given offset.
> > - * @param chip The GPIO chip object.
> > + * @brief Get the current snapshot of information about the line at given
> > + *        offset.
> > + * @param chip GPIO chip object.
> >   * @param offset The offset of the GPIO line.
> > - * @return Pointer to the GPIO line handle or NULL if an error occured.
> > - */
> > -struct gpiod_line *
> > -gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset);
> > -
> > -/**
> > - * @brief Retrieve a set of lines and store them in a line bulk object.
> > - * @param chip The GPIO chip object.
> > - * @param offsets Array of offsets of lines to retrieve.
> > - * @param num_offsets Number of lines to retrieve.
> > - * @return New line bulk object or NULL on error.
> > + * @return New GPIO line info object or NULL if an error occurred.
> >   */
> > -struct gpiod_line_bulk *
> > -gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
> > -                  unsigned int num_offsets);
> > +struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
> > +                                              unsigned int offset);
> >
>
> Caller takes ownership of the gpiod_line_info, or are we peeking into
> the gpiod_chip internals?  Either way, needs a comment.
>

Caller takes ownership to underline the fact that it's a non-mutable
snapshot of the line config at the time when it was retrieved. I'll
add a comment.

> <snip>
>
> >  /**
> > - * @brief Get the handle to the GPIO chip controlling this line.
> > - * @param line The GPIO line object.
> > - * @return Pointer to the GPIO chip handle controlling this line.
> > + * @brief Get the pointer to the line-info object associated with this event.
> > + * @param event Line info event object.
> > + * @return Returns a pointer to the line-info object associated with this event
> > + *         whose lifetime is tied to the event object. It must not be freed by
> > + *         the caller.
> >   */
> > -struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line);
> > +struct gpiod_line_info *
> > +gpiod_info_event_peek_line_info(struct gpiod_info_event *event);
> > +
>
> Rather than the peek/copy you use here, I would rename the peek to
> get...

Ha! I think we'll disagree here again. In most cases in low-level
linux C libraries, a "get" for complex objects returns a copy (or a
new reference if we're using shared objects). I would like to stay
consistent with that pattern. To me "peek" is a good way to
distinguish those functions that allow you to look into the internals
of the parent object. If anything - I'd go with the get/peek pattern
where the former returns a new object over whose lifetime the caller
takes responsibility and the latter returns a pointer to an object
stored in the parent. I went with copy/peek because it hints at a
different behavior than regular get but I can live with get/peek.

>
> > +/**
> > + * @brief Get a copy of the line-info object associated with this event.
> > + * @param event Line info event object.
> > + * @return Returns a copy of the line-info object associated with this event or
> > + *         NULL on error. The lifetime of the returned object must be managed
> > + *         by the caller and the line-info object must be freed using
> > + *         ::gpiod_line_info_free.
> > + */
> >
> > +struct gpiod_line_info *
> > +gpiod_info_event_copy_line_info(struct gpiod_info_event *event);
>
> ... and change this to
>
>  +struct gpiod_line_info *
>  +gpiod_line_info_copy(struct gpiod_line_info *info);
>
> as that is more generally useful.
>
> Similarly elsewhere you use the peek/copy pattern.
>
> <snip>
>
> > +/**
> > + * @brief Set the output value for a single offset.
> > + * @param config Line config object.
> > + * @param offset Offset of the line.
> > + * @param value Output value to set.
> > + */
> > +void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
> > +                                     unsigned int offset, int value);
> > +
>
> I would rename this to gpiod_line_config_set_output() and have it set
> the direction (to GPIOD_LINE_CONFIG_DIRECTION_OUTPUT of course) as well
> as the value.
>

I like it but how would that plug into the global direction setting?

> And maybe add a gpiod_line_config_set_input()?
>

What about "as is" with this pattern? We agreed that input would be
the default so we need some way to set "as is" too.

Thanks a lot for the review!

Bart

> <snip>
>
> Those are the only things that jump out at me at the moment.
> I much prefer this version over the previous.
> Sorry I haven't had a chance to look at it earlier.
>
> Cheers,
> Kent.
