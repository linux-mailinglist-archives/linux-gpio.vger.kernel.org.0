Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F321007A1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 15:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfKROsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 09:48:33 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37410 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfKROsd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 09:48:33 -0500
Received: by mail-pf1-f194.google.com with SMTP id p24so10511315pfn.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 06:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zi6Qgt15FSzuMirBfAePXcp99DUcVjfSY2iEU5jAzBQ=;
        b=aW/mSAonmf/GDbzR673SpOkKD8AKW30LAnlHrikLTUDxvH3wfAhoMFg+1P15HIH1cx
         9XabhWbki5qf5P3BisFX5+yD618fhWa+mn526uz0lGYuSsvdqK5f4XK8zqGMfBtcve2S
         FKKtIrfx4Da1PDKg16VWd/5nNW1WorCMJ+wENiCQQbHmuGS/gZz956O46p4HepsZAI2I
         cjSMwEZbhvA4SGrxNYpLyc2iK6WvThFcG1wMWEdn3phUH6dsWgRChQvtkvqA3+kwRd9K
         na3+y66T5i9jD5lUP5Grzi4W3NqV+6bfcJTSDr5rzjbOQ/BxgfqFAE+Q5e9h9e6kS6SR
         9Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zi6Qgt15FSzuMirBfAePXcp99DUcVjfSY2iEU5jAzBQ=;
        b=XU8a3AePCrFBVGAm/xCCISEc3uGFdgJ6Y+uv2fZ/pxHl2wKa9vywsLPWnzG/DE3UdW
         vya1L6pFgI+creCgrs21lmSW9IGR6y2bxgtqoy1rMX2+LGQp3SjmEZOLJv0HJoPgsxXw
         thPA/CPXvvtxKi16nBjjvzYWUCeXur0pgQfGq5MGfN/wonV0EyN1DkqoMO7cHTiDkUv5
         hoYWJplLUY321Cq8ixeebfKDphAtggZhTeey/9m42XlATXVrwQ1yWJkEn1wyRRKqI0Rm
         dmE7mTe6/HRyWiIYFa2TeBA/y+99KTVqRZR+RZMaAqYQMZsm71Y4b5/aofh02Qxc9gi7
         SoXg==
X-Gm-Message-State: APjAAAUfRLp45K5qXg7kVnQXz82qwmvaUNWNJV1PN255S6GX/9vK2Fim
        2/SN4AsLSQCrJ/DhroEACC6PHyOpCtiWGw==
X-Google-Smtp-Source: APXvYqybDZ3mlXzykMdSwf7Q2/VUGE4jYB2YBuUGeG0GJGqAPzaAeN1K2vstK18MgZZoBqbbVVoXGQ==
X-Received: by 2002:aa7:8a83:: with SMTP id a3mr34599521pfc.54.1574088510449;
        Mon, 18 Nov 2019 06:48:30 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id q26sm20330059pff.143.2019.11.18.06.48.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:48:29 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:48:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191118144825.GE27359@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski wrote:
> pt., 15 lis 2019 o 15:45 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Extend the libgpiod API to support the setting line configuration using the
> > GPIO GPIOHANDLE_SET_CONFIG_IOCTL uAPI ioctl.
> >
> > The core change is the addition of gpiod_line_set_config, which provides a
> > low level wrapper around the ioctl.
> >
> > Additionally, higher level helper functions, gpiod_line_set_flags,
> > gpiod_line_set_direction_input, and gpiod_line_set_direction_output provide
> > slightly simplified APIs for common use cases.
> >
> > Bulk forms of all functions are also provided.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  include/gpiod.h | 115 ++++++++++++++++++++++++++++
> >  lib/core.c      | 196 +++++++++++++++++++++++++++++++++++++++++++++---
> >  2 files changed, 300 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/gpiod.h b/include/gpiod.h
> > index 159d745..4053fd2 100644
> > --- a/include/gpiod.h
> > +++ b/include/gpiod.h
> > @@ -1252,6 +1252,14 @@ void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
> >   */
> >  bool gpiod_line_is_requested(struct gpiod_line *line) GPIOD_API;
> >
> > +/**
> > + * @brief Check if the calling user has ownership of this line for values,
> > + * not events.
> > + * @param line GPIO line object.
> > + * @return True if given line was requested, false otherwise.
> 
> I'd clarify: "requested for reading/setting values".
> 
> > + */
> > +bool gpiod_line_is_requested_values(struct gpiod_line *line) GPIOD_API;
> > +
> >  /**
> >   * @brief Check if the calling user has neither requested ownership of this
> >   *        line nor configured any event notifications.
> > @@ -1311,6 +1319,113 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
> >  int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
> >                               const int *values) GPIOD_API;
> >
> > +/**
> > + * @}
> > + *
> > + * @defgroup __line_config__ Setting line configuration
> > + * @{
> > + */
> > +
> > +/**
> > + * @brief Update the configuration of a single GPIO line.
> > + * @param line GPIO line object.
> > + * @param direction Updated direction which may be one of
> > + * GPIOD_LINE_REQUEST_DIRECTION_AS_IS, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
> > + * or GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> > + * @param flags Replacement flags.
> > + * @param value The new output value for the line when direction is
> > + * GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + */
> > +int gpiod_line_set_config(struct gpiod_line *line, int direction,
> > +                         int flags, int value) GPIOD_API;
> > +
> > +/**
> > + * @brief Update the configuration of a set of GPIO lines.
> > + * @param bulk Set of GPIO lines.
> > + * @param direction Updated direction which may be one of
> > + * GPIOD_LINE_REQUEST_DIRECTION_AS_IS, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
> > + * or GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> > + * @param flags Replacement flags.
> > + * @param values An array holding line_bulk->num_lines new logical values
> > + * for lines when direction is GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + *
> > + * If the lines were not previously requested together, the behavior is
> > + * undefined.
> > + */
> > +int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
> > +                              int direction, int flags,
> > +                              const int *values) GPIOD_API;
> > +
> > +
> > +/**
> > + * @brief Update the configuration flags of a single GPIO line.
> > + * @param line GPIO line object.
> > + * @param flags Replacement flags.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + */
> > +int gpiod_line_set_flags(struct gpiod_line *line, int flags) GPIOD_API;
> > +
> > +/**
> > + * @brief Update the configuration flags of a set of GPIO lines.
> > + * @param bulk Set of GPIO lines.
> > + * @param flags Replacement flags.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + *
> > + * If the lines were not previously requested together, the behavior is
> > + * undefined.
> > + */
> > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk,
> > +                             int flags) GPIOD_API;
> > +
> > +/**
> > + * @brief Set the direction of a single GPIO line to input.
> > + * @param line GPIO line object.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + */
> > +int gpiod_line_set_direction_input(struct gpiod_line *line) GPIOD_API;
> > +
> > +/**
> > + * @brief Set the direction of a set of GPIO lines to input.
> > + * @param bulk Set of GPIO lines.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + *
> > + * If the lines were not previously requested together, the behavior is
> > + * undefined.
> > + */
> > +int gpiod_line_set_direction_bulk_input(struct gpiod_line_bulk *bulk
> > +                                       ) GPIOD_API;
> 
> Please stick to the current convention of having "_bulk" at the end of
> the function name.
> 

That would be clearer.  Not sure why I went with those names - maybe
taking the lead from gpiod_line_request_bulk_falling_edge_events_flags?
Maybe I originally had a core set_direction function, and these were to
be wrappers around that?
Anyway - will change it.

> > +
> > +/**
> > + * @brief Set the direction of a single GPIO line to output.
> > + * @param line GPIO line object.
> > + * @param value The logical value output on the line.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + */
> > +int gpiod_line_set_direction_output(struct gpiod_line *line,
> > +                                   int value) GPIOD_API;
> > +
> > +/**
> > + * @brief Set the direction of a set of GPIO lines to output.
> > + * @param bulk Set of GPIO lines.
> > + * @values The logical value to output for each line.
> > + * @return 0 is the operation succeeds. In case of an error this routine
> > + *         returns -1 and sets the last error number.
> > + *
> > + * If the lines were not previously requested together, the behavior is
> > + * undefined.
> > + */
> > +int gpiod_line_set_direction_bulk_output(struct gpiod_line_bulk *bulk,
> > +                                        const int *values) GPIOD_API;
> > +
> >  /**
> >   * @}
> >   *
> > diff --git a/lib/core.c b/lib/core.c
> > index 9b7d88f..c42cda5 100644
> > --- a/lib/core.c
> > +++ b/lib/core.c
> > @@ -36,10 +36,13 @@ struct gpiod_line {
> >         unsigned int offset;
> >         int direction;
> >         int active_state;
> > -       __u32 flags;
> > +       int output_value;
> > +       __u32 lflags;
> > +       __u32 cflags;
> 
> Ugh, these aren't very fortunate names - at first glance I have no
> idea what they mean. Either document those or change the names to
> something more obvious.
> 

Yeah - not the best - lflags are line_flags (those returned by
LINEINFO_IOCTL) and cflags is config_flags (those set in the initial
line request).  So maybe rename lflags to line_flags or info_flags,
and rename cflags to handle_flags or req_flags?
And add some documentation as well.

> >
> >         int state;
> >         bool needs_update;
> > +       bool as_is;
> >
> >         struct gpiod_chip *chip;
> >         struct line_fd_handle *fd_handle;
> > @@ -359,11 +362,11 @@ int gpiod_line_active_state(struct gpiod_line *line)
> >
> >  int gpiod_line_bias(struct gpiod_line *line)
> >  {
> > -       if (line->flags & GPIOLINE_FLAG_BIAS_DISABLE)
> > +       if (line->lflags & GPIOLINE_FLAG_BIAS_DISABLE)
> >                 return GPIOD_LINE_BIAS_DISABLE;
> > -       if (line->flags & GPIOLINE_FLAG_BIAS_PULL_UP)
> > +       if (line->lflags & GPIOLINE_FLAG_BIAS_PULL_UP)
> >                 return GPIOD_LINE_BIAS_PULL_UP;
> > -       if (line->flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
> > +       if (line->lflags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
> >                 return GPIOD_LINE_BIAS_PULL_DOWN;
> >
> >         return GPIOD_LINE_BIAS_AS_IS;
> > @@ -371,17 +374,17 @@ int gpiod_line_bias(struct gpiod_line *line)
> >
> >  bool gpiod_line_is_used(struct gpiod_line *line)
> >  {
> > -       return line->flags & GPIOLINE_FLAG_KERNEL;
> > +       return line->lflags & GPIOLINE_FLAG_KERNEL;
> >  }
> >
> >  bool gpiod_line_is_open_drain(struct gpiod_line *line)
> >  {
> > -       return line->flags & GPIOLINE_FLAG_OPEN_DRAIN;
> > +       return line->lflags & GPIOLINE_FLAG_OPEN_DRAIN;
> >  }
> >
> >  bool gpiod_line_is_open_source(struct gpiod_line *line)
> >  {
> > -       return line->flags & GPIOLINE_FLAG_OPEN_SOURCE;
> > +       return line->lflags & GPIOLINE_FLAG_OPEN_SOURCE;
> >  }
> >
> >  bool gpiod_line_needs_update(struct gpiod_line *line)
> > @@ -408,7 +411,7 @@ int gpiod_line_update(struct gpiod_line *line)
> >                                                 ? GPIOD_LINE_ACTIVE_STATE_LOW
> >                                                 : GPIOD_LINE_ACTIVE_STATE_HIGH;
> >
> > -       line->flags = info.flags;
> > +       line->lflags = info.flags;
> >
> >         strncpy(line->name, info.name, sizeof(line->name));
> >         strncpy(line->consumer, info.consumer, sizeof(line->consumer));
> > @@ -457,6 +460,20 @@ static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
> >         return true;
> >  }
> >
> > +static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
> > +{
> > +       struct gpiod_line *line, **lineptr;
> > +
> > +       gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
> > +               if (!gpiod_line_is_requested_values(line)) {
> > +                       errno = EPERM;
> > +                       return false;
> > +               }
> > +       }
> > +
> > +       return true;
> > +}
> > +
> >  static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
> >  {
> >         struct gpiod_line *line, **lineptr;
> > @@ -471,6 +488,27 @@ static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
> >         return true;
> >  }
> >
> > +static bool line_request_direction_is_valid(int direction)
> > +{
> > +       if ((direction == GPIOD_LINE_REQUEST_DIRECTION_AS_IS) ||
> > +           (direction == GPIOD_LINE_REQUEST_DIRECTION_INPUT) ||
> > +           (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT))
> > +               return true;
> > +
> > +       errno = EINVAL;
> > +       return false;
> > +}
> > +
> > +static __u32 line_request_direction_to_gpio_handleflag(int direction)
> > +{
> > +       if (direction == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
> > +               return GPIOHANDLE_REQUEST_INPUT;
> > +       if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> > +               return GPIOHANDLE_REQUEST_OUTPUT;
> > +
> > +       return 0;
> > +}
> > +
> >  static __u32 line_request_flag_to_gpio_handleflag(int flags)
> >  {
> >         int hflags = 0;
> > @@ -495,7 +533,7 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
> >                                const struct gpiod_line_request_config *config,
> >                                const int *default_vals)
> >  {
> > -       struct gpiod_line *line, **lineptr;
> > +       struct gpiod_line *line;
> >         struct line_fd_handle *line_fd;
> >         struct gpiohandle_request req;
> >         unsigned int i;
> > @@ -524,7 +562,6 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
> >         else if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> >                 req.flags |= GPIOHANDLE_REQUEST_OUTPUT;
> >
> > -
> >         gpiod_line_bulk_foreach_line_off(bulk, line, i) {
> >                 req.lineoffsets[i] = gpiod_line_offset(line);
> >                 if (config->request_type ==
> > @@ -548,8 +585,14 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
> >         if (!line_fd)
> >                 return -1;
> >
> > -       gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
> > +       gpiod_line_bulk_foreach_line_off(bulk, line, i) {
> >                 line->state = LINE_REQUESTED_VALUES;
> > +               line->cflags = config->flags;
> > +               if (config->request_type ==
> > +                       GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> > +                       line->output_value = req.default_values[i];
> > +               if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_AS_IS)
> > +                       line->as_is = true;
> >                 line_set_fd(line, line_fd);
> >                 line_maybe_update(line);
> >         }
> > @@ -590,6 +633,7 @@ static int line_request_event_single(struct gpiod_line *line,
> >                 return -1;
> >
> >         line->state = LINE_REQUESTED_EVENTS;
> > +       line->cflags = config->flags;
> >         line_set_fd(line, line_fd);
> >         line_maybe_update(line);
> >
> > @@ -688,6 +732,11 @@ bool gpiod_line_is_requested(struct gpiod_line *line)
> >                 line->state == LINE_REQUESTED_EVENTS);
> >  }
> >
> > +bool gpiod_line_is_requested_values(struct gpiod_line *line)
> > +{
> > +       return (line->state == LINE_REQUESTED_VALUES);
> > +}
> > +
> >  bool gpiod_line_is_free(struct gpiod_line *line)
> >  {
> >         return line->state == LINE_FREE;
> > @@ -766,9 +815,134 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
> >         if (rv < 0)
> >                 return -1;
> >
> > +       gpiod_line_bulk_foreach_line_off(bulk, line, i)
> > +               line->output_value = data.values[i];
> > +
> > +       return 0;
> > +}
> > +
> > +int gpiod_line_set_config(struct gpiod_line *line, int direction,
> > +                         int flags, int value)
> > +{
> > +       struct gpiod_line_bulk bulk;
> > +
> > +       gpiod_line_bulk_init(&bulk);
> > +       gpiod_line_bulk_add(&bulk, line);
> > +
> > +       return gpiod_line_set_config_bulk(&bulk, direction, flags, &value);
> > +}
> > +
> > +int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
> > +                              int direction, int flags,
> > +                              const int *values)
> > +{
> > +       struct gpiohandle_config hcfg;
> > +       struct gpiod_line *line;
> > +       unsigned int i;
> > +       int rv, fd;
> > +       bool as_is;
> > +
> > +       if (!line_bulk_same_chip(bulk) ||
> > +           !line_bulk_all_requested_values(bulk))
> > +               return -1;
> > +
> > +       if (!line_request_direction_is_valid(direction))
> > +               return -1;
> > +
> > +       memset(&hcfg, 0, sizeof(hcfg));
> > +
> > +       hcfg.flags = line_request_flag_to_gpio_handleflag(flags);
> > +       hcfg.flags |= line_request_direction_to_gpio_handleflag(direction);
> > +       if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT && values) {
> > +               for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> > +                       hcfg.default_values[i] = (uint8_t)!!values[i];
> > +       }
> > +
> > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > +       fd = line_get_fd(line);
> > +
> > +       rv = ioctl(fd, GPIOHANDLE_SET_CONFIG_IOCTL, &hcfg);
> > +       if (rv < 0)
> > +               return -1;
> > +
> > +       as_is = line->as_is && direction == GPIOD_LINE_REQUEST_DIRECTION_AS_IS;
> > +       gpiod_line_bulk_foreach_line_off(bulk, line, i) {
> > +               line->cflags = flags;
> > +               if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> > +                       line->output_value = hcfg.default_values[i];
> > +               line->as_is = as_is;
> > +               line_maybe_update(line);
> > +       }
> >         return 0;
> >  }
> >
> > +int gpiod_line_set_flags(struct gpiod_line *line, int flags)
> > +{
> > +       struct gpiod_line_bulk bulk;
> > +
> > +       gpiod_line_bulk_init(&bulk);
> > +       gpiod_line_bulk_add(&bulk, line);
> > +
> > +       return gpiod_line_set_flags_bulk(&bulk, flags);
> > +}
> > +
> > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > +{
> > +       struct gpiod_line *line;
> > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > +       unsigned int i;
> > +       int direction;
> > +
> > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > +       if (line->as_is) {
> 
> Can you explain the purpose of this as_is field? I'm not sure this is
> really needed.
> 

It is there for gpiod_set_flags, which has to populate the direction
flags in the SET_CONFIG ioctl. The existing line->direction is
either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
as-is is gets mapped to input.
I didn't want to change the existing line->direction, and adding the
as-is seemed clearer than adding another flavour of direction that
contained all three.

Happy to entertain alternatives...

Cheers,
Kent.

