Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06219344745
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 15:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhCVOcp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 10:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhCVOch (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 10:32:37 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC105C061762
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:32:36 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x21so19611200eds.4
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chWlvvM+R8+Nda51a8aii3oOtn9NRHzXgHWY/tWJNes=;
        b=05P7zw0tsPCH0lkJ4IJWK6rQhq0iLu6STD9jyRTbwyhVhZmqY4InkSeFh37+emrYYw
         wr+8HIFPwHEyiFrnZO4OyYvntZCN+eM8GP07HOelEq4xNS4oPiZeML8W89f1n04NUVpL
         7Fl5hRXg6UwkyofR+jUZWed9M7WzxZVcAudOsL9B5YnDxY5qZDNYaA2ch1lxKFlhz7GT
         i/xarewa/2rMudBLAosj/p9RNJDtM2SNArMRxkAXy4+GPBOrMsWm9HqPiqhOQ0AfFM49
         l47SLVzefAIGGeKk5h/uFBLhZeHjdM9Jk/1qDi7SeoziApYdbNmYZKFTojxjrEl8PVJl
         9kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chWlvvM+R8+Nda51a8aii3oOtn9NRHzXgHWY/tWJNes=;
        b=Vd5QQF8rrKFGla+dH136ijqrUdHC6AcEiQxUjIyVaPbdA+RI68HJoDpf+0ntUrQgHz
         jbmJuWv2BD3cGhtnDyMZjWTLKykLzRKi9IekLLsbmqpdcE6JMhwax8OsZJHsAWdYI6F+
         jQ5L0NvYYzpcr2flUVEVNoEmFwypiF+pz8W7HK8zn38f31BSTtIlJ4wG5TMmQR2KbNRH
         /DNCByzJ2r4QPyd4YBqaF4NR0U4i2gSB4xhSRsatUEhQsQjh6Wk8RlY9/q1DNm4A9TyW
         uRhW05nVWngR5UpjlFbRzADAsfihNXPCNqZdvD0VPOuCEFa01omWP0YsBYluPu4ZGlaU
         pebg==
X-Gm-Message-State: AOAM531GPJtw++GAa9w/pMt8rk8AYlQCVchs18GF6v4nKSHv/qP+EzDv
        K9DHwKyhv5Q7wBDM3usIPpsLiOvkn0eMvbqfUrKYsA==
X-Google-Smtp-Source: ABdhPJw/qkhZqdtkjOclpC5fJbhhHCbMBE7GUaaaOreGNmjMwpYaceJ/cmgop4G0BQNlEFUtPoQIUhipTBCnhOKseCY=
X-Received: by 2002:a05:6402:4309:: with SMTP id m9mr27072328edc.25.1616423555361;
 Mon, 22 Mar 2021 07:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210315091400.13772-1-brgl@bgdev.pl>
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 22 Mar 2021 15:32:24 +0100
Message-ID: <CAMRc=MfQnofWQKz9tbnTA_1M8BkN37FcxbJpK4hs0RoRebWWkw@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] gpio: implement the configfs testing module
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 10:14 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series adds a new GPIO testing module based on configfs committable items
> and sysfs. The goal is to provide a testing driver that will be configurable
> at runtime (won't need module reload) and easily extensible. The control over
> the attributes is also much more fine-grained than in gpio-mockup.
>
> This series also contains a respin of the patches I sent separately to the
> configfs maintainers - these patches implement the concept of committable
> items that was well defined for a long time but never actually completed.
>
> Apart from the new driver itself, its selftests and the configfs patches, this
> series contains some changes to the bitmap API - most importantly: it adds
> devres managed variants of bitmap_alloc() and bitmap_zalloc().
>
> v1 -> v2:
> - add selftests for gpio-sim
> - add helper programs for selftests
> - update the configfs rename callback to work with the new API introduced in
>   v5.11
> - fix a missing quote in the documentation
> - use !! whenever using bits operation that are required to return 0 or 1
> - use provided bitmap API instead of reimplementing copy or fill operations
> - fix a deadlock in gpio_sim_direction_output()
> - add new read-only configfs attributes for mapping of configfs items to GPIO
>   device names
> - and address other minor issues pointed out in reviews of v1
>
> v2 -> v3:
> - use devm_bitmap_alloc() instead of the zalloc variant if we're initializing
>   the bitmap with 1s
> - drop the patch exporting device_is_bound()
> - don't return -ENODEV from dev_nam and chip_name configfs attributes, return
>   a string indicating that the device is not available yet ('n/a')
> - fix indentation where it makes sense
> - don't protect IDA functions which use their own locking and where it's not
>   needed
> - use kmemdup() instead of kzalloc() + memcpy()
> - collected review tags
> - minor coding style fixes
>
> v3 -> v4:
> - return 'none' instead of 'n/a' from dev_name and chip_name before the device
>   is registered
> - use sysfs_emit() instead of s*printf()
> - drop GPIO_SIM_MAX_PROP as it's only used in an array's definition where it's
>   fine to hardcode the value
>
> v4 -> v5:
> - export devm bitmap functions with EXPORT_SYMBOL_GPL() instead of a simple
>   EXPORT_SYMBOL()
>
> Bartosz Golaszewski (11):
>   configfs: increase the item name length
>   configfs: use (1UL << bit) for internal flags
>   configfs: implement committable items
>   samples: configfs: add a committable group
>   lib: bitmap: remove the 'extern' keyword from function declarations
>   lib: bitmap: order includes alphabetically
>   lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
>   gpio: sim: new testing module
>   selftests: gpio: provide a helper for reading chip info
>   selftests: gpio: add a helper for reading GPIO line names
>   selftests: gpio: add test cases for gpio-sim
>
>  Documentation/admin-guide/gpio/gpio-sim.rst   |  72 ++
>  Documentation/filesystems/configfs.rst        |   6 +-
>  drivers/gpio/Kconfig                          |   8 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-sim.c                       | 874 ++++++++++++++++++
>  fs/configfs/configfs_internal.h               |  22 +-
>  fs/configfs/dir.c                             | 245 ++++-
>  include/linux/bitmap.h                        | 127 +--
>  include/linux/configfs.h                      |   3 +-
>  lib/bitmap.c                                  |  42 +-
>  samples/configfs/configfs_sample.c            | 153 +++
>  tools/testing/selftests/gpio/.gitignore       |   2 +
>  tools/testing/selftests/gpio/Makefile         |   4 +-
>  tools/testing/selftests/gpio/config           |   1 +
>  tools/testing/selftests/gpio/gpio-chip-info.c |  57 ++
>  tools/testing/selftests/gpio/gpio-line-name.c |  55 ++
>  tools/testing/selftests/gpio/gpio-sim.sh      | 229 +++++
>  17 files changed, 1815 insertions(+), 86 deletions(-)
>  create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
>  create mode 100644 drivers/gpio/gpio-sim.c
>  create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
>  create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
>  create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh
>
> --
> 2.30.1
>

Hi Joel, Christoph,

FYI The configfs patches from this series have been on the mailing
list for months (long before the GPIO part) and have been re-sent
several times. You have neither acked or opposed these changes. I
don't want to delay the new testing driver anymore so I intend to
apply the entire series and take it upstream through the GPIO tree by
the end of this week.

Best Regards,
Bartosz Golaszewski
