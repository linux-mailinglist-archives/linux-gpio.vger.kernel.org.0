Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4315229F890
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 23:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgJ2WpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 18:45:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:50236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgJ2WpF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 18:45:05 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A67872151B;
        Thu, 29 Oct 2020 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604011504;
        bh=1v9CTsEcGCgtoQ3mFiM/G5rvasL5DfAEHGbNZndBwFE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Uf1mOXg9wfRgP+VnI3PH9Fb79G11G/jl7u/fmg6ASSDcR9HVAccCHwLoT32tm/hgV
         uGo4btKOD6SmKgoHOJpMC2BULYG3rxeiVlFtM1A5KeoQ6LjV3xZBP8/Bx0Xt3ieV9M
         9ePSuEUSyGLPPciQqQP1xcCHIIE82Vzx3dAwTpcU=
Received: by mail-qv1-f54.google.com with SMTP id w9so2060700qvj.0;
        Thu, 29 Oct 2020 15:45:04 -0700 (PDT)
X-Gm-Message-State: AOAM5332mT/QD4F8UKScYQHMWm+o4zQPxAdUC/xLjWif7MlwqS0rr7B8
        ZK02gtOUlTV4WsAvIjw9AdAEH2pbzVrmRk3DbA8=
X-Google-Smtp-Source: ABdhPJzQBXt+NNpAFnKtCF7GsFUy8+wsiNLwchxJlqMAxiAWENdCeuVjvj/CNl/ygivrx8yWxaM+UTceQbzR1/jXMvw=
X-Received: by 2002:a0c:b58c:: with SMTP id g12mr6923502qve.16.1604011503669;
 Thu, 29 Oct 2020 15:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603055402.git.syednwaris@gmail.com> <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
In-Reply-To: <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 29 Oct 2020 23:44:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
Message-ID: <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
>
> This patch reimplements the xgpio_set_multiple() function in
> drivers/gpio/gpio-xilinx.c to use the new generic functions:
> bitmap_get_value() and bitmap_set_value(). The code is now simpler
> to read and understand. Moreover, instead of looping for each bit
> in xgpio_set_multiple() function, now we can check each channel at
> a time and save cycles.

This now causes -Wtype-limits warnings in linux-next with gcc-10:

> +       u32 *const state = chip->gpio_state;
> +       unsigned int *const width = chip->gpio_width;
> +
> +       DECLARE_BITMAP(old, 64);
> +       DECLARE_BITMAP(new, 64);
> +       DECLARE_BITMAP(changed, 64);
> +
> +       spin_lock_irqsave(&chip->gpio_lock[0], flags);
> +       spin_lock(&chip->gpio_lock[1]);
> +
> +       bitmap_set_value(old, state[0], 0, width[0]);
> +       bitmap_set_value(old, state[1], width[0], width[1]);

In file included from ../include/linux/cpumask.h:12,
                 from ../arch/x86/include/asm/cpumask.h:5,
                 from ../arch/x86/include/asm/msr.h:11,
                 from ../arch/x86/include/asm/processor.h:22,
                 from ../arch/x86/include/asm/timex.h:5,
                 from ../include/linux/timex.h:65,
                 from ../include/linux/time32.h:13,
                 from ../include/linux/time.h:73,
                 from ../include/linux/stat.h:19,
                 from ../include/linux/module.h:13,
                 from ../drivers/gpio/gpio-xilinx.c:11:
../include/linux/bitmap.h:639:18: warning: array subscript [1,
67108864] is outside array bounds of 'long unsigned int[1]'
[-Warray-bounds]
  639 |   map[index + 1] |= value >> space;
      |   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
In file included from ../include/linux/kasan-checks.h:5,
                 from ../include/asm-generic/rwonce.h:26,
                 from ./arch/x86/include/generated/asm/rwonce.h:1,
                 from ../include/linux/compiler.h:246,
                 from ../include/linux/build_bug.h:5,
                 from ../include/linux/bits.h:22,
                 from ../include/linux/bitops.h:6,
                 from ../drivers/gpio/gpio-xilinx.c:8:
../drivers/gpio/gpio-xilinx.c:144:17: note: while referencing 'old'
  144 |  DECLARE_BITMAP(old, 64);
      |                 ^~~
../include/linux/types.h:11:16: note: in definition of macro 'DECLARE_BITMAP'
   11 |  unsigned long name[BITS_TO_LONGS(bits)]
      |                ^~~~
In file included from ../include/linux/cpumask.h:12,
                 from ../arch/x86/include/asm/cpumask.h:5,
                 from ../arch/x86/include/asm/msr.h:11,
                 from ../arch/x86/include/asm/processor.h:22,
                 from ../arch/x86/include/asm/timex.h:5,
                 from ../include/linux/timex.h:65,
                 from ../include/linux/time32.h:13,
                 from ../include/linux/time.h:73,
                 from ../include/linux/stat.h:19,
                 from ../include/linux/module.h:13,
                 from ../drivers/gpio/gpio-xilinx.c:11:

The compiler clearly tries to do range-checking here and notices
that the index into the fixed-length array on the stack is not correctly
bounded. It seems this would happen whenever width[0] + width[1]
is larger than 64.

I have just submitted patches for all other -Wtype-limits warnings
and would like to enable this option by default. Can you try to find
a way to make this code safer? I would expect that you need a
variant of bitmap_set_value() that takes an explicit ceiling here,
and checks the stand and nbits values against that.

       Arnd
