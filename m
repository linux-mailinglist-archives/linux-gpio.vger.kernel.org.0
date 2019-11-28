Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAA110C6A7
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 11:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfK1K33 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 05:29:29 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44043 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfK1K33 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 05:29:29 -0500
Received: by mail-oi1-f196.google.com with SMTP id s71so22850415oih.11
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lrDQ+5Pmq0w1E/8vM9fsEo650NbKjsO/1We87692eUs=;
        b=vz9cQU2V+Cpgu1FXS5uJbXRxdu7AUhYhgQBx1Dpy9XM5qjVuxqPYlOwzNcgW9gXRAK
         40aqpFC5QdK4HJctfJpSqxtvwZIGBMYJo3em3i4ANEMhiCH8GgK1fjreLkYIQ0rmUT8Q
         pMqC7Q6FLh98Gy5Kw2kCM+gO8uSs/Yq6oWT6kjffpB3EfN90hkaCQuvr8M+WFSGxyN/j
         5t1xMW4M5/K9YCHB7rq2dbp/wVOAFXse1w+fsk1Lns0+mtctUWfHxrt6fT343Urvgw46
         MGvMFhJQGJ1KfvzMRxTIgdfx8cUBwFh9TO/ddcRsZII+UmugvFEgK3JIpgYFPlgYcEmj
         0Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lrDQ+5Pmq0w1E/8vM9fsEo650NbKjsO/1We87692eUs=;
        b=Qr81DnMsLSkqYbeE0hyKo+2D5rwwUw68bnXvGxc6zEgn8Wot3o9atDrijLFPgBM/0Z
         KnkPs6ke1vd8YTlhUjVQmzNDlZbqgw2W1ACkGFwYFZVTXnCvaAR2qiJG6FFFYq124kLu
         6dnmUyA0zl5saSyqS3O5X7oPJNYv7UMURkRjgUdogPaNmuqxHMjZHRquQmDuQi+vIDQL
         hIF/5gklRRjTl1Tu1IwJwh703G5c73TvdSYjkNE4MuefI+2mIGEMgUcEg2QOQcleb6/U
         z5IhcoDid3mkC2LVmz2zG2lSLP5iOJ9DheIX5Lh+59SbZhvK6Mp/ZeHEIl3ehYUOLpuf
         T6zw==
X-Gm-Message-State: APjAAAVuYHTt6jGKLL0ep7u1AJDPMb0by7HQafaw/Ak3/0yAyLHefwaa
        1ORy6foZmU5304Y3Sa8vxJX8FHASqMYTBk+nGC1FtvBT
X-Google-Smtp-Source: APXvYqz3UZJ06L+Ka0GG1G0jAvLBlfjxSHVOG+xY9TISbJAVg369JmwK2TlcsRQhKhSuqWlSh0RxMLnv2Akl7VW4BaE=
X-Received: by 2002:aca:d904:: with SMTP id q4mr8058883oig.21.1574936965297;
 Thu, 28 Nov 2019 02:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20191125143157.26154-1-warthog618@gmail.com> <20191125143157.26154-8-warthog618@gmail.com>
In-Reply-To: <20191125143157.26154-8-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Nov 2019 11:29:14 +0100
Message-ID: <CAMpxmJUzVAeVysoig4O0rczTFbeOz4xCmSNm8OYVogwXuOmj+g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 07/14] core: add support for SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 lis 2019 o 15:32 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Extend the libgpiod API to support the setting line configuration using t=
he
> GPIO GPIOHANDLE_SET_CONFIG_IOCTL uAPI ioctl.
>
> The core change is the addition of gpiod_line_set_config, which provides =
a
> low level wrapper around the ioctl.
>
> Additionally, higher level helper functions, gpiod_line_set_flags,
> gpiod_line_set_direction_input, and gpiod_line_set_direction_output provi=
de
> slightly simplified APIs for common use cases.
>
> Bulk forms of all functions are also provided.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  include/gpiod.h | 123 +++++++++++++++++++++++++++++++
>  lib/core.c      | 187 +++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 307 insertions(+), 3 deletions(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 86c3ea9..185e2f4 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -1246,6 +1246,15 @@ void gpiod_line_release_bulk(struct gpiod_line_bul=
k *bulk) GPIOD_API;
>   */
>  bool gpiod_line_is_requested(struct gpiod_line *line) GPIOD_API;
>
> +/**
> + * @brief Check if the calling user has ownership of this line for value=
s,
> + * not events.

For consistency: please align this with the beginning of the
description above...

> + * @param line GPIO line object.
> + * @return True if given line was requested for reading/setting values,
> + *         false otherwise.
> + */
> +bool gpiod_line_is_requested_values(struct gpiod_line *line) GPIOD_API;

... but also: why do we need to export this anyway?

> +
>  /**
>   * @brief Check if the calling user has neither requested ownership of t=
his
>   *        line nor configured any event notifications.
> @@ -1296,6 +1305,7 @@ int gpiod_line_set_value(struct gpiod_line *line, i=
nt value) GPIOD_API;
>   * @brief Set the values of a set of GPIO lines.
>   * @param bulk Set of GPIO lines to reserve.
>   * @param values An array holding line_bulk->num_lines new values for li=
nes.
> + *               A NULL pointer is interpreted as a logical low for all =
lines.

This looks like part of a different commit.

>   * @return 0 is the operation succeeds. In case of an error this routine
>   *         returns -1 and sets the last error number.
>   *
> @@ -1305,6 +1315,119 @@ int gpiod_line_set_value(struct gpiod_line *line,=
 int value) GPIOD_API;
>  int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
>                               const int *values) GPIOD_API;
>
> +/**
> + * @}
> + *
> + * @defgroup __line_config__ Setting line configuration
> + * @{
> + */
> +
> +/**
> + * @brief Update the configuration of a single GPIO line.
> + * @param line GPIO line object.
> + * @param direction Updated direction which may be one of
> + *                  GPIOD_LINE_REQUEST_DIRECTION_AS_IS,
> + *                  GPIOD_LINE_REQUEST_DIRECTION_INPUT, or
> + *                  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> + * @param flags Replacement flags.
> + * @param value The new output value for the line when direction is
> + *              GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + */
> +int gpiod_line_set_config(struct gpiod_line *line, int direction,
> +                         int flags, int value) GPIOD_API;
> +
> +/**
> + * @brief Update the configuration of a set of GPIO lines.
> + * @param bulk Set of GPIO lines.
> + * @param direction Updated direction which may be one of
> + *                  GPIOD_LINE_REQUEST_DIRECTION_AS_IS,
> + *                  GPIOD_LINE_REQUEST_DIRECTION_INPUT, or
> + *                  GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> + * @param flags Replacement flags.
> + * @param values An array holding line_bulk->num_lines new logical value=
s
> + *               for lines when direction is
> + *               GPIOD_LINE_REQUEST_DIRECTION_OUTPUT.
> + *               A NULL pointer is interpreted as a logical low for all =
lines.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + *
> + * If the lines were not previously requested together, the behavior is
> + * undefined.
> + */
> +int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
> +                              int direction, int flags,
> +                              const int *values) GPIOD_API;
> +
> +
> +/**
> + * @brief Update the configuration flags of a single GPIO line.
> + * @param line GPIO line object.
> + * @param flags Replacement flags.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + */
> +int gpiod_line_set_flags(struct gpiod_line *line, int flags) GPIOD_API;
> +
> +/**
> + * @brief Update the configuration flags of a set of GPIO lines.
> + * @param bulk Set of GPIO lines.
> + * @param flags Replacement flags.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + *
> + * If the lines were not previously requested together, the behavior is
> + * undefined.
> + */
> +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk,
> +                             int flags) GPIOD_API;
> +
> +/**
> + * @brief Set the direction of a single GPIO line to input.
> + * @param line GPIO line object.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + */
> +int gpiod_line_set_direction_input(struct gpiod_line *line) GPIOD_API;
> +
> +/**
> + * @brief Set the direction of a set of GPIO lines to input.
> + * @param bulk Set of GPIO lines.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + *
> + * If the lines were not previously requested together, the behavior is
> + * undefined.
> + */
> +int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk
> +                                       ) GPIOD_API;
> +
> +/**
> + * @brief Set the direction of a single GPIO line to output.
> + * @param line GPIO line object.
> + * @param value The logical value output on the line.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + */
> +int gpiod_line_set_direction_output(struct gpiod_line *line,
> +                                   int value) GPIOD_API;
> +
> +/**
> + * @brief Set the direction of a set of GPIO lines to output.
> + * @param bulk Set of GPIO lines.
> + * @param values An array holding line_bulk->num_lines new logical value=
s
> + *               for lines.  A NULL pointer is interpreted as a logical =
low
> + *               for all lines.
> + * @return 0 is the operation succeeds. In case of an error this routine
> + *         returns -1 and sets the last error number.
> + *
> + * If the lines were not previously requested together, the behavior is
> + * undefined.
> + */
> +int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
> +                                        const int *values) GPIOD_API;
> +
>  /**
>   * @}
>   *
> diff --git a/lib/core.c b/lib/core.c
> index 0465de9..71bb4fb 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -34,10 +34,26 @@ struct line_fd_handle {
>
>  struct gpiod_line {
>         unsigned int offset;
> +
> +       /* The GPIOD_LINE_DIRECTION */
>         int direction;
> +
> +       /* The GPIOD_LINE_ACTIVE_STATE */
>         int active_state;
> +
> +       /* The logical value last written to the line. */
> +       int output_value;
> +
> +       /* The GPIOLINE_FLAGs returned by GPIO_GET_LINEINFO_IOCTL */
>         __u32 info_flags;
>
> +       /* The GPIOD_LINE_REQUEST_FLAGs provided to request the line. */
> +       __u32 req_flags;
> +
> +       /*
> +        * Indicator of LINE_FREE, LINE_REQUESTED_VALUES or
> +        *  LINE_REQUESTED_EVENTS
> +        */
>         int state;

Please include the mention on documenting this in the commit message.
Otherwise it looks like it should be part of a different commit.

>
>         struct gpiod_chip *chip;
> @@ -445,6 +461,20 @@ static bool line_bulk_all_requested(struct gpiod_lin=
e_bulk *bulk)
>         return true;
>  }
>
> +static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
> +{
> +       struct gpiod_line *line, **lineptr;
> +
> +       gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
> +               if (!gpiod_line_is_requested_values(line)) {
> +                       errno =3D EPERM;
> +                       return false;
> +               }
> +       }
> +
> +       return true;
> +}
> +
>  static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
>  {
>         struct gpiod_line *line, **lineptr;
> @@ -459,6 +489,27 @@ static bool line_bulk_all_free(struct gpiod_line_bul=
k *bulk)
>         return true;
>  }
>
> +static bool line_request_direction_is_valid(int direction)
> +{
> +       if ((direction =3D=3D GPIOD_LINE_REQUEST_DIRECTION_AS_IS) ||
> +           (direction =3D=3D GPIOD_LINE_REQUEST_DIRECTION_INPUT) ||
> +           (direction =3D=3D GPIOD_LINE_REQUEST_DIRECTION_OUTPUT))
> +               return true;
> +
> +       errno =3D EINVAL;
> +       return false;
> +}

Same here: please be a bit more elaborate in the commit message. Say
something like: "while at it: restructure the code by doing this and
that".

> +
> +static __u32 line_request_direction_to_gpio_handleflag(int direction)
> +{
> +       if (direction =3D=3D GPIOD_LINE_REQUEST_DIRECTION_INPUT)
> +               return GPIOHANDLE_REQUEST_INPUT;
> +       if (direction =3D=3D GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> +               return GPIOHANDLE_REQUEST_OUTPUT;
> +
> +       return 0;
> +}
> +
>  static __u32 line_request_flag_to_gpio_handleflag(int flags)
>  {
>         int hflags =3D 0;
> @@ -483,7 +534,7 @@ static int line_request_values(struct gpiod_line_bulk=
 *bulk,
>                                const struct gpiod_line_request_config *co=
nfig,
>                                const int *default_vals)
>  {
> -       struct gpiod_line *line, **lineptr;
> +       struct gpiod_line *line;
>         struct line_fd_handle *line_fd;
>         struct gpiohandle_request req;
>         unsigned int i;
> @@ -512,7 +563,6 @@ static int line_request_values(struct gpiod_line_bulk=
 *bulk,
>         else if (config->request_type =3D=3D GPIOD_LINE_REQUEST_DIRECTION=
_OUTPUT)
>                 req.flags |=3D GPIOHANDLE_REQUEST_OUTPUT;
>
> -

Fixing stray newlines etc should be in separate commits too IMO but
let's let is slip here, this is already a big patch anyway.

>         gpiod_line_bulk_foreach_line_off(bulk, line, i) {
>                 req.lineoffsets[i] =3D gpiod_line_offset(line);
>                 if (config->request_type =3D=3D
> @@ -536,8 +586,12 @@ static int line_request_values(struct gpiod_line_bul=
k *bulk,
>         if (!line_fd)
>                 return -1;
>
> -       gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
> +       gpiod_line_bulk_foreach_line_off(bulk, line, i) {
>                 line->state =3D LINE_REQUESTED_VALUES;
> +               line->req_flags =3D config->flags;
> +               if (config->request_type =3D=3D
> +                       GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)

Add another tab here because otherwise there's no indentation
difference between this line and the line below.

> +                       line->output_value =3D req.default_values[i];
>                 line_set_fd(line, line_fd);
>
>                 rv =3D gpiod_line_update(line);
> @@ -583,6 +637,7 @@ static int line_request_event_single(struct gpiod_lin=
e *line,
>                 return -1;
>
>         line->state =3D LINE_REQUESTED_EVENTS;
> +       line->req_flags =3D config->flags;
>         line_set_fd(line, line_fd);
>
>         rv =3D gpiod_line_update(line);
> @@ -686,6 +741,11 @@ bool gpiod_line_is_requested(struct gpiod_line *line=
)
>                 line->state =3D=3D LINE_REQUESTED_EVENTS);
>  }
>
> +bool gpiod_line_is_requested_values(struct gpiod_line *line)
> +{
> +       return (line->state =3D=3D LINE_REQUESTED_VALUES);
> +}
> +
>  bool gpiod_line_is_free(struct gpiod_line *line)
>  {
>         return line->state =3D=3D LINE_FREE;
> @@ -766,9 +826,130 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bul=
k *bulk, const int *values)
>         if (rv < 0)
>                 return -1;
>
> +       gpiod_line_bulk_foreach_line_off(bulk, line, i)
> +               line->output_value =3D data.values[i];
> +
>         return 0;
>  }
>
> +int gpiod_line_set_config(struct gpiod_line *line, int direction,
> +                         int flags, int value)
> +{
> +       struct gpiod_line_bulk bulk;
> +
> +       gpiod_line_bulk_init(&bulk);
> +       gpiod_line_bulk_add(&bulk, line);
> +
> +       return gpiod_line_set_config_bulk(&bulk, direction, flags, &value=
);
> +}
> +
> +int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
> +                              int direction, int flags,
> +                              const int *values)
> +{
> +       struct gpiohandle_config hcfg;
> +       struct gpiod_line *line;
> +       unsigned int i;
> +       int rv, fd;
> +
> +       if (!line_bulk_same_chip(bulk) ||
> +           !line_bulk_all_requested_values(bulk))
> +               return -1;
> +
> +       if (!line_request_direction_is_valid(direction))
> +               return -1;
> +
> +       memset(&hcfg, 0, sizeof(hcfg));
> +
> +       hcfg.flags =3D line_request_flag_to_gpio_handleflag(flags);
> +       hcfg.flags |=3D line_request_direction_to_gpio_handleflag(directi=
on);
> +       if (direction =3D=3D GPIOD_LINE_REQUEST_DIRECTION_OUTPUT && value=
s) {
> +               for (i =3D 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> +                       hcfg.default_values[i] =3D (uint8_t)!!values[i];
> +       }
> +
> +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> +       fd =3D line_get_fd(line);
> +
> +       rv =3D ioctl(fd, GPIOHANDLE_SET_CONFIG_IOCTL, &hcfg);
> +       if (rv < 0)
> +               return -1;
> +
> +       gpiod_line_bulk_foreach_line_off(bulk, line, i) {
> +               line->req_flags =3D flags;
> +               if (direction =3D=3D GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> +                       line->output_value =3D hcfg.default_values[i];

Please add a newline here.

> +               rv =3D gpiod_line_update(line);
> +               if (rv < 0)
> +                       return rv;
> +       }
> +       return 0;
> +}
> +
> +int gpiod_line_set_flags(struct gpiod_line *line, int flags)
> +{
> +       struct gpiod_line_bulk bulk;
> +
> +       gpiod_line_bulk_init(&bulk);
> +       gpiod_line_bulk_add(&bulk, line);
> +
> +       return gpiod_line_set_flags_bulk(&bulk, flags);
> +}
> +
> +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> +{
> +       struct gpiod_line *line;
> +       int values[GPIOD_LINE_BULK_MAX_LINES];
> +       unsigned int i;
> +       int direction;
> +
> +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> +       if (line->direction =3D=3D GPIOD_LINE_DIRECTION_OUTPUT) {
> +               gpiod_line_bulk_foreach_line_off(bulk, line, i) {
> +                       values[i] =3D line->output_value;
> +               }

No need for brackets here.



> +               direction =3D GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
> +       } else {
> +               direction =3D GPIOD_LINE_REQUEST_DIRECTION_INPUT;
> +       }
> +
> +       return gpiod_line_set_config_bulk(bulk, direction,
> +                                         flags, values);
> +}
> +
> +int gpiod_line_set_direction_input(struct gpiod_line *line)
> +{
> +       return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_I=
NPUT,
> +                                    line->req_flags, 0);
> +}
> +
> +int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk)
> +{
> +       struct gpiod_line *line;
> +
> +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> +       return gpiod_line_set_config_bulk(bulk,
> +                                         GPIOD_LINE_REQUEST_DIRECTION_IN=
PUT,
> +                                         line->req_flags, NULL);
> +}
> +
> +int gpiod_line_set_direction_output(struct gpiod_line *line, int value)
> +{
> +       return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_O=
UTPUT,
> +                                    line->req_flags, value);
> +}
> +
> +int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
> +                                        const int *values)
> +{
> +       struct gpiod_line *line;
> +
> +       line =3D gpiod_line_bulk_get_line(bulk, 0);
> +       return gpiod_line_set_config_bulk(bulk,
> +                                         GPIOD_LINE_REQUEST_DIRECTION_OU=
TPUT,
> +                                         line->req_flags, values);
> +}
> +
>  int gpiod_line_event_wait(struct gpiod_line *line,
>                           const struct timespec *timeout)
>  {
> --
> 2.24.0
>
