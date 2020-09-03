Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D70D25BD6B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 10:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgICIiD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 04:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgICIh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 04:37:59 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43405C061244;
        Thu,  3 Sep 2020 01:37:57 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ls14so1124393pjb.3;
        Thu, 03 Sep 2020 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CnW3xjdqvYym8ybjUdu602OWF4Ej8k4Dv8bhPrl1pe8=;
        b=HxkzVaMorxDYSKEwQMqccGUvpw5q6Q+KoP/dnUD1uRlKWi0ba90OBTOzklSRZkXshc
         8q51CSULZM0om6cbMve3gn79E4vUvUPaZjoY9W00WBwSM64I8x1T/5KMnpRj18HgicGA
         TsRNOIAbwMmwDga8rBgE0FzN2s2TkTAHDdotU8bNATjJOBuFCnmsMFKNP0Qm6sga9tw7
         6evuxcWi5V/kfSrp9HavBiBX3OAUJ5DgZcT/jHKJjLZEI5TB9eOzhX8Xg+C0CcLE4ROx
         +dOdL9DIsDUBR2htycVFioI+GfHCwidMal/nMdVpIUsa+lXCJXbPWA2CEtTiAyS9BMMO
         Z3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CnW3xjdqvYym8ybjUdu602OWF4Ej8k4Dv8bhPrl1pe8=;
        b=Ke+cmGcFWdV0P15d26d6gOJcxOebIkrQwWlIc9BZMa/g+J3zqOa+qjfZXeleImC49Z
         cSGkk/ffjDAaXTWPdUOyG5gtbPa4p7Yc6FIdDZxPpuCv6Mp6n/UpgrozqthasTFzEMPG
         FIygyZfEaf18br40AeT8XSRLM7BQcmbbPIOsK1GvellYfObE9clOfFnxGhQxK+CqCB9F
         9JFv/p3AcH0dJhqCXBDO0vskNSaGhfCL8zF7iijPFQwc0koOYt63S4r2czEhkXkQtETj
         0b7xcXZk5rIQuQCjSvalr5T2jX33K/7MhuafLVeXKu73qJoMvBiCcKK0ZROf1gSlKnTr
         wkuw==
X-Gm-Message-State: AOAM533WZdc6rITW/0XbVKH4360p+2NVwu0WuJ798e+tzBfuHgTk7Y7G
        +qsjcr0L0iDxnkDpwR5p5Sc=
X-Google-Smtp-Source: ABdhPJzeCb2dVOInw/LE0MkDqm1WmUPlWLFs2YQn19Ci7VEMlfpfpKfolgt73QIaJxMZ+rwzoEb1JA==
X-Received: by 2002:a17:90b:1046:: with SMTP id gq6mr2225705pjb.231.1599122276001;
        Thu, 03 Sep 2020 01:37:56 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id g129sm2215648pfb.33.2020.09.03.01.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 01:37:55 -0700 (PDT)
Date:   Thu, 3 Sep 2020 16:37:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 00/20] gpio: cdev: add uAPI v2
Message-ID: <20200903083750.GA17445@sol>
References: <20200831032006.1019978-1-warthog618@gmail.com>
 <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJUETJgmxzWzHumOVr+vWFQ27P71MtcdSdf_=jvtrSfRPg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 03, 2020 at 10:02:04AM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 31, 2020 at 5:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > This patchset defines and implements a new version of the
> > GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> > support for debounce, event sequence numbers, and allow for requested
> > lines with different configurations.
> > It provides some future proofing by adding optional configuration fields
> > and padding reserved for future use.
> >
> > The series can be partitioned into three blocks; the first two patches
> > are minor fixes that impact later patches, the next eleven contain the
> > v2 uAPI definition and implementation, and the final seven port the GPIO
> > tools to the v2 uAPI and extend them to use new uAPI features.
> >
> > The more complicated patches include their own commentary where
> > appropriate.
> >
> > Cheers,
> > Kent.
> >
> > Changes for v6:
> >  - flags variable in linereq_create() should be u64 not unsigned long
> >    (patch 07)
> >  - remove restrictions on configuration changes - any change from one
> >    valid state to another valid state is allowed. (patches 09, 10, 12)
> >
> > Changes for v5:
> >
> > All changes for v5 fix issues with the gpiolib-cdev.c implementation,
> > in patches 07-12.
> > The uAPI is unchanged from v4, as is the port of the tools.
> >
> >  - use IS_ALIGNED in BUILD_BUG_ON checks (patch 07)
> >  - relocate BUILD_BUG_ON checks to gpiolib_cdev_register (patch 07)
> >  - s/requies/requires/ (patch 07)
> >  - use unsigned int for variables that are never negative
> >  - change lineinfo_get() parameter from cmd to bool watch (patch 08)
> >  - flagsv2 in gpio_v2_line_info_to_v1() should be u64, not int (patch 08)
> >  - change "_locked" suffixed function names to "_unlocked" (patch 10 and
> >    11)
> >  - be less eager breaking long lines
> >  - move commentary into checkin comment where appropriate - particularly
> >    patch 12
> >  - restructure the request/line split - rename struct line to
> >    struct linereq, and struct edge_detector to struct line, and relocate
> >    the desc field from linereq to line.  The linereq name was selected
> >    over line_request as function names such as linereq_set_values() are
> >    more clearly associated with requests than line_request_set_values(),
> >    particularly as there is also a struct line.  And linereq is as
> >    informative as linerequest, so I went with the shortened form.
> >
> > Changes for v4:
> >  - bitmap width clarification in gpiod.h (patch 04)
> >  - fix info offset initialisation bug (patch 08 and inserting patch 01)
> >  - replace strncpy with strscpy to remove compiler warnings
> >    (patch 08 and inserting patch 02)
> >  - fix mask handling in line_get_values (patch 07)
> >
> > Changes for v3:
> >  - disabling the character device from the build requires EXPERT
> >  - uAPI revisions (see patch 02)
> >  - replace padding_not_zeroed with calls to memchr_inv
> >  - don't use bitops on 64-bit flags as that doesn't work on BE-32
> >  - accept first attribute matching a line in gpio_v2_line_config.attrs
> >    rather than the last
> >  - rework lsgpio port to uAPI v2 as flags reverted to v1 like layout
> >    (since patch v2)
> >  - swapped patches 17 and 18 to apply debounce to multiple monitored
> >    lines
> >
> > Changes for v2:
> >  - split out cleanup patches into a separate series.
> >  - split implementation patch into a patch for each ioctl or major feature.
> >  - split tool port patch into a patch per tool.
> >  - rework uAPI to allow requested lines with different configurations.
> >
> > Kent Gibson (20):
> >   gpiolib: cdev: desc_to_lineinfo should set info offset
> >   gpiolib: cdev: replace strncpy with strscpy
> >   gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
> >   gpio: uapi: define uAPI v2
> >   gpiolib: make cdev a build option
> >   gpiolib: add build option for CDEV v1 ABI
> >   gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and
> >     GPIO_V2_LINE_GET_VALUES_IOCTL
> >   gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
> >     GPIO_V2_GET_LINEINFO_WATCH_IOCTL
> >   gpiolib: cdev: support edge detection for uAPI v2
> >   gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
> >   gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
> >   gpiolib: cdev: support setting debounce
> >   gpio: uapi: document uAPI v1 as deprecated
> >   tools: gpio: port lsgpio to v2 uAPI
> >   tools: gpio: port gpio-watch to v2 uAPI
> >   tools: gpio: rename nlines to num_lines
> >   tools: gpio: port gpio-hammer to v2 uAPI
> >   tools: gpio: port gpio-event-mon to v2 uAPI
> >   tools: gpio: add multi-line monitoring to gpio-event-mon
> >   tools: gpio: add debounce support to gpio-event-mon
> >
> >  drivers/gpio/Kconfig        |   29 +-
> >  drivers/gpio/Makefile       |    2 +-
> >  drivers/gpio/gpiolib-cdev.c | 1273 +++++++++++++++++++++++++++++++++--
> >  drivers/gpio/gpiolib-cdev.h |   15 +
> >  drivers/gpio/gpiolib.c      |    5 +
> >  drivers/gpio/gpiolib.h      |    6 +
> >  include/uapi/linux/gpio.h   |  316 ++++++++-
> >  tools/gpio/gpio-event-mon.c |  146 ++--
> >  tools/gpio/gpio-hammer.c    |   56 +-
> >  tools/gpio/gpio-utils.c     |  127 ++--
> >  tools/gpio/gpio-utils.h     |   50 +-
> >  tools/gpio/gpio-watch.c     |   16 +-
> >  tools/gpio/lsgpio.c         |   60 +-
> >  13 files changed, 1871 insertions(+), 230 deletions(-)
> >
> >
> > base-commit: feeaefd378cae2f6840f879d6123ef265f8aee79
> > --
> > 2.28.0
> >
> 
> To me it looks good, just a couple nits here and there and some questions.
> 
> I think it's worth deciding whether we want to keep the selftests in
> tools/testing/selftests/gpio/ and then maybe consider porting
> gpio-mockup-chardev.c to V2 or simply outsource it entirely to
> libgpiod.
> 

Ooops - I wasn't even aware they existed - though it had crossed my mind
that the kernel should have some selftests somewhere - I use the libgpiod
tests, from my libgpiod port, and my own Go based test suite for my testing,
as well as some smoke tests with the tools/gpio.

The libgpiod tests only cover v1 equivalent functionality, while my Go
tests cover the complete uAPI, and both v1 and v2.

It would be good for the kernel to at least have some smoke tests to
confirm basic functionality, even thorough testing is left to a
userspace library.  So the existing tests should be ported to v2, though
should also retain the v1 tests if v1 is still compiled in.

Cheers,
Kent.
