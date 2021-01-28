Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25544307A78
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 17:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhA1QOU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 11:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbhA1QMn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 11:12:43 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FFBC061573;
        Thu, 28 Jan 2021 08:12:02 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i63so4281144pfg.7;
        Thu, 28 Jan 2021 08:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JhffxInAUmhk1vMKR4ZZWJhUVenQfYY2F9vgS33QU2I=;
        b=R0VbwrY5FF1Rd8U9NGDnZHjDj2j7uX2LgVsO7v+dobKrxw0CQUZBArvGfS93oXeZXW
         u5/ep0FvCh1RURFnm/XA3xmPOXIDZeYI1nOZ9xx7pNJ7cW6he5UELPJqYjOBK42QQdqG
         vpHYmnC4qXzjJVc7SLGrq6NJB7uBRThLPMeiX29znz6S8thIh1oMW3uTLmTYjU5ega8l
         itAKS72kpJwEY2LiDEWSr0BkA5U1B6JGbM7z4bFMNBH5bw1aS9mR1dK/fA3S0nWUFTfW
         DxP2BuaNQvoIJYfsg2Wrm7tcg+kDLL3Sn+yZMahU5QMeW6r4iUwbiBZ3YBNdqnJhZ/UH
         hkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhffxInAUmhk1vMKR4ZZWJhUVenQfYY2F9vgS33QU2I=;
        b=KL9j47ZB8HK10H6Y8qT2WZGhRF+eu4Wb9fgYaJ31fsnOLwe0x/R9KI6qycS8KOJ8Vd
         2EL/Z6v8Q33yqHVGjVMz8oeywdGeBAN967XnJN4wBGsqS/kLYP7hQSfV5sI4u72alx0f
         fc//Ba6FR5oqcyAobQzEiKWT/dq3vWWcIjTGHNWCuqnxboNi6+xYVB8xZohcod/O96VL
         IFBWDj+eEXBPRrsl62qOclufH3X9dpE0mS7HqpgfkUiVBSRYhBY0bKifRt+Vf7BPT67W
         yIeQnz0Db1l/edrwchx7XAci9iJmjkwTWm50JNC9H4x3RezsXnqfIFrHvBcOMCuA71Yj
         OJJw==
X-Gm-Message-State: AOAM533mCvEq+3lsIMnu2LtxAPRulxQxj3AI/PsjSxu2B40vXHIVnq3v
        XdiYkbCW79MOSMxF1j9x32UOOshZXO8bM9iraOxFWfEuad4MJw==
X-Google-Smtp-Source: ABdhPJyLIEPgXfLPuK6Sk/IsdGlM+NRp75V6FhxV6srXnxhiCt2Fw0fRstmuSp6Xg0xPHOx+wd6+E5t2G49pYjcF+rw=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr156514pfb.7.1611850322451; Thu, 28 Jan
 2021 08:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20210128122123.25341-1-nikita.shubin@maquefel.me> <20210128122123.25341-2-nikita.shubin@maquefel.me>
In-Reply-To: <20210128122123.25341-2-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Jan 2021 18:11:46 +0200
Message-ID: <CAHp75VfBb5+K9cSAzj9EBD+KtswkHSNMZWoCaU=bKvOO3fXRjw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] gpio: gpio-ep93xx: fix BUG_ON port F usage
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 2:21 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> The port F is index 2 not 5.
>
> ------------[ cut here ]------------
> kernel BUG at drivers/gpio/gpio-ep93xx.c:64!

Perhaps you missed my message, please cut this to have only related
information and not be so noisy!

> Internal error: Oops - BUG: 0 [#1] ARM
> Modules linked in:
> CPU: 0 PID: 403 Comm: gpio-event-mon Not tainted 5.9.10-00011-ge93e9618628b-dirty #19
> Hardware name: Technologic Systems TS-72xx SBC
> PC is at ep93xx_gpio_update_int_params+0x1c/0x80
> LR is at ep93xx_gpio_update_int_params+0x14/0x80
> pc : [<c03abc44>] lr : [<c03abc3c>] psr: 20000093
> sp : c158de00 ip : 00000000 fp : 00000001
> r10: c44154d4 r9 : 00000000 r8 : c4415020
> r7 : c04ef884 r6 : c051c842 r5 : c4415020 r4 : 00000005
> r3 : 00000000 r2 : 00000000 r1 : c04eb768 r0 : 00000008
> Flags: nzCv IRQs off FIQs on Mode SVC_32 ISA ARM Segment none
> Control: 0000717f Table: 01684000 DAC: 00000051
> Process gpio-event-mon (pid: 403, stack limit = 0x(ptrval))
> Stack: (0xc158de00 to 0xc158e000)
> de00: 00000005 00000002 c051c842 c0238dc0 c0238c98 c0238c98 c04ef874 00000000
> de20: 00000003 c04fcfcc 60000013 c04ef910 c04ef8d4 c00456f0 c04ef874 c15f1e00
> de40: 00000000 00000000 00000001 c0045d40 c15f1e00 c4400160 c0044ca8 c04ef8a8
> de60: 60000013 00000000 c15f1e00 c04ef874 c04ef884 00000001 c0235d70 c158b800
> de80: be825f0f c0045ec8 00000003 c158b800 c440aa00 be825bc8 00000003 00000001
> dea0: 00000000 c0236f00 c44ed3a0 c158b800 c45c2015 00000000 00000001 00000003
> dec0: 6f697067 6576652d 6d2d746e 00006e6f 00000000 00000000 00000000 00000000
> dee0: be825df4 c00abb0c c440c500 c00aabd4 c440c500 c528b840 c45c2010 c04e1228
> df00: 00000ff0 c4478d28 c030b404 be825bc8 c1550e20 00000003 c1550e20 c00c3388
> df20: c4478d28 c00c3d48 be825f0f c00abd00 c45c2000 c45c2000 c1550e20 c00bfea8
> df40: 00000003 c00b0714 00000000 c4450000 00000004 00000100 00000001 c04e1228
> df60: c158dfb0 ffffff9c 000231f8 00000003 00000142 c00b085c 00000000 c04e1228
> df80: 00000000 be825f0f 00000003 00000003 00000036 c00083c4 c158c000 00000000
> dfa0: be825f0f c00081e0 be825f0f 00000003 00000003 c030b404 be825bc8 00000000
> dfc0: be825f0f 00000003 00000003 00000036 00000001 00000000 00022070 be825f0f
> dfe0: b6f2e4e0 be825bac 00010acc b6f2e4ec 60000010 00000003 00000000 00000000
> [<c03abc44>] (ep93xx_gpio_update_int_params) from [<c0238dc0>] (ep93xx_gpio_irq_type+0x128/0x1c0)
> [<c0238dc0>] (ep93xx_gpio_irq_type) from [<c00456f0>] (__irq_set_trigger+0x6c/0x128)
> [<c00456f0>] (__irq_set_trigger) from [<c0045d40>] (__setup_irq+0x594/0x678)
> [<c0045d40>] (__setup_irq) from [<c0045ec8>] (request_threaded_irq+0xa4/0x128)
> [<c0045ec8>] (request_threaded_irq) from [<c0236f00>] (gpio_ioctl+0x300/0x4d8)
> [<c0236f00>] (gpio_ioctl) from [<c00c3388>] (vfs_ioctl+0x24/0x3c)
> [<c00c3388>] (vfs_ioctl) from [<c00c3d48>] (sys_ioctl+0xbc/0x768)
> [<c00c3d48>] (sys_ioctl) from [<c00081e0>] (ret_fast_syscall+0x0/0x50)
> Exception stack(0xc158dfa8 to 0xc158dff0)
> dfa0: be825f0f 00000003 00000003 c030b404 be825bc8 00000000
> dfc0: be825f0f 00000003 00000003 00000036 00000001 00000000 00022070 be825f0f
> dfe0: b6f2e4e0 be825bac 00010acc b6f2e4ec
> Code: e59f0060 ebfff3e1 e3540002 9a000000 (e7f001f2)
> ---[ end trace 3f6544e133e9f5ae ]---
>
> Fixes: fd935fc421e74 ("gpio: ep93xx: Do not pingpong irq numbers")
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

...

> +/*
> + * F Port index in GPIOCHIP'S array is 5
> + * but we use index 2 for stored values and offsets
> + */
> +#define EP93XX_GPIO_F_PORT_INDEX 5

Hmm... Why not to use an array with holes instead.

...

> +       if (port == EP93XX_GPIO_F_PORT_INDEX)
> +               port = 2;

Sorry, but I'm not in favour of this as it adds confusion.
See above for the potential way to solve.

-- 
With Best Regards,
Andy Shevchenko
