Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919782075C1
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389909AbgFXOdk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388652AbgFXOdj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:33:39 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78D5C061573;
        Wed, 24 Jun 2020 07:33:39 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 35so1144441ple.0;
        Wed, 24 Jun 2020 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VErVacHCP+qxbt+yCso2FO5hD9NPfSRNc29K4jab4d8=;
        b=LxCSwEsJfmnWrxL0xaaa4pGaVx087nKdbCztUhnlcfs/7iJRT8mEDyeJUrIxOFq1HJ
         Mfjup7cUO6VDDgyWTmEDBf/xJ3FUa4JdxnDyXrCB0gS2jllptxJ1mn0OwHaICl2x5jaJ
         HlN6rPzYymS6QE1wBEP3uWOPUeYlPqyimNmSvYgVVRniYtwMha93TLgW3jkRHGPsagbO
         13+XhMsftY8nBzNEKuRPQaNAHJIyYWYP9uG1P333/s9inUjJ3DW48XFwezcP+WHhNhfe
         vDrXCzCfPiNo/EAkKSV9lDue1Ya/xPJbPXGchOLDBTgAcsE2zwn/TNtSj1Z7dfsQ2kN0
         7BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VErVacHCP+qxbt+yCso2FO5hD9NPfSRNc29K4jab4d8=;
        b=MzDcgq5+LlcpV6d3f1pDSO6cn88Dy0T28R5FMIBYuA3nPmyYlrpZbV1jZSClMO7j1A
         dTL/V2God3t8rjW+mOjAudEbN+yF36KRp09I3pfHPD4MPe0e0ZGLJyXMlmpUYaUEjPGE
         ARCXO14DU+58Uy7B92xmAx5225WoiL1VZqWxUZK8OVhkLjz8Tt1LXhq6o0653Cemkt/x
         9uvU90y3u5g9ayw45yaUzM+yPPaMKIm0xlrKrjDz69Eo9tFlzGclRjvWf5RBgWZC5qDZ
         GapUHReXAsCIaQGraZkr/fzp2zTCzMClUgltelF2h1GkQDZR5TZxlZEQW0SnV1Ile8+s
         3BIw==
X-Gm-Message-State: AOAM532qIxaeyW64k7TG5L1zG97/CyOP45J8YzsVsAFsYnQf8Vvvg3ug
        8ZkjMv4QjgGyX+KNX3AlHc5JUzqnu1NNR1JeXZfQxyTD7ps=
X-Google-Smtp-Source: ABdhPJzx5pHobXlNGGXsN6/6qc81m/S8aPw8U2AnjgT9fUKocTQRx92S6SZLUrs7/peijGodLGpGuGnfIfduXQyb4EQ=
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr29576682pjq.228.1593009219246;
 Wed, 24 Jun 2020 07:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-14-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-14-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 17:33:26 +0300
Message-ID: <CAHp75VcEDnrQk5FeWTZdV3fMnTsLpnmy+hAnL4V3a0Ge0NEe2A@mail.gmail.com>
Subject: Re: [PATCH 13/22] gpio: uapi: define uAPI V2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 7:04 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a new version of the uAPI to address existing 32/64bit alignment

I think using - would be nice, like 32/64-bit (or at least space like
32/64 bit) as a common practice.

> issues, add support for debounce and event sequence numbers, and provide
> some future proofing by adding padding reserved for future use.
>
> The alignment issue relates to the gpioevent_data, which packs to different
> sizes on 32bit and 64bit platforms. That creates problems for 32bit apps
> running on 64bit kernels.

Dashes, please.

$ git grep -n -w '32 bit' | wc
  1904
$ git grep -n -w '64 bit' | wc
  1155

~3k

$ git grep -n -w '32bit' | wc
  1405
$ git grep -n -w '64bit' | wc
   870

~2.2k

$ git grep -n -w '64-bit' | wc
  3196
$ git grep -n -w '32-bit' | wc
  4369

~7.5k

> The patch addresses that particular issue, and
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

...

> Firstly, I've reworked the flags field throughout.  V1 has three different
> flags fields, each with their own separate bit definitions.  In V2 that is
> collapsed to one.  Further, the bits of the V2 flags field are used
> as feature enable flags, with any other necessary configuration fields encoded
> separately.  This is simpler and clearer, while also providing a foundation
> for adding features in the future.
>
> I've also merged the handle and event requests into a single request, the
> line request, as the two requests where mostly the same, other than the

where-> were ? (yes I noticed it's not a part of commit message)

> edge detection provided by event requests.  As a byproduct, the V2 uAPI
> allows for multiple lines producing edge events on the same line handle.
> This is a new capability as V1 only supports a single line in an event
> request.
>
> This means there are now only two types of file handle to be concerned with,
> the chip and the line, and it is clearer which ioctls apply to which type
> of handle.
>
> There is also some minor renaming of fields for consistency compared to their
> V1 counterparts, e.g. offset rather than lineoffset or line_offset, and
> consumer rather than consumer_label.
>
> Additionally, V1 GPIOHANDLES_MAX becomes GPIOLINES_MAX in V2 for clarity,
> and the gpiohandle_data __u8 array becomes a bitmap gpioline_values.
>
> The V2 uAPI is mostly just a reorganisation of V1, so userspace code,
> particularly libgpiod, should easily port to it.
>
> The padding sizes have been carried over from the RFC version, although the
> seqnos added to the gpioline_event alone would've used the all of the padding
> for that struct, had they not been added here.  So I'm moderatly concerned
> that those values are too small due to a lack of imagination on may part and
> should be increased to decrease the probability of running out of space in
> the padding and requiring creative solutions or even a V3.

...

> +#include <linux/kernel.h>

Perhaps keep it in order?

...

> + * Must be a multiple of 8 to ensure 32/64bit alignment of structs.

Dash. And same for all cases like this.

...

> +/* the number of __u64 required for a bitmap for GPIOLINES_MAX lines */

the -> The ?

> +#define GPIOLINES_BITMAP_SIZE  __KERNEL_DIV_ROUND_UP(GPIOLINES_MAX, 64)

Not sure we need this definition. The problem is that definitions in
the uAPI header are also part of uAPI. Here is just a calculus which
can be done manually since if anybody changes MAX, they will anyway
have to check if everything else is consistent. And yes, I'm not in
favour of including kernel.h here and there.

...

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

I'm not sure they (definitions) should be part of UAPI. Can't you
simple hard code numbers per case?

...

> +/**
> + * struct gpioline_config - Configuration for GPIO lines
> + */
> +struct gpioline_config {
> +       struct gpioline_values values;
> +       __u32 flags;
> +       /* Note that the following four fields are equivalent to a single u32. */
> +       __u8 direction;
> +       __u8 drive;
> +       __u8 bias;
> +       __u8 edge_detection;
> +       __u32 debounce_period;

> +       __u32 padding[GPIOLINE_CONFIG_PAD_SIZE]; /* for future use */

I would just put minimum here. If you need to extend you have to use
sizeof(struct) as a version of ABI.

> +};

I'm wondering how many lines (in average) the user usually changes at
once? One? Two?

Perhaps we need to be better with this, something like single line /
multiple lines?

So, having a struct for single line change being embedded multiple
times would allow to configure atomically several lines with different
requirements.
For example you can turn directions of the two lines for some kind of
half-duplex bit banging protocol.

I'm not sure about the rest, but to me it seems reasonable to have
single vs. multiple separation in some of the structures.

...

> +/*
> + *  ABI V1

V1 -> v1

And below V2 -> v2.

> + */

-- 
With Best Regards,
Andy Shevchenko
