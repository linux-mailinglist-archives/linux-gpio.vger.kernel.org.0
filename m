Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF00275D86
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 18:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgIWQft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 12:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWQft (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 12:35:49 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A132C0613CE;
        Wed, 23 Sep 2020 09:35:49 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w7so9237pfi.4;
        Wed, 23 Sep 2020 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ip6DvJIjl2i89FPqUm/voP5asTdO63DJlg18ZnkNaF0=;
        b=siM7JTAANJE1p6PWke51xN1+n7CnZkw3pPZY+3AxB8BLX1v1egaxKhXsL9K0KOTHpx
         P5BaPCS2z8zX6X9UW9xi09G3pNcvvPJTTmXd/uXQ3O96g8IS7HSIrdf9uqv5BJNaA7I8
         oTUMh+s3woGIdE2t9l567NCmgd0/Q3G2sJG9cXsCzq52Cyt88Xcvcqk+qwOXIDhKQoyj
         149w6z4f38PD+hSe/e+0d61Jsa+P6jzPgZLplRHwfSML0+FxbhV6rJ9icQN1HXkvbPT9
         Kdtk27KCPxyU561mZlPGbOly+qodcnJrKUBHGn5U3rtxMPGQufbpwKmt9gqU4JhLB8PF
         Z7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ip6DvJIjl2i89FPqUm/voP5asTdO63DJlg18ZnkNaF0=;
        b=DvHf28x7IszW81dT10bZA/vhVPogIPRVjXmU433jzRaS79l7jCQkF9owgAviU4OIUR
         hsxrmtRlpzx8Bgaompsye4UxeODO5cJs823BIR3+LcyUch1eD7Rm4t6TrW4eL5MhPTpO
         scm+D34zIc4+GibCrFNdc7TaD0pwWqD5VX0WY2tGa+2nELQz4TgA74U2bfgE7AKCkV4L
         TJ/y9kaLI/thAF2mJpuLQe93PemhkUUmUwqQjZhnWE5ju0+1MOgPd71QpGK95BCwf4RD
         soo7gtzVqM3r73TXJlKWnOVouibpWborhWM/6BHlAeV12XY3SolKpTz0VDyyurA02+D3
         mH1g==
X-Gm-Message-State: AOAM531uPN8ctPmCTcDoe7E856620ttecrbQMcO40DN+rYceczaQgPAf
        QSY95LkAyZM+VJKDaY8vfSXJ4wRsoYTH0DAiW+I=
X-Google-Smtp-Source: ABdhPJxp9tnp6bsDC+rJkStQ3w6zYB45UnML3g3O2xwZDvhh3AswHTGBMTFZiBAm9l/CQ6CanLQK5xDYCMOcWERV4Nk=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr515353pgj.74.1600878948664;
 Wed, 23 Sep 2020 09:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 19:35:30 +0300
Message-ID: <CAHp75VeXbTkSTVgrqmeL_taEHPDBMo-rekA767Y+YT1_7RYjdg@mail.gmail.com>
Subject: Re: [PATCH v9 00/20] gpio: cdev: add uAPI v2
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

For tools (there are minor comments, which not prevent to have a tag):
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

For the rest I gave some comments but most of them are simply to
address. The uAPI definition I agree with after Arnd's comment. I
don't see big impediments to having this for v5.10.

Thanks!

> Cheers,
> Kent.
>
> Changes for v9:
>  - references to function names should include braces (patch 02)
>  - add time scale suffixes to timestamp (_ns) and debounce period (_us)
>    variables (patch 04 and later)
>  - address multiple review comments (patch 04)
>  - drop mention of future API removal (patch 06)
>  - use static_assert() rather than BUILD_BUG_ON() (patch 07)
>  - change event buffer overflow behaviour to discard old events rather
>    than recent events (patch 09)
>  - add spaces around '*' in '*16' (patch 09)
>  - reword comments regarding field access and locking (patch 09 and 12)
>
> Changes for v8:
>  - fix BUILD_BUG_ON conditions and relocate them before the return in
>    gpiolib_cdev_register() (patch 07)
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
>
> Kent Gibson (20):
>   gpiolib: cdev: gpio_desc_to_lineinfo() should set info offset
>   gpiolib: cdev: replace strncpy() with strscpy()
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
>  drivers/gpio/gpiolib-cdev.c | 1531 +++++++++++++++++++++++++++++++----
>  drivers/gpio/gpiolib-cdev.h |   15 +
>  drivers/gpio/gpiolib.c      |    5 +
>  drivers/gpio/gpiolib.h      |    6 +
>  include/uapi/linux/gpio.h   |  334 +++++++-
>  tools/gpio/gpio-event-mon.c |  146 ++--
>  tools/gpio/gpio-hammer.c    |   56 +-
>  tools/gpio/gpio-utils.c     |  176 +++-
>  tools/gpio/gpio-utils.h     |   48 +-
>  tools/gpio/gpio-watch.c     |   16 +-
>  tools/gpio/lsgpio.c         |   60 +-
>  13 files changed, 2098 insertions(+), 326 deletions(-)
>
>
> base-commit: 36eccdb58fb55d2bea6a0e62932e4d7e5192d409
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
