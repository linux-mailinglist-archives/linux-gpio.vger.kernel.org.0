Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645931EE820
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 18:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbgFDQAS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 12:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729216AbgFDQAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 12:00:18 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3FBC08C5C0;
        Thu,  4 Jun 2020 09:00:17 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e9so3626455pgo.9;
        Thu, 04 Jun 2020 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XWrgXRjk6rSuxDojxGAmHRk7tFyiuR8c79Xwbj7xUFY=;
        b=qMLlzxIZLm3hKY17RlZaUdkxmKQfQLjQCCxzvfSraTMym28TYKXMaysxHIdD0X/59j
         +5WRtzH7Fe5WwC0TspFU4njGpGx9CDQ5Z9PB15MNqSFKyysws2faFmkpdtDh6c+A5O1L
         yseX8x4dWEQkcP9FI5/xvSwZowpH0rzstgtG+6CdcvHITslzIZWNaRw5YIyHvqpsUVLG
         MDTSa+ULXreS6V0zTo0E8TWkAAu6fQgPFvPcPgRGHg4i07e+szV+Aocnd2JmxzLYyok3
         KTaeBACs3JDGPRVqLnPJEsgC7/RbrRZC8e1zsDAoANqIiccZRb016olYW6F8zwZ8AC2p
         4mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XWrgXRjk6rSuxDojxGAmHRk7tFyiuR8c79Xwbj7xUFY=;
        b=Ba6u7GDf2CRmvxN3qUpFDOvWsF0+i6ScF578qb2PcLYXI6mDchyXcqFQeOnFlCyT5n
         EsjMAFN+O6O9WC/K5gLvp0yn+HAKxQcEZu2euO/1dtuXNBLQX61iyWE5CCZ/acJu1RCo
         p2QeUlzX2jfCHg5GVxS4nUgBs+Y2gKCqCyJcU2vrs7tpCrR/oHHVB8cNGBCcdTjUaF2F
         LLUbsGyDaewO3XJMPG/LeOGH17LtYGZpF7+4bzuEIuawPcNxWipY/17iPasB9QLqJQiA
         I7l/679EiXF7T4OaKmUf8poVC1NPF9CJGjf2+HaODVj4zuUkGY9Nj85t/BqXJRgfI9zg
         0poA==
X-Gm-Message-State: AOAM532t8FEkbOQSD6v7LjzVC3u+ZmvyjMmNcbEvoPl8yWEk0uIIkSlL
        HXJGnmQj1Iw6SzXT2pSAcHU=
X-Google-Smtp-Source: ABdhPJxqIDq7uX7Q7try0o98rfVcaJkFwchf96F7SugTKzh0iINvFyep82v/jc8Nvw0sa+MlAU0+ZQ==
X-Received: by 2002:a62:a518:: with SMTP id v24mr4631249pfm.295.1591286415154;
        Thu, 04 Jun 2020 09:00:15 -0700 (PDT)
Received: from sol (220-235-66-207.dyn.iinet.net.au. [220.235.66.207])
        by smtp.gmail.com with ESMTPSA id j7sm4913106pfh.154.2020.06.04.09.00.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 09:00:12 -0700 (PDT)
Date:   Fri, 5 Jun 2020 00:00:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
Message-ID: <20200604160006.GA5730@sol>
References: <20200516064507.19058-1-warthog618@gmail.com>
 <CAMpxmJUbC4qmUGM0Z-6hXsYPRSpEpNM7iXgc7XbMcf_epi0Lig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUbC4qmUGM0Z-6hXsYPRSpEpNM7iXgc7XbMcf_epi0Lig@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 02:43:08PM +0200, Bartosz Golaszewski wrote:
> sob., 16 maj 2020 o 08:45 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Add a new version of the uAPI to address existing 32/64bit alignment
> > issues, add support for debounce, and provide some future proofing by
> > adding padding reserved for future use.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> 
> I'm a bit late to the party but here's my review.
> 
> >
> >  include/uapi/linux/gpio.h | 204 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 197 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > index 0206383c0383..3db7e0bc1312 100644
> > --- a/include/uapi/linux/gpio.h
> > +++ b/include/uapi/linux/gpio.h
> > @@ -14,6 +14,9 @@
> >  #include <linux/ioctl.h>
> >  #include <linux/types.h>
> >
> > +/* The maximum size of name and label arrays */
> > +#define GPIO_MAX_NAME_SIZE 32
> > +
> >  /**
> >   * struct gpiochip_info - Information about a certain GPIO chip
> >   * @name: the Linux kernel name of this GPIO chip
> > @@ -27,6 +30,184 @@ struct gpiochip_info {
> >         __u32 lines;
> >  };
> >
> > +/* Maximum number of requested lines */
> > +#define GPIOLINES_MAX 64
> > +
> > +enum gpioline_direction {
> > +       GPIOLINE_DIRECTION_INPUT        = 1,
> > +       GPIOLINE_DIRECTION_OUTPUT       = 2,
> > +};
> > +
> > +enum gpioline_drive {
> > +       GPIOLINE_DRIVE_PUSH_PULL        = 0,
> > +       GPIOLINE_DRIVE_OPEN_DRAIN       = 1,
> > +       GPIOLINE_DRIVE_OPEN_SOURCE      = 2,
> > +};
> > +
> > +enum gpioline_bias {
> > +       GPIOLINE_BIAS_DISABLE           = 0,
> > +       GPIOLINE_BIAS_PULL_UP           = 1,
> > +       GPIOLINE_BIAS_PULL_DOWN         = 2,
> > +};
> > +
> > +enum gpioline_edge {
> > +       GPIOLINE_EDGE_NONE              = 0,
> > +       GPIOLINE_EDGE_RISING            = 1,
> > +       GPIOLINE_EDGE_FALLING           = 2,
> > +       GPIOLINE_EDGE_BOTH              = 3,
> > +};
> 
> I would skip the names of the enum types if we're not reusing them anywhere.
> 

I thought it was useful to name them even if it was just to be able to
reference them in the documentation for relevant fields, such as that in
struct gpioline_config below, rather than having to either list all
possible values or a GPIOLINE_EDGE_* glob.

And I'm currently using enum gpioline_edge in my edge detector
implementation - is that sufficient?

> > +
> > +/* Line flags - V2 */
> > +#define GPIOLINE_FLAG_V2_KERNEL                (1UL << 0) /* Line used by the kernel */
> 
> In v1 this flag is also set if the line is used by user-space. Maybe a
> simple GPIOLINE_FLAG_V2_USED would be better?
> 

Agreed - the _KERNEL name is confusing.
In my latest draft I've already renamed it GPIOLINE_FLAG_V2_BUSY,
as EBUSY is what the ioctl returns when you try to request such a line.
Does that work for you?
I was also considering _IN_USE, and was using _UNAVAILABLE for a while.

> > +#define GPIOLINE_FLAG_V2_ACTIVE_LOW    (1UL << 1)
> > +#define GPIOLINE_FLAG_V2_DIRECTION     (1UL << 2)
> > +#define GPIOLINE_FLAG_V2_DRIVE         (1UL << 3)
> > +#define GPIOLINE_FLAG_V2_BIAS          (1UL << 4)
> > +#define GPIOLINE_FLAG_V2_EDGE_DETECTION        (1UL << 5)
> > +#define GPIOLINE_FLAG_V2_DEBOUNCE      (1UL << 6)
> > +
> > +/**
> > + * struct gpioline_config - Configuration for GPIO lines
> > + * @default_values: if the direction is GPIOLINE_DIRECTION_OUTPUT, this
> > + * specifies the default output value, should be 0 (low) or 1 (high),
> > + * anything else than 0 or 1 will be interpreted as 1 (high)
> > + * @flags: flags for the GPIO lines, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
> > + * GPIOLINE_FLAG_V2_DIRECTION etc, OR:ed together
> > + * @direction: if GPIOLINE_FLAG_V2_DIRECTION is set in flags, the desired
> > + * direction for the requested lines, with a value from enum
> > + * gpioline_direction
> > + * @drive: if GPIOLINE_FLAG_V2_DRIVE is set in flags, the desired drive for
> > + * the requested lines, with a value from enum gpioline_drive
> > + * @bias: if GPIOLINE_FLAG_V2_BIAS is set in flags, the desired bias for
> > + * the requested lines, with a value from enum gpioline_bias
> > + * @edge_detection: if GPIOLINE_FLAG_V2_EDGE_DETECTION is set in flags, the
> > + * desired edge_detection for the requested lines, with a value from enum
> > + * gpioline_edge
> > + * @debounce: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the desired
> > + * debounce period for the requested lines, in microseconds
> > + * @padding: reserved for future use and should be zero filled
> > + */
> > +struct gpioline_config {
> > +       __u8 default_values[GPIOLINES_MAX];
> 
> As I said elsewhere - bitfield is fine here for me: for instance a single u64.
> 
> > +       __u32 flags;
> > +       __u8 direction;
> > +       __u8 drive;
> > +       __u8 bias;
> > +       __u8 edge_detection;
> > +       __u32 debounce;
> 
> Maybe debounce_time for clarity?
> 
> > +       __u32 padding[7]; /* for future use */
> > +};
> > +
> > +/**
> > + * struct gpioline_request - Information about a request for GPIO lines
> > + * @offsets: an array of desired lines, specified by offset index for the
> > + * associated GPIO device
> > + * @consumer: a desired consumer label for the selected GPIO lines such
> > + * as "my-bitbanged-relay"
> > + * @config: Requested configuration for the requested lines. Note that
> > + * even if multiple lines are requested, the same configuration must be
> > + * applicable to all of them. If you want lines with individual
> > + * configuration, request them one by one. It is possible to select a
> > + * batch of input or output lines, but they must all have the same
> > + * configuration, i.e. all inputs or all outputs, all active low etc
> > + * @lines: number of lines requested in this request, i.e. the number of
> > + * valid fields in the GPIOLINES_MAX sized arrays, set to 1 to request a
> > + * single line
> > + * @padding: reserved for future use and should be zero filled
> > + * @fd: if successful this field will contain a valid anonymous file handle
> > + * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
> > + * error
> > + */
> > +struct gpioline_request {
> > +       __u32 offsets[GPIOLINES_MAX];
> > +       char consumer[GPIO_MAX_NAME_SIZE];
> > +       struct gpioline_config config;
> > +       __u32 lines;
> 
> Maybe num_lines would be clearer?
> 
> > +       __u32 padding[4]; /* for future use */
> > +       __s32 fd;
> > +};
> > +
> > +/**
> > + * struct gpioline_values - Values of GPIO lines
> > + * @values: when getting the state of lines this contains the current
> > + * state of a line, when setting the state of lines these should contain
> > + * the desired target state
> > + */
> > +struct gpioline_values {
> > +       __u8 values[GPIOLINES_MAX];
> 
> Same here for bitfield. And maybe reuse this structure in
> gpioline_config for default values?
>

Can do.  What makes me reticent is the extra level of indirection
and the stuttering that would cause when referencing them.
e.g. config.default_values.values
So not sure the gain is worth the pain.

And I've renamed "default_values" to just "values" in my latest draft
which doesn't help with the stuttering.

> > +};
> > +
> > +/**
> > + * struct gpioline_info_v2 - Information about a certain GPIO line
> > + * @name: the name of this GPIO line, such as the output pin of the line on
> > + * the chip, a rail or a pin header name on a board, as specified by the
> > + * gpio chip, may be empty
> > + * @consumer: a functional name for the consumer of this GPIO line as set
> > + * by whatever is using it, will be empty if there is no current user but
> > + * may also be empty if the consumer doesn't set this up
> > + * @offset: the local offset on this GPIO device, fill this in when
> > + * requesting the line information from the kernel
> > + * @flags: various flags for this line
> > + * @direction: if GPIOLINE_FLAG_V2_DIRECTION is set in flags, the direction
> > + * of the line, with a value from enum gpioline_direction
> > + * @drive: if GPIOLINE_FLAG_V2_DRIVE is set in flags, the drive for the
> > + * line, with a value from enum gpioline_drive
> > + * @bias: if GPIOLINE_FLAG_V2_BIAS is set in flags, the bias for the line,
> > + * with a value from enum gpioline_bias
> > + * @edge_detection: if GPIOLINE_FLAG_V2_EDGE_DETECTION is set in flags, the
> > + * edge_detection for the line, with a value from enum gpioline_edge
> > + * @debounce: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the debounce
> > + * period for the line, in microseconds
> > + * @padding: reserved for future use
> > + */
> > +struct gpioline_info_v2 {
> > +       char name[GPIO_MAX_NAME_SIZE];
> > +       char consumer[GPIO_MAX_NAME_SIZE];
> > +       __u32 offset;
> > +       __u32 flags;
> > +       __u8 direction;
> > +       __u8 drive;
> > +       __u8 bias;
> > +       __u8 edge_detection;
> > +       __u32 debounce;
> > +       __u32 padding[12]; /* for future use */
> > +};
> > +
> > +/**
> > + * struct gpioline_info_changed_v2 - Information about a change in status
> > + * of a GPIO line
> > + * @info: updated line information
> > + * @timestamp: estimate of time of status change occurrence, in nanoseconds
> > + * and GPIOLINE_CHANGED_CONFIG
> > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
> > + * @padding: reserved for future use
> > + */
> > +struct gpioline_info_changed_v2 {
> > +       struct gpioline_info_v2 info;
> > +       __u64 timestamp;
> > +       __u32 event_type;
> > +       __u32 padding[5]; /* for future use */
> > +};
> > +
> > +enum gpioline_event_id {
> > +       GPIOLINE_EVENT_RISING_EDGE      = 1,
> > +       GPIOLINE_EVENT_FALLING_EDGE     = 2,
> > +};
> > +
> > +/**
> > + * struct gpioline_event - The actual event being pushed to userspace
> > + * @timestamp: best estimate of time of event occurrence, in nanoseconds
> > + * @id: event identifier with value from enum gpioline_event_id
> > + * @offset: the offset of the line that triggered the event
> > + * @padding: reserved for future use
> > + */
> > +struct gpioline_event {
> > +       __u64 timestamp;
> 
> I'd specify in the comment the type of clock used for the timestamp.
> 

Agreed - as this one will be guaranteed to be CLOCK_MONOTONIC.

I'm also kicking around the idea of adding sequence numbers to events,
one per line and one per handle, so userspace can more easily detect
mis-ordering or buffer overflows.  Does that make any sense?

And would it be useful for userspace to be able to influence the size of
the event buffer (currently fixed at 16 events per line)?

Cheers,
Kent.

> > +       __u32 id;
> > +       __u32 offset;
> > +       __u32 padding[2]; /* for future use */
> > +};
> > +
> >  /* Informational flags */
> >  #define GPIOLINE_FLAG_KERNEL           (1UL << 0) /* Line used by the kernel */
> >  #define GPIOLINE_FLAG_IS_OUT           (1UL << 1)
> > @@ -144,8 +325,6 @@ struct gpiohandle_config {
> >         __u32 padding[4]; /* padding for future use */
> >  };
> >
> > -#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
> > -
> >  /**
> >   * struct gpiohandle_data - Information of values on a GPIO handle
> >   * @values: when getting the state of lines this contains the current
> > @@ -156,9 +335,6 @@ struct gpiohandle_data {
> >         __u8 values[GPIOHANDLES_MAX];
> >  };
> >
> > -#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
> > -#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
> > -
> >  /* Eventrequest flags */
> >  #define GPIOEVENT_REQUEST_RISING_EDGE  (1UL << 0)
> >  #define GPIOEVENT_REQUEST_FALLING_EDGE (1UL << 1)
> > @@ -202,11 +378,25 @@ struct gpioevent_data {
> >         __u32 id;
> >  };
> >
> > +/* V1 and V2 */
> >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> > +#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0C, __u32)
> > +
> > +/* V1 */
> >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> > -#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_info)
> > -#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
> >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
> >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
> > +#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
> > +#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
> > +#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0A, struct gpiohandle_config)
> > +#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0B, struct gpioline_info)
> > +
> > +/* V2 */
> > +#define GPIO_GET_LINEINFO_V2_IOCTL _IOWR(0xB4, 0x0D, struct gpioline_info_v2)
> > +#define GPIO_GET_LINEINFO_WATCH_V2_IOCTL _IOWR(0xB4, 0x0E, struct gpioline_info_v2)
> > +#define GPIO_GET_LINE_IOCTL _IOWR(0xB4, 0x0F, struct gpioline_request)
> > +#define GPIOLINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x10, struct gpioline_config)
> > +#define GPIOLINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x11, struct gpioline_values)
> > +#define GPIOLINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x12, struct gpioline_values)
> >
> >  #endif /* _UAPI_GPIO_H_ */
> > --
> > 2.26.2
> >
> 
> Bartosz
