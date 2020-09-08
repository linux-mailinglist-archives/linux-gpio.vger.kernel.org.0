Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD568261ACF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 20:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgIHSkl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 14:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731309AbgIHQID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 12:08:03 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15840C061573
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 09:08:02 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id i22so23340127eja.5
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b83ebFqRYcRhQMUoBny7VrK/w8/3rX5McYpuAfGB4mo=;
        b=uBKGiRCBAUcXiZe6KjvW8veA6mBHm5VFt7ivszqCnVZRismSNIYRjUVQ8pmaaGscMa
         3XihnP3ER4lw3sOMFpoGAON1afkzfS8TMZnyQqK9ECVsBMzt8k1zJf4N1jHSRyzVC6Ks
         YAxyWluRhsln1OUVRd3lSAZD30T/5fUvDJDLWlUkT9tPUZDaqNO2nVjXqUlVaIkxX93Y
         G0V4rz+bpnsHGitXCkGPfAkPIAeQeGSeTyZJQyTNvo9E0JFnnR1RFUXqenpKqvQQ7zIl
         mFQFbwjtfQBS4nq8qv6kTocYKdvci05IltOHy5zLYPUdrqgFkzZ8LRf674NZDgjRZgPZ
         1UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b83ebFqRYcRhQMUoBny7VrK/w8/3rX5McYpuAfGB4mo=;
        b=l1RUJRAYWuXMT8n4+vdlM4zBuPFElRM+zdZ97EvBEtxzziD7n8BsdSkjYSGlS9rQqD
         mPcRqmXQ2RNces/C0KfvAZqYI3CR6ym3uS5k/ZQuvaHWtETCTYPDSciDTmGl0t7m0z4U
         7oEmPVKe7nvQzyd2CkKqv/KUoQMqg3kzwEqS+tL39gRc16XRBIqeZTW2v0pkBKpAKh3u
         cyRlzDABLztlN/f6v3u1Ev11/AqFvvJiaF6+YwLHWkqh2rH68U1cSL4g7cUoX45TcaYY
         VAXXwM1dvK3x/DKZEEGUsB5pdX2blJZi43hYcZW4SfUY8vExhBBmgPu11OzTXWePKNnZ
         S5UQ==
X-Gm-Message-State: AOAM530W/xf7PD4rJ/EeYN+ttTgibt/HVZ3rW/a62gwQzwUoTWlFezuh
        tIQMEShqW0UlMm8+lDmeOvgG8Wj3FuiUtgXN+MPBFQ==
X-Google-Smtp-Source: ABdhPJy/RregNsYzCyTwu4urXWA7E91Gc3e0PzZIrHy1he7Etcg4uawBqFaT8rYNk1TVNoTj2V4kWLOklM1+MFMGjBA=
X-Received: by 2002:a17:906:7f15:: with SMTP id d21mr27487893ejr.470.1599581280525;
 Tue, 08 Sep 2020 09:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200905133549.24606-1-warthog618@gmail.com>
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 8 Sep 2020 18:07:49 +0200
Message-ID: <CAMpxmJUhTp=KHy_MU7feNDvM+A43u0o0Jjfc3SmSSBh98jjdyQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 5, 2020 at 3:36 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> This patchset defines and implements a new version of the
> GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> support for debounce, event sequence numbers, and allow for requested
> lines with different configurations.
> It provides some future proofing by adding optional configuration fields
> and padding reserved for future use.
>
> The series can be partitioned into three blocks; the first two patches
> are minor fixes that impact later patches, the next eleven contain the
> v2 uAPI definition and implementation, and the final seven port the GPIO
> tools to the v2 uAPI and extend them to use new uAPI features.
>
> The more complicated patches include their own commentary where
> appropriate.
>
> Cheers,
> Kent.
>
> Changes for v7:
>  - use _BITULL for ULL flag definitions (patch 04)
>  - add check on kmalloc_array return value in linereq_get_values()
>    (patch 07) and linereq_set_values_unlocked() (patch 11)
>  - restore v1 functions used by gpio-mockup selftests (patch 17)
>
> Changes for v6:
>  - flags variable in linereq_create() should be u64 not unsigned long
>    (patch 07)
>  - remove restrictions on configuration changes - any change from one
>    valid state to another valid state is allowed. (patches 09, 10, 12)
>
> Changes for v5:
>
> All changes for v5 fix issues with the gpiolib-cdev.c implementation,
> in patches 07-12.
> The uAPI is unchanged from v4, as is the port of the tools.
>
>  - use IS_ALIGNED in BUILD_BUG_ON checks (patch 07)
>  - relocate BUILD_BUG_ON checks to gpiolib_cdev_register (patch 07)
>  - s/requies/requires/ (patch 07)
>  - use unsigned int for variables that are never negative
>  - change lineinfo_get() parameter from cmd to bool watch (patch 08)
>  - flagsv2 in gpio_v2_line_info_to_v1() should be u64, not int (patch 08)
>  - change "_locked" suffixed function names to "_unlocked" (patch 10 and
>    11)
>  - be less eager breaking long lines
>  - move commentary into checkin comment where appropriate - particularly
>    patch 12
>  - restructure the request/line split - rename struct line to
>    struct linereq, and struct edge_detector to struct line, and relocate
>    the desc field from linereq to line.  The linereq name was selected
>    over line_request as function names such as linereq_set_values() are
>    more clearly associated with requests than line_request_set_values(),
>    particularly as there is also a struct line.  And linereq is as
>    informative as linerequest, so I went with the shortened form.
>
> Changes for v4:
>  - bitmap width clarification in gpiod.h (patch 04)
>  - fix info offset initialisation bug (patch 08 and inserting patch 01)
>  - replace strncpy with strscpy to remove compiler warnings
>    (patch 08 and inserting patch 02)
>  - fix mask handling in line_get_values (patch 07)
>
> Changes for v3:
>  - disabling the character device from the build requires EXPERT
>  - uAPI revisions (see patch 02)
>  - replace padding_not_zeroed with calls to memchr_inv
>  - don't use bitops on 64-bit flags as that doesn't work on BE-32
>  - accept first attribute matching a line in gpio_v2_line_config.attrs
>    rather than the last
>  - rework lsgpio port to uAPI v2 as flags reverted to v1 like layout
>    (since patch v2)
>  - swapped patches 17 and 18 to apply debounce to multiple monitored
>    lines
>
> Changes for v2:
>  - split out cleanup patches into a separate series.
>  - split implementation patch into a patch for each ioctl or major feature.
>  - split tool port patch into a patch per tool.
>  - rework uAPI to allow requested lines with different configurations.
>
> Kent Gibson (20):
>   gpiolib: cdev: desc_to_lineinfo should set info offset
>   gpiolib: cdev: replace strncpy with strscpy
>   gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
>   gpio: uapi: define uAPI v2
>   gpiolib: make cdev a build option
>   gpiolib: add build option for CDEV v1 ABI
>   gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and
>     GPIO_V2_LINE_GET_VALUES_IOCTL
>   gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
>     GPIO_V2_GET_LINEINFO_WATCH_IOCTL
>   gpiolib: cdev: support edge detection for uAPI v2
>   gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
>   gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
>   gpiolib: cdev: support setting debounce
>   gpio: uapi: document uAPI v1 as deprecated
>   tools: gpio: port lsgpio to v2 uAPI
>   tools: gpio: port gpio-watch to v2 uAPI
>   tools: gpio: rename nlines to num_lines
>   tools: gpio: port gpio-hammer to v2 uAPI
>   tools: gpio: port gpio-event-mon to v2 uAPI
>   tools: gpio: add multi-line monitoring to gpio-event-mon
>   tools: gpio: add debounce support to gpio-event-mon
>
>  drivers/gpio/Kconfig        |   29 +-
>  drivers/gpio/Makefile       |    2 +-
>  drivers/gpio/gpiolib-cdev.c | 1277 +++++++++++++++++++++++++++++++++--
>  drivers/gpio/gpiolib-cdev.h |   15 +
>  drivers/gpio/gpiolib.c      |    5 +
>  drivers/gpio/gpiolib.h      |    6 +
>  include/uapi/linux/gpio.h   |  317 ++++++++-
>  tools/gpio/gpio-event-mon.c |  146 ++--
>  tools/gpio/gpio-hammer.c    |   56 +-
>  tools/gpio/gpio-utils.c     |  176 ++++-
>  tools/gpio/gpio-utils.h     |   48 +-
>  tools/gpio/gpio-watch.c     |   16 +-
>  tools/gpio/lsgpio.c         |   60 +-
>  13 files changed, 1948 insertions(+), 205 deletions(-)
>
>
> base-commit: feeaefd378cae2f6840f879d6123ef265f8aee79
> --
> 2.28.0
>

To me this looks good enough to queue for v5.10. I think you'll need
to resend the selftests patches and get an ack from selftests
maintainer. Once that's done we can get this series into next.

Bart
