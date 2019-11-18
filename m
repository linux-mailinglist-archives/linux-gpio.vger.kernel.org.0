Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 441D31006CC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfKRNvV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:51:21 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40837 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfKRNvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 08:51:20 -0500
Received: by mail-ot1-f68.google.com with SMTP id m15so14528180otq.7
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 05:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e4LFtBtKWvfNoC53D8B7r3+tiUCei/Ll0rqVxlqiWN8=;
        b=y9s2vjOrud91yxx26ufNav3h+QqYnv1qf1qQcKZ1mPbT4ur7BVnx30lfHwj70jjaWM
         qLvOQIw0szWAvFHor+GygDTI6UVVtXqdk/5KEa2RxGcy9VJ69G6WFr7qMKq1/oD4LPMD
         Kh9JWnkkGFUTayiFSGCxQRwnqTIM72kLRGO6rEZTSqLUgM0Ol1x7Z2qJoxAGz5CCQ4ss
         L4FoQHJz3nPVNxZqkDjoQ4YRrLGVqM3lpwTsvSLMymuhdi8GiQdUm+W3QMKvE7JlR420
         D+WXbPl7YQlnxDhBJ/KYKL82YgYj4SuVm5C+Hq+Uy0U5GttwjuplIRtpxoFdp1gNiGhc
         Ugmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e4LFtBtKWvfNoC53D8B7r3+tiUCei/Ll0rqVxlqiWN8=;
        b=tvOb4LnG1yaNVUvpSh3x6xBAEHDAq+qHV9lFkrPMwcYF8cik5bCm4mdtIubMhvVIF7
         vUJxMFB46x8VcR8euHrnFdv4QaejEHxV3QVCD/f+ahfkzAti/1UHxLuaY6A4TOWh+c70
         bkbo1XtuT1xJImKx+lIyCR8dSsjq2rYIM6Dp2wD3cPN/WbdqcWOhr7LMdcdmaAlOjWci
         eqh5e9I2Ig7VB/8u9zjsd+L1rAHCSz3T7NDJun1pYRgcWck32im9M0JlDihliDQiR9xr
         S8/TaqgIoHAUWlu7MVbM+6xm1SAqmx3m7+0WuDtQfe5I3vcqhnv4kSErTTlmsGrc0xJd
         Sh5g==
X-Gm-Message-State: APjAAAWjsr7T+n9cpfPw9aFWy3clQSxd8jKO0E5ZSQO/CgI83j1uLYcE
        /vOz+8thj6XDGcM9zr+G+4lM7uY//dwvL6+RGOz1Fq9D
X-Google-Smtp-Source: APXvYqy2VXFCdPB+winaCrEVozz1m3pxF8fKNmnAaqn4tMS7tq2rCi24j6gsPwETrBxi7DvidALCOIBfc4BppUwUXRw=
X-Received: by 2002:a9d:77cb:: with SMTP id w11mr23051886otl.292.1574085077498;
 Mon, 18 Nov 2019 05:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-3-warthog618@gmail.com>
In-Reply-To: <20191115144355.975-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 14:51:06 +0100
Message-ID: <CAMpxmJXRuRmE9-9mk9uv47kviMUO=+oEgPO0KtVB77JW8M_AYg@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 02/19] API: add support for bias flags
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Extend the libgpiod API to support the bias flags recently added to the
> kernel GPIO uAPI.  The core change is the addition of
> GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_U=
P
> and GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN flags to be passed into
> line_request functions, and the addition of gpiod_line_bias to return the
> bias state of lines.
>
> Extended variants of the ctxless functions that accept an active_low flag
> are added to also accept other flags. The variant names add a "_ext"
> suffix to the name of the original function.
>
> Based on initial work by Drew Fustini <drew@pdp7.com>.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Hi Kent,

this looks good, just a couple nits. I'd change the subject line to
"core: add support for bias flags". Also: how about moving the flags
argument to the last position in all the ctxless extended variants, so
that they keep the same signature *except* for the appended new
argument?

Bart



> ---
>  include/gpiod.h | 184 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/core.c      |  32 ++++++---
>  lib/ctxless.c   | 115 +++++++++++++++++++++++++++---
>  3 files changed, 313 insertions(+), 18 deletions(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 9860ea8..0f01cab 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -84,6 +84,22 @@ struct gpiod_line_bulk;
>   * the need to use the gpiod_* structures or to keep track of resources.
>   */
>
> +/**
> + * @brief Miscellaneous GPIO flags.
> + */
> +enum {
> +       GPIOD_CTXLESS_FLAG_OPEN_DRAIN           =3D GPIOD_BIT(0),
> +       /**< The line is an open-drain port. */
> +       GPIOD_CTXLESS_FLAG_OPEN_SOURCE          =3D GPIOD_BIT(1),
> +       /**< The line is an open-source port. */
> +       GPIOD_CTXLESS_FLAG_BIAS_DISABLE         =3D GPIOD_BIT(2),
> +       /**< The line has neither either pull-up nor pull-down resistor *=
/
> +       GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN       =3D GPIOD_BIT(3),
> +       /**< The line has pull-down resistor enabled */
> +       GPIOD_CTXLESS_FLAG_BIAS_PULL_UP         =3D GPIOD_BIT(4),
> +       /**< The line has pull-up resistor enabled */
> +};
> +
>  /**
>   * @brief Read current value from a single GPIO line.
>   * @param device Name, path, number or label of the gpiochip.
> @@ -95,6 +111,19 @@ struct gpiod_line_bulk;
>  int gpiod_ctxless_get_value(const char *device, unsigned int offset,
>                             bool active_low, const char *consumer) GPIOD_=
API;
>
> +/**
> + * @brief Read current value from a single GPIO line.
> + * @param device Name, path, number or label of the gpiochip.
> + * @param offset Offset of the GPIO line.
> + * @param active_low The active state of this line - true if low.
> + * @param flags The flags for the line.
> + * @param consumer Name of the consumer.
> + * @return 0 or 1 (GPIO value) if the operation succeeds, -1 on error.
> + */
> +int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
> +                               bool active_low, int flags,
> +                               const char *consumer) GPIOD_API;
> +
>  /**
>   * @brief Read current values from a set of GPIO lines.
>   * @param device Name, path, number or label of the gpiochip.
> @@ -110,6 +139,24 @@ int gpiod_ctxless_get_value_multiple(const char *dev=
ice,
>                                      unsigned int num_lines, bool active_=
low,
>                                      const char *consumer) GPIOD_API;
>
> +/**
> + * @brief Read current values from a set of GPIO lines.
> + * @param device Name, path, number or label of the gpiochip.
> + * @param offsets Array of offsets of lines whose values should be read.
> + * @param values Buffer in which the values will be stored.
> + * @param num_lines Number of lines, must be > 0.
> + * @param active_low The active state of this line - true if low.
> + * @param flags The flags for the lines.
> + * @param consumer Name of the consumer.
> + * @return 0 if the operation succeeds, -1 on error.
> + */
> +int gpiod_ctxless_get_value_multiple_ext(const char *device,
> +                                        const unsigned int *offsets,
> +                                        int *values,
> +                                        unsigned int num_lines,
> +                                        bool active_low, int flags,
> +                                        const char *consumer) GPIOD_API;
> +
>  /**
>   * @brief Simple set value callback signature.
>   */
> @@ -133,6 +180,26 @@ int gpiod_ctxless_set_value(const char *device, unsi=
gned int offset, int value,
>                             gpiod_ctxless_set_value_cb cb,
>                             void *data) GPIOD_API;
>
> +/**
> + * @brief Set value of a single GPIO line.
> + * @param device Name, path, number or label of the gpiochip.
> + * @param offset The offset of the GPIO line.
> + * @param value New value (0 or 1).
> + * @param active_low The active state of this line - true if low.
> + * @param flags The flags for the line.
> + * @param consumer Name of the consumer.
> + * @param cb Optional callback function that will be called right after =
setting
> + *           the value. Users can use this, for example, to pause the ex=
ecution
> + *           after toggling a GPIO.
> + * @param data Optional user data that will be passed to the callback fu=
nction.
> + * @return 0 if the operation succeeds, -1 on error.
> + */
> +int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
> +                               int value, bool active_low, int flags,
> +                               const char *consumer,
> +                               gpiod_ctxless_set_value_cb cb,
> +                               void *data) GPIOD_API;
> +
>  /**
>   * @brief Set values of multiple GPIO lines.
>   * @param device Name, path, number or label of the gpiochip.
> @@ -153,6 +220,29 @@ int gpiod_ctxless_set_value_multiple(const char *dev=
ice,
>                                      gpiod_ctxless_set_value_cb cb,
>                                      void *data) GPIOD_API;
>
> +/**
> + * @brief Set values of multiple GPIO lines.
> + * @param device Name, path, number or label of the gpiochip.
> + * @param offsets Array of offsets of lines the values of which should b=
e set.
> + * @param values Array of integers containing new values.
> + * @param num_lines Number of lines, must be > 0.
> + * @param active_low The active state of this line - true if low.
> + * @param flags The flags for the lines.
> + * @param consumer Name of the consumer.
> + * @param cb Optional callback function that will be called right after =
setting
> + *           all values. Works the same as in ::gpiod_ctxless_set_value.
> + * @param data Optional user data that will be passed to the callback fu=
nction.
> + * @return 0 if the operation succeeds, -1 on error.
> + */
> +int gpiod_ctxless_set_value_multiple_ext(const char *device,
> +                                        const unsigned int *offsets,
> +                                        const int *values,
> +                                        unsigned int num_lines,
> +                                        bool active_low, int flags,
> +                                        const char *consumer,
> +                                        gpiod_ctxless_set_value_cb cb,
> +                                        void *data) GPIOD_API;
> +
>  /**
>   * @brief Event types that the ctxless event monitor can wait for.
>   */
> @@ -327,6 +417,31 @@ int gpiod_ctxless_event_monitor(const char *device, =
int event_type,
>                                 gpiod_ctxless_event_handle_cb event_cb,
>                                 void *data) GPIOD_API;
>
> +/**
> + * @brief Wait for events on a single GPIO line.
> + * @param device Name, path, number or label of the gpiochip.
> + * @param event_type Type of events to listen for.
> + * @param offset GPIO line offset to monitor.
> + * @param active_low The active state of this line - true if low.
> + * @param flags The flags for the line.
> + * @param consumer Name of the consumer.
> + * @param timeout Maximum wait time for each iteration.
> + * @param poll_cb Callback function to call when waiting for events.
> + * @param event_cb Callback function to call for each line event.
> + * @param data User data passed to the callback.
> + * @return 0 if no errors were encountered, -1 if an error occurred.
> + * @note The way the ctxless event loop works is described in detail in
> + *       ::gpiod_ctxless_event_monitor_multiple - this is just a wrapper=
 aound
> + *       this routine which calls it for a single GPIO line.
> + */
> +int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
> +                                   unsigned int offset, bool active_low,
> +                                   int flags, const char *consumer,
> +                                   const struct timespec *timeout,
> +                                   gpiod_ctxless_event_poll_cb poll_cb,
> +                                   gpiod_ctxless_event_handle_cb event_c=
b,
> +                                   void *data) GPIOD_API;
> +
>  /**
>   * @brief Wait for events on multiple GPIO lines.
>   * @param device Name, path, number or label of the gpiochip.
> @@ -366,6 +481,47 @@ int gpiod_ctxless_event_monitor_multiple(
>                         gpiod_ctxless_event_handle_cb event_cb,
>                         void *data) GPIOD_API;
>
> +/**
> + * @brief Wait for events on multiple GPIO lines.
> + * @param device Name, path, number or label of the gpiochip.
> + * @param event_type Type of events to listen for.
> + * @param offsets Array of GPIO line offsets to monitor.
> + * @param num_lines Number of lines to monitor.
> + * @param active_low The active state of this line - true if low.
> + * @param flags The flags for the lines.
> + * @param consumer Name of the consumer.
> + * @param timeout Maximum wait time for each iteration.
> + * @param poll_cb Callback function to call when waiting for events. Can
> + *                be NULL.
> + * @param event_cb Callback function to call on event occurrence.
> + * @param data User data passed to the callback.
> + * @return 0 no errors were encountered, -1 if an error occurred.
> + * @note The poll callback can be NULL in which case the routine will fa=
ll
> + *       back to a basic, ppoll() based callback.
> + *
> + * Internally this routine opens the GPIO chip, requests the set of line=
s for
> + * the type of events specified in the event_type parameter and calls th=
e
> + * polling callback in a loop. The role of the polling callback is to de=
tect
> + * input events on a set of file descriptors and notify the caller about=
 the
> + * fds ready for reading.
> + *
> + * The ctxless event loop then reads each queued event from marked descr=
iptors
> + * and calls the event callback. Both callbacks can stop the loop at any
> + * point.
> + *
> + * The poll_cb argument can be NULL in which case the function falls bac=
k to
> + * a default, ppoll() based callback.
> + */
> +int gpiod_ctxless_event_monitor_multiple_ext(
> +                       const char *device, int event_type,
> +                       const unsigned int *offsets,
> +                       unsigned int num_lines, bool active_low, int flag=
s,
> +                       const char *consumer, const struct timespec *time=
out,
> +                       gpiod_ctxless_event_poll_cb poll_cb,
> +                       gpiod_ctxless_event_handle_cb event_cb,
> +                       void *data) GPIOD_API;
> +
> +
>  /**
>   * @brief Determine the chip name and line offset of a line with given n=
ame.
>   * @param name The name of the GPIO line to lookup.
> @@ -658,6 +814,20 @@ enum {
>         /**< The active state of a GPIO is active-low. */
>  };
>
> +/**
> + * @brief Possible internal bias settings.
> + */
> +enum {
> +       GPIOD_LINE_BIAS_AS_IS =3D 1,
> +       /**< The internal bias state is unknown. */
> +       GPIOD_LINE_BIAS_DISABLE,
> +       /**< The internal bias is disabled. */
> +       GPIOD_LINE_BIAS_PULL_UP,
> +       /**< The internal pull-up bias is enabled. */
> +       GPIOD_LINE_BIAS_PULL_DOWN,
> +       /**< The internal pull-down bias is enabled. */
> +};
> +
>  /**
>   * @brief Read the GPIO line offset.
>   * @param line GPIO line object.
> @@ -697,6 +867,14 @@ int gpiod_line_direction(struct gpiod_line *line) GP=
IOD_API;
>   */
>  int gpiod_line_active_state(struct gpiod_line *line) GPIOD_API;
>
> +/**
> + * @brief Read the GPIO line bias setting.
> + * @param line GPIO line object.
> + * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
> + *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_AS_IS.
> + */
> +int gpiod_line_bias(struct gpiod_line *line) GPIOD_API;
> +
>  /**
>   * @brief Check if the line is currently in use.
>   * @param line GPIO line object.
> @@ -792,6 +970,12 @@ enum {
>         /**< The line is an open-source port. */
>         GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW      =3D GPIOD_BIT(2),
>         /**< The active state of the line is low (high is the default). *=
/
> +       GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE    =3D GPIOD_BIT(3),
> +       /**< The line has neither either pull-up nor pull-down resistor *=
/
> +       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN  =3D GPIOD_BIT(4),
> +       /**< The line has pull-down resistor enabled */
> +       GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP    =3D GPIOD_BIT(5),
> +       /**< The line has pull-up resistor enabled */
>  };
>
>  /**
> diff --git a/lib/core.c b/lib/core.c
> index f05e595..9b7d88f 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -36,9 +36,7 @@ struct gpiod_line {
>         unsigned int offset;
>         int direction;
>         int active_state;
> -       bool used;
> -       bool open_source;
> -       bool open_drain;
> +       __u32 flags;
>
>         int state;
>         bool needs_update;
> @@ -359,19 +357,31 @@ int gpiod_line_active_state(struct gpiod_line *line=
)
>         return line->active_state;
>  }
>
> +int gpiod_line_bias(struct gpiod_line *line)
> +{
> +       if (line->flags & GPIOLINE_FLAG_BIAS_DISABLE)
> +               return GPIOD_LINE_BIAS_DISABLE;
> +       if (line->flags & GPIOLINE_FLAG_BIAS_PULL_UP)
> +               return GPIOD_LINE_BIAS_PULL_UP;
> +       if (line->flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
> +               return GPIOD_LINE_BIAS_PULL_DOWN;
> +
> +       return GPIOD_LINE_BIAS_AS_IS;
> +}
> +
>  bool gpiod_line_is_used(struct gpiod_line *line)
>  {
> -       return line->used;
> +       return line->flags & GPIOLINE_FLAG_KERNEL;
>  }
>
>  bool gpiod_line_is_open_drain(struct gpiod_line *line)
>  {
> -       return line->open_drain;
> +       return line->flags & GPIOLINE_FLAG_OPEN_DRAIN;
>  }
>
>  bool gpiod_line_is_open_source(struct gpiod_line *line)
>  {
> -       return line->open_source;
> +       return line->flags & GPIOLINE_FLAG_OPEN_SOURCE;
>  }
>
>  bool gpiod_line_needs_update(struct gpiod_line *line)
> @@ -398,9 +408,7 @@ int gpiod_line_update(struct gpiod_line *line)
>                                                 ? GPIOD_LINE_ACTIVE_STATE=
_LOW
>                                                 : GPIOD_LINE_ACTIVE_STATE=
_HIGH;
>
> -       line->used =3D info.flags & GPIOLINE_FLAG_KERNEL;
> -       line->open_drain =3D info.flags & GPIOLINE_FLAG_OPEN_DRAIN;
> -       line->open_source =3D info.flags & GPIOLINE_FLAG_OPEN_SOURCE;
> +       line->flags =3D info.flags;
>
>         strncpy(line->name, info.name, sizeof(line->name));
>         strncpy(line->consumer, info.consumer, sizeof(line->consumer));
> @@ -473,6 +481,12 @@ static __u32 line_request_flag_to_gpio_handleflag(in=
t flags)
>                 hflags |=3D GPIOHANDLE_REQUEST_OPEN_SOURCE;
>         if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
>                 hflags |=3D GPIOHANDLE_REQUEST_ACTIVE_LOW;
> +       if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
> +               hflags |=3D GPIOHANDLE_REQUEST_BIAS_DISABLE;
> +       if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
> +               hflags |=3D GPIOHANDLE_REQUEST_BIAS_PULL_DOWN;
> +       if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
> +               hflags |=3D GPIOHANDLE_REQUEST_BIAS_PULL_UP;
>
>         return hflags;
>  }
> diff --git a/lib/ctxless.c b/lib/ctxless.c
> index ba85018..44f1872 100644
> --- a/lib/ctxless.c
> +++ b/lib/ctxless.c
> @@ -14,6 +14,26 @@
>  #include <stdio.h>
>  #include <string.h>
>
> +static int ctxless_flags_to_line_request_flags(bool active_low, int flag=
s)
> +{
> +       int lflags =3D 0;
> +
> +       if (active_low)
> +               lflags |=3D GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
> +       if (flags & GPIOD_CTXLESS_FLAG_OPEN_DRAIN)
> +               lflags |=3D GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
> +       if (flags & GPIOD_CTXLESS_FLAG_OPEN_SOURCE)
> +               lflags |=3D GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
> +       if (flags & GPIOD_CTXLESS_FLAG_BIAS_DISABLE)
> +               lflags |=3D GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
> +       if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_UP)
> +               lflags |=3D GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
> +       if (flags & GPIOD_CTXLESS_FLAG_BIAS_PULL_DOWN)
> +               lflags |=3D GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
> +
> +       return lflags;
> +}
> +
>  int gpiod_ctxless_get_value(const char *device, unsigned int offset,
>                             bool active_low, const char *consumer)
>  {
> @@ -27,16 +47,45 @@ int gpiod_ctxless_get_value(const char *device, unsig=
ned int offset,
>         return value;
>  }
>
> +int gpiod_ctxless_get_value_ext(const char *device, unsigned int offset,
> +                               bool active_low, int flags,
> +                               const char *consumer)
> +{
> +       int value, rv;
> +
> +       rv =3D gpiod_ctxless_get_value_multiple_ext(device, &offset, &val=
ue, 1,
> +                                                 active_low, flags, cons=
umer);
> +       if (rv < 0)
> +               return rv;
> +
> +       return value;
> +}
> +
>  int gpiod_ctxless_get_value_multiple(const char *device,
>                                      const unsigned int *offsets, int *va=
lues,
>                                      unsigned int num_lines, bool active_=
low,
>                                      const char *consumer)
> +{
> +       int rv;
> +
> +       rv =3D gpiod_ctxless_get_value_multiple_ext(device, offsets, valu=
es,
> +                                                 num_lines, active_low, =
0,
> +                                                 consumer);
> +       return rv;
> +}
> +
> +int gpiod_ctxless_get_value_multiple_ext(const char *device,
> +                                        const unsigned int *offsets,
> +                                        int *values,
> +                                        unsigned int num_lines,
> +                                        bool active_low, int flags,
> +                                        const char *consumer)
>  {
>         struct gpiod_line_bulk bulk;
>         struct gpiod_chip *chip;
>         struct gpiod_line *line;
>         unsigned int i;
> -       int rv, flags;
> +       int rv, lflags;
>
>         if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
>                 errno =3D EINVAL;
> @@ -59,9 +108,8 @@ int gpiod_ctxless_get_value_multiple(const char *devic=
e,
>                 gpiod_line_bulk_add(&bulk, line);
>         }
>
> -       flags =3D active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
> -
> -       rv =3D gpiod_line_request_bulk_input_flags(&bulk, consumer, flags=
);
> +       lflags =3D ctxless_flags_to_line_request_flags(active_low, flags)=
;
> +       rv =3D gpiod_line_request_bulk_input_flags(&bulk, consumer, lflag=
s);
>         if (rv < 0) {
>                 gpiod_chip_close(chip);
>                 return -1;
> @@ -83,17 +131,39 @@ int gpiod_ctxless_set_value(const char *device, unsi=
gned int offset, int value,
>                                                 active_low, consumer, cb,=
 data);
>  }
>
> +int gpiod_ctxless_set_value_ext(const char *device, unsigned int offset,
> +                               int value, bool active_low, int flags,
> +                               const char *consumer,
> +                               gpiod_ctxless_set_value_cb cb, void *data=
)
> +{
> +       return gpiod_ctxless_set_value_multiple_ext(device, &offset, &val=
ue,
> +                                                   1, active_low, flags,
> +                                                   consumer, cb, data);
> +}
> +
>  int gpiod_ctxless_set_value_multiple(const char *device,
>                                      const unsigned int *offsets,
>                                      const int *values, unsigned int num_=
lines,
>                                      bool active_low, const char *consume=
r,
>                                      gpiod_ctxless_set_value_cb cb, void =
*data)
> +{
> +       return gpiod_ctxless_set_value_multiple_ext(device, offsets, valu=
es,
> +                                                   num_lines, active_low=
,
> +                                                   0, consumer, cb, data=
);
> +}
> +
> +int gpiod_ctxless_set_value_multiple_ext(
> +                       const char *device,
> +                       const unsigned int *offsets,
> +                       const int *values, unsigned int num_lines,
> +                       bool active_low, int flags, const char *consumer,
> +                       gpiod_ctxless_set_value_cb cb, void *data)
>  {
>         struct gpiod_line_bulk bulk;
>         struct gpiod_chip *chip;
>         struct gpiod_line *line;
>         unsigned int i;
> -       int rv, flags;
> +       int rv, lflags;
>
>         if (!num_lines || num_lines > GPIOD_LINE_BULK_MAX_LINES) {
>                 errno =3D EINVAL;
> @@ -116,10 +186,9 @@ int gpiod_ctxless_set_value_multiple(const char *dev=
ice,
>                 gpiod_line_bulk_add(&bulk, line);
>         }
>
> -       flags =3D active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : 0;
> -
> +       lflags =3D ctxless_flags_to_line_request_flags(active_low, flags)=
;
>         rv =3D gpiod_line_request_bulk_output_flags(&bulk, consumer,
> -                                                 flags, values);
> +                                                 lflags, values);
>         if (rv < 0) {
>                 gpiod_chip_close(chip);
>                 return -1;
> @@ -216,6 +285,19 @@ int gpiod_ctxless_event_monitor(const char *device, =
int event_type,
>                                                     poll_cb, event_cb, da=
ta);
>  }
>
> +int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
> +                                   unsigned int offset, bool active_low,
> +                                   int flags, const char *consumer,
> +                                   const struct timespec *timeout,
> +                                   gpiod_ctxless_event_poll_cb poll_cb,
> +                                   gpiod_ctxless_event_handle_cb event_c=
b,
> +                                   void *data)
> +{
> +       return gpiod_ctxless_event_monitor_multiple_ext(
> +                       device, event_type, &offset, 1, active_low,
> +                       flags, consumer, timeout, poll_cb, event_cb, data=
);
> +}
> +
>  int gpiod_ctxless_event_monitor_multiple(
>                         const char *device, int event_type,
>                         const unsigned int *offsets,
> @@ -225,6 +307,21 @@ int gpiod_ctxless_event_monitor_multiple(
>                         gpiod_ctxless_event_poll_cb poll_cb,
>                         gpiod_ctxless_event_handle_cb event_cb,
>                         void *data)
> +{
> +       return gpiod_ctxless_event_monitor_multiple_ext(
> +                       device, event_type, offsets,
> +                       num_lines, active_low, 0, consumer, timeout,
> +                       poll_cb, event_cb, data);
> +}
> +
> +int gpiod_ctxless_event_monitor_multiple_ext(
> +                       const char *device, int event_type,
> +                       const unsigned int *offsets,
> +                       unsigned int num_lines, bool active_low, int flag=
s,
> +                       const char *consumer, const struct timespec *time=
out,
> +                       gpiod_ctxless_event_poll_cb poll_cb,
> +                       gpiod_ctxless_event_handle_cb event_cb,
> +                       void *data)
>  {
>         struct gpiod_ctxless_event_poll_fd fds[GPIOD_LINE_BULK_MAX_LINES]=
;
>         struct gpiod_line_request_config conf;
> @@ -259,7 +356,7 @@ int gpiod_ctxless_event_monitor_multiple(
>                 gpiod_line_bulk_add(&bulk, line);
>         }
>
> -       conf.flags =3D active_low ? GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW : =
0;
> +       conf.flags =3D ctxless_flags_to_line_request_flags(active_low, fl=
ags);
>         conf.consumer =3D consumer;
>
>         if (event_type =3D=3D GPIOD_CTXLESS_EVENT_RISING_EDGE) {
> --
> 2.24.0
>
