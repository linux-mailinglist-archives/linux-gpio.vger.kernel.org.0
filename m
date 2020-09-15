Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F231926A2B9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 12:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIOKG6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 06:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIOKG4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 06:06:56 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82489C06174A;
        Tue, 15 Sep 2020 03:06:55 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh1so1084333plb.12;
        Tue, 15 Sep 2020 03:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CIXcs/tmFpjsxswb7wCexcBN4qyTuCWbTtuiyQ7C9vk=;
        b=OiOxOM3IKYSvwoWV7uPMWGK8UZ6r6sHAgfp0qFKwgJYvgk2/9ZYS+OHoguDS0pAt4n
         bq4ogp319oOVxTe708IS9nQ0fU+fi+nrngI/I/gQWTbBfmcZSjR7ZgB57ukiF7qB7+0j
         AX51JBRA0QnFaW8pgoXqt2YrDH/FzkoPCP6u0RuZpxmQKaFtCegDs1MGaXaVXOHMGz+K
         OQ95TT67gWNb0KMXdXV0//tMi+IHcRhtOeILJQehOaIR8f3cYcGKAypSMM8ywu1L2ZkT
         jIfH9+yf+quL5Wo0PLTs0yU60Bzf929ILW+MvAeULbSb8EE1Rhye64btLAaMGnXhpBXk
         ZBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CIXcs/tmFpjsxswb7wCexcBN4qyTuCWbTtuiyQ7C9vk=;
        b=du0EdAsoYAwUvxpJr5ei5bw1f8Ol7zqcFOG6FNZNaERKZLCXucQyEAddt39cdmszYq
         1BvOGVJf2e6laYfimr6lE28lxPfj0gynkP8HlzjsotYH1q59jpLxxFzTS+zZDZmSOcUS
         WSPMfpeb3/WxphnZycWw3i4Bt4fQAGBzQ8YJK82v19ioA42VbOOklDpjqABmIJrWDNjh
         E+W89SBmF9nMP4m5sAzYHL+ZRnwNAccfmlANMbRDVlfzYHIfrop0tFtzIdm5JTxJg5Ii
         DoQwnz3/y+E4l5FHzyg91iNOpK830+cJN6bzJLayU9Lr/my1HMLeCBu+kleq8n6pZOBC
         SLsg==
X-Gm-Message-State: AOAM532+oX/8ib4pduqrWek0ftHOzbCk0sBO3H7LyES0c5zm5mdoGd3x
        RzhCOjNSWY87Kcs/a2l1Y68Z+YyDM8baaif9ySigj2BTqhjoQeRe
X-Google-Smtp-Source: ABdhPJxN0FqfO/w+iM89XL0UsGlbYycehob8qidvaMXQXF52OyxFs6uzEunIGPYqdKyEt6s/YKPMegHxtVFubKdbdgY=
X-Received: by 2002:a17:902:9e08:b029:d0:8a6a:d5e8 with SMTP id
 d8-20020a1709029e08b02900d08a6ad5e8mr18333261plq.0.1600164414754; Tue, 15 Sep
 2020 03:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com> <20200909102640.1657622-5-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-5-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 13:06:36 +0300
Message-ID: <CAHp75VdF1be-W3iV2JfWYZzEhrj13+5A+1Y4J8XgpBrkvg8cZQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/20] gpio: uapi: define uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:29 PM Kent Gibson <warthog618@gmail.com> wrote:
>

Thanks again for doing this and sorry for quite a delay from my side.
Below my comments regarding uAPI v2 (mostly nit-picks as I agree with
it in general).

> Add a new version of the uAPI to address existing 32/64-bit alignment
> issues, add support for debounce and event sequence numbers, allow
> requested lines with different configurations, and provide some future
> proofing by adding padding reserved for future use.
>
> The alignment issue relates to the gpioevent_data, which packs to differe=
nt
> sizes on 32-bit and 64-bit platforms. That creates problems for 32-bit ap=
ps
> running on 64-bit kernels.  uAPI v2 addresses that particular issue, and
> the problem more generally, by adding pad fields that explicitly pad
> structs out to 64-bit boundaries, so they will pack to the same size now,
> and even if some of the reserved padding is used for __u64 fields in the
> future.
>
> The new structs have been analysed with pahole to ensure that they
> are sized as expected and contain no implicit padding.
>
> The lack of future proofing in v1 makes it impossible to, for example,
> add the debounce feature that is included in v2.
> The future proofing is addressed by providing configurable attributes in
> line config and reserved padding in all structs for future features.
> Specifically, the line request, config, info, info_changed and event
> structs receive updated versions and new ioctls.
>
> As the majority of the structs and ioctls were being replaced, it is
> opportune to rework some of the other aspects of the uAPI:
>
> v1 has three different flags fields, each with their own separate
> bit definitions.  In v2 that is collapsed to one - gpio_v2_line_flag.
>
> The handle and event requests are merged into a single request, the line
> request, as the two requests were mostly the same other than the edge
> detection provided by event requests.  As a byproduct, the v2 uAPI allows
> for multiple lines producing edge events on the same line handle.
> This is a new capability as v1 only supports a single line in an event
> request.
>
> As a consequence, there are now only two types of file handle to be
> concerned with, the chip and the line, and it is clearer which ioctls
> apply to which type of handle.
>
> There is also some minor renaming of fields for consistency compared to
> their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> and consumer rather than consumer_label.
>
> Additionally, v1 GPIOHANDLES_MAX becomes GPIO_V2_LINES_MAX in v2 for
> clarity, and the gpiohandle_data __u8 array becomes a bitmap in
> gpio_v2_line_values.
>
> The v2 uAPI is mostly a reorganisation and extension of v1, so userspace
> code, particularly libgpiod, should readily port to it.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Changes for v7:
>  - use _BITULL for flag constants
>
> Changes for v4:
>  - clarify bitmap width in GPIO_V2_LINES_MAX description
>
> Changes for v3:
>  - relocated commentary into commit description
>  - hard limit max requested lines to 64 so bitmaps always fit in a single
>    u64.
>  - prefix all v2 symbols with GPIO_V2
>  - 64-bit flag values to ULL
>  - use __aligned_u64 to ensure 64-bit fields are 64-bit aligned
>  - support masked get values, as per set values.
>
> Changes for v2:
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
> Changes for v1 (since the RFC):
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
>  - rename debounce to debounce_period
>  - rename lines to num_lines
>
>  include/uapi/linux/gpio.h | 274 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 267 insertions(+), 7 deletions(-)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 285cc10355b2..87074886e73d 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -11,11 +11,14 @@
>  #ifndef _UAPI_GPIO_H_
>  #define _UAPI_GPIO_H_
>
> +#include <linux/const.h>
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>
>  /*
>   * The maximum size of name and label arrays.
> + *
> + * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
>   */
>  #define GPIO_MAX_NAME_SIZE 32
>
> @@ -32,6 +35,248 @@ struct gpiochip_info {
>         __u32 lines;
>  };
>
> +/*
> + * Maximum number of requested lines.
> + *
> + * Must be no greater than 64, as bitmaps are restricted here to 64-bits
> + * for simplicity, and a multiple of 2 to ensure 32/64-bit alignment of
> + * structs.
> + */
> +#define GPIO_V2_LINES_MAX 64
> +
> +/*
> + * The maximum number of configuration attributes associated with a line
> + * request.
> + */
> +#define GPIO_V2_LINE_NUM_ATTRS_MAX 10
> +
> +/**
> + * enum gpio_v2_line_flag - &struct gpio_v2_line_attribute.flags values
> + */
> +enum gpio_v2_line_flag {
> +       GPIO_V2_LINE_FLAG_USED                  =3D _BITULL(0), /* line n=
ot available for request */
> +       GPIO_V2_LINE_FLAG_ACTIVE_LOW            =3D _BITULL(1),
> +       GPIO_V2_LINE_FLAG_INPUT                 =3D _BITULL(2),
> +       GPIO_V2_LINE_FLAG_OUTPUT                =3D _BITULL(3),
> +       GPIO_V2_LINE_FLAG_EDGE_RISING           =3D _BITULL(4),
> +       GPIO_V2_LINE_FLAG_EDGE_FALLING          =3D _BITULL(5),
> +       GPIO_V2_LINE_FLAG_OPEN_DRAIN            =3D _BITULL(6),
> +       GPIO_V2_LINE_FLAG_OPEN_SOURCE           =3D _BITULL(7),
> +       GPIO_V2_LINE_FLAG_BIAS_PULL_UP          =3D _BITULL(8),
> +       GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN        =3D _BITULL(9),
> +       GPIO_V2_LINE_FLAG_BIAS_DISABLED         =3D _BITULL(10),
> +};
> +
> +/**
> + * struct gpio_v2_line_values - Values of GPIO lines
> + * @mask: a bitmap identifying the lines to get or set, with each bit
> + * number corresponding to the index into &struct
> + * gpio_v2_line_request.offsets.
> + * @bits: a bitmap containing the value of the lines, set to 1 for activ=
e
> + * and 0 for inactive.

>  Note that this is the logical value, which will be
> + * the opposite of the physical value if the line is configured as activ=
e
> + * low.

I'm not sure this is good to have here. To me it still sounds
confusing. Perhaps better to explain with examples in the
documentation rather than in this summary.
Note that field descriptions initially are for short summaries and
multi-line ones are not encouraged.

> + */
> +struct gpio_v2_line_values {
> +       __aligned_u64 mask;
> +       __aligned_u64 bits;
> +};
> +
> +/**
> + * enum gpio_v2_line_attr_id - &struct gpio_v2_line_attribute.id values

Perhaps per-item description (couple of words per each)?

> + */
> +enum gpio_v2_line_attr_id {
> +       GPIO_V2_LINE_ATTR_ID_FLAGS              =3D 1,
> +       GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES      =3D 2,
> +       GPIO_V2_LINE_ATTR_ID_DEBOUNCE           =3D 3,
> +};
> +
> +/**
> + * struct gpio_v2_line_attribute - a configurable attribute of a line
> + * @id: attribute identifier with value from &enum gpio_v2_line_attr_id
> + * @padding: reserved for future use and must be zero filled
> + * @flags: if id is GPIO_V2_LINE_ATTR_ID_FLAGS, the flags for the GPIO
> + * line, with values from enum gpio_v2_line_flag, such as
> + * GPIO_V2_LINE_FLAG_ACTIVE_LOW, GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed
> + * together.  This overrides the default flags contained in the &struct
> + * gpio_v2_line_config for the associated line.
> + * @values: if id is GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES, a bitmap
> + * containing the values to which the lines will be set, with each bit
> + * number corresponding to the index into &struct
> + * gpio_v2_line_request.offsets.

> + * @debounce_period: if id is GPIO_V2_LINE_ATTR_ID_DEBOUNCE, the desired
> + * debounce period, in microseconds

(1)

> + */
> +struct gpio_v2_line_attribute {
> +       __u32 id;
> +       __u32 padding;
> +       union {
> +               __aligned_u64 flags;
> +               __aligned_u64 values;


> +               __u32 debounce_period;

(2)

I would rather go with kernel general approach, i.e. units to be added
to the name

               __u32 debounce_period_us;

> +       };
> +};
> +
> +/**
> + * struct gpio_v2_line_config_attribute - a configuration attribute
> + * associated with one or more of the requested lines.
> + * @mask: a bitmap identifying the lines to which the attribute applies,
> + * with each bit number corresponding to the index into &struct
> + * gpio_v2_line_request.offsets.
> + * @attr: the configurable attribute
> + */
> +struct gpio_v2_line_config_attribute {

> +       __aligned_u64 mask;
> +       struct gpio_v2_line_attribute attr;

I would exchange their positions to follow the English natural phrase:
"The configuration attribute structure provides a line attribute
applied to the selected lines".

> +};
> +
> +/**
> + * struct gpio_v2_line_config - Configuration for GPIO lines
> + * @flags: flags for the GPIO lines, with values from

> enum
> + * gpio_v2_line_flag, such as GPIO_V2_LINE_FLAG_ACTIVE_LOW,

Hmm... Do we have a special symbol to refer to enumerators?

> + * GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed together.  This is the default fo=
r

I think "OR:ed together" is understandable for programmers but a bit
special for normal phrases. I would rephrase it somehow, but I'm not a
native speaker.
Something like "or any of their combinations".

> + * all requested lines but may be overridden for particular lines using
> + * attrs.
> + * @num_attrs: the number of attributes in attrs
> + * @padding: reserved for future use and must be zero filled

> + * @attrs: the configuration attributes associated with the requested
> + * lines.  Any attribute should only be associated with a particular lin=
e
> + * once.  If an attribute is associated with a line multiple times then =
the
> + * first occurrence (i.e. lowest index) has precedence.

This is a bit unexpected. I anticipated last come last served as in a
shell script argument list.

> + */
> +struct gpio_v2_line_config {
> +       __aligned_u64 flags;
> +       __u32 num_attrs;
> +       /*
> +        * Pad to fill implicit padding and provide space for future use.
> +        */

> +       __u32 padding[5];

This is still questionable. First of all why to waste so many bytes (I
propose 5 -> 1) and how will you do when the structure changes (we
still need some type of versioning or flags for which one u32 is more
than enough).

> +       struct gpio_v2_line_config_attribute attrs[GPIO_V2_LINE_NUM_ATTRS=
_MAX];
> +};
> +
> +/**
> + * struct gpio_v2_line_request - Information about a request for GPIO li=
nes
> + * @offsets: an array of desired lines, specified by offset index for th=
e
> + * associated GPIO device
> + * @consumer: a desired consumer label for the selected GPIO lines such =
as
> + * "my-bitbanged-relay"
> + * @config: requested configuration for the lines.

> + * @num_lines: number of lines requested in this request, i.e. the numbe=
r
> + * of valid fields in the GPIO_V2_LINES_MAX sized arrays, set to 1 to
> + * request a single line

I would rather call it "amount" or something which is one word, but
you may have a reason for the current, so I don't insist.
Also, I would describe what will be the expected behaviour outside of
the range (and what is the range?).
For example, would it mean that we consider all lines if num_lines >=3D
_LINES_MAX?

> + * @event_buffer_size: a suggested minimum number of line events that th=
e
> + * kernel should buffer.  This is only relevant if edge detection is
> + * enabled in the configuration. Note that this is only a suggested valu=
e
> + * and the kernel may allocate a larger buffer or cap the size of the
> + * buffer. If this field is zero then the buffer size defaults to a mini=
mum
> + * of num_lines*16.
> + * @padding: reserved for future use and must be zero filled
> + * @fd: if successful this field will contain a valid anonymous file han=
dle
> + * after a GPIO_GET_LINE_IOCTL operation, zero or negative value means
> + * error
> + */
> +struct gpio_v2_line_request {
> +       __u32 offsets[GPIO_V2_LINES_MAX];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       struct gpio_v2_line_config config;
> +       __u32 num_lines;
> +       __u32 event_buffer_size;
> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use=
.
> +        */

> +       __u32 padding[5];

Same comment about this as above.

> +       __s32 fd;
> +};
> +
> +/**
> + * struct gpio_v2_line_info - Information about a certain GPIO line
> + * @name: the name of this GPIO line, such as the output pin of the line=
 on
> + * the chip, a rail or a pin header name on a board, as specified by the
> + * gpio chip, may be empty

gpio -> GPIO ?

> + * @consumer: a functional name for the consumer of this GPIO line as se=
t
> + * by whatever is using it, will be empty if there is no current user bu=
t
> + * may also be empty if the consumer doesn't set this up

In both cases "empty" means what? All \0:s, only first \0, white spaces?

> + * @flags: flags for the GPIO line, such as GPIO_V2_LINE_FLAG_ACTIVE_LOW=
,

> + * GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed together

Same comment about "OR:ed..."

> + * @offset: the local offset on this GPIO device, fill this in when

GPIO chip, GPIO device =E2=80=94 what the difference?
If it's the same can we have some consistency?

> + * requesting the line information from the kernel
> + * @num_attrs: the number of attributes in attrs
> + * @attrs: the configuration attributes associated with the line.
> + * @padding: reserved for future use
> + */
> +struct gpio_v2_line_info {
> +       char name[GPIO_MAX_NAME_SIZE];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       __u32 offset;
> +       __u32 num_attrs;
> +       __aligned_u64 flags;
> +       struct gpio_v2_line_attribute attrs[GPIO_V2_LINE_NUM_ATTRS_MAX];

> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use=
.
> +        */

Can it be one line?
Moreover this padding has nothing to do with 64-bit since the above
already has taken care of.

> +       __u32 padding[4];

Again, can we reduce this 4 -> 2 (same comments about versioning). And
in previous structures you put padding before an array. Why is here a
different approach?

> +};
> +

> +enum gpio_v2_line_changed_type {

Kernel doc?

> +       GPIO_V2_LINE_CHANGED_REQUESTED  =3D 1,
> +       GPIO_V2_LINE_CHANGED_RELEASED   =3D 2,
> +       GPIO_V2_LINE_CHANGED_CONFIG     =3D 3,
> +};
> +
> +/**
> + * struct gpio_v2_line_info_changed - Information about a change in stat=
us
> + * of a GPIO line
> + * @info: updated line information
> + * @timestamp: estimate of time of status change occurrence, in nanoseco=
nds
> + * @event_type: the type of change with a value from enum
> + * gpio_v2_line_changed_type
> + * @padding: reserved for future use
> + */
> +struct gpio_v2_line_info_changed {
> +       struct gpio_v2_line_info info;

> +       __aligned_u64 timestamp;

timestamp -> timestamp_ns ?

> +       __u32 event_type;

> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use=
.
> +        */
> +       __u32 padding[5];

Same comments about above.

> +};
> +

> +enum gpio_v2_line_event_id {

Okay, this looks self-explanatory w/o doc.

> +       GPIO_V2_LINE_EVENT_RISING_EDGE  =3D 1,
> +       GPIO_V2_LINE_EVENT_FALLING_EDGE =3D 2,
> +};
> +
> +/**
> + * struct gpio_v2_line_event - The actual event being pushed to userspac=
e
> + * @timestamp: best estimate of time of event occurrence, in nanoseconds=
.
> + * The timestamp is read from CLOCK_MONOTONIC and is intended to allow t=
he
> + * accurate measurement of the time between events.  It does not provide
> + * the wall-clock time.
> + * @id: event identifier with value from enum gpio_v2_line_event_id
> + * @offset: the offset of the line that triggered the event
> + * @seqno: the sequence number for this event in the sequence of events =
for
> + * all the lines in this line request
> + * @line_seqno: the sequence number for this event in the sequence of
> + * events on this particular line
> + * @padding: reserved for future use
> + */
> +struct gpio_v2_line_event {

> +       __aligned_u64 timestamp;

_ns ?

> +       __u32 id;
> +       __u32 offset;
> +       __u32 seqno;
> +       __u32 line_seqno;

> +       /*
> +        * Pad struct to 64-bit boundary and provide space for future use=
.
> +        */
> +       __u32 padding[6];

No 64-bit relation, 6 -> 2 ?

> +};
> +
> +/*
> + *  ABI v1
> + */
> +
>  /* Informational flags */
>  #define GPIOLINE_FLAG_KERNEL           (1UL << 0) /* Line used by the ke=
rnel */
>  #define GPIOLINE_FLAG_IS_OUT           (1UL << 1)
> @@ -149,8 +394,6 @@ struct gpiohandle_config {
>         __u32 padding[4]; /* padding for future use */
>  };
>
> -#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_=
config)
> -
>  /**
>   * struct gpiohandle_data - Information of values on a GPIO handle
>   * @values: when getting the state of lines this contains the current
> @@ -161,9 +404,6 @@ struct gpiohandle_data {
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
> @@ -207,11 +447,31 @@ struct gpioevent_data {
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
> +#define GPIO_V2_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x05, struct gpio_v2_line=
_info)
> +#define GPIO_V2_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x06, struct gpio_v=
2_line_info)
> +#define GPIO_V2_GET_LINE_IOCTL _IOWR(0xB4, 0x07, struct gpio_v2_line_req=
uest)
> +#define GPIO_V2_LINE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0D, struct gpio_v2_l=
ine_config)
> +#define GPIO_V2_LINE_GET_VALUES_IOCTL _IOWR(0xB4, 0x0E, struct gpio_v2_l=
ine_values)
> +#define GPIO_V2_LINE_SET_VALUES_IOCTL _IOWR(0xB4, 0x0F, struct gpio_v2_l=
ine_values)
> +
> +/*
> + * v1 ioctl()s
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
> 2.28.0
>


--=20
With Best Regards,
Andy Shevchenko
