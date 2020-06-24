Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B6C2075C8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390429AbgFXOgf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388652AbgFXOge (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:36:34 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E83C061573
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:36:34 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id j80so2014433qke.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yyTPQtYtovKQHemyi6fKhSEHo1KqIXmemZ00rIWSbwo=;
        b=ehqi3G3QDIzoKXTuaE5F70ljsBkvlln1Auc30kYy4L7hQ3V1sDC4KZhUSB84KOFAD0
         +FL51M5vxP1sQ098ErbphKHYcXBfr/m2LJtLD45MDtkd9O1sHLvBKAp2x/HlSYt6uW9g
         RvoSNc3u/Ui9lN7V5Us5xfBovwbAfx26qDp1nN01vM9BbeQ5NiRe8D/yB7c7DX2W2562
         nE+d4SKh0kT3o2xwVodb4OwtDAezERWg+0YiphhrIleFGuW/gLMCx7fK7SWJcpWzeihz
         bHsm3A3dz/7aSzBE5XQTJ3HLg+nOSfQTKPytGvA3DxjOw4NSgqvX2cMDv8mLooOuYAOV
         ICzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yyTPQtYtovKQHemyi6fKhSEHo1KqIXmemZ00rIWSbwo=;
        b=G0Zz+Kn4X4N3QGv9FEegvBIwsBRt6Q3o7k6wrvlzxKo4Gx+GbVQNQCsPvtVRGrCL7u
         IYSbtwKUmpM0iIMvUc8dJoU/bYR+zuoU263R180zbwSZC4OA9MfguY4z0nhr8df/a0Dv
         V9QctXPfvMzl4B7/JHwLdsdQzJ0HoywVXmoJfW1WUCqgLZC2kQoHpgrChcdb8B+def7C
         d4ZM4P0sL09aO4wHuyuAiq8pF3sKJuKlUttBGHidt1UN7gnRKO/tJNuxhX9g6nGHe6sN
         9LXJdRc2K/knPOx/TWAWP0W1lzRuV09WcDJLIluPKETd8zsnOwXx32etZtfOXUVH9+cv
         WG2A==
X-Gm-Message-State: AOAM533q7b7BBgaV7ktcP/EqZaYkfQbIHVEIig1YDt6jg9qIL+AGr3Bv
        dDXrNTYzQ4NSt1HU+PpfdzAcyJ/FTtmJTCmOmJSvLpYB
X-Google-Smtp-Source: ABdhPJw/JlhhVSIe7cHaneumNKPnNO9Z0V7JtLRrMRm8Zs9gfi1SP7Njo3AuAMf1t+ndi8enEJzfxbmI5uZxEmLGJno=
X-Received: by 2002:a05:620a:1114:: with SMTP id o20mr26012870qkk.120.1593009393709;
 Wed, 24 Jun 2020 07:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-14-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-14-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 16:36:22 +0200
Message-ID: <CAMpxmJVf2NpRJN8cNuVxVpuy45xzH037JsT-wxRREM8YJ1mJpA@mail.gmail.com>
Subject: Re: [PATCH 13/22] gpio: uapi: define uAPI V2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Add a new version of the uAPI to address existing 32/64bit alignment
> issues, add support for debounce and event sequence numbers, and provide
> some future proofing by adding padding reserved for future use.
>
> The alignment issue relates to the gpioevent_data, which packs to differe=
nt
> sizes on 32bit and 64bit platforms. That creates problems for 32bit apps
> running on 64bit kernels.  The patch addresses that particular issue, and
> the problem more generally, by adding pad fields that explicitly pad
> structs out to 64bit boundaries, so they will pack to the same size now,
> and even if some of the reserved padding is used for __u64 fields in the
> future.
>
> The lack of future proofing in V1 makes it impossible to, for example,
> add the debounce feature that is included in v2.
> The future proofing is addressed by providing reserved padding in all
> structs for future features.  Specifically, the line request,
> config, info, info_changed and event structs receive updated versions,
> and the first three new ioctls.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> ---
>
> I haven't added any padding to gpiochip_info, as I haven't seen any calls
> for new features for the corresponding ioctl, but I'm open to updating th=
at
> as well.
>
> As the majority of the structs and ioctls were being replaced, it seemed
> opportune to rework some of the other aspects of the uAPI.
>
> Firstly, I've reworked the flags field throughout.  V1 has three differen=
t
> flags fields, each with their own separate bit definitions.  In V2 that i=
s
> collapsed to one.  Further, the bits of the V2 flags field are used
> as feature enable flags, with any other necessary configuration fields en=
coded
> separately.  This is simpler and clearer, while also providing a foundati=
on
> for adding features in the future.
>
> I've also merged the handle and event requests into a single request, the
> line request, as the two requests where mostly the same, other than the
> edge detection provided by event requests.  As a byproduct, the V2 uAPI
> allows for multiple lines producing edge events on the same line handle.
> This is a new capability as V1 only supports a single line in an event
> request.
>
> This means there are now only two types of file handle to be concerned wi=
th,
> the chip and the line, and it is clearer which ioctls apply to which type
> of handle.
>
> There is also some minor renaming of fields for consistency compared to t=
heir
> V1 counterparts, e.g. offset rather than lineoffset or line_offset, and
> consumer rather than consumer_label.
>
> Additionally, V1 GPIOHANDLES_MAX becomes GPIOLINES_MAX in V2 for clarity,
> and the gpiohandle_data __u8 array becomes a bitmap gpioline_values.
>
> The V2 uAPI is mostly just a reorganisation of V1, so userspace code,
> particularly libgpiod, should easily port to it.
>
> The padding sizes have been carried over from the RFC version, although t=
he
> seqnos added to the gpioline_event alone would've used the all of the pad=
ding
> for that struct, had they not been added here.  So I'm moderatly concerne=
d
> that those values are too small due to a lack of imagination on may part =
and
> should be increased to decrease the probability of running out of space i=
n
> the padding and requiring creative solutions or even a V3.
>
> Changes since the RFC:
>  - document the constraints on array sizes to maintain 32/64 alignment
>  - add sequence numbers to gpioline_event
>  - use bitmap for values instead of array of __u8
>  - gpioline_info_v2 contains gpioline_config instead of its composite fie=
lds
>  - provide constants for all array sizes, especially padding
>  - renamed "GPIOLINE_FLAG_V2_KERNEL" to "GPIOLINE_FLAG_V2_USED"
>  - renamed "default_values" to "values"
>  - made gpioline_direction zero based
>  - document clock used in gpioline_event timestamp
>  - add event_buffer_size to gpioline_request
>
>
>  include/uapi/linux/gpio.h | 237 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 230 insertions(+), 7 deletions(-)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 4e1139ab25bc..e4ed6f79e332 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -11,11 +11,14 @@
>  #ifndef _UAPI_GPIO_H_
>  #define _UAPI_GPIO_H_
>
> +#include <linux/kernel.h>
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>
>  /*
>   * The maximum size of name and label arrays.
> + *
> + * Must be a multiple of 8 to ensure 32/64bit alignment of structs.
>   */
>  #define GPIO_MAX_NAME_SIZE 32
>
> @@ -32,6 +35,211 @@ struct gpiochip_info {
>         __u32 lines;
>  };
>
> +/*
> + * Maximum number of requested lines.
> + *
> + * Must be a multiple of 8 to ensure 32/64bit alignment of structs.
> + */
> +#define GPIOLINES_MAX 64
> +
> +/* the number of __u64 required for a bitmap for GPIOLINES_MAX lines */
> +#define GPIOLINES_BITMAP_SIZE  __KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)
> +
> +enum gpioline_direction {
> +       GPIOLINE_DIRECTION_INPUT        =3D 0,
> +       GPIOLINE_DIRECTION_OUTPUT       =3D 1,
> +};
> +
> +enum gpioline_drive {
> +       GPIOLINE_DRIVE_PUSH_PULL        =3D 0,
> +       GPIOLINE_DRIVE_OPEN_DRAIN       =3D 1,
> +       GPIOLINE_DRIVE_OPEN_SOURCE      =3D 2,
> +};
> +
> +enum gpioline_bias {
> +       GPIOLINE_BIAS_DISABLED          =3D 0,
> +       GPIOLINE_BIAS_PULL_UP           =3D 1,
> +       GPIOLINE_BIAS_PULL_DOWN         =3D 2,
> +};
> +
> +enum gpioline_edge {
> +       GPIOLINE_EDGE_NONE              =3D 0,
> +       GPIOLINE_EDGE_RISING            =3D 1,
> +       GPIOLINE_EDGE_FALLING           =3D 2,
> +       GPIOLINE_EDGE_BOTH              =3D 3,
> +};

Nit: I'd just add a comment before these enums saying that values of 0
represent sensible default settings.

> +
> +/* Line flags - V2 */
> +#define GPIOLINE_FLAG_V2_USED          (1UL << 0) /* line is not availab=
le for request */
> +#define GPIOLINE_FLAG_V2_ACTIVE_LOW    (1UL << 1)
> +#define GPIOLINE_FLAG_V2_DIRECTION     (1UL << 2)
> +#define GPIOLINE_FLAG_V2_DRIVE         (1UL << 3)
> +#define GPIOLINE_FLAG_V2_BIAS          (1UL << 4)
> +#define GPIOLINE_FLAG_V2_EDGE_DETECTION        (1UL << 5)
> +#define GPIOLINE_FLAG_V2_DEBOUNCE      (1UL << 6)
> +
> +/*
> + * Struct padding sizes.
> + *
> + * These are sized to pad structs to 64bit boundaries.
> + * To maintain 32/64bit alignment, any arbitrary change must be even, as
> + * the pad elements are __u32.
> + */
> +#define GPIOLINE_CONFIG_PAD_SIZE               7
> +#define GPIOLINE_REQUEST_PAD_SIZE              5
> +#define GPIOLINE_INFO_V2_PAD_SIZE              5
> +#define GPIOLINE_INFO_CHANGED_V2_PAD_SIZE      5
> +#define GPIOLINE_EVENT_PAD_SIZE                        2
> +

Did someone request such definitions? IMO it's one of those rare
instances where I'd prefer to see magic numbers used in the structs.
I'm not sure if we need this indirection.

> +/**
> + * struct gpioline_values - Values of GPIO lines
> + * @bitmap: a bitmap containing the value of the lines, set to 1 for act=
ive
> + * and 0 for inactive.  Note that this is the logical value, which will =
be
> + * the opposite of the physical value if GPIOLINE_FLAG_V2_ACTIVE_LOW is
> + * set in flags.
> + */
> +struct gpioline_values {
> +       __u64 bitmap[GPIOLINES_BITMAP_SIZE];
> +};

Ok so now when embedding this structure we get something like
"config.values.bitmap". This looks fine with the exception that "bits"
would be even shorter and the information about this field being a
bitmap is not necessary. I hope this isn't too much bikeshedding. :)

> +
> +/**
> + * struct gpioline_config - Configuration for GPIO lines
> + * @values: if the direction is GPIOLINE_DIRECTION_OUTPUT, the values th=
at
> + * the lines will be set to.  This field is write-only and is zeroed whe=
n
> + * returned within struct gpioline_info.
> + * @flags: flags for the GPIO lines, such as GPIOLINE_FLAG_V2_ACTIVE_LOW=
,
> + * GPIOLINE_FLAG_V2_DIRECTION etc, OR:ed together
> + * @direction: if GPIOLINE_FLAG_V2_DIRECTION is set in flags, the desire=
d
> + * direction for the requested lines, with a value from enum
> + * gpioline_direction
> + * @drive: if GPIOLINE_FLAG_V2_DRIVE is set in flags, the desired drive =
for
> + * the requested lines, with a value from enum gpioline_drive
> + * @bias: if GPIOLINE_FLAG_V2_BIAS is set in flags, the desired bias for
> + * the requested lines, with a value from enum gpioline_bias
> + * @edge_detection: if GPIOLINE_FLAG_V2_EDGE_DETECTION is set in flags, =
the
> + * desired edge_detection for the requested lines, with a value from enu=
m
> + * gpioline_edge
> + * @debounce_period: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the
> + * desired debounce period for the requested lines, in microseconds
> + * @padding: reserved for future use and must be zero filled
> + */
> +struct gpioline_config {
> +       struct gpioline_values values;
> +       __u32 flags;
> +       /* Note that the following four fields are equivalent to a single=
 u32. */
> +       __u8 direction;
> +       __u8 drive;
> +       __u8 bias;
> +       __u8 edge_detection;

Limiting the size of these enum fields doesn't improve performance in
any measurable way. We already have 4 possible values for events. I'm
afraid that at some point in the future we'll add support for level
events or something else etc. and we'll run into a problem because we
only have 8 bits available. If there are no objections, I'd make it 32
bits wide.

For the same reason I was thinking that making flags 64 bits wouldn't
hurt either.

> +       __u32 debounce_period;
> +       __u32 padding[GPIOLINE_CONFIG_PAD_SIZE]; /* for future use */
> +};
> +
> +/**
> + * struct gpioline_request - Information about a request for GPIO lines
> + * @offsets: an array of desired lines, specified by offset index for th=
e
> + * associated GPIO device
> + * @consumer: a desired consumer label for the selected GPIO lines such =
as
> + * "my-bitbanged-relay"
> + * @config: requested configuration for the requested lines. Note that e=
ven
> + * if multiple lines are requested, the same configuration must be
> + * applicable to all of them. If you want lines with individual
> + * configuration, request them one by one. It is possible to select a ba=
tch
> + * of input or output lines, but they must all have the same configurati=
on,
> + * i.e. all inputs or all outputs, all active low etc
> + * @num_lines: number of lines requested in this request, i.e. the numbe=
r
> + * of valid fields in the GPIOLINES_MAX sized arrays, set to 1 to reques=
t a
> + * single line
> + * @event_buffer_size: a suggested minimum number of line events that th=
e
> + * kernel should buffer.  This is only relevant if edge_detection is
> + * enabled. Note that this is only a suggested value and the kernel may
> + * allocate a larger buffer or cap the size of the buffer. If this field=
 is
> + * zero then the buffer size defaults to a minimum of num_lines*16.
> + * @padding: reserved for future use and must be zero filled
> + * @fd: if successful this field will contain a valid anonymous file han=
dle
> + * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
> + * error
> + */
> +struct gpioline_request {
> +       __u32 offsets[GPIOLINES_MAX];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       struct gpioline_config config;
> +       __u32 num_lines;
> +       __u32 event_buffer_size;
> +       __u32 padding[GPIOLINE_REQUEST_PAD_SIZE]; /* for future use */
> +       __s32 fd;
> +};
> +
> +/**
> + * struct gpioline_info_v2 - Information about a certain GPIO line
> + * @name: the name of this GPIO line, such as the output pin of the line=
 on
> + * the chip, a rail or a pin header name on a board, as specified by the
> + * gpio chip, may be empty
> + * @consumer: a functional name for the consumer of this GPIO line as se=
t
> + * by whatever is using it, will be empty if there is no current user bu=
t
> + * may also be empty if the consumer doesn't set this up
> + * @config: the configuration of the line.  Note that the values field i=
s
> + * always zeroed - the line must be requested to read the values.
> + * @offset: the local offset on this GPIO device, fill this in when
> + * requesting the line information from the kernel
> + * @padding: reserved for future use
> + */
> +struct gpioline_info_v2 {
> +       char name[GPIO_MAX_NAME_SIZE];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       struct gpioline_config config;
> +       __u32 offset;
> +       __u32 padding[GPIOLINE_INFO_V2_PAD_SIZE]; /* for future use */
> +};
> +
> +/**
> + * struct gpioline_info_changed_v2 - Information about a change in statu=
s
> + * of a GPIO line
> + * @info: updated line information
> + * @timestamp: estimate of time of status change occurrence, in nanoseco=
nds
> + * and GPIOLINE_CHANGED_CONFIG
> + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELE=
ASED
> + * @padding: reserved for future use
> + */
> +struct gpioline_info_changed_v2 {
> +       struct gpioline_info_v2 info;
> +       __u64 timestamp;
> +       __u32 event_type;
> +       __u32 padding[GPIOLINE_INFO_CHANGED_V2_PAD_SIZE]; /* for future u=
se */
> +};
> +
> +enum gpioline_event_id {
> +       GPIOLINE_EVENT_RISING_EDGE      =3D 1,
> +       GPIOLINE_EVENT_FALLING_EDGE     =3D 2,
> +};
> +
> +/**
> + * struct gpioline_event - The actual event being pushed to userspace
> + * @timestamp: best estimate of time of event occurrence, in nanoseconds=
.
> + * The timestamp is read from CLOCK_MONOTONIC and is intended to allow t=
he
> + * accurate measurement of the time between events.  It does not provide
> + * the wall-clock time.
> + * @id: event identifier with value from enum gpioline_event_id
> + * @offset: the offset of the line that triggered the event
> + * @seqno: the sequence number for this event in the sequence of events =
for
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
> +       __u32 padding[GPIOLINE_EVENT_PAD_SIZE]; /* for future use */

Any reason for only having 64 bits of padding? 128 wouldn't change much, ri=
ght?

> +};
> +
> +/*
> + *  ABI V1
> + */
> +
>  /* Informational flags */
>  #define GPIOLINE_FLAG_KERNEL           (1UL << 0) /* Line used by the ke=
rnel */
>  #define GPIOLINE_FLAG_IS_OUT           (1UL << 1)
> @@ -149,8 +357,6 @@ struct gpiohandle_config {
>         __u32 padding[4]; /* padding for future use */
>  };
>
> -#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_=
config)
> -
>  /**
>   * struct gpiohandle_data - Information of values on a GPIO handle
>   * @values: when getting the state of lines this contains the current
> @@ -161,9 +367,6 @@ struct gpiohandle_data {
>         __u8 values[GPIOHANDLES_MAX];
>  };
>
> -#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpioha=
ndle_data)
> -#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpioha=
ndle_data)
> -
>  /* Eventrequest flags */
>  #define GPIOEVENT_REQUEST_RISING_EDGE  (1UL << 0)
>  #define GPIOEVENT_REQUEST_FALLING_EDGE (1UL << 1)
> @@ -207,11 +410,31 @@ struct gpioevent_data {
>         __u32 id;
>  };
>
> +/*
> + * V1 and V2 ioctl()s
> + */
>  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> +#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0C, __u32)
> +
> +/*
> + * V2 ioctl()s
> + */
> +#define GPIO_GET_LINEINFO_V2_IOCTL _IOWR(0xB4, 0x05, struct gpioline_inf=
o_v2)
> +#define GPIO_GET_LINEINFO_WATCH_V2_IOCTL _IOWR(0xB4, 0x06, struct gpioli=
ne_info_v2)
> +#define GPIO_GET_LINE_IOCTL _IOWR(0xB4, 0x07, struct gpioline_request)
> +#define GPIOLINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0D, struct gpioline_conf=
ig)
> +#define GPIOLINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x0E, struct gpioline_valu=
es)
> +#define GPIOLINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x0F, struct gpioline_valu=
es)
> +
> +/*
> + * V1 ioctl()s
> + */
>  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> -#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_=
info)
> -#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
>  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_re=
quest)
>  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_requ=
est)
> +#define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpioha=
ndle_data)
> +#define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpioha=
ndle_data)
> +#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0A, struct gpiohandle_=
config)
> +#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0B, struct gpioline_=
info)
>
>  #endif /* _UAPI_GPIO_H_ */
> --
> 2.27.0
>

Looks nice! Thanks again Kent!

Bart
