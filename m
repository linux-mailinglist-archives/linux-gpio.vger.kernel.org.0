Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D90828E551
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 19:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgJNR0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 13:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgJNR0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 13:26:39 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C110C061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 10:26:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so212547pfp.5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 10:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SL1q4MrVG3s97QEkgWAuIezR1j8xRppouLjGFhAJKc8=;
        b=bKLk1qvXEQj+z+wA6rhZCvyO4SVkpOti4iVncj/Cr5YKlvWfh6sIxbHlVt3xBF2vqH
         VjnDSbDMiEIkZyZsOB4O48qxeGIrVYhxOqbSjDwa9ZIQCQqjo3UoGSp2+VZjFuZxbdV6
         PLRplqhsMx049YtWyZ5MMrxQXeF9yxsNfLBGJ36zUQWYZeoM5peVwUE0cnAlTj8VxQvT
         us19rifo54ZlXFMabK4QZtfpMjHSkKcIpF4WPcMlnh7hEIr2zrdnIXM/FTIMofuSk1yi
         jav03gwfTCPe9jzFE9jfHmXQn9OxUTQwSTu+XmbATI9Yh8lddOoIDcLOwqcnb82s+EYB
         lfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SL1q4MrVG3s97QEkgWAuIezR1j8xRppouLjGFhAJKc8=;
        b=XT/2xDTtJ1aXkpj+H0w0Oxo3AAXbDxcDEx63qN5urd8j7eS9YCQinz1pjFp674m9Ll
         OxNXck7PV+P5KG6j3cW7dgHPaVP1Lh4DNNW5WVYbePfeFIqBfE99x4L9J9MUG+C/dQuX
         drBU+u5e5e5cPa+JGPq8hTIDCFOcKTiZsQGzHgTeWQ5gevjuFS8UYC6wnWfYMm8jzKiU
         B6w9AkpEtRS17BR4fZXgwHmuYGauLQ3zpx2xjAe/D4HdkMf7UzBJzGSqSgceFK+q+6ZB
         1PuFGPOM50jRUwnr7joDopsWLixzNs+quGVO/KqG54cob6d+HpwbwclDaG8pKYvAU4cT
         4xDQ==
X-Gm-Message-State: AOAM530SdHzOexNx7t6Y+Nb5Pcge+y85CNlTIMceKhzb7oWZRUm3ItuM
        ydvwdyYZ96lWXuVasbsC2EQ9/kDuDNy28YL1qJk=
X-Google-Smtp-Source: ABdhPJwxjsZVsl5Aj18aC7zEy+XjCu6IlTghcs7nKl49n4xsSdQqO+tYDEAgcoz2kkiBnPLj4iQiYHkQvo5nO6PfKAQ=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr80828pgj.74.1602696398738;
 Wed, 14 Oct 2020 10:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201014113052.234932-1-warthog618@gmail.com>
In-Reply-To: <20201014113052.234932-1-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Oct 2020 20:27:27 +0300
Message-ID: <CAHp75VfYczgi5bj6kOZoS8uGHCiNcvwEx=kMXcabUM17JbViOA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] core: Basic port to uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 7:03 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Port existing implementation from GPIO uAPI v1 to v2.
> The libgpiod external interface remains unchanged, only the internal
> implementation switches from uAPI v1 to v2.
>
> This is a minimal port - uAPI v2 features are not used, only the
> uAPI v1 calls are switched to the v2 equivalent.

Thanks, this sounds good to me!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Changes for v2:
>  - reverted to using a line request for each line in an event request to
>    retain complete compatiblity with the existing libgpiod API.
>
> All tests now pass, including CXX and Python, and also tested on a kernel
> with uAPI v1 removed to double check it is only using uAPI v2.
>
>  include/gpiod.h |   2 +
>  lib/core.c      | 287 ++++++++++++++++++++++++++++++++----------------
>  2 files changed, 193 insertions(+), 96 deletions(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 3477f9d..a6e34ae 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -1485,6 +1485,8 @@ struct gpiod_line_event {
>         /**< Best estimate of time of event occurrence. */
>         int event_type;
>         /**< Type of the event that occurred. */
> +       int offset;
> +       /**< Offset of line on which the event occurred. */
>  };
>
>  /**
> diff --git a/lib/core.c b/lib/core.c
> index b964272..1abe3a4 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -403,26 +403,49 @@ bool gpiod_line_needs_update(struct gpiod_line *line GPIOD_UNUSED)
>         return false;
>  }
>
> +static int line_info_v2_to_info_flags(struct gpio_v2_line_info *info)
> +{
> +       int iflags = 0;
> +
> +       if (info->flags & GPIO_V2_LINE_FLAG_USED)
> +               iflags |= GPIOLINE_FLAG_KERNEL;
> +
> +       if (info->flags & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
> +               iflags |= GPIOLINE_FLAG_OPEN_DRAIN;
> +       if (info->flags & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
> +               iflags |= GPIOLINE_FLAG_OPEN_SOURCE;
> +
> +       if (info->flags & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
> +               iflags |= GPIOLINE_FLAG_BIAS_DISABLE;
> +       if (info->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
> +               iflags |= GPIOLINE_FLAG_BIAS_PULL_UP;
> +       if (info->flags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
> +               iflags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
> +
> +       return iflags;
> +}
> +
>  int gpiod_line_update(struct gpiod_line *line)
>  {
> -       struct gpioline_info info;
> +       struct gpio_v2_line_info info;
>         int rv;
>
>         memset(&info, 0, sizeof(info));
> -       info.line_offset = line->offset;
> +       info.offset = line->offset;
>
> -       rv = ioctl(line->chip->fd, GPIO_GET_LINEINFO_IOCTL, &info);
> +       rv = ioctl(line->chip->fd, GPIO_V2_GET_LINEINFO_IOCTL, &info);
>         if (rv < 0)
>                 return -1;
>
> -       line->direction = info.flags & GPIOLINE_FLAG_IS_OUT
> +       line->direction = info.flags & GPIO_V2_LINE_FLAG_OUTPUT
>                                                 ? GPIOD_LINE_DIRECTION_OUTPUT
>                                                 : GPIOD_LINE_DIRECTION_INPUT;
> -       line->active_state = info.flags & GPIOLINE_FLAG_ACTIVE_LOW
> +
> +       line->active_state = info.flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW
>                                                 ? GPIOD_LINE_ACTIVE_STATE_LOW
>                                                 : GPIOD_LINE_ACTIVE_STATE_HIGH;
>
> -       line->info_flags = info.flags;
> +       line->info_flags = line_info_v2_to_info_flags(&info);
>
>         strncpy(line->name, info.name, sizeof(line->name));
>         strncpy(line->consumer, info.consumer, sizeof(line->consumer));
> @@ -508,86 +531,149 @@ static bool line_request_direction_is_valid(int direction)
>         return false;
>  }
>
> -static __u32 line_request_direction_to_gpio_handleflag(int direction)
> +static void line_request_type_to_gpio_v2_line_config(int reqtype,
> +               struct gpio_v2_line_config *config)
>  {
> -       if (direction == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
> -               return GPIOHANDLE_REQUEST_INPUT;
> -       if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> -               return GPIOHANDLE_REQUEST_OUTPUT;
> +       if (reqtype == GPIOD_LINE_REQUEST_DIRECTION_AS_IS)
> +               return;
>
> -       return 0;
> +       if (reqtype == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT) {
> +               config->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
> +               return;
> +       }
> +       config->flags |= GPIO_V2_LINE_FLAG_INPUT;
> +
> +       if (reqtype == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE)
> +               config->flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
> +       else if (reqtype == GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE)
> +               config->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
> +       else if (reqtype == GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES)
> +               config->flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
> +                                 GPIO_V2_LINE_FLAG_EDGE_FALLING);
>  }
>
> -static __u32 line_request_flag_to_gpio_handleflag(int flags)
> +static void line_request_flag_to_gpio_v2_line_config(int flags,
> +               struct gpio_v2_line_config *config)
>  {
> -       int hflags = 0;
> +       if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
> +               config->flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
>
>         if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN)
> -               hflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
> -       if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
> -               hflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
> -       if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
> -               hflags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
> +               config->flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
> +       else if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
> +               config->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
> +
>         if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
> -               hflags |= GPIOHANDLE_REQUEST_BIAS_DISABLE;
> -       if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
> -               hflags |= GPIOHANDLE_REQUEST_BIAS_PULL_DOWN;
> -       if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
> -               hflags |= GPIOHANDLE_REQUEST_BIAS_PULL_UP;
> +               config->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
> +       else if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
> +               config->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
> +       else if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
> +               config->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
> +}
> +
> +static void line_request_config_to_gpio_v2_line_config(
> +               const struct gpiod_line_request_config *reqcfg,
> +               struct gpio_v2_line_config *lc)
> +{
> +       line_request_type_to_gpio_v2_line_config(reqcfg->request_type, lc);
> +       line_request_flag_to_gpio_v2_line_config(reqcfg->flags, lc);
> +}
> +
> +static bool line_request_config_validate(
> +               const struct gpiod_line_request_config *config)
> +{
> +       int bias_flags = 0;
> +
> +       if ((config->request_type != GPIOD_LINE_REQUEST_DIRECTION_OUTPUT) &&
> +           (config->flags & (GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN |
> +                             GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)))
> +               return false;
> +
> +
> +       if ((config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN) &&
> +           (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)) {
> +               return false;
> +       }
> +
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
> +               bias_flags++;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
> +               bias_flags++;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
> +               bias_flags++;
> +       if (bias_flags > 1)
> +               return false;
> +
> +       return true;
> +}
>
> -       return hflags;
> +static void lines_bitmap_set_bit(__u64 *bits, int nr)
> +{
> +       *bits |= _BITULL(nr);
> +}
> +
> +static void lines_bitmap_clear_bit(__u64 *bits, int nr)
> +{
> +       *bits &= ~_BITULL(nr);
> +}
> +
> +static int lines_bitmap_test_bit(__u64 bits, int nr)
> +{
> +       return !!(bits & _BITULL(nr));
> +}
> +
> +static void lines_bitmap_assign_bit(__u64 *bits, int nr, bool value)
> +{
> +       if (value)
> +               lines_bitmap_set_bit(bits, nr);
> +       else
> +               lines_bitmap_clear_bit(bits, nr);
>  }
>
>  static int line_request_values(struct gpiod_line_bulk *bulk,
>                                const struct gpiod_line_request_config *config,
> -                              const int *default_vals)
> +                              const int *vals)
>  {
>         struct gpiod_line *line;
>         struct line_fd_handle *line_fd;
> -       struct gpiohandle_request req;
> +       struct gpio_v2_line_request req;
>         unsigned int i;
>         int rv, fd;
>
> -       if ((config->request_type != GPIOD_LINE_REQUEST_DIRECTION_OUTPUT) &&
> -           (config->flags & (GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN |
> -                             GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE))) {
> -               errno = EINVAL;
> -               return -1;
> -       }
> -
> -       if ((config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN) &&
> -           (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)) {
> +       if (!line_request_config_validate(config)) {
>                 errno = EINVAL;
>                 return -1;
>         }
>
>         memset(&req, 0, sizeof(req));
>
> -       req.lines = gpiod_line_bulk_num_lines(bulk);
> -       req.flags = line_request_flag_to_gpio_handleflag(config->flags);
> -
> -       if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
> -               req.flags |= GPIOHANDLE_REQUEST_INPUT;
> -       else if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> -               req.flags |= GPIOHANDLE_REQUEST_OUTPUT;
> +       req.num_lines = gpiod_line_bulk_num_lines(bulk);
> +       line_request_config_to_gpio_v2_line_config(config, &req.config);
>
> -
> -       gpiod_line_bulk_foreach_line_off(bulk, line, i) {
> -               req.lineoffsets[i] = gpiod_line_offset(line);
> -               if (config->request_type ==
> -                               GPIOD_LINE_REQUEST_DIRECTION_OUTPUT &&
> -                   default_vals)
> -                       req.default_values[i] = !!default_vals[i];
> +       gpiod_line_bulk_foreach_line_off(bulk, line, i)
> +               req.offsets[i] = gpiod_line_offset(line);
> +
> +       if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT &&
> +           vals) {
> +               req.config.num_attrs = 1;
> +               req.config.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
> +               gpiod_line_bulk_foreach_line_off(bulk, line, i) {
> +                       lines_bitmap_assign_bit(
> +                               &req.config.attrs[0].mask, i, 1);
> +                       lines_bitmap_assign_bit(
> +                               &req.config.attrs[0].attr.values,
> +                               i, vals[i]);
> +               }
>         }
>
>         if (config->consumer)
> -               strncpy(req.consumer_label, config->consumer,
> -                       sizeof(req.consumer_label) - 1);
> +               strncpy(req.consumer, config->consumer,
> +                       sizeof(req.consumer) - 1);
>
>         line = gpiod_line_bulk_get_line(bulk, 0);
>         fd = line->chip->fd;
>
> -       rv = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
> +       rv = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
>         if (rv < 0)
>                 return -1;
>
> @@ -598,9 +684,9 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
>         gpiod_line_bulk_foreach_line_off(bulk, line, i) {
>                 line->state = LINE_REQUESTED_VALUES;
>                 line->req_flags = config->flags;
> -               if (config->request_type ==
> -                               GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> -                       line->output_value = req.default_values[i];
> +               if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> +                       line->output_value = lines_bitmap_test_bit(
> +                               req.config.attrs[0].attr.values, i);
>                 line_set_fd(line, line_fd);
>
>                 rv = gpiod_line_update(line);
> @@ -617,27 +703,20 @@ static int line_request_event_single(struct gpiod_line *line,
>                         const struct gpiod_line_request_config *config)
>  {
>         struct line_fd_handle *line_fd;
> -       struct gpioevent_request req;
> +       struct gpio_v2_line_request req;
>         int rv;
>
>         memset(&req, 0, sizeof(req));
>
>         if (config->consumer)
> -               strncpy(req.consumer_label, config->consumer,
> -                       sizeof(req.consumer_label) - 1);
> +               strncpy(req.consumer, config->consumer,
> +                       sizeof(req.consumer) - 1);
>
> -       req.lineoffset = gpiod_line_offset(line);
> -       req.handleflags = line_request_flag_to_gpio_handleflag(config->flags);
> -       req.handleflags |= GPIOHANDLE_REQUEST_INPUT;
> +       req.offsets[0] = gpiod_line_offset(line);
> +       req.num_lines = 1;
> +       line_request_config_to_gpio_v2_line_config(config, &req.config);
>
> -       if (config->request_type == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE)
> -               req.eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
> -       else if (config->request_type == GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE)
> -               req.eventflags |= GPIOEVENT_REQUEST_FALLING_EDGE;
> -       else if (config->request_type == GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES)
> -               req.eventflags |= GPIOEVENT_REQUEST_BOTH_EDGES;
> -
> -       rv = ioctl(line->chip->fd, GPIO_GET_LINEEVENT_IOCTL, &req);
> +       rv = ioctl(line->chip->fd, GPIO_V2_GET_LINE_IOCTL, &req);
>         if (rv < 0)
>                 return -1;
>
> @@ -708,13 +787,13 @@ static bool line_request_is_events(int request)
>
>  int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
>                             const struct gpiod_line_request_config *config,
> -                           const int *default_vals)
> +                           const int *vals)
>  {
>         if (!line_bulk_same_chip(bulk) || !line_bulk_all_free(bulk))
>                 return -1;
>
>         if (line_request_is_direction(config->request_type))
> -               return line_request_values(bulk, config, default_vals);
> +               return line_request_values(bulk, config, vals);
>         else if (line_request_is_events(config->request_type))
>                 return line_request_events(bulk, config);
>
> @@ -772,7 +851,7 @@ int gpiod_line_get_value(struct gpiod_line *line)
>
>  int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
>  {
> -       struct gpiohandle_data data;
> +       struct gpio_v2_line_values lv;
>         struct gpiod_line *line;
>         unsigned int i;
>         int rv, fd;
> @@ -782,27 +861,31 @@ int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
>
>         line = gpiod_line_bulk_get_line(bulk, 0);
>
> +       memset(&lv, 0, sizeof(lv));
> +
>         if (line->state == LINE_REQUESTED_VALUES) {
> -               memset(&data, 0, sizeof(data));
> +               for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> +                       lines_bitmap_set_bit(&lv.mask, i);
>
>                 fd = line_get_fd(line);
>
> -               rv = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
> +               rv = ioctl(fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &lv);
>                 if (rv < 0)
>                         return -1;
>
>                 for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> -                       values[i] = data.values[i];
> +                       values[i] = lines_bitmap_test_bit(lv.bits, i);
>
>         } else if (line->state == LINE_REQUESTED_EVENTS) {
> +               lines_bitmap_set_bit(&lv.mask, 0);
>                 for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
>                         line = gpiod_line_bulk_get_line(bulk, i);
>
>                         fd = line_get_fd(line);
> -                       rv = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
> +                       rv = ioctl(fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &lv);
>                         if (rv < 0)
>                                 return -1;
> -                       values[i] = data.values[0];
> +                       values[i] = lines_bitmap_test_bit(lv.bits, 0);
>                 }
>         } else {
>                 errno = EINVAL;
> @@ -823,7 +906,7 @@ int gpiod_line_set_value(struct gpiod_line *line, int value)
>
>  int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
>  {
> -       struct gpiohandle_data data;
> +       struct gpio_v2_line_values lv;
>         struct gpiod_line *line;
>         unsigned int i;
>         int rv, fd;
> @@ -831,22 +914,22 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
>         if (!line_bulk_same_chip(bulk) || !line_bulk_all_requested(bulk))
>                 return -1;
>
> -       memset(&data, 0, sizeof(data));
> +       memset(&lv, 0, sizeof(lv));
>
> -       if (values) {
> -               for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> -                       data.values[i] = (uint8_t)!!values[i];
> +       for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
> +               lines_bitmap_set_bit(&lv.mask, i);
> +               lines_bitmap_assign_bit(&lv.bits, i, values && values[i]);
>         }
>
>         line = gpiod_line_bulk_get_line(bulk, 0);
>         fd = line_get_fd(line);
>
> -       rv = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
> +       rv = ioctl(fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &lv);
>         if (rv < 0)
>                 return -1;
>
>         gpiod_line_bulk_foreach_line_off(bulk, line, i)
> -               line->output_value = data.values[i];
> +               line->output_value = lines_bitmap_test_bit(lv.bits, i);
>
>         return 0;
>  }
> @@ -866,7 +949,7 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
>                                int direction, int flags,
>                                const int *values)
>  {
> -       struct gpiohandle_config hcfg;
> +       struct gpio_v2_line_config hcfg;
>         struct gpiod_line *line;
>         unsigned int i;
>         int rv, fd;
> @@ -880,24 +963,30 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
>
>         memset(&hcfg, 0, sizeof(hcfg));
>
> -       hcfg.flags = line_request_flag_to_gpio_handleflag(flags);
> -       hcfg.flags |= line_request_direction_to_gpio_handleflag(direction);
> +       line_request_flag_to_gpio_v2_line_config(flags, &hcfg);
> +       line_request_type_to_gpio_v2_line_config(direction, &hcfg);
>         if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT && values) {
> -               for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> -                       hcfg.default_values[i] = (uint8_t)!!values[i];
> +               hcfg.num_attrs = 1;
> +               hcfg.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
> +               for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
> +                       lines_bitmap_assign_bit(&hcfg.attrs[0].mask, i, 1);
> +                       lines_bitmap_assign_bit(
> +                               &hcfg.attrs[0].attr.values, i, values[i]);
> +               }
>         }
>
>         line = gpiod_line_bulk_get_line(bulk, 0);
>         fd = line_get_fd(line);
>
> -       rv = ioctl(fd, GPIOHANDLE_SET_CONFIG_IOCTL, &hcfg);
> +       rv = ioctl(fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &hcfg);
>         if (rv < 0)
>                 return -1;
>
>         gpiod_line_bulk_foreach_line_off(bulk, line, i) {
>                 line->req_flags = flags;
>                 if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
> -                       line->output_value = hcfg.default_values[i];
> +                       line->output_value = lines_bitmap_test_bit(
> +                               hcfg.attrs[0].attr.values, i);
>
>                 rv = gpiod_line_update(line);
>                 if (rv < 0)
> @@ -1082,8 +1171,13 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
>         /*
>          * 16 is the maximum number of events the kernel can store in the FIFO
>          * so we can allocate the buffer on the stack.
> +        *
> +        * NOTE: This is no longer strictly true for uAPI v2.  While 16 is
> +        * the default for single line, a request with multiple lines will
> +        * have a larger buffer.  So need to rethink the allocation here,
> +        * or at least the comment above...
>          */
> -       struct gpioevent_data evdata[16], *curr;
> +       struct gpio_v2_line_event evdata[16], *curr;
>         struct gpiod_line_event *event;
>         unsigned int events_read, i;
>         ssize_t rd;
> @@ -1109,11 +1203,12 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
>                 curr = &evdata[i];
>                 event = &events[i];
>
> -               event->event_type = curr->id == GPIOEVENT_EVENT_RISING_EDGE
> +               event->offset = curr->offset;
> +               event->event_type = curr->id == GPIO_V2_LINE_EVENT_RISING_EDGE
>                                         ? GPIOD_LINE_EVENT_RISING_EDGE
>                                         : GPIOD_LINE_EVENT_FALLING_EDGE;
> -               event->ts.tv_sec = curr->timestamp / 1000000000ULL;
> -               event->ts.tv_nsec = curr->timestamp % 1000000000ULL;
> +               event->ts.tv_sec = curr->timestamp_ns / 1000000000ULL;
> +               event->ts.tv_nsec = curr->timestamp_ns % 1000000000ULL;
>         }
>
>         return i;
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
