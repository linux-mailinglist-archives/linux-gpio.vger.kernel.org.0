Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDCB268B70
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 14:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgINMue (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 08:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgINMsd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 08:48:33 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D66C061788
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 05:47:59 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id e22so6921228edq.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OgGiEsLuSuiUe7mlIYYTMOaSRD7tRf9jAKMOWkJf9zs=;
        b=QFRPSGVQl7B+K/P2IZsQvAYmbAXW++iaHs8RsX8FifHoNzVt3vliZEMqSv3Pfsje0z
         hT+PZPy+mnzak0iEQzBnudiUlAAuaw4S/vdxGSbTErE2Py23lR2yE+gtgjE2oOjfgcKY
         VinxEusaZtclWKO2KNMMXkoZC+8cIlxLvQrHESJcDLNDzAr9VmWljDq+ARl6w6Bat4Ug
         CkULXJ2fYOw9EDT8sc/mZvxHj3aPeIkWeijRG8MvsJeDGflDMidBb0wEBko/bLbcEzK8
         V93heRhefUiy/8fBCPvOWy8bPjbsQKivmyGFHpTH5wkMGveB1vel91jKtI45KPKF5rqc
         ZrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OgGiEsLuSuiUe7mlIYYTMOaSRD7tRf9jAKMOWkJf9zs=;
        b=UEB6Uw/+PUJC66rjDCW4EoGNoRNLSJYxWAJbfGnuVh7wBtaSDX56NwQCPsk/XA+cMC
         oWjHS/yENi7r0WcVb7XwHBkJT9VgsgHtkS77fRXmCl5y8r4/Ol6tKb9QKntkLEBDNcbc
         QV6HwBl353M0BMb8x5Nhy7xx6kUFXElnV6US0X0uxWV9upp/wtWBqBO6aKw3k1oNc8hq
         yZSXJKA6OiFXoE9hZFKIQRYKdA54DgY1oXZmb1JoomWI8Xun5SovgY8jISIPF0D6jJHF
         alRFEifXJL0FPUQFTjOXVkm3rGQpij3idcfzmUtrt1Vu4WovMYrwfyoEMlmePlYrskhF
         +v5Q==
X-Gm-Message-State: AOAM531JHCAQF2F9/Oqa6NyAynI7XNhCiwiqJZBWEMcgqqHPKMo6ffzx
        HFxQ3pvXEttz1yqLuFgMxFgvy61p9hWur7fEkEQG0g==
X-Google-Smtp-Source: ABdhPJxIivdRt4uyXS9BgZTHKrXstL1j9lZiOyppCPUn8u7Gwy/aAA6UM6Ecd0klQSsnMBoyQYxvQTiLRTY6uRSHy+w=
X-Received: by 2002:a05:6402:17ec:: with SMTP id t12mr16394883edy.328.1600087677902;
 Mon, 14 Sep 2020 05:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Sep 2020 14:47:47 +0200
Message-ID: <CAMpxmJUfsYtc_+e_gCaJuA=68U1e7df5URHCGj+bdaTqtJiHdw@mail.gmail.com>
Subject: Re: [PATCH v8 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 12:27 PM Kent Gibson <warthog618@gmail.com> wrote:
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
>  drivers/gpio/gpiolib-cdev.c | 1278 +++++++++++++++++++++++++++++++++--
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
>  13 files changed, 1949 insertions(+), 205 deletions(-)
>
>
> base-commit: feeaefd378cae2f6840f879d6123ef265f8aee79
> --
> 2.28.0
>

Hi Arnd,

If you have a moment: could you take a look at this series -
especially the uAPI header (patch 4)? If you don't have it in your
inbox then let us know and we'll ask Kent to resend it with you in
copy.

Best regards,
Bartosz Golaszewski
