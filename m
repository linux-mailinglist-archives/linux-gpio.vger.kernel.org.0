Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A5D2F7761
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 12:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbhAOLQF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 06:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbhAOLQF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 06:16:05 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A11C0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:15:24 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id h16so9089226edt.7
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V3jqJmaCcX5IsJBQx6umjI2NW+YvABykmMz+qlqbkqg=;
        b=de91hk7XW2RthcW/6uJXj5/Dv9wrxG0da3c/0XKYUtXhwvC4DFW/DuSyemHj5ir25b
         oL/7A+XRPRNiYPScwkk1C/+0w36NVdlPnVQpJQAnoKFejrl/69ekgiAM7va2h2MoCEtN
         /gE2bgvpG5mch238bjGUp6ZLhTSSA3/LvIS+W8n+9/AhFpsQMRro5+dp4FF4DCpm3mFV
         TkDn7wbodFdyshUYv1H60YdV2uqJVJkGdX7v1o1073zUsQmi13Z7hhifuy6UG7IyAa0d
         QZFWePIYFv9iK7MmngnZ8+3H+HeY2fvNTRUFenGOYgyIej02eNyE40ger1HJrI+YLEPF
         LB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3jqJmaCcX5IsJBQx6umjI2NW+YvABykmMz+qlqbkqg=;
        b=i5P5QEibwSnUZLfqjYMqIeQ15GMW3Qpx+cszyrNUo2dHouv/cmv+LFLaouI6LLinv6
         G3sHUprqts9rh5Ol7eyZrYH201rz1OAkyjgHIwSGhqVNG2BiWp7F1ae+CQEAFVnjhvxR
         ZQFaS0Tnq4CIR2z5j4o+MpP1lmERIh5xPNAjkt6XVG0BU+0xEa0f/I1j1uQOkO4QS5Bv
         j+pxsOPEN9Y4iMrB/HZtm83vr55ubgi9IGNJ4qB8OmLQ2RVkIiD/KsDRvgjS3f3x3hMV
         sRbYq4/dl3wB6l4uI07RIqhQrtL50wgFQM4CxtHql2yHMm2QW7nR9EdzR5FYiy6Cf3CV
         6DkA==
X-Gm-Message-State: AOAM531UbRykF2ivU5LZ7ZzLMElZnxS1SAl5x8yXHtrMtcb0ppUDkCuB
        GClz7jDONiplAC/Hln1Zs/Z5aC8vQUNgOLB1wV9FSA==
X-Google-Smtp-Source: ABdhPJwkl8q54wo3u7lYIDIzreVmV8Ba+6cC4hgrMB+rkVbUCwH2GynXVEEKCSAy/UeDGhtsje3MjtAFUmIA42r7Ihs=
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr8983802eds.134.1610709323372;
 Fri, 15 Jan 2021 03:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20210115111311.31601-1-brgl@bgdev.pl>
In-Reply-To: <20210115111311.31601-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 15 Jan 2021 12:15:12 +0100
Message-ID: <CAMRc=MegcWNzhQ+6pxa2dgREG-Y_SBEGZfuXS1oz1xnduBKgHQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] configfs: implement committable items and add
 sample code
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 12:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Committable items in configfs are well defined and documented but unfortunately
> so far never implemented.
>
> The use-case we have over at the GPIO subsystem is using configfs in
> conjunction with sysfs to replace our current gpio-mockup testing module
> with one that will be much more flexible and will allow complete coverage
> of the GPIO uAPI.
>
> The current gpio-mockup module is controlled using module parameters which
> forces the user to reload it everytime they need to change the chip
> configuration or layout and makes it difficult to extend its functionality.
>
> Testing module based on configfs would allow fine-grained control over dummy
> GPIO chips but since GPIO devices must be configured before they are
> instantiated, we need committable items.
>
> This implements them and adds code examples to configfs_sample module. The
> first two patches are just cosmetic.
>
> v1 -> v2:
> - fix a 'set but not used' build warning reported by kernel test robot
>
> v2 -> v3:
> - use (1UL << bit) instead of BIT() in patch 2/4
> - extend configfs_dump_one() to make it print the new flags
> - clear the CONFIGFS_USET_DIR bit on the live group dirent
>
> v3 -> v4:
> - relax the attribute handling for the 'live' group: don't make all attributes
>   read-only once their group is committed
> - don't allow to change the dirent name of committable groups when renaming
>
> Rebased on top of v5.11-rc3.
>
> Bartosz Golaszewski (4):
>   configfs: increase the item name length
>   configfs: use (1UL << bit) for internal flags
>   configfs: implement committable items
>   samples: configfs: add a committable group
>
>  Documentation/filesystems/configfs.rst |   6 +-
>  fs/configfs/configfs_internal.h        |  22 ++-
>  fs/configfs/dir.c                      | 244 ++++++++++++++++++++++++-
>  include/linux/configfs.h               |   3 +-
>  samples/configfs/configfs_sample.c     | 153 ++++++++++++++++
>  5 files changed, 408 insertions(+), 20 deletions(-)
>
> --
> 2.29.1
>

Ah cr*p I now noticed Linus W had left his Ack on the previous version
and I forgot to collect it...

Bart
