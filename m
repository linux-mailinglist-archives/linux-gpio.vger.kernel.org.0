Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71AE71EE676
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 16:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgFDOSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 10:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgFDOSM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 10:18:12 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181C6C08C5C0;
        Thu,  4 Jun 2020 07:18:12 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a127so3298510pfa.12;
        Thu, 04 Jun 2020 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fDkZK8HfjhsR/tIxHqFWkpyr4yJZJlEPI//WdzBK1Sk=;
        b=SZizmfDicqjomp1mZa4xFgc22u4mFQutUOkAoJPKxOZ+nnwP4/3Nt/cQtYQakZT4Qb
         pBP6YZGq8riJPq8RFB8wGoArareuOzZSiYARQEdVde/h9we/PuIxpMMdWflXwBGD4Fwn
         pPGHqKSv8wT4CSNx+WV2ktOKN48/wB0xdY54FTyVEtHx1zPHHngGXzFtjacwsZpn92h3
         mcjNyyuDj3y4tWAIFI9KTMQn9ct7sM+yhtAbXhKxn+uHh//lP7v+pNoVoI5saYZbuXqV
         Fa4HosnLktqyo3TUfflwSz6EHTz5VyPtB88GZ35IUFAxQcs/pjZ8OZw4g7Kqk8BSqsu3
         WeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fDkZK8HfjhsR/tIxHqFWkpyr4yJZJlEPI//WdzBK1Sk=;
        b=Q+X+BIDqclbPI+wQ2DUq5xcEGMTnKP49TiRtAxbpHfgZz5uBKjHd+mXuR+hB3QMTiH
         gOCCWsDNctPai5ga/YC7BStDPFqrkE/eM2ibkl6ilCMLpMgAtNbewv0C/Fs4+UrVT0vn
         JRfSsptGc+sgOjM723A3l5PJEqPgWHKOLSZo7bHoyiZus17mn6VLjGow6ncf9U826fvy
         igFFH0XU/fhgpTOFfDQUD1U/1rp4yh6+9d5HWe5WBpblyNa6V1L3iXn2JaQsuoV2IvjU
         eQLdFAsGxhhuZ3WqP4VJg47YB8K0wDmeXPQDIahWxi4bngYePJJc7IJ4tUEUvnTMUzVO
         9FPg==
X-Gm-Message-State: AOAM533E9oeAqB5zhFQRoa2TqZP8MzJsn/XAZ8imA4NffViyn4nUoV2U
        xcCwmWuX6qwg+xfj4TRQrBmcTsNHJLQ=
X-Google-Smtp-Source: ABdhPJzFVVUILaN09gghKKI4F3wzZkgMLC/EdPpgZemOz8Sm8CPt+vkdy3L1Co0PnnVPZuHAtWAsUw==
X-Received: by 2002:a62:4e91:: with SMTP id c139mr4738452pfb.18.1591280291456;
        Thu, 04 Jun 2020 07:18:11 -0700 (PDT)
Received: from sol (220-235-66-207.dyn.iinet.net.au. [220.235.66.207])
        by smtp.gmail.com with ESMTPSA id nl5sm6198183pjb.36.2020.06.04.07.18.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 07:18:10 -0700 (PDT)
Date:   Thu, 4 Jun 2020 22:18:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: split character device into gpiolib-cdev
Message-ID: <20200604141804.GA5050@sol>
References: <20200602141048.1995-1-warthog618@gmail.com>
 <CAMpxmJUjYn5SHg3BpCeKbYc_OpCjd8d943yfYL_TF15wyTenfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUjYn5SHg3BpCeKbYc_OpCjd8d943yfYL_TF15wyTenfA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 02:04:08PM +0200, Bartosz Golaszewski wrote:
> wt., 2 cze 2020 o 16:11 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Split the cdev specific functionality out of gpiolib.c and into
> > gpiolib-cdev.c. This improves the readability and maintainability of both
> > the cdev and core gpiolib code.
> >
> > Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> > ---
> > While this patch is complete and ready for review, I don't expect it to
> > be applied as is. There are a few cdev patches pending merge into
> > gpio/devel that are sure to conflict, and it makes more sense to
> > rebase this on top of them than vice versa. But I thought it would
> > be worthwhile to get it out for review so it can be ready to be rebased
> > when the time is right.
> >
> > Also, this is a naive split. That is, if applied as is, it will lose the
> > line history of the cdev code.  This is not what I intend, and I
> > understand can be avoided by encouraging git to remember the history
> > with a few moves, but I'm unsure how the maintainers would prefer that
> > to be done.
> >
> > Bart,
> >  As this was your idea, I've taken the liberty of adding the Suggested-by.
> >  I hope that is ok.
> >
> > Changes in v2:
> >  - rebased to latest gpio/devel and added base-commit to placate the
> >   build bot.  The comments above still apply, as there are still a
> >   couple of commits in gpio/fixes that will conflict.
> >
> > Kent.
> 
> Thanks for doing this Kent!
> 
> This looks mostly good, see a single comment below.
> 
> Linus: do you think we can get this in for v5.8? Maybe apply this as
> the last patch before your PR?
> 
> >
> >  drivers/gpio/Makefile       |    1 +
> >  drivers/gpio/gpiolib-cdev.c | 1148 +++++++++++++++++++++++++++++++++++
> >  drivers/gpio/gpiolib-cdev.h |   11 +
> >  drivers/gpio/gpiolib.c      | 1112 +--------------------------------
> >  4 files changed, 1164 insertions(+), 1108 deletions(-)
> >  create mode 100644 drivers/gpio/gpiolib-cdev.c
> >  create mode 100644 drivers/gpio/gpiolib-cdev.h
> >
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index 65bf3940e33c..b5b58b624f37 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -7,6 +7,7 @@ obj-$(CONFIG_GPIOLIB)           += gpiolib.o
> >  obj-$(CONFIG_GPIOLIB)          += gpiolib-devres.o
> >  obj-$(CONFIG_GPIOLIB)          += gpiolib-legacy.o
> >  obj-$(CONFIG_GPIOLIB)          += gpiolib-devprop.o
> > +obj-$(CONFIG_GPIOLIB)          += gpiolib-cdev.o
> >  obj-$(CONFIG_OF_GPIO)          += gpiolib-of.o
> >  obj-$(CONFIG_GPIO_SYSFS)       += gpiolib-sysfs.o
> >  obj-$(CONFIG_GPIO_ACPI)                += gpiolib-acpi.o
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > new file mode 100644
> > index 000000000000..971470bdc9c9
> > --- /dev/null
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -0,0 +1,1148 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/bitmap.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irqreturn.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/cdev.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/compat.h>
> > +#include <linux/anon_inodes.h>
> > +#include <linux/file.h>
> > +#include <linux/kfifo.h>
> > +#include <linux/poll.h>
> > +#include <linux/timekeeping.h>
> > +#include <uapi/linux/gpio.h>
> > +
> > +
> > +#include "gpiolib.h"
> > +
> > +/* Implementation infrastructure for GPIO interfaces.
> > + *
> > + * The GPIO programming interface allows for inlining speed-critical
> > + * get/set operations for common cases, so that access to SOC-integrated
> > + * GPIOs can sometimes cost only an instruction or two per bit.
> > + */
> 
> Is this comment relevant for the character device?
> 

True - that comment should stay in gpiolib, and gpiolib-cdev should get
one of it's own.

Any suggestions on how to maintain line history?
I know you can trick git by moving the original file into two new ones,
then moving one of those back to the old name, but not sure if that is
what you would want to see in a patch.

Cheers,
Kent.
