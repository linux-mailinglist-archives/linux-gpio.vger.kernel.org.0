Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B05421501
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 19:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233806AbhJDRRV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 13:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbhJDRRU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 13:17:20 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386CAC061749
        for <linux-gpio@vger.kernel.org>; Mon,  4 Oct 2021 10:15:31 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z20so16145756edc.13
        for <linux-gpio@vger.kernel.org>; Mon, 04 Oct 2021 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JCMAyY7Zq7LI1hSn5nCf7+6dW+zdCzKjbNAz5L5GbsQ=;
        b=XXVBC+Syf5JtEJtV8diPsrILQ3WalnFuR+1l1EQ5kffJv+dMhM4Uo5HxxnOkSYaOy6
         ZsAnFgQGVdwj4/S+rd5QvgEPGs6UEBm+VVm83kzMwIqx9jDrY0dVx3ecW1J5jrfvUdqZ
         5I5QkMwyah9NQM+G4RCZG5HhJRPYIU15jGZWSmJiXbFcpxqIO+EpnAGYg+4yn5Kwz9DI
         cuG+kP9xAFgGQXYCuJ+3eQZ8qXQkISZnxZlIW7AL+jPEZimJ8v8pIS5MYa4GsVs9dQ4r
         8QPP3l+JbmdacFkwYyLLgP0aDkEGfNnzcFgVOrz6xoe4sW0MKT0d19I8jOpFfr2npx+s
         rZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCMAyY7Zq7LI1hSn5nCf7+6dW+zdCzKjbNAz5L5GbsQ=;
        b=YyEw5ICZQAb3T18LYg/NjQMuYVAixhxjLZ/iMBxj73xHZjy6/53x9naPUlLR/KiqTu
         MelsWvFT0NBwN9afnW5Z2HQcF06vxVfL+W2myFCtaMbSvP9WgHxgvK2kRxl0T+G8Pf0x
         r80ETibOHOb+ZKFRwIPzFVGsMKz64ugbTwD/8ClFd4yki+hawL2MeIeb1US2fYwSYeGC
         he2CXabPJwNBVq1IQx1fbtMj8s2uCfzYtJqFLNvhWNsiE85U2VqcUA3IGi2qBjTSfa2B
         S37ta70yQn4dU6b047t/N40R4h0J2w3yfAhn56yfXn4EdX36Gnh0u2IInuiNyTJ8fYWE
         CzLA==
X-Gm-Message-State: AOAM530XKnt3thELfAmFEXUnMqkpNHY0qBknz4GB1WFKBBMHoP3JCjmP
        toVU9oWeKwE3ja/MrLN9fTk31OZhceT1IXkFQyQ7FQ==
X-Google-Smtp-Source: ABdhPJyUipKA5I1jT46xgWhTErCJBp8N844sgLKRu+eDQ4mywKuLwzL8DVo57J1RiveoEzryDzw0V+ypqvlnOdcHS88=
X-Received: by 2002:a17:906:a018:: with SMTP id p24mr18099480ejy.349.1633367729713;
 Mon, 04 Oct 2021 10:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210922084733.5547-1-brgl@bgdev.pl>
In-Reply-To: <20210922084733.5547-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 Oct 2021 19:15:19 +0200
Message-ID: <CAMRc=McbVHoNxn=hx_qSVk0ygLGQomtSy1+QrqnvxgXHtt8b6g@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] gpio: implement the configfs testing module
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
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 10:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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
>  drivers/gpio/gpio-sim.c                       | 877 ++++++++++++++++++
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
>  15 files changed, 1743 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
>  create mode 100644 drivers/gpio/gpio-sim.c
>  create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c
>  create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c
>  create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh
>
> --
> 2.30.1
>

Gentle ping for the entire series.

Bart
