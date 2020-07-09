Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44DF21A0AC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 15:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbgGINTv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 09:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgGINT3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 09:19:29 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC9EC08C5CE
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 06:19:29 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id di5so881458qvb.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wDgz11ShYk/Rb+cjhB3hGNA4H8iFe+o/AJhL/6TvR/c=;
        b=rCiEZYZ9CED5ElkKfWtMCX8ixiQqplvTeIu+Ibn+QBVy3wXBuDBikSfnSKeNCRj/VB
         EqrVchTsBbGc2W4JWOIzzNVs1qy4idQxgXy97+072cnPMGKGFuMvjU3yMnu4EE5TT6mj
         ooFWv3xAjwHTB7RfTTbBACSQ7WhJUIzjDqmPKM91EatqfR1ThIFZ0bhRDCUVl230P+P2
         pW3pfIm3zvrjncMfAhRrznCBtGEMNIqV8f4UKRPrlh0GmAqAnTpZ3MidAZEOM8F0zIvp
         rH2B5Xpi3y5E/XAeSdtuqt5ODAyaLxUXME5yc/FwYj2cReLsn6uLB+MOM284lCaJi6/8
         BmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wDgz11ShYk/Rb+cjhB3hGNA4H8iFe+o/AJhL/6TvR/c=;
        b=BzAnUDWqMIVufT4Z+50xcAjC2sHbFVisTeH0uBzPqKxE3omiZLhDYRUG7X0ZVbsPf9
         ANSYDFjWgKAkeC5ClKNAEpvX5IKgGaaLY1HeGTCY/e9RLc8pOf7GsIrvbpe+/Anvit/v
         Kr3ZPmCBN9G5DuHlT/j5CZCYQ3NORAfAJIWayITCsd9Za1xHyl/GgoED2v1vj4vDhzXZ
         9L5N+9pQr2lfBRbJKy6WS1kyh3Ik84Mzuie3RsCv0+cA2aAngUMUD2wSWK9NTD15SitE
         4IOc1HqyITy4IwbwRMt8iIXZe0NRBbhJb6zEDmZiSHFuhGwiDhLYgMw84Gk2il0Vbv8Y
         jKtw==
X-Gm-Message-State: AOAM531mU0AsMt3ZsXE4yhukP88A2xnjYl8nPlmhDh1/fmulf1R1Pg0u
        6nuSuw7mC8NQfafjg43t9lcOZka++FSMhervwX79NA==
X-Google-Smtp-Source: ABdhPJyBlDePeobZPrB/H+vNSKy8PsVTe99vnGiqo586PyF/ZAgTRfMF07tYml4pg+RfsX6MJuGd7z9oI42LX8hANPA=
X-Received: by 2002:a05:6214:72c:: with SMTP id c12mr59335115qvz.76.1594300768959;
 Thu, 09 Jul 2020 06:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200708041600.768775-1-warthog618@gmail.com>
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 9 Jul 2020 15:19:18 +0200
Message-ID: <CAMpxmJUtD_GrQObd=1-6pVv4xDb4GO52J6sDyvVvtxzySjBzJw@mail.gmail.com>
Subject: Re: [PATCH 00/17] gpiolib: cdev: pre-uAPI v2 cleanups
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 6:18 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> This collection of patches provides improvements to or
> address minor problems in gpiolib-cdev.
>
> The majority of the patches (1-7, 9-11) have been pulled directly from
> my "gpio: cdev: add uAPI V2" patch set, as they are not related to any
> uAPI changes.
> The remaining patches were either split out of the remaining patches
> from that set, as they are not directly part of the uAPI changes, or
> were inspired by fixes for issues in that set, or were only noticed
> subsequent to that set.
>
> Changes since "gpio: cdev: add uAPI V2":
>  - rebase onto latest gpio/devel
>  - fix typo in patch 1 commit description
>  - replace patch 8 with the blocking notifier call chain patch
>  - rename priv to cdev instead of gcdev in patch 9
>  - fix error handling in patch 10
>  - add patches 12 to 17
>
> Kent Gibson (17):
>   gpiolib: move gpiolib-sysfs function declarations into their own
>     header
>   gpiolib: cdev: sort includes
>   gpiolib: cdev: minor indentation fixes
>   gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
>   gpiolib: cdev: rename 'filep' and 'filp' to 'file' to be consistent
>     with other use
>   gpiolib: cdev: rename numdescs to num_descs
>   gpiolib: cdev: remove pointless decrement of i
>   gpiolib: cdev: use blocking notifier call chain instead of atomic
>   gpiolib: cdev: rename priv to cdev
>   gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
>   gpiolib: cdev: remove recalculation of offset
>   gpiolib: cdev: refactor linehandle cleanup into linehandle_free
>   gpiolib: cdev: refactor lineevent cleanup into lineevent_free
>   gpio: uapi: fix misplaced comment line
>   tools: gpio: fix spurious close warning in lsgpio
>   tools: gpio: fix spurious close warning in gpio-utils
>   tools: gpio: fix spurious close warning in gpio-event-mon
>
>  drivers/gpio/gpiolib-cdev.c  | 385 ++++++++++++++++-------------------
>  drivers/gpio/gpiolib-sysfs.c |   1 +
>  drivers/gpio/gpiolib-sysfs.h |  24 +++
>  drivers/gpio/gpiolib.c       |  15 +-
>  drivers/gpio/gpiolib.h       |  20 +-
>  include/uapi/linux/gpio.h    |   2 +-
>  tools/gpio/gpio-event-mon.c  |   3 +-
>  tools/gpio/gpio-utils.c      |   4 +-
>  tools/gpio/lsgpio.c          |   3 +-
>  9 files changed, 217 insertions(+), 240 deletions(-)
>  create mode 100644 drivers/gpio/gpiolib-sysfs.h
>
>
> base-commit: b239e4454e59bc85d466eb5630da46f6a876df77
> --
> 2.27.0
>

Hi Kent,

The entire series looks good to me, thanks for doing this. I'll pick
it up into my tree and send a PR to Linus.

Bartosz
