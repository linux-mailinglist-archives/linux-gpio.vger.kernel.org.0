Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EAD1EE4AC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 14:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgFDMn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 08:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgFDMnV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 08:43:21 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FEAFC08C5C1
        for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2020 05:43:20 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id s1so5745053qkf.9
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2020 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AAk4apw0tPkpx+v42w8OxrwItXcj6jJnR/oP+5jlPEo=;
        b=dnkopTmgMhziXOlRGGOw+IrcSBzXoNLVw3dMgoS3pEDafR7B6C2v7vvcPfndTbmSLx
         pzMBJCAxbOyIx87FxGVnY9LL6lAnyQa6l29LsVCQMgOMDoI+2qhk75G5DDZXZMorx7GJ
         mRXtEihTsiojPM9rZpmZTHSMkPZWoAoZ/00Silx6MnuDXNAklzHI9fUprYvbWYwzSb12
         3vjvAdKrQwI7c7E9P6rFNYWXE+cPROhNKRcHYnarBfAGBOQcyqm9gRU+LsYuLjxpeO9C
         6LJEK8cTJjoVpiAL8G2nOLVgoeOFDTk0C2xEmDy1D764xnZxZS/0qw9xEGuhADYEe7Dt
         roWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AAk4apw0tPkpx+v42w8OxrwItXcj6jJnR/oP+5jlPEo=;
        b=JUjHuRgc8l4BnU4nr4RZSh2uIB8576xC9/bQIGlJdtwOJsWUyF+hhRq6fCXIHKngyW
         IEZ5Cke+jlvQ7kj1aL92k4WZ7zlso0HjKL6Oc8f7GfwfCe0wa91fpu/WVrolqGrxLWzX
         VFe313/V9Ujx5n9hLlYia3+fS9BL7xxo98lB7CoQgrtrCTiJf0IG8sywDkt2OIKHMGus
         P89KMLv7HTucppZ4Nd1BJSPxnbj6bFHhkHbQPCz+cRTpXfuU4z/xxWSQDakC+yml4XW4
         ZtN6DwjgOwpQSLVXbuONDwTHLyAikHbDK//vw7rj+IFCUrvV53zAsq3cQW7qtQ1fTvj2
         +d+g==
X-Gm-Message-State: AOAM533dMbvIp4oCuIuIcJAnmSME+jmHJbfR54m+sQ2IefON7ApmsvoV
        +E1LZIhhi6SIu4H5QPEsimp1/5/cYCNkbdrEqaWaEg==
X-Google-Smtp-Source: ABdhPJzP4ul/j9n//MCcyYjMQgizKb4I6M9itO5F/T4etTotiMHO/vX+d15z0UhKzyoQoBKrkbrtZfk47kbC0dF2YtE=
X-Received: by 2002:a37:dd6:: with SMTP id 205mr4273510qkn.323.1591274599280;
 Thu, 04 Jun 2020 05:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200516064507.19058-1-warthog618@gmail.com>
In-Reply-To: <20200516064507.19058-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 4 Jun 2020 14:43:08 +0200
Message-ID: <CAMpxmJUbC4qmUGM0Z-6hXsYPRSpEpNM7iXgc7XbMcf_epi0Lig@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
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

sob., 16 maj 2020 o 08:45 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Add a new version of the uAPI to address existing 32/64bit alignment
> issues, add support for debounce, and provide some future proofing by
> adding padding reserved for future use.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

I'm a bit late to the party but here's my review.

>
>  include/uapi/linux/gpio.h | 204 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 197 insertions(+), 7 deletions(-)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 0206383c0383..3db7e0bc1312 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -14,6 +14,9 @@
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>
> +/* The maximum size of name and label arrays */
> +#define GPIO_MAX_NAME_SIZE 32
> +
>  /**
>   * struct gpiochip_info - Information about a certain GPIO chip
>   * @name: the Linux kernel name of this GPIO chip
> @@ -27,6 +30,184 @@ struct gpiochip_info {
>         __u32 lines;
>  };
>
> +/* Maximum number of requested lines */
> +#define GPIOLINES_MAX 64
> +
> +enum gpioline_direction {
> +       GPIOLINE_DIRECTION_INPUT        =3D 1,
> +       GPIOLINE_DIRECTION_OUTPUT       =3D 2,
> +};
> +
> +enum gpioline_drive {
> +       GPIOLINE_DRIVE_PUSH_PULL        =3D 0,
> +       GPIOLINE_DRIVE_OPEN_DRAIN       =3D 1,
> +       GPIOLINE_DRIVE_OPEN_SOURCE      =3D 2,
> +};
> +
> +enum gpioline_bias {
> +       GPIOLINE_BIAS_DISABLE           =3D 0,
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

I would skip the names of the enum types if we're not reusing them anywhere=
.

> +
> +/* Line flags - V2 */
> +#define GPIOLINE_FLAG_V2_KERNEL                (1UL << 0) /* Line used b=
y the kernel */

In v1 this flag is also set if the line is used by user-space. Maybe a
simple GPIOLINE_FLAG_V2_USED would be better?

> +#define GPIOLINE_FLAG_V2_ACTIVE_LOW    (1UL << 1)
> +#define GPIOLINE_FLAG_V2_DIRECTION     (1UL << 2)
> +#define GPIOLINE_FLAG_V2_DRIVE         (1UL << 3)
> +#define GPIOLINE_FLAG_V2_BIAS          (1UL << 4)
> +#define GPIOLINE_FLAG_V2_EDGE_DETECTION        (1UL << 5)
> +#define GPIOLINE_FLAG_V2_DEBOUNCE      (1UL << 6)
> +
> +/**
> + * struct gpioline_config - Configuration for GPIO lines
> + * @default_values: if the direction is GPIOLINE_DIRECTION_OUTPUT, this
> + * specifies the default output value, should be 0 (low) or 1 (high),
> + * anything else than 0 or 1 will be interpreted as 1 (high)
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
> + * @debounce: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the desired
> + * debounce period for the requested lines, in microseconds
> + * @padding: reserved for future use and should be zero filled
> + */
> +struct gpioline_config {
> +       __u8 default_values[GPIOLINES_MAX];

As I said elsewhere - bitfield is fine here for me: for instance a single u=
64.

> +       __u32 flags;
> +       __u8 direction;
> +       __u8 drive;
> +       __u8 bias;
> +       __u8 edge_detection;
> +       __u32 debounce;

Maybe debounce_time for clarity?

> +       __u32 padding[7]; /* for future use */
> +};
> +
> +/**
> + * struct gpioline_request - Information about a request for GPIO lines
> + * @offsets: an array of desired lines, specified by offset index for th=
e
> + * associated GPIO device
> + * @consumer: a desired consumer label for the selected GPIO lines such
> + * as "my-bitbanged-relay"
> + * @config: Requested configuration for the requested lines. Note that
> + * even if multiple lines are requested, the same configuration must be
> + * applicable to all of them. If you want lines with individual
> + * configuration, request them one by one. It is possible to select a
> + * batch of input or output lines, but they must all have the same
> + * configuration, i.e. all inputs or all outputs, all active low etc
> + * @lines: number of lines requested in this request, i.e. the number of
> + * valid fields in the GPIOLINES_MAX sized arrays, set to 1 to request a
> + * single line
> + * @padding: reserved for future use and should be zero filled
> + * @fd: if successful this field will contain a valid anonymous file han=
dle
> + * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
> + * error
> + */
> +struct gpioline_request {
> +       __u32 offsets[GPIOLINES_MAX];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       struct gpioline_config config;
> +       __u32 lines;

Maybe num_lines would be clearer?

> +       __u32 padding[4]; /* for future use */
> +       __s32 fd;
> +};
> +
> +/**
> + * struct gpioline_values - Values of GPIO lines
> + * @values: when getting the state of lines this contains the current
> + * state of a line, when setting the state of lines these should contain
> + * the desired target state
> + */
> +struct gpioline_values {
> +       __u8 values[GPIOLINES_MAX];

Same here for bitfield. And maybe reuse this structure in
gpioline_config for default values?

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
> + * @offset: the local offset on this GPIO device, fill this in when
> + * requesting the line information from the kernel
> + * @flags: various flags for this line
> + * @direction: if GPIOLINE_FLAG_V2_DIRECTION is set in flags, the direct=
ion
> + * of the line, with a value from enum gpioline_direction
> + * @drive: if GPIOLINE_FLAG_V2_DRIVE is set in flags, the drive for the
> + * line, with a value from enum gpioline_drive
> + * @bias: if GPIOLINE_FLAG_V2_BIAS is set in flags, the bias for the lin=
e,
> + * with a value from enum gpioline_bias
> + * @edge_detection: if GPIOLINE_FLAG_V2_EDGE_DETECTION is set in flags, =
the
> + * edge_detection for the line, with a value from enum gpioline_edge
> + * @debounce: if GPIOLINE_FLAG_V2_DEBOUNCE is set in flags, the debounce
> + * period for the line, in microseconds
> + * @padding: reserved for future use
> + */
> +struct gpioline_info_v2 {
> +       char name[GPIO_MAX_NAME_SIZE];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       __u32 offset;
> +       __u32 flags;
> +       __u8 direction;
> +       __u8 drive;
> +       __u8 bias;
> +       __u8 edge_detection;
> +       __u32 debounce;
> +       __u32 padding[12]; /* for future use */
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
> +       __u32 padding[5]; /* for future use */
> +};
> +
> +enum gpioline_event_id {
> +       GPIOLINE_EVENT_RISING_EDGE      =3D 1,
> +       GPIOLINE_EVENT_FALLING_EDGE     =3D 2,
> +};
> +
> +/**
> + * struct gpioline_event - The actual event being pushed to userspace
> + * @timestamp: best estimate of time of event occurrence, in nanoseconds
> + * @id: event identifier with value from enum gpioline_event_id
> + * @offset: the offset of the line that triggered the event
> + * @padding: reserved for future use
> + */
> +struct gpioline_event {
> +       __u64 timestamp;

I'd specify in the comment the type of clock used for the timestamp.

> +       __u32 id;
> +       __u32 offset;
> +       __u32 padding[2]; /* for future use */
> +};
> +
>  /* Informational flags */
>  #define GPIOLINE_FLAG_KERNEL           (1UL << 0) /* Line used by the ke=
rnel */
>  #define GPIOLINE_FLAG_IS_OUT           (1UL << 1)
> @@ -144,8 +325,6 @@ struct gpiohandle_config {
>         __u32 padding[4]; /* padding for future use */
>  };
>
> -#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_=
config)
> -
>  /**
>   * struct gpiohandle_data - Information of values on a GPIO handle
>   * @values: when getting the state of lines this contains the current
> @@ -156,9 +335,6 @@ struct gpiohandle_data {
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
> @@ -202,11 +378,25 @@ struct gpioevent_data {
>         __u32 id;
>  };
>
> +/* V1 and V2 */
>  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> +#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0C, __u32)
> +
> +/* V1 */
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
> +
> +/* V2 */
> +#define GPIO_GET_LINEINFO_V2_IOCTL _IOWR(0xB4, 0x0D, struct gpioline_inf=
o_v2)
> +#define GPIO_GET_LINEINFO_WATCH_V2_IOCTL _IOWR(0xB4, 0x0E, struct gpioli=
ne_info_v2)
> +#define GPIO_GET_LINE_IOCTL _IOWR(0xB4, 0x0F, struct gpioline_request)
> +#define GPIOLINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x10, struct gpioline_conf=
ig)
> +#define GPIOLINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x11, struct gpioline_valu=
es)
> +#define GPIOLINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x12, struct gpioline_valu=
es)
>
>  #endif /* _UAPI_GPIO_H_ */
> --
> 2.26.2
>

Bartosz
