Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E862223C4F4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 07:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgHEFTB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 01:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgHEFTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 01:19:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2DEC06174A;
        Tue,  4 Aug 2020 22:19:00 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i92so2604476pje.0;
        Tue, 04 Aug 2020 22:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u4n6NcRQqafhhVkuqOu116GPQKiA9klBEyV1e5vUts4=;
        b=MIqgi7jf0p5CnAFRyTb//TfWwiFjYOVHNoPrmXjoIBhNty3fzZXzE60zF0KG5BUtTi
         P5gqKC0KOZNRQKLyHcI7dku9b4AovFafM+EYAVGOhqyANplFz2cWWuUGB+9jTbmmSgrq
         5BumTWYC27GPl5Jbyn+aiVDXMBIFqH3DlgD4e2zzbMI7bWiCqw9iqzSSG3CVKMxNU+Yy
         wSyWDiTWqUMqhUkVzVZIhOdXqmsNWA+uBpLpPaYL6XKbRxDbFFuQm8JJP0DolIROKp+e
         O18VustKGbw7LYXbdHenD5TFzgp3mIHZCUJBYEMyaJKNBG6tYrGvgpb81iBmhJGCg5r1
         DmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u4n6NcRQqafhhVkuqOu116GPQKiA9klBEyV1e5vUts4=;
        b=aMGEEKBUKu9UPrejFBTxO+LdwxwpS1IoH4enVhkNPgGnsdahDZ4UhbXXpAqgkVByrm
         AHhWjO7A2fxJlTI5zDIw543NNngK28B4mDZ7zuZlw1vN/xYQ7hSFXJIl6Ga31y4h5bKl
         hDUW5kVpc59GTY/cU782ebrTEcr9JO8ooyuZ7MTh17RptfPax0pK0vsClluQnynH1Eqq
         bPI/I+iDPUPu8q573pXLzb//3dyYWC4oV48n8l6/bVCsNINJWwBL+tbvu4xbxpf9eW4o
         1l9TSvEToZ35bSgqamAQ50WvC67zyFO/bhsoqyPtaN4/EmjqVkuGlreYQlJEMZz0i6ej
         95Ww==
X-Gm-Message-State: AOAM530IcPbZkwgxYcIelD0NnBm4cGkXxHWZkpL9CNHQB+iOEr7DL96m
        ojwm4OB+xYCHuycZnk6cm0g=
X-Google-Smtp-Source: ABdhPJx7hW1Qdwej/OWSDvak2Vp1cNbJrXS8ceiawTTWbqiTFn0WSBYwpm6pIDNkmuNUSiNzv1AFzQ==
X-Received: by 2002:a17:90b:3597:: with SMTP id mm23mr1506944pjb.3.1596604739404;
        Tue, 04 Aug 2020 22:18:59 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id a17sm1338257pgi.26.2020.08.04.22.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 22:18:58 -0700 (PDT)
Date:   Wed, 5 Aug 2020 13:18:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/18] gpio: uapi: define uAPI v2
Message-ID: <20200805051853.GA122005@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-3-warthog618@gmail.com>
 <CAMpxmJXocdDTvC7_76UwZ9FONn86p0MjZtorRKTR5bxN7PJy6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXocdDTvC7_76UwZ9FONn86p0MjZtorRKTR5bxN7PJy6g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 04, 2020 at 07:42:34PM +0200, Bartosz Golaszewski wrote:
> On Sat, Jul 25, 2020 at 6:20 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add a new version of the uAPI to address existing 32/64-bit alignment
> > issues, add support for debounce and event sequence numbers, and provide
> > some future proofing by adding padding reserved for future use.
> >
> > The alignment issue relates to the gpioevent_data, which packs to different
> > sizes on 32-bit and 64-bit platforms. That creates problems for 32-bit apps
> > running on 64-bit kernels.  The patch addresses that particular issue, and
> > the problem more generally, by adding pad fields that explicitly pad
> > structs out to 64-bit boundaries, so they will pack to the same size now,
> > and even if some of the reserved padding is used for __u64 fields in the
> > future.
> >
> > The lack of future proofing in v1 makes it impossible to, for example,
> > add the debounce feature that is included in v2.
> > The future proofing is addressed by providing reserved padding in all
> > structs for future features.  Specifically, the line request,
> > config, info, info_changed and event structs receive updated versions,
> > and the first three new ioctls.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> 
> Hi Kent,
> 
> Thanks a lot for your work on this. Please see comments below.
> 
> One thing I'd change globally for better readability is to have all
> new symbols marked as v2 - even if they have no counterparts in v1. I
> know libgpiod will wrap it all anyway but I think it's still a good
> way to make our work in user-space easier.
> 

Fair enough.  Oh joy.

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
> > collapsed to one.
> >
> > I've also merged the handle and event requests into a single request, the
> > line request, as the two requests were mostly the same, other than the
> > edge detection provided by event requests.  As a byproduct, the v2 uAPI
> > allows for multiple lines producing edge events on the same line handle.
> > This is a new capability as v1 only supports a single line in an event
> > request.
> >
> > This means there are now only two types of file handle to be concerned with,
> > the chip and the line, and it is clearer which ioctls apply to which type
> > of handle.
> >
> > There is also some minor renaming of fields for consistency compared to
> > their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> > and consumer rather than consumer_label.
> >
> > Additionally, v1 GPIOHANDLES_MAX becomes GPIOLINES_MAX in v2 for clarity,
> > and the gpiohandle_data __u8 array becomes a bitmap gpioline_values.
> >
> > The v2 uAPI is mostly just a reorganisation of v1, so userspace code,
> > particularly libgpiod, should easily port to it.
> >
> 
> I think the info above is worth putting into the commit message.
> Especially the part about merging the two event types.
> 

OK, but I'll rework it a bit to make it more suitable for a commit
message.

> > Changes since v1:
> >  - lower case V1 and V2, except in capitalized names
> >  - hyphenate 32/64-bit
> >  - rename bitmap field to bits
> >  - drop PAD_SIZE consts in favour of hard coded numbers
> >  - sort includes
> >  - change config flags to __u64
> >  - increase padding of gpioline_event
> >  - relocate GPIOLINE_CHANGED enum into v2 section (is common with v1)
> >  - rework config to collapse direction, drive, bias and edge enums back
> >    into flags and add optional attributes that can be associated with a
> >    subset of the requested lines.
> >
> > Changes since the RFC:
> >  - document the constraints on array sizes to maintain 32/64 alignment
> >  - add sequence numbers to gpioline_event
> >  - use bitmap for values instead of array of __u8
> >  - gpioline_info_v2 contains gpioline_config instead of its composite fields
> >  - provide constants for all array sizes, especially padding
> >  - renamed "GPIOLINE_FLAG_V2_KERNEL" to "GPIOLINE_FLAG_V2_USED"
> >  - renamed "default_values" to "values"
> >  - made gpioline_direction zero based
> >  - document clock used in gpioline_event timestamp
> >  - add event_buffer_size to gpioline_request
> >  - rename debounce to debounce_period
> >  - rename lines to num_lines
> >
> >  include/uapi/linux/gpio.h | 284 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 270 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > index 285cc10355b2..3f6db33014f0 100644
> > --- a/include/uapi/linux/gpio.h
> > +++ b/include/uapi/linux/gpio.h
> > @@ -12,10 +12,13 @@
> >  #define _UAPI_GPIO_H_
> >
> >  #include <linux/ioctl.h>
> > +#include <linux/kernel.h>
> >  #include <linux/types.h>
> >
> >  /*
> >   * The maximum size of name and label arrays.
> > + *
> > + * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
> >   */
> >  #define GPIO_MAX_NAME_SIZE 32
> >
> > @@ -32,6 +35,251 @@ struct gpiochip_info {
> >         __u32 lines;
> >  };
> >
> > +/*
> > + * Maximum number of requested lines.
> > + *
> > + * Must be a multiple of 8 to ensure 32/64-bit alignment of structs.
> > + */
> > +#define GPIOLINES_MAX 64
> > +
> > +/* The number of __u64 required for a bitmap for GPIOLINES_MAX lines */
> > +#define GPIOLINES_BITMAP_SIZE  __KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)
> > +
> 
> In what circumstances can this be different than 1? It's worth
> documenting here I suppose.
> 

In terms of the API definition, GPIOLINES_MAX can be anything you want
and the definitions are still valid.  In practice in the mainline kernel
it would always be 1 for ABI compatibility.

Chiselling GPIOLINES_MAX <= 64 into stone could simplify things a bit,
as all the bitmaps reduce to a single __u64.  Would you prefer that?

> > +/*
> > + * The maximum number of configuration attributes associated with a line
> > + * request.
> > + */
> > +#define GPIOLINE_NUM_ATTRS_MAX 10
> > +
> 
> How did you choose this number? I mean: it's reasonable - just asking
> for clarification.
> 

I didn't want to constrain the possible configurations by making it too
small, particularly allowing for future attributes, but wanted to keep the
request size down so it can still comfortably fit on the stack.
The gpioline_request stands at 592 bytes, which is already substantially
larger than the 364 bytes of the v1 request, and each additional config
attribute slot adds another 24 bytes.

So 10 seemed like a happy medium.

> > +/**
> > + * enum gpioline_flag_v2 - &struct gpioline_attribute.flags values
> > + */
> > +enum gpioline_flag_v2 {
> > +       GPIOLINE_FLAG_V2_USED                   = 1UL << 0, /* line is not available for request */
> > +       GPIOLINE_FLAG_V2_ACTIVE_LOW             = 1UL << 1,
> > +       GPIOLINE_FLAG_V2_INPUT                  = 1UL << 2,
> > +       GPIOLINE_FLAG_V2_OUTPUT                 = 1UL << 3,
> > +       GPIOLINE_FLAG_V2_EDGE_RISING            = 1UL << 4,
> > +       GPIOLINE_FLAG_V2_EDGE_FALLING           = 1UL << 5,
> > +       GPIOLINE_FLAG_V2_OPEN_DRAIN             = 1UL << 6,
> > +       GPIOLINE_FLAG_V2_OPEN_SOURCE            = 1UL << 7,
> > +       GPIOLINE_FLAG_V2_BIAS_PULL_UP           = 1UL << 8,
> > +       GPIOLINE_FLAG_V2_BIAS_PULL_DOWN         = 1UL << 9,
> > +       GPIOLINE_FLAG_V2_BIAS_DISABLED          = 1UL << 10,
> > +};
> > +
> > +/**
> > + * struct gpioline_values - Values of GPIO lines
> > + * @bits: a bitmap containing the value of the lines, set to 1 for active
> > + * and 0 for inactive.  Note that this is the logical value, which will be
> > + * the opposite of the physical value if the line is configured as active
> > + * low.
> > + */
> > +struct gpioline_values {
> > +       __u64 bits[GPIOLINES_BITMAP_SIZE];
> > +};
> > +
> 
> We can set values only for a subset of requested lines but AFAICT we
> can't read values of only a subset of lines. Would it be difficult to
> remove this limitation? While reading values always succeeds - even if
> the line is in input mode and has edge detected - I think that someone
> may want to request the max number of lines without reading all their
> values each time. Maybe consider merging this with struct
> gpioline_set_values?
> 

That is correct.

I considered that corner case to be unlikely, as a major point of
requesting lines together is to be able to perform collective operations
on them as atomically as possible.  If you only want subsets then
request them as separate subsets.

Do you have a case in mind where you would have overlapping subsets?

Not difficult to remove the limitation - I just didn't see sufficient
benefit. 

> > +/**
> > + * struct gpioline_set_values - Values to set a group of GPIO lines
> > + * @mask: a bitmap identifying the lines to set.
> > + * @bits: a bitmap containing the value of the lines, set to 1 for active
> > + * and 0 for inactive.  Note that this is the logical value, which will be
> > + * the opposite of the physical value if the line is configured as active
> > + * low.
> > + */
> > +struct gpioline_set_values {
> > +       __u64 mask[GPIOLINES_BITMAP_SIZE];
> > +       __u64 bits[GPIOLINES_BITMAP_SIZE];
> > +};
> > +
> > +/**
> > + * enum gpioline_attr_id - &struct gpioline_attribute.id values
> > + */
> > +enum gpioline_attr_id {
> > +       GPIOLINE_ATTR_ID_FLAGS                  = 1,
> > +       GPIOLINE_ATTR_ID_OUTPUT_VALUES          = 2,
> > +       GPIOLINE_ATTR_ID_DEBOUNCE               = 3,
> > +};
> > +
> > +/**
> > + * struct gpioline_attribute - a configurable attribute of a line
> > + * @id: attribute identifier with value from &enum gpioline_attr_id
> > + * @padding: reserved for future use and must be zero filled
> > + * @flags: if id is GPIOLINE_ATTR_ID_FLAGS, the flags for the GPIO line,
> > + * with values from enum gpioline_flag_v2, such as
> > + * GPIOLINE_FLAG_V2_ACTIVE_LOW, GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed
> > + * together.  This overrides the default flags contained in the &struct
> > + * gpioline_config for the associated line.
> > + * @values: if id is GPIOLINE_ATTR_ID_OUTPUT_VALUES, the values to which
> > + * the lines will be set
> > + * @debounce_period: if id is GPIOLINE_ATTR_ID_DEBOUNCE, the desired
> > + * debounce period, in microseconds
> > + */
> > +struct gpioline_attribute {
> > +       __u32 id;
> > +       __u32 padding;
> > +       union {
> > +               __u64 flags;
> > +               struct gpioline_values values;
> > +               __u32 debounce_period;
> > +       };
> > +};
> 
> I'm afraid that if we don't have enough padding here (at the end),
> we'll end up wanting to add a new attribute at some point whose
> argument won't fit. Maybe have a specific field in the union that's
> even larger than __u64?
> 

I'm satisfied with the 64-bit value restriction.

I don't want to go adding another 8 bytes of pad per attribute on the
off chance that we ever find such an attribute, and that we couldn't
find some other solution like using the __u32 padding, or user the
gpioline_config padding, or split it over two attributes....

> > +
> > +/**
> > + * struct gpioline_config_attribute - a configuration attribute associated
> > + * with one or more of the requested lines.
> > + * @mask: a bitmap identifying the lines to which the attribute applies
> > + * @attr: the configurable attribute
> > + */
> > +struct gpioline_config_attribute {
> > +       __u64 mask[GPIOLINES_BITMAP_SIZE];
> > +       struct gpioline_attribute attr;
> > +};
> > +
> > +/**
> > + * struct gpioline_config - Configuration for GPIO lines
> > + * @flags: flags for the GPIO lines, with values from enum
> > + * gpioline_flag_v2, such as GPIOLINE_FLAG_V2_ACTIVE_LOW,
> > + * GPIOLINE_FLAG_V2_OUTPUT etc, OR:ed together.  This is the default for
> > + * all requested lines but may be overridden for particular lines using
> > + * attrs.
> 
> So I'm having a hard time with this. I understand that the thinking
> behind it was: use the flags field to set all lines to INPUT by
> default and only set certain lines to OUTPUT with attrs. This would
> make life easier for user-space but it complicates the kernel code and
> I also believe that any such simplification should be handled by
> user-space libraries, not be exposed by kernel uAPI. My personal
> preference would be to drop the flags field and only handle attributes
> (maybe even define a special macro to set all bits in mask -
> GPIOLINE_CONFIG_ALL_LINES or something) on a first-in-wins basis. I'm
> open to other suggestions though.
> 

I think I've addressed this elsewhere, and still think it is worthwhile
and very low cost.  I thought it was an easy win when I added it, and
still do.

Happy to change the attrs to first-in-wins though - the validation of
the attrs is still my biggest bugbear with this version.

Cheers,
Kent.
