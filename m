Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F1E42F4F5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 16:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhJOOQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 10:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234863AbhJOOQX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 10:16:23 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E40C061762
        for <linux-gpio@vger.kernel.org>; Fri, 15 Oct 2021 07:14:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id d9so38430167edh.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Oct 2021 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rJxeYYnbN1BqAbq3eridm9U4CkbE9dBcGehVd60yHQ=;
        b=xZnTHuAuPumh9gY513gOjcoEIBojcfbXPYblG9DBqCyu9w+7SrCdmuB7gEnT7Z2/d4
         Dy00cnuQiOFiDnHDjDNkT/GAIVeUpSmQD0m54oMGRqXy5Jctgg5GVA7aiBkmWAhHZ5ao
         mmZrlilcGq1V7vWDmvcuWZXD6Ud1+TP3WpVrdLJKXkT05p/WFnz3NJfjVcBUXZmmfIHV
         S146osdHREWEWMw2xDl536hot0PN53Dd8+d0PBSnDAS5MyG9RN0uxY7RO/KqnNg/izm0
         acovJz6ifR5SZBbU/WTJp1Q6ImMhYcwnQOgD5111c1pZp426p6Ms8IJutNaYI18Tpa8Z
         SdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rJxeYYnbN1BqAbq3eridm9U4CkbE9dBcGehVd60yHQ=;
        b=SPZcn1TsR4QrpvuodEBtscUeLrYuMjX4hTSKnMDjlKtvVjYBJPt4+6897il/ri3gYK
         p0wGp1ugDi24tvCg7ZvNEW8PwqOJke/t/hALyGv0D3nH6Gve2tw5XITTJL0D5H9KZuEO
         A1jMDtKbS0BPbU3FukyvMzjrN3mK11DH2iOD74qCJJ1v2eRHz/4po+eVzziqNLwUpkpq
         0eRJ/hJRTkdm/geYS3dpbMi8P3uRytST9KOlcISRpMvO90qU0sy4E3keNKDdXDs/hd4a
         BXfF3GUzReoMuytvoYnXJK8jvC3W87L7ACkeh+H/e5m5QtessXM1q44PaJER8T0Amt6d
         FHHA==
X-Gm-Message-State: AOAM533AmoDwba4d1eoe2xlsxpPX7KWF8NXKjCcLYHbMM0Iv/qgpstzI
        nEGCf0jy2gviOiswt/42jQSkHx34hxrELtzlId8uRg==
X-Google-Smtp-Source: ABdhPJwyWhnDU7znLM6TsqQtys/OEF0zuKOS5DiBTSLCAfhLJHeCMdHnVxEZpmIrWGNBSmwyG8eCzKwO2UyHGqwnW8k=
X-Received: by 2002:a50:d50c:: with SMTP id u12mr18241839edi.118.1634307227070;
 Fri, 15 Oct 2021 07:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211008081739.26807-1-brgl@bgdev.pl>
In-Reply-To: <20211008081739.26807-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 15 Oct 2021 16:13:36 +0200
Message-ID: <CAMRc=McpCw2TgLFCzvwOupd+RW2BoQRJKVTdbR6s2z+O2pJuUQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] gpio: implement the configfs testing module
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 8, 2021 at 10:17 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> I'm respinning this series now because I noticed that I need to start writing
> tests for my work on the new libgpiod v2 code to make sense (it's just becoming
> too complicated to make even remotely functional without test coverage). At the
> same time I don't want to rewrite the tests using gpio-mockup if the goal is to
> replace it with gpio-sim anyway.
>
> I fixed issues pointed out by Al Viro and made sure that references are
> correctly counted (including error paths) and that memory allocated for the
> pending and live groups gets freed.
>
> ===
>
> Cc'ing Viresh too.
>
> Viresh: while there's still a long way to go before the libgpio v2.0 release,
> in order to merge the Rust bindings, we'll need a test-suite similar to what
> we have now for C++ and Python bindings, except that it will have to be based
> on the gpio-sim module when it makes its way into mainline.
>
> ===
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
> - drop lib patches that are already upstream
> - use BIT() instead of (1UL << bit) for flags
> - fix refcounting for the configfs_dirent in rename()
> - drop d_move() from the rename() callback
> - free memory allocated for the live and pending groups in configfs_d_iput()
>   and not in detach_groups()
> - make sure that if a group of some name is in the live directory, a new group
>   with the same name cannot be created in the pending directory
>
> v5 -> v6:
> - go back to using (1UL << bit) instead of BIT()
> - if the live group dentry doesn't exist for whatever reason at the time when
>   mkdir() in the pending group is called (would be a BUG()), return -ENOENT
>   instead of -EEXIST which should only be returned if given subsystem already
>   exists in either live or pending group
>
> v6 -> v7:
> - as detailed by Andy in commit 6fda593f3082 ("gpio: mockup: Convert to use
>   software nodes") removing device properties after the platform device is
>   removed but before the GPIO device gets dropped can lead to a use-after-free
>   bug - use software nodes to manually control the freeing of the properties
>
> Bartosz Golaszewski (8):
>   configfs: increase the item name length
>   configfs: use (1UL << bit) for internal flags
>   configfs: implement committable items
>   samples: configfs: add a committable group
>   gpio: sim: new testing module
>   selftests: gpio: provide a helper for reading chip info
>   selftests: gpio: add a helper for reading GPIO line names
>   selftests: gpio: add test cases for gpio-sim
>
>  Documentation/admin-guide/gpio/gpio-sim.rst   |  72 ++
>  Documentation/filesystems/configfs.rst        |   6 +-
>  drivers/gpio/Kconfig                          |   8 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-sim.c                       | 886 ++++++++++++++++++
>  fs/configfs/configfs_internal.h               |  22 +-
>  fs/configfs/dir.c                             | 276 +++++-
>  include/linux/configfs.h                      |   3 +-
>  samples/configfs/configfs_sample.c            | 153 +++
>  tools/testing/selftests/gpio/.gitignore       |   2 +
>  tools/testing/selftests/gpio/Makefile         |   4 +-
>  tools/testing/selftests/gpio/config           |   1 +
>  tools/testing/selftests/gpio/gpio-chip-info.c |  57 ++
>  tools/testing/selftests/gpio/gpio-line-name.c |  55 ++
>  tools/testing/selftests/gpio/gpio-sim.sh      | 229 +++++
>  15 files changed, 1752 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
>  create mode 100644 drivers/gpio/gpio-sim.c
>  create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
>  create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
>  create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh
>
> --
> 2.30.1
>

Another ping...

Bart
