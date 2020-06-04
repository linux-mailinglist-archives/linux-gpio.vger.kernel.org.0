Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00D41EE3E1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 14:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgFDMEY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 08:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgFDMEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 08:04:21 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F794C03E96D
        for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2020 05:04:20 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id q8so5618724qkm.12
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2020 05:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rQACftCBYPdSwAslxUYeMjkisCybiZwNexgueRdL/90=;
        b=rWrfGuxh1OBCcNfYCx/KQCoj8U7TjfmlIzH9M2tjrlAGVdBaMqdqcnRm40jNwO0XOJ
         /3ihEVp12QxXNgJ+ksNYlzlI1IjZpoDFLpq6ZQ7t1ndpxYSyX42xDvltv2DeZoU2GW2s
         1SDD4UsjDDgJBfch2nCATV2IIV8dbDGrnUk2seqzQ1PQpqL+yXGwwOfFp1a5c7IXr3Rm
         OetqKiNJP6iAWXU1mBdDKuSL0qWez5pBrh6Y/yvus5yozK8WWXxly/D2ZHEIi8RcGjZk
         zlsJCULqXmUZgrkD3oCr1krV8M3ZFd2k8UbEqRFTtgOMLW/O/XjfCK4I8NgS2EM0wuUc
         uwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rQACftCBYPdSwAslxUYeMjkisCybiZwNexgueRdL/90=;
        b=HltYkj+RMVhBdOuRM21bGlz5kVVOABua38WHZpPi6fey/XzZ7ZVzCGWc2IM2Wj9qtr
         cZtsEE81JOIHbJd67xKpFtZPgLB5RfgWKCHTjqpf21XpZpaofsOF/OBjBJGA3kKEqpEf
         SB/T+ger+wYalZxqcY0KBp10Vz9tYPI3iStd+Q+HOC8lIyYGC493bcJC9IllnjwH74SV
         uyTmssLBpWIXsSzi82OYdZOODT3HqrcY99Yj3L35L9g3Xa1RZ/AP8vF0hXGgWUiFnAEr
         O2CDTNo+22/aIL4b8h9C3ojbYs04wMjKpqf+tBCfDTk2fVP7LRb/8iSqx/JzaI67CEJf
         U4kQ==
X-Gm-Message-State: AOAM532a15jQIPCth+HfqHU/i25jUEFG/oeAWFdoeR+EsfCb/dsxv/tb
        2VH2vhdcDzhECVy1CWfTTlieH7hZ0q+FPA7KWpMvjg==
X-Google-Smtp-Source: ABdhPJw+gVnIl9ro5623Beo5SlFkBvigm3cQQouSYHWdth7ulCxMWwR0Hs0o07gHCa/+js12enJXUc4bO/DmBRK/pxU=
X-Received: by 2002:a37:5b47:: with SMTP id p68mr4378659qkb.120.1591272259324;
 Thu, 04 Jun 2020 05:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200602141048.1995-1-warthog618@gmail.com>
In-Reply-To: <20200602141048.1995-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 4 Jun 2020 14:04:08 +0200
Message-ID: <CAMpxmJUjYn5SHg3BpCeKbYc_OpCjd8d943yfYL_TF15wyTenfA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: split character device into gpiolib-cdev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 2 cze 2020 o 16:11 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a):
>
> Split the cdev specific functionality out of gpiolib.c and into
> gpiolib-cdev.c. This improves the readability and maintainability of both
> the cdev and core gpiolib code.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> ---
> While this patch is complete and ready for review, I don't expect it to
> be applied as is. There are a few cdev patches pending merge into
> gpio/devel that are sure to conflict, and it makes more sense to
> rebase this on top of them than vice versa. But I thought it would
> be worthwhile to get it out for review so it can be ready to be rebased
> when the time is right.
>
> Also, this is a naive split. That is, if applied as is, it will lose the
> line history of the cdev code.  This is not what I intend, and I
> understand can be avoided by encouraging git to remember the history
> with a few moves, but I'm unsure how the maintainers would prefer that
> to be done.
>
> Bart,
>  As this was your idea, I've taken the liberty of adding the Suggested-by=
.
>  I hope that is ok.
>
> Changes in v2:
>  - rebased to latest gpio/devel and added base-commit to placate the
>   build bot.  The comments above still apply, as there are still a
>   couple of commits in gpio/fixes that will conflict.
>
> Kent.

Thanks for doing this Kent!

This looks mostly good, see a single comment below.

Linus: do you think we can get this in for v5.8? Maybe apply this as
the last patch before your PR?

>
>  drivers/gpio/Makefile       |    1 +
>  drivers/gpio/gpiolib-cdev.c | 1148 +++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib-cdev.h |   11 +
>  drivers/gpio/gpiolib.c      | 1112 +--------------------------------
>  4 files changed, 1164 insertions(+), 1108 deletions(-)
>  create mode 100644 drivers/gpio/gpiolib-cdev.c
>  create mode 100644 drivers/gpio/gpiolib-cdev.h
>
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 65bf3940e33c..b5b58b624f37 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_GPIOLIB)           +=3D gpiolib.o
>  obj-$(CONFIG_GPIOLIB)          +=3D gpiolib-devres.o
>  obj-$(CONFIG_GPIOLIB)          +=3D gpiolib-legacy.o
>  obj-$(CONFIG_GPIOLIB)          +=3D gpiolib-devprop.o
> +obj-$(CONFIG_GPIOLIB)          +=3D gpiolib-cdev.o
>  obj-$(CONFIG_OF_GPIO)          +=3D gpiolib-of.o
>  obj-$(CONFIG_GPIO_SYSFS)       +=3D gpiolib-sysfs.o
>  obj-$(CONFIG_GPIO_ACPI)                +=3D gpiolib-acpi.o
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> new file mode 100644
> index 000000000000..971470bdc9c9
> --- /dev/null
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -0,0 +1,1148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitmap.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqreturn.h>
> +#include <linux/spinlock.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/cdev.h>
> +#include <linux/uaccess.h>
> +#include <linux/compat.h>
> +#include <linux/anon_inodes.h>
> +#include <linux/file.h>
> +#include <linux/kfifo.h>
> +#include <linux/poll.h>
> +#include <linux/timekeeping.h>
> +#include <uapi/linux/gpio.h>
> +
> +
> +#include "gpiolib.h"
> +
> +/* Implementation infrastructure for GPIO interfaces.
> + *
> + * The GPIO programming interface allows for inlining speed-critical
> + * get/set operations for common cases, so that access to SOC-integrated
> + * GPIOs can sometimes cost only an instruction or two per bit.
> + */

Is this comment relevant for the character device?

Bartosz
