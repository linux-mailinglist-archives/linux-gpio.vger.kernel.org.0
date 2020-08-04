Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1870123BEFD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 19:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgHDRmr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 13:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729725AbgHDRmq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 13:42:46 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9C1C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2020 10:42:46 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id s15so15006798qvv.7
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2020 10:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VheqgmQVE5+EY9PvuT2rHPuR1ItGVEwEKvVCwg1L7WE=;
        b=pxAngJrWI1QsfBWnOSadbey6ugitKHtI11FZ5AYazdvCdQMQ3VIvd+/OI+5WqCA5M/
         cofW9w1C/N5XtQMnKfwx650JgmdQUsc8PJUk7WzP9/BooNhbfaENUsKFo6caxE4nBWTk
         KFPYa5mTXNfXN9t8l4+3epX4JGSGXCfbFmIQMtfKyHIgqHFX8BNXJO0D4Ztb4zGa4355
         ukDHPKrFNvl8bybeISKFFt92GHEBNrYldqJHQrUUUNLOy200a5aY8d3XKAEQsnH8bkjX
         UQcctTnQov942Sv9TGvu78wqz1tos4N9DLZUEF98Ovk5WR6TVYhXCvpOT+69IXYzKWJK
         mIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VheqgmQVE5+EY9PvuT2rHPuR1ItGVEwEKvVCwg1L7WE=;
        b=GD3QIYIZjyKDVOV8JmCRiEc8WzevTjlAMLRhdgw6iim65yMP/E5lxCGwr3XOI80JHG
         EYlRAXnNx7d2g5e8YoEDBqZPl8hhOOmbjV0YJfvWEGO+1Ia44Asbtf5MG1nLL7lJY07W
         LNgagzvAPV2eeykUWlGCKPLfig7Z39cYx8pfag7ApGg3i8lUGw9ELa4FbHzKzJDFwkgR
         4R5aBz6jynDd8Y7swyOV1kP8+nY5PzbCyK8sYSYoXF3e+cObJtG+I8Zl3ko2OsY1aFR4
         xXM+LX71GSmvYB4v1xwIXHwq8ozhn9diiUuU33tKhkr+pL1GGVT437BWTQ6MQNjP+NMA
         9NaQ==
X-Gm-Message-State: AOAM530reoB7JbckmJHuMlC9Cc7ufh1DX9Cv+nN67zbd2smhdjlK/z8B
        4ikAa+Cfb3zW8pOW1uEmi9dvLkYxioEd5bYlZO7DNw==
X-Google-Smtp-Source: ABdhPJyq9ZUolSybDGwT0yhhtAH5L/QxTCZqWcII3MIwINYMZBQKgTehUIDDRXi7/tbU+c91LJXuCAp0Qxu+z/E89uM=
X-Received: by 2002:a0c:ff06:: with SMTP id w6mr9105101qvt.61.1596562965560;
 Tue, 04 Aug 2020 10:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-3-warthog618@gmail.com>
In-Reply-To: <20200725041955.9985-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Aug 2020 19:42:34 +0200
Message-ID: <CAMpxmJXocdDTvC7_76UwZ9FONn86p0MjZtorRKTR5bxN7PJy6g@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] gpio: uapi: define uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 25, 2020 at 6:20 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a new version of the uAPI to address existing 32/64-bit alignment
> issues, add support for debounce and event sequence numbers, and provide
> some future proofing by adding padding reserved for future use.
>
> The alignment issue relates to the gpioevent_data, which packs to different
> sizes on 32-bit and 64-bit platforms. That creates problems for 32-bit apps
> running on 64-bit kernels.  The patch addresses that particular issue, and
> the problem more generally, by adding pad fields that explicitly pad
> structs out to 64-bit boundaries, so they will pack to the same size now,
> and even if some of the reserved padding is used for __u64 fields in the
> future.
>
> The lack of future proofing in v1 makes it impossible to, for example,
> add the debounce feature that is included in v2.
> The future proofing is addressed by providing reserved padding in all
> structs for future features.  Specifically, the line request,
> config, info, info_changed and event structs receive updated versions,
> and the first three new ioctls.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Hi Kent,

Thanks a lot for your work on this. Please see comments below.

One thing I'd change globally for better readability is to have all
new symbols marked as v2 - even if they have no counterparts in v1. I
know libgpiod will wrap it all anyway but I think it's still a good
way to make our work in user-space easier.

>
> I haven't added any padding to gpiochip_info, as I haven't seen any calls
> for new features for the corresponding ioctl, but I'm open to updating that
> as well.
>
> As the majority of the structs and ioctls were being replaced, it seemed
> opportune to rework some of the other aspects of the uAPI.
>
> Firstly, I've reworked the flags field throughout.  v1 has three different
> flags fields, each with their own separate bit definitions.  In v2 that is
> collapsed to one.
>
> I've also merged the handle and event requests into a single request, the
> line request, as the two requests were mostly the same, other than the
> edge detection provided by event requests.  As a byproduct, the v2 uAPI
> allows for multiple lines producing edge events on the same line handle.
> This is a new capability as v1 only supports a single line in an event
> request.
>
> This means there are now only two types of file handle to be concerned with,
> the chip and the line, and it is clearer which ioctls apply to which type
> of handle.
>
> There is also some minor renaming of fields for consistency compared to
> their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> and consumer rather than consumer_label.
>
> Additionally, v1 GPIOHANDLES_MAX becomes GPIOLINES_MAX in v2 for clarity,
> and the gpiohandle_data __u8 array becomes a bitmap gpioline_values.
>
> The v2 uAPI is mostly just a reorganisation of v1, so userspace code,
> particularly libgpiod, should easily port to it.
>

I think the info above is worth putting into the commit message.
Especially the part about merging the two event types.

> Changes since v1:
>  - lower case V1 and V2, except in capitalized names
>  - hyphenate 32/64-bit
>  - rename bitmap field to bits
>  - drop PAD_SIZE consts in favour of hard coded numbers
>  - sort includes
>  - change config flags to __u64
>  - increase padding of gpioline_event
>  - relocate GPIOLINE_CHANGED enum into v2 section (is common with v1)
>  - rework config to collapse direction, drive, bias and edge enums back
>    into flags and add optional attributes that can be associated with a
>    subset of the requested lines.
>
> Changes since the RFC:
>  - document the constraints on array sizes to maintain 32/64 alignment
>  - add sequence numbers to gpioline_event
>  - use bitmap for values instead of array of __u8
>  - gpioline_info_v2 contains gpioline_config instead of its composite fields
>  - provide constants for all array sizes, especially padding
>  - renamed "GPIOLINE_FLAG_V2_KERNEL" to "GPIOLINE_FLAG_V2_USED"
>  - renamed "default_values" to "values"
>  - made gpioline_direction zero based
>  - document clock used in gpioline_event timestamp
>  - add event_buffer_size to gpioline_request
>  - rename debounce to debounce_period
>  - rename lines to num_lines
>
>  include/uapi/linux/gpio.h | 284 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 270 insertions(+), 14 deletions(-)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 285cc10355b2..3f6db33014f0 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -12,10 +12,13 @@
>  #define _UAPI_GPIO_H_
>
>  #include <linux/ioctl.h>
> +#include <linux/kernel.h>
>  #include <linux/types.h>
>
>  /*
>   * The maximum size of name and label arrays.
> + *
> + * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
>   */
>  #define GPIO_MAX_NAME_SIZE 32
>
> @@ -32,6 +35,251 @@ struct gpiochip_info {
>         __u32 lines;
>  };
>
> +/*
> + * Maximum number of requested lines.
> + *
> + * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
> + */
> +#define GPIOLINES_MAX 64
> +
> +/* The number of __u64 required for a bitmap for GPIOLINES_MAX lines */
> +#define GPIOLINES_BITMAP_SIZE  __KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)
> +

In what circumstances can this be different than 1? It's worth
documenting here I suppose.

> +/*
> + * The maximum number of configuration attributes associated with a line
> + * request.
> + */
> +#define GPIOLINE_NUM_ATTRS_MAX 10
> +

How did you choose this number? I mean: it's reasonable - just asking
for clarification.

> +/**
> + * enum gpioline_flag_v2 - &struct gpioline_attribute.flags values
> + */
> +enum gpioline_flag_v2 {
> +       GPIOLINE_FLAG_V2_USED                   = 1UL << 0, /* line is not available for request */
> +       GPIOLINE_FLAG_V2_ACTIVE_LOW             = 1UL << 1,
> +       GPIOLINE_FLAG_V2_INPUT                  = 1UL << 2,
> +       GPIOLINE_FLAG_V2_OUTPUT                 = 1UL << 3,
> +       GPIOLINE_FLAG_V2_EDGE_RISING            = 1UL << 4,
> +       GPIOLINE_FLAG_V2_EDGE_FALLING           = 1UL << 5,
> +       GPIOLINE_FLAG_V2_OPEN_DRAIN             = 1UL << 6,
> +       GPIOLINE_FLAG_V2_OPEN_SOURCE            = 1UL << 7,
> +       GPIOLINE_FLAG_V2_BIAS_PULL_UP           = 1UL << 8,
> +       GPIOLINE_FLAG_V2_BIAS_PULL_DOWN         = 1UL << 9,
> +       GPIOLINE_FLAG_V2_BIAS_DISABLED          = 1UL << 10,
> +};
> +
> +/**
> + * struct gpioline_values - Values of GPIO lines
> + * @bits: a bitmap containing the value of the lines, set to 1 for active
> + * and 0 for inactive.  Note that this is the logical value, which will be
> + * the opposite of the physical value if the line is configured as active
> + * low.
> + */
> +struct gpioline_values {
> +       __u64 bits[GPIOLINES_BITMAP_SIZE];
> +};
> +

We can set values only for a subset of requested lines but AFAICT we
can't read values of only a subset of lines. Would it be difficult to
remove this limitation? While reading values always succeeds - even if
the line is in input mode and has edge detected - I think that someone
may want to request the max number of lines without reading all their
values each time. Maybe consider merging this with struct
gpioline_set_values?

> +/**
> + * struct gpioline_set_values - Values to set a group of GPIO lines
> + * @mask: a bitmap identifying the lines to set.
> + * @bits: a bitmap containing the value of the lines, set to 1 for active
> + * and 0 for inactive.  Note that this is the logical value, which will be
> + * the opposite of the physical value if the line is configured as active
> + * low.
> + */
> +struct gpioline_set_values {
> +       __u64 mask[GPIOLINES_BITMAP_SIZE];
> +       __u64 bits[GPIOLINES_BITMAP_SIZE];
> +};
> +
> +/**
> + * enum gpioline_attr_id - &struct gpioline_attribute.id values
> + */
> +enum gpioline_attr_id {
> +       GPIOLINE_ATTR_ID_FLAGS                  = 1,
> +       GPIOLINE_ATTR_ID_OUTPUT_VALUES          = 2,
> +       GPIOLINE_ATTR_ID_DEBOUNCE               = 3,
> +};
> +
> +/**
> + * struct gpioline_attribute - a configurable attribute of a line
> + * @id: attribute identifier with value from &enum gpioline_attr_id
> + * @padding: reserved for future use and must be zero filled
> + * @flags: if id is GPIOLINE_ATTR_ID_FLAGS, the flags for the GPIO line,
> + * with values from enum gpioline_flag_v2, such as
> + * GPIOLINE_FLAG_V2_ACTIVE_LOW, GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed
> + * together.  This overrides the default flags contained in the &struct
> + * gpioline_config for the associated line.
> + * @values: if id is GPIOLINE_ATTR_ID_OUTPUT_VALUES, the values to which
> + * the lines will be set
> + * @debounce_period: if id is GPIOLINE_ATTR_ID_DEBOUNCE, the desired
> + * debounce period, in microseconds
> + */
> +struct gpioline_attribute {
> +       __u32 id;
> +       __u32 padding;
> +       union {
> +               __u64 flags;
> +               struct gpioline_values values;
> +               __u32 debounce_period;
> +       };
> +};

I'm afraid that if we don't have enough padding here (at the end),
we'll end up wanting to add a new attribute at some point whose
argument won't fit. Maybe have a specific field in the union that's
even larger than __u64?

> +
> +/**
> + * struct gpioline_config_attribute - a configuration attribute associated
> + * with one or more of the requested lines.
> + * @mask: a bitmap identifying the lines to which the attribute applies
> + * @attr: the configurable attribute
> + */
> +struct gpioline_config_attribute {
> +       __u64 mask[GPIOLINES_BITMAP_SIZE];
> +       struct gpioline_attribute attr;
> +};
> +
> +/**
> + * struct gpioline_config - Configuration for GPIO lines
> + * @flags: flags for the GPIO lines, with values from enum
> + * gpioline_flag_v2, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
> + * GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed together.  This is the default for
> + * all requested lines but may be overridden for particular lines using
> + * attrs.

So I'm having a hard time with this. I understand that the thinking
behind it was: use the flags field to set all lines to INPUT by
default and only set certain lines to OUTPUT with attrs. This would
make life easier for user-space but it complicates the kernel code and
I also believe that any such simplification should be handled by
user-space libraries, not be exposed by kernel uAPI. My personal
preference would be to drop the flags field and only handle attributes
(maybe even define a special macro to set all bits in mask -
GPIOLINE_CONFIG_ALL_LINES or something) on a first-in-wins basis. I'm
open to other suggestions though.

> + * @num_attrs: the number of attributes in attrs
> + * @padding: reserved for future use and must be zero filled
> + * @attrs: the configuration attributes associated with the requested
> + * lines.
> + */
> +struct gpioline_config {
> +       __u64 flags;
> +       __u32 num_attrs;
> +       /*
> +        * Pad to fill implicit padding and provide space for future use.
> +        */
> +       __u32 padding[5];
> +       struct gpioline_config_attribute attrs[GPIOLINE_NUM_ATTRS_MAX];
> +};
> +
> +/**
> + * struct gpioline_request - Information about a request for GPIO lines
> + * @offsets: an array of desired lines, specified by offset index for the
> + * associated GPIO device
> + * @consumer: a desired consumer label for the selected GPIO lines such as
> + * "my-bitbanged-relay"
> + * @config: requested configuration for the lines.
> + * @num_lines: number of lines requested in this request, i.e. the number
> + * of valid fields in the GPIOLINES_MAX sized arrays, set to 1 to request a
> + * single line
> + * @event_buffer_size: a suggested minimum number of line events that the
> + * kernel should buffer.  This is only relevant if edge detection is
> + * enabled in the configuration. Note that this is only a suggested value
> + * and the kernel may allocate a larger buffer or cap the size of the
> + * buffer. If this field is zero then the buffer size defaults to a minimum
> + * of num_lines*16.
> + * @padding: reserved for future use and must be zero filled
> + * @fd: if successful this field will contain a valid anonymous file handle
> + * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
> + * error
> + */
> +struct gpioline_request {
> +       __u32 offsets[GPIOLINES_MAX];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       struct gpioline_config config;
> +       __u32 num_lines;
> +       __u32 event_buffer_size;
> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use.
> +        */
> +       __u32 padding[5];
> +       __s32 fd;
> +};
> +
> +/**
> + * struct gpioline_info_v2 - Information about a certain GPIO line
> + * @name: the name of this GPIO line, such as the output pin of the line on
> + * the chip, a rail or a pin header name on a board, as specified by the
> + * gpio chip, may be empty
> + * @consumer: a functional name for the consumer of this GPIO line as set
> + * by whatever is using it, will be empty if there is no current user but
> + * may also be empty if the consumer doesn't set this up
> + * @flags: flags for the GPIO line, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
> + * GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed together
> + * @offset: the local offset on this GPIO device, fill this in when
> + * requesting the line information from the kernel
> + * @num_attrs: the number of attributes in attrs
> + * @attrs: the configuration attributes associated with the line.
> + * @padding: reserved for future use
> + */
> +struct gpioline_info_v2 {
> +       char name[GPIO_MAX_NAME_SIZE];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       __u32 offset;
> +       __u32 num_attrs;
> +       __u64 flags;
> +       struct gpioline_attribute attrs[GPIOLINE_NUM_ATTRS_MAX];
> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use.
> +        */
> +       __u32 padding[4];
> +};
> +
> +enum gpioline_changed_type {
> +       GPIOLINE_CHANGED_REQUESTED      = 1,
> +       GPIOLINE_CHANGED_RELEASED       = 2,
> +       GPIOLINE_CHANGED_CONFIG         = 3,
> +};
> +
> +/**
> + * struct gpioline_info_changed_v2 - Information about a change in status
> + * of a GPIO line
> + * @info: updated line information
> + * @timestamp: estimate of time of status change occurrence, in nanoseconds
> + * @event_type: the type of change with a value from enum gpioline_changed_type
> + * @padding: reserved for future use
> + */
> +struct gpioline_info_changed_v2 {
> +       struct gpioline_info_v2 info;
> +       __u64 timestamp;
> +       __u32 event_type;
> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use.
> +        */
> +       __u32 padding[5];
> +};
> +
> +enum gpioline_event_id {
> +       GPIOLINE_EVENT_RISING_EDGE      = 1,
> +       GPIOLINE_EVENT_FALLING_EDGE     = 2,
> +};
> +
> +/**
> + * struct gpioline_event - The actual event being pushed to userspace
> + * @timestamp: best estimate of time of event occurrence, in nanoseconds.
> + * The timestamp is read from CLOCK_MONOTONIC and is intended to allow the
> + * accurate measurement of the time between events.  It does not provide
> + * the wall-clock time.
> + * @id: event identifier with value from enum gpioline_event_id
> + * @offset: the offset of the line that triggered the event
> + * @seqno: the sequence number for this event in the sequence of events for
> + * all the lines in this line request
> + * @line_seqno: the sequence number for this event in the sequence of
> + * events on this particular line
> + * @padding: reserved for future use
> + */
> +struct gpioline_event {
> +       __u64 timestamp;
> +       __u32 id;
> +       __u32 offset;
> +       __u32 seqno;
> +       __u32 line_seqno;
> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use.
> +        */
> +       __u32 padding[6];
> +};
> +
> +/*
> + *  ABI v1
> + */
> +
>  /* Informational flags */
>  #define GPIOLINE_FLAG_KERNEL           (1UL << 0) /* Line used by the kernel */
>  #define GPIOLINE_FLAG_IS_OUT           (1UL << 1)
> @@ -64,13 +312,6 @@ struct gpioline_info {
>  /* Maximum number of requested handles */
>  #define GPIOHANDLES_MAX 64
>
> -/* Possible line status change events */
> -enum {
> -       GPIOLINE_CHANGED_REQUESTED = 1,
> -       GPIOLINE_CHANGED_RELEASED,
> -       GPIOLINE_CHANGED_CONFIG,
> -};
> -
>  /**
>   * struct gpioline_info_changed - Information about a change in status
>   * of a GPIO line
> @@ -149,8 +390,6 @@ struct gpiohandle_config {
>         __u32 padding[4]; /* padding for future use */
>  };
>
> -#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
> -
>  /**
>   * struct gpiohandle_data - Information of values on a GPIO handle
>   * @values: when getting the state of lines this contains the current
> @@ -161,9 +400,6 @@ struct gpiohandle_data {
>         __u8 values[GPIOHANDLES_MAX];
>  };
>
> -#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
> -#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
> -
>  /* Eventrequest flags */
>  #define GPIOEVENT_REQUEST_RISING_EDGE  (1UL << 0)
>  #define GPIOEVENT_REQUEST_FALLING_EDGE (1UL << 1)
> @@ -207,11 +443,31 @@ struct gpioevent_data {
>         __u32 id;
>  };
>
> +/*
> + * v1 and v2 ioctl()s
> + */
>  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> +#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0C, __u32)
> +
> +/*
> + * v2 ioctl()s
> + */
> +#define GPIO_GET_LINEINFO_V2_IOCTL _IOWR(0xB4, 0x05, struct gpioline_info_v2)
> +#define GPIO_GET_LINEINFO_WATCH_V2_IOCTL _IOWR(0xB4, 0x06, struct gpioline_info_v2)
> +#define GPIO_GET_LINE_IOCTL _IOWR(0xB4, 0x07, struct gpioline_request)
> +#define GPIOLINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0D, struct gpioline_config)
> +#define GPIOLINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x0E, struct gpioline_values)
> +#define GPIOLINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x0F, struct gpioline_set_values)
> +
> +/*
> + * v1 ioctl()s
> + */
>  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> -#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_info)
> -#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
>  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
>  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
> +#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
> +#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
> +#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0A, struct gpiohandle_config)
> +#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0B, struct gpioline_info)
>
>  #endif /* _UAPI_GPIO_H_ */
> --
> 2.27.0
>

Everything else looks good to me. Much cleaner and more elegant than
v1. Great job!

I may come up with something else while browsing other patches I suppose.

Bartosz
