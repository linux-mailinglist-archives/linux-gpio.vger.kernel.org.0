Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BD6392CA5
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 13:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhE0L2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhE0L2o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 07:28:44 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD86C061574
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 04:27:11 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id x188so336503pfd.7
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 04:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3wBpSUVg6qXpkWKAKiPy6Uw2WE/yp8PrjKzwQj+j6m4=;
        b=s29Uwvm57+ZQuSur7ilnMAtNno6NdxhnxaXe1lBCfPyqtAzJuDYDWOxRO2XlnGAepV
         rEmRBikpF6kRgwGZqVA20CyQgciCGgWByug2AF/TnC13nl0+vRYrAaKFDHSxgxcvgaBq
         Qqbw1ptJAA/osCcbqbPzULMyCuVNmvs+NwuM9zx+U2DZfG3rQWgS57jYYLf6GEUW0K3T
         G/8xFAuijY3mn2KnobzWJhqAsA5eeX0lzbR8WTUGQ0AEVL49gdfy1lje4TM9bgI1SOli
         wcSmzCW8bYrcNZiQA3VnYECeXL8hFQTrX+bbwMv+HB1VaCDE0YE2qJLppTZtAZnU90w+
         GolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3wBpSUVg6qXpkWKAKiPy6Uw2WE/yp8PrjKzwQj+j6m4=;
        b=s6qs1A7fR8lFikFziV3MN4MLTviGP10UPhmNsJeGh7uHq2/o+wTTdDqv/987mcyDaz
         eTpp+lHf0hxRcyLzKLLUuw0zXN0X8Txj8O4MdNYC/s74GH2Y0zPGgRCwkPVbD4aYWz/V
         pQcL5M+crNIVfkjDpiyv7NIXPAKTlHA9C5yHi4mG2mY73mXcs5yMCMdOxpibWJQhmfB2
         mzzv2YB0MUK7jhAdMqUTbuIcwqUC0YcqNnMzhGdXLZ/4UXwgX61z0B9ZZR1wYeCcrCM0
         I7qWTz2wTN9vVwpco4osYZzMbfnqUsY8v6hzVRVon7LCMcTafzRk6L4s0WstP0AnPfhP
         ffnA==
X-Gm-Message-State: AOAM53336vuBbtZXgNE+Ue6NF9IASZgvoT0RSi8MKzHD+gXGDkcmAzNy
        33A7WRXJgdaxuuoTYU3Ja+E=
X-Google-Smtp-Source: ABdhPJwJ9epch87Oft2R5PXqmQ24i2NTWJeoDYFzjYiNSy5FL5JComM5la3VCJPSKWf/mPZLU6DpeQ==
X-Received: by 2002:a05:6a00:cd3:b029:27f:c296:4a5d with SMTP id b19-20020a056a000cd3b029027fc2964a5dmr3276668pfv.38.1622114830874;
        Thu, 27 May 2021 04:27:10 -0700 (PDT)
Received: from sol (106-69-175-91.dyn.iinet.net.au. [106.69.175.91])
        by smtp.gmail.com with ESMTPSA id p14sm1714485pjh.27.2021.05.27.04.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 04:27:10 -0700 (PDT)
Date:   Thu, 27 May 2021 19:27:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC v2] core: implement v2.0 API
Message-ID: <20210527112705.GA20965@sol>
References: <20210518191855.12647-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518191855.12647-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 09:18:55PM +0200, Bartosz Golaszewski wrote:
> This is the second shot at the v2.0 C API for libgpiod.
> 
> Special thanks go out to Kent for his valuable advice and suggestions.
> 
> The biggest changes are:
> 
> The concept of attributes has been removed - instead the translation from
> configuration options to kernel request happens at the time of the line
> request call and can only fail at this stage - the config mutators no
> longer return any value.
> 
> If the caller has passed a config that is too complicated, the request
> function will set errno to E2BIG which stands for: "Argument list too
> long".
> 
> The direction and edge options have been split from the former
> request_type.
> 
> The objects are no longer reference counted and no longer can be the
> responsibility for their lifetime shared.
> 
> There are many other minor tweaks everywhere.
> 
> One thing I've been contemplating is whether we should expose some
> functions allowing callers to check if the line config has already
> become too complex or values passed are invalid. This would allow
> languages that have exceptions throw them before we actually make the
> request call. Does this make sense?
> 

Wrt passing invalid values, I suggested error-less mutators on the
assumption they wouldn't have parameters that require range checking.
e.g. my Go library has AsInput() and AsOutput(value)
Your equivalents are:
    gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_INPUT)
and
    gpiod_line_config_set_direction(cfg, GPIOD_LINE_CONFIG_DIRECTION_OUTPUT)

If you need to perform range checking on the parameters then the mutator
should return an error code.

OTOH, for the active level you provide two error-less mutators,
gpiod_line_config_set_active_low() and
gpiod_line_config_set_active_high(), which is fine.

Wrt exposing complexity validation functions, I don't see the benefit.
The config may transition through complex states, so long as at the time
the gpiod_chip_request_lines() or gpiod_line_request_reconfigure_lines()
is called it isn't too complex and so can be translated to the uAPI.
The check has to be performed as part of those functions either way, and
validating a transitional config doesn't prove anything.

> This time the new API is in one big patch for easier review. This
> changeset doesn't modify the bindings or tests but the tools compile
> and pass all tests.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  include/gpiod.h            | 1222 ++++++++++++++++++-----------------
>  lib/Makefile.am            |   13 +-
>  lib/chip.c                 |  216 +++++++
>  lib/core.c                 | 1240 ------------------------------------
>  lib/edge-event.c           |  184 ++++++
>  lib/helpers.c              |  302 ---------
>  lib/info-event.c           |   83 +++
>  lib/internal.c             |   58 ++
>  lib/internal.h             |   28 +
>  lib/line-config.c          |  674 ++++++++++++++++++++
>  lib/line-info.c            |  164 +++++
>  lib/line-request.c         |  192 ++++++
>  lib/misc.c                 |   63 ++
>  lib/request-config.c       |   98 +++
>  tools/gpio-tools-test.bats |   12 +-
>  tools/gpiodetect.c         |   13 +-
>  tools/gpiofind.c           |    3 +-
>  tools/gpioget.c            |   66 +-
>  tools/gpioinfo.c           |   60 +-
>  tools/gpiomon.c            |  133 ++--
>  tools/gpioset.c            |   75 ++-
>  tools/tools-common.c       |    8 +-
>  tools/tools-common.h       |    2 +-
>  23 files changed, 2607 insertions(+), 2302 deletions(-)
>  create mode 100644 lib/chip.c
>  delete mode 100644 lib/core.c
>  create mode 100644 lib/edge-event.c
>  delete mode 100644 lib/helpers.c
>  create mode 100644 lib/info-event.c
>  create mode 100644 lib/internal.c
>  create mode 100644 lib/line-config.c
>  create mode 100644 lib/line-info.c
>  create mode 100644 lib/line-request.c
>  create mode 100644 lib/request-config.c
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index a4ce01f..bd4689f 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -1,12 +1,12 @@
>  /* SPDX-License-Identifier: LGPL-2.1-or-later */
>  /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */


I'm only going to look at the header here - I'm assuming the other changes
just follow from the API changes.

<snip>

>  /**
> - * @brief Get the handle to the GPIO line at given offset.
> - * @param chip The GPIO chip object.
> + * @brief Get the current snapshot of information about the line at given
> + *        offset.
> + * @param chip GPIO chip object.
>   * @param offset The offset of the GPIO line.
> - * @return Pointer to the GPIO line handle or NULL if an error occured.
> - */
> -struct gpiod_line *
> -gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset);
> -
> -/**
> - * @brief Retrieve a set of lines and store them in a line bulk object.
> - * @param chip The GPIO chip object.
> - * @param offsets Array of offsets of lines to retrieve.
> - * @param num_offsets Number of lines to retrieve.
> - * @return New line bulk object or NULL on error.
> + * @return New GPIO line info object or NULL if an error occurred.
>   */
> -struct gpiod_line_bulk *
> -gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
> -		     unsigned int num_offsets);
> +struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chip,
> +						 unsigned int offset);
>  

Caller takes ownership of the gpiod_line_info, or are we peeking into
the gpiod_chip internals?  Either way, needs a comment.

<snip>

>  /**
> - * @brief Get the handle to the GPIO chip controlling this line.
> - * @param line The GPIO line object.
> - * @return Pointer to the GPIO chip handle controlling this line.
> + * @brief Get the pointer to the line-info object associated with this event.
> + * @param event Line info event object.
> + * @return Returns a pointer to the line-info object associated with this event
> + *         whose lifetime is tied to the event object. It must not be freed by
> + *         the caller.
>   */
> -struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line);
> +struct gpiod_line_info *
> +gpiod_info_event_peek_line_info(struct gpiod_info_event *event);
> +

Rather than the peek/copy you use here, I would rename the peek to
get...

> +/**
> + * @brief Get a copy of the line-info object associated with this event.
> + * @param event Line info event object.
> + * @return Returns a copy of the line-info object associated with this event or
> + *         NULL on error. The lifetime of the returned object must be managed
> + *         by the caller and the line-info object must be freed using
> + *         ::gpiod_line_info_free.
> + */
>  
> +struct gpiod_line_info *
> +gpiod_info_event_copy_line_info(struct gpiod_info_event *event);

... and change this to 

 +struct gpiod_line_info *
 +gpiod_line_info_copy(struct gpiod_line_info *info);

as that is more generally useful.

Similarly elsewhere you use the peek/copy pattern.

<snip>

> +/**
> + * @brief Set the output value for a single offset.
> + * @param config Line config object.
> + * @param offset Offset of the line.
> + * @param value Output value to set.
> + */
> +void gpiod_line_config_set_output_value(struct gpiod_line_config *config,
> +					unsigned int offset, int value);
> +

I would rename this to gpiod_line_config_set_output() and have it set
the direction (to GPIOD_LINE_CONFIG_DIRECTION_OUTPUT of course) as well
as the value.

And maybe add a gpiod_line_config_set_input()?

<snip>

Those are the only things that jump out at me at the moment.
I much prefer this version over the previous.
Sorry I haven't had a chance to look at it earlier.

Cheers,
Kent.
