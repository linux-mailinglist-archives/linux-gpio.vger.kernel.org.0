Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2835304661
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 19:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbhAZRWj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 12:22:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:47314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389867AbhAZIWe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 03:22:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 479A220717
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611649313;
        bh=ifZX5JkH2KGQEngRqfDyhgMFQH75aVXiKarwuVpDq74=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Z1YHmTROxAlFmxp0+XwdvBTr+Nbg1AKagmOj1kjYhokU+9XDuP/wdMT3spxwSKFVB
         Uc9dq0/7VRJsnt4rfQKdSod9ffzTS+1dqiG8P6Pk0qqWYy8dLdO/HG3lusk28QNDxO
         0R5iBK1aoN6XGKvVKO/O4iibP6Z1CqLXSG5r8uEnQ4BPKurykulGXK5MkqeLbLksfG
         oiI8K4VcwdUKquOZnKwtgpwYqGyrnMSlBqVhdABrcI1jUiC+xnWM4dU+JNLUzEkWJf
         ay16wXU6vo1CvbcXpQW/F706Zmmjt6+YozryYoPg599ZqawZ7pUaN3F+1xaqU1EZxL
         G5AqU6F+wCVUQ==
Received: by mail-ej1-f54.google.com with SMTP id l9so21761975ejx.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 00:21:53 -0800 (PST)
X-Gm-Message-State: AOAM530Qf5IZp+K7oQeNdqnJkLsOXOehZFOz1v4HS2jq1tRAHaD2eTVW
        IgBMzXhpd6z3+0dSMaeDQGlr8fFrkd6Hmvz7SzY=
X-Google-Smtp-Source: ABdhPJxfZA4RboehZB7wY0VN7HdEEtRIOvsa7DCgyqkKMlwj8RPCvG1/579qQWpNykHxEoO8A3aqYUzwc/6Yp1OfXCA=
X-Received: by 2002:a17:906:158c:: with SMTP id k12mr2805657ejd.119.1611649311780;
 Tue, 26 Jan 2021 00:21:51 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210125232704epcas2p4f362849a8f5e85f46d406d20b7983429@epcas2p4.samsung.com>
 <202101260734.haBuNSsB-lkp@intel.com> <000001d6f377$6c1b3af0$4451b0d0$@samsung.com>
In-Reply-To: <000001d6f377$6c1b3af0$4451b0d0$@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 26 Jan 2021 09:21:40 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeht+rL0Epd4jsQLgw=Yg70+gHKMSw4m1xwdvp5pO6mqg@mail.gmail.com>
Message-ID: <CAJKOXPeht+rL0Epd4jsQLgw=Yg70+gHKMSw4m1xwdvp5pO6mqg@mail.gmail.com>
Subject: Re: [pinctrl:devel 32/33] drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25:
 error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible
 pointer type
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 26 Jan 2021 at 01:08, Chanho Park <chanho61.park@samsung.com> wrote:
>
> >         git fetch --no-tags pinctrl devel
> >         git checkout 1f306ecbe0f66681bd87a2bb9013630233a32f7f
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross
> > ARCH=c6x
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/wait.h:9,
> >                     from include/linux/pid.h:6,
> >                     from include/linux/sched.h:14,
> >                     from include/linux/ratelimit.h:6,
> >                     from include/linux/dev_printk.h:16,
> >                     from include/linux/device.h:15,
> >                     from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
> >    drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function
> > 's3c64xx_irq_set_function':
> > >> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:20: error: passing
> > >> argument 1 of 'spinlock_check' from incompatible pointer type
> > >> [-Werror=incompatible-pointer-types]
> >      289 |  spin_lock_irqsave(&bank->slock, flags);
> >          |                    ^~~~~~~~~~~~
> >          |                    |
> >          |                    raw_spinlock_t * {aka struct raw_spinlock *}
> >    include/linux/spinlock.h:252:34: note: in definition of macro
> > 'raw_spin_lock_irqsave'
> >      252 |   flags = _raw_spin_lock_irqsave(lock); \
> >          |                                  ^~~~
> >    drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:2: note: in expansion of
> > macro 'spin_lock_irqsave'
> >      289 |  spin_lock_irqsave(&bank->slock, flags);
> >          |  ^~~~~~~~~~~~~~~~~
> >    In file included from include/linux/wait.h:9,
> >                     from include/linux/pid.h:6,
> >                     from include/linux/sched.h:14,
> >                     from include/linux/ratelimit.h:6,
> >                     from include/linux/dev_printk.h:16,
> >                     from include/linux/device.h:15,
> >                     from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
> >    include/linux/spinlock.h:327:67: note: expected 'spinlock_t *' {aka
> > 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka
> > 'struct raw_spinlock *'}
> >      327 | static __always_inline raw_spinlock_t
> *spinlock_check(spinlock_t
> > *lock)
> >          |
> ~~~~~~~~~~~~^~~~
> > >> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25: error: passing
> > >> argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type
> > >> [-Werror=incompatible-pointer-types]
> >      296 |  spin_unlock_irqrestore(&bank->slock, flags);
> >          |                         ^~~~~~~~~~~~
> >          |                         |
> >          |                         raw_spinlock_t * {aka struct
> raw_spinlock *}
> >    In file included from include/linux/wait.h:9,
> >                     from include/linux/pid.h:6,
> >                     from include/linux/sched.h:14,
> >                     from include/linux/ratelimit.h:6,
> >                     from include/linux/dev_printk.h:16,
> >                     from include/linux/device.h:15,
> >                     from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
> >    include/linux/spinlock.h:407:64: note: expected 'spinlock_t *' {aka
> > 'struct spinlock *'} but argument is of type 'raw_spinlock_t *' {aka
> > 'struct raw_spinlock *'}
> >      407 | static __always_inline void spin_unlock_irqrestore(spinlock_t
> > *lock, unsigned long flags)
> >          |
> ~~~~~~~~~~~~^~~~
> >    cc1: some warnings being treated as errors
> >
> >
>
> Hi Linus,
>
> I was not aware PINCTRL_S3C64XX because it's not enabled in
> s3c6410_defconfig.
> Please pick the v2 patch. Sorry for the inconvenience.

For arm:
make allyesconfig
make -j4 drivers/pinctrl/samsung/

and indeed it does not compile...

Best regards,
Krzysztof
