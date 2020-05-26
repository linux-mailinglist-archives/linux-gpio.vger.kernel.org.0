Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2EC1E221E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 14:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389226AbgEZMmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 08:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389225AbgEZMmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 08:42:10 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D992C03E96D;
        Tue, 26 May 2020 05:42:09 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 5so1299718pjd.0;
        Tue, 26 May 2020 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oe5S7isHFyb9QNqaTXu7EWpAPWe1cyTvh80d0IkjY6M=;
        b=BLrl10HwQGLEebx2WCHmcM9vn0pPtgiWA1LJYNe5s5jjVYu7hoeW2DGSyIpjlDV/7V
         RxVKG7c+/Err4ZuvYZY4UgoCMQECgfa/Ajq+azLn/OLEemTh9BhkjRU2CeAyHchH5AcH
         56Ew4LaCabVEk8KNDkFFzDauClBAP8vbgvRm+MJXBoRiiiYT8QsvhWzkiXlS1TSy6HLt
         cuCERR4lVTl+JPyqd8ws+LO9sBBO3DSukl28Pzf8XwlnH/BpGHNBx3KYRmJGGxjNEpIn
         CSAfOwek0eN+2Y2CzwFxiqF1qk4hffhEjw58XhnoSCYvSYZtzH4boAL5dmYomdQOEp2M
         dbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oe5S7isHFyb9QNqaTXu7EWpAPWe1cyTvh80d0IkjY6M=;
        b=NNdBLAlXpG9DTYACLohO27U0w4fgJl5ir2/1oO52brHZUdnxN/DdRGU/P4yP5V0OrK
         b+2omeCZGrjbo5WCM6tlGzOZ0Wuu5DrO36eJqhDFUfrPOJNT5+Yd8mylHpRRLWgsrUJw
         AH/wH3lysFG9/MO2TQ5U9HirB59cxDFs/eaw/3a2Qy61hq+hIbD8N0l97QiTDORWbW/v
         Lqz9NSMHfySs2NHkh9u9xI3tinPIw+mXQVqxgDAKOviNrRoAj4SJuy2bpxTE29dhUw7E
         Vob3vxDE1r+52nF8O7SCb/H77ygcrYzoFAqtIOXsR0n1Bilh/qMnYK17exFl6CBrO+3v
         JWHg==
X-Gm-Message-State: AOAM531Sas8GmeAUP1BlFFYZqOf0SoPDHsaEyYT3OHLyLGEsvorOykhd
        WaMy3YEn1lFvqqnCAYmhjq4=
X-Google-Smtp-Source: ABdhPJyq155Ho1bMESxIADSfNNEjW5jF0rOJDd0mnWO/Mbfoyhw1HrTDDDyZxyHXj19pdSwQuGBvxg==
X-Received: by 2002:a17:90a:7c07:: with SMTP id v7mr26798562pjf.124.1590496928522;
        Tue, 26 May 2020 05:42:08 -0700 (PDT)
Received: from sol (220-235-68-201.dyn.iinet.net.au. [220.235.68.201])
        by smtp.gmail.com with ESMTPSA id v127sm15354494pfb.91.2020.05.26.05.42.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 05:42:07 -0700 (PDT)
Date:   Tue, 26 May 2020 20:42:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     ville.syrjala@linux.intel.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
Message-ID: <20200526124201.GA17748@sol>
References: <20200516064507.19058-1-warthog618@gmail.com>
 <CAHp75Vc9Js7keBnk5P0Skm4sBkxZdQPLTpqLm4sqzbNmuyjEMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vc9Js7keBnk5P0Skm4sBkxZdQPLTpqLm4sqzbNmuyjEMA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 11:04:25AM +0300, Andy Shevchenko wrote:
> +Cc: Ville
> 
> Ville, this is a v2 of the GPIO ABI we discussed with some time ago.
> If you have time to briefly look at it and perhaps comment if it's
> right way to go.
> 
> On Sat, May 16, 2020 at 9:50 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add a new version of the uAPI to address existing 32/64bit alignment
> > issues, add support for debounce, and provide some future proofing by
> > adding padding reserved for future use.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> > ---
> >
> > This patch is a proposal to replace the majority of the uAPI, so some
> > background and justification is in order.
> >
> > The alignment issue relates to the gpioevent_data, which packs to different
> > sizes on 32bit and 64bit platforms. That creates problems for 32bit apps
> > running on 64bit kernels.  The patch addresses that particular issue, and
> > the problem more generally, by adding pad fields that explicitly pad
> > structs out to 64bit boundaries, so they will pack to the same size now,
> > and even if some of the reserved padding is used for __u64 fields in the
> > future.
> >
> > The lack of future proofing in v1 makes it impossible to, for example,
> > add the debounce feature that is included in v2.
> > The future proofing is addressed by providing reserved padding in all
> > structs for future features.  Specifically, the line request,
> > config and info structs get updated versions and ioctls.
> >
> > I haven't added any padding to gpiochip_info, as I haven't seen any calls
> > for new features for the corresponding ioctl, but I'm open to updating that
> > as well.
> >
> > As the majority of the structs and ioctls were being replaced, it seemed
> > opportune to rework some of the other aspects of the uAPI.
> >
> > Firstly, I've reworked the flags field throughout.  v1 has three different
> > flags fields, each with their own separate bit definitions.  In v2 that is
> > collapsed to one.  Further, the bits of the v2 flags field are used
> > as feature enable flags, with any other necessary configuration fields encoded
> > separately.  This is simpler and clearer, while also providing a foundation
> > for adding features in the future.
> >
> > I've also merged the handle and event requests into a single request, the
> > line request, as the two requests where mostly the same, other than the
> > edge detection provided by event requests.  As a byproduct, the v2 uAPI
> > allows for multiple lines producing edge events on the same line handle.
> > This is a new capability as v1 only supports a single line in an event request.
> >
> > This means there are now only two types of file handle to be concerned with,
> > the chip and the line, and it is clearer which ioctls apply to which type
> > of handle.
> >
> > There is also some minor renaming of fields for consistency compared to their
> > v1 counterparts, e.g. offset rather than lineoffset or line_offset, and
> > consumer rather than consumer_label.
> 
> > And v1 GPIOHANDLES_MAX and gpiohandle_data become GPIOLINES_MAX and
> > gpioline_values for v2 - the only change being the renaming for clarity.
> 
> Hmm... I think it makes sense if you fully replace uAPI, otherwise in
> my opinion it adds to the confusion.
> My point is that we may try to be less invasive, perhaps?
> 

I had an earlier draft that did just that, but I found that having the
"handle" names still floating around confusing - particularly
considering what the header will eventually look like once v1 is
eventually removed.  I'm also assuming the v1 fields will get
documentation updates should we proceed with v2 and deprecate v1.

> > The v2 uAPI is mostly just a reorganisation of v1, so userspace code,
> > particularly libgpiod, should easily port to it.
> >
> > This patch is obviously only one patch in a much bigger series that
> > will actually implement it, but I would appreciate a review and any feedback,
> > as it is foundational to the rest of that series.
> >
> > Thanks,
> > Kent.
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
> > +
> > +/* Line flags - V2 */
> > +#define GPIOLINE_FLAG_V2_KERNEL                (1UL << 0) /* Line used by the kernel */
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
> This basically means that whatever in square brackets must be aligned
> to 8. So, BUILD_BUG_ON() here and in similar places where it makes
> sense.
> 

That is true, and also applies to GPIO_MAX_NAME_SIZE.

Can't put BUILD_BUG_ON checks in the header, but happy to add checks to
gpiolib-cdev.c, as well as some comments in the header.

> > +       __u32 flags;
> > +       __u8 direction;
> > +       __u8 drive;
> > +       __u8 bias;
> > +       __u8 edge_detection;
> > +       __u32 debounce;
> 
> > +       __u32 padding[7]; /* for future use */
> 
> Why 7 and not 5 or even 1?
> Can we use size of struct as a versioning?
> Or maybe explicit version field?
> 

Basically I tried to pick a number that pads the struct out to 64bits,
provides a reasonable amount of room for future use, but isn't stupidly
large.  How much is reasonable depends on how likely the struct is to be
extended in the future.  _config is on the upper end of that, so gets
more than the rest. _info_v2 may have to contain the contents of
_request, which has _config embedded, so its pad is as large as _config
and _request combined.

I'm open to other sizings - these just seemed reasonable to me. YMMV.

> Same questions to all big paddings.
> 
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
> 
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
> 
> Can't we use existing flags (field) to distinguish versions at least
> between v1 and v2?

I'm not sure how that would work. Can you provide an example?

> The IOCTL namespace is not big and adding such a group of new calls
> perhaps too much.
> 

The NR field is 8bits, and so far we've used only 18 values (although
I'm not sure on 5,6, and 7).  I must be missing something, cos that is
about as close to exhausting the namespace as we were before??

Having said that, your recent gpiolib patch has made me consider merging
GPIO_GET_LINEINFO_V2_IOCTL and GPIO_GET_LINEINFO_WATCH_V2_IOCTL.
That would save one ioctl and may reduce the code a little as well.

Hmmm, and perhaps the GPIOHANDLE_GET_LINE_VALUES_IOCTL and
GPIOHANDLE_SET_LINE_VALUES_IOCTL can just be aliases for the GPIOLINE
equivalents, given the structs are identical other than naming??

Cheers,
Kent.

