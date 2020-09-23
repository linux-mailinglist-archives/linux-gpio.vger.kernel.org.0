Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E071B27550A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 12:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgIWKEZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 06:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWKEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 06:04:24 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A8FC0613CE;
        Wed, 23 Sep 2020 03:04:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d19so6592896pld.0;
        Wed, 23 Sep 2020 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FkYqYStFxJ6DfYL7hPfSU7rflihsJBrQX0AyZVatfFk=;
        b=l1n9DduT2uuNOi3NnJ/np3LCh2KISCWfsVqK4YeE4xvHgleGz7Icp94jp0BBFlY+0P
         nmrFMLrFU1eiT5xR+gHH9E7tcPQ8GiKF+j/qcFIhHn83p7nexC0ojDZmAVQD9YeVOsgU
         vpr6bKHM8xPOqZCKO42GJgu6afnuHhrxV9oz71i9CGPyWRyoop9SyVw04JpNQUCK9l/W
         R2m/xwkrlc0nQqU9J7KOKmWHgK0jPe5PZjXa++muK1uUBZtxdcLLGsx7NuyL4jTVdImW
         /swZxkvrnBugHbbe7A4LAOYwHi+H/BtFtqvUZwHsAfpQjMDbqMVMlxJXrrhZcWKjthpx
         9Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkYqYStFxJ6DfYL7hPfSU7rflihsJBrQX0AyZVatfFk=;
        b=ABvI7lo2VUWlJDDdF+H1YpGWRWEdBoMWJSwv3alxazmuJZa7yD3sTg/STirfJn+cXp
         /c61IgAunpmb0NotXVwcgbYjGTCTe4ExhP/eaIj1gwTNY5oLCjr92flIMMVpIcolvE1O
         4WYT2VA++7ZrC0R30H4wIr9LJ4Wu1Pj4qPuHLfsyEa6NIPletDzNB4gOAhwN0WJKo8Ii
         /r7hzr98GrN0mYyBCu+/k6Q8pIfQf77vC/rWSM7enSDcaSHALuxUBGlnx5Iq0jXmWpt+
         C0lnbGIJ1By2jOLtWY7A8OLh9qCJeCSEE28s4hvP7MZjqO5+ebolE8GtrU6iv0KD7NvS
         3J4Q==
X-Gm-Message-State: AOAM532T+JY+m0PMCSvUxkmMJe/vxb/frXwb5cRiNxCPD/P2Rcyxk5J8
        xZT6qhkJoSbQTDu4uvM7IaOwbA2F/KIuXZMTvdc=
X-Google-Smtp-Source: ABdhPJzzMGQiuxp/3TSZv7QWahdtf/4iY8MfvuRnGTeHcbjylmnREeYP8v4JNMcluPmchu4UFhYExVaVsC1buXKjL+E=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr7840420pjr.228.1600855463097;
 Wed, 23 Sep 2020 03:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-5-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-5-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 13:04:05 +0300
Message-ID: <CAHp75VewJYDQ1Moi4jw=wbBMLNpaUGPgz+AsPjNdZqtHCgkjwA@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] gpio: uapi: define uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 5:34 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a new version of the uAPI to address existing 32/64-bit alignment
> issues, add support for debounce and event sequence numbers, allow
> requested lines with different configurations, and provide some future
> proofing by adding padding reserved for future use.
>
> The alignment issue relates to the gpioevent_data, which packs to different
> sizes on 32-bit and 64-bit platforms. That creates problems for 32-bit apps
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

...

> +struct gpio_v2_line_config {
> +       __aligned_u64 flags;
> +       __u32 num_attrs;

> +       /* Pad to fill implicit padding and reserve space for future use. */
> +       __u32 padding[5];

Probably I somehow missed the answer, but why do we need 5 here and not 1?

> +       struct gpio_v2_line_config_attribute attrs[GPIO_V2_LINE_NUM_ATTRS_MAX];
> +};

...

> +struct gpio_v2_line_request {
> +       __u32 offsets[GPIO_V2_LINES_MAX];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       struct gpio_v2_line_config config;
> +       __u32 num_lines;
> +       __u32 event_buffer_size;

> +       /* Pad to fill implicit padding and reserve space for future use. */
> +       __u32 padding[5];

Ditto.

> +       __s32 fd;
> +};

...

> +struct gpio_v2_line_info {
> +       char name[GPIO_MAX_NAME_SIZE];
> +       char consumer[GPIO_MAX_NAME_SIZE];
> +       __u32 offset;
> +       __u32 num_attrs;
> +       __aligned_u64 flags;
> +       struct gpio_v2_line_attribute attrs[GPIO_V2_LINE_NUM_ATTRS_MAX];

> +       /* Space reserved for future use. */
> +       __u32 padding[4];

Here two comments as in previous patches, why this went after
attribute structures and why 2 is not enough?

> +};

...

> +struct gpio_v2_line_info_changed {
> +       struct gpio_v2_line_info info;
> +       __aligned_u64 timestamp_ns;
> +       __u32 event_type;
> +       /* Pad struct to 64-bit boundary and reserve space for future use. */
> +       __u32 padding[5];

Again, why 5 and not 1?

> +};

...

> +struct gpio_v2_line_event {
> +       __aligned_u64 timestamp_ns;
> +       __u32 id;
> +       __u32 offset;
> +       __u32 seqno;
> +       __u32 line_seqno;

> +       /* Space reserved for future use. */
> +       __u32 padding[6];

Why 6 and not 2?

And here actually sizeof() can be a version.
So, I still see possible versioning issues with ABI.

> +};

-- 
With Best Regards,
Andy Shevchenko
