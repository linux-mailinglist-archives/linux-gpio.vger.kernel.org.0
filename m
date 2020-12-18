Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33222DE71D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 17:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbgLRQCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Dec 2020 11:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgLRQCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2020 11:02:22 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46303C06138C;
        Fri, 18 Dec 2020 08:01:42 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id j1so1635546pld.3;
        Fri, 18 Dec 2020 08:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kdhRqI/BEp6A9Y3itWAvkzj42aOw+qxe3o4UvhUzO2c=;
        b=nBtlnt0YZCdhNgp2AwY1ZTgERaxW949bJa4cRB7Tj4RRl3wPk7UQOoFysxLqp34Lht
         W17XbcjNxj2MczWVlPTxczeszRf/NrqmJFRg3tfYAwRUUJTRz8FZ/UYljmsK6AL8M4//
         U79dXgsAs7p3OulI7OHKbHqjZu1wj504DOi/4dthUIAgs9DMg91eyOBMAu5js4GxiNQi
         bW5T76VhtDNPDAV6UcInsyKQRbU/EKfQK1sPudQPZeYZnMPKIeXb4CSnwStXb0+7VkGp
         B8JhgSQNhNh3k59xasBAAL4UX0k3sgBEsi/Gx8dYUnyyoMQ5MXjuCUW/Ixg9S6mDT6tL
         qEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kdhRqI/BEp6A9Y3itWAvkzj42aOw+qxe3o4UvhUzO2c=;
        b=P5iTMAmJKH5ryCxhUYwqhClW8WKRppky87zl7j518ZUSeiQu1UagAUiW93TR9c19V6
         ej1+WIS1POvmC3U61YD3pQ/hpbdV3aizM6gCMEsIw+mQNNxQQFLASLTSjZxDcuOvapzp
         p+6WkCiMrDipQye06kZtNbztUEd8IZY+bofo+dhjMlhtKKhCVA7yf4qhCn+IoHx0yy6I
         N669n+egMiswuPS+VPxImg1MiKY1WjCyirqVTbMEwnkKOYqEXa27hIKAfru62tl2dX+b
         I+IsJI5/Pigj9sbpWtXpiMCvIT82+Xgi16knwntt0+p5AUyUqR8VAW8Cm/BM/Czi7xWj
         hSxQ==
X-Gm-Message-State: AOAM5311EinIR5IaVtQJcpt99+JJOfoksLbjgav0GGTOOgn0fXGX7659
        sKTSn80sK9pDTGya1s0IvhmXUadJrJgdo4nN0XZP3FkbKjg=
X-Google-Smtp-Source: ABdhPJzF7pTrDH4y0XKfT25f9aRZNUmpvp+v8GMT67qgvOWwFHE8iGpY2OIeW9ARjpmyYW++1w42XzS/t+wQMOoSjPE=
X-Received: by 2002:a17:902:c244:b029:da:e63c:cede with SMTP id
 4-20020a170902c244b02900dae63ccedemr5078018plg.0.1608307301846; Fri, 18 Dec
 2020 08:01:41 -0800 (PST)
MIME-Version: 1.0
References: <20201218045134.4158709-1-drew@beagleboard.org>
In-Reply-To: <20201218045134.4158709-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Dec 2020 18:01:25 +0200
Message-ID: <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 18, 2020 at 6:52 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> BeagleBoard.org [0] currently uses an out-of-tree driver called
> bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.
> The driver assists users of our BeagleBone and PocketBeagle boards in
> rapid prototyping by allowing them to change at run-time between defined
> set of pinctrl states [3] for each pin on the expansion connectors [4].
> This is achieved by exposing a 'state' file in sysfs for each pin which
> is used by our 'config-pin' utility [5].
>
> Our goal is to eliminate all out-of-tree drivers for BeagleBoard.org
> boards and thus I have been working to replace bone-pinmux-helper with a
> new driver that could be acceptable upstream. My understanding is that
> debugfs, unlike sysfs, could be the appropriate mechanism to expose such
> functionality.

No objections here.

> I used the compatible string "pinctrl,state-helper" but would appreciate
> advice on how to best name this. Should I create a new vendor prefix?

Here is the first concern. Why does this require to be a driver with a
compatible string?

> The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
> The driver would create the corresponding pinctrl state file in debugfs
> for the pin.  Here is an example of how the state can be read and
> written from userspace:
>
> root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> default
> root@beaglebone:~# echo pwm > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> root@beaglebone:~# cat /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P9_14_pinmux/state
> pwm
>
> I would very much appreciate feedback on both this general concept, and
> also specific areas in which the code should be changed to be acceptable
> upstream.

Two more concerns:
 - why is it OF only?
 - why has it been separated from pin control per device debug folder?


> [0] http://beagleboard.org/latest-images
> [1] https://github.com/beagleboard/linux/blob/5.4/drivers/misc/cape/beaglebone/bone-pinmux-helper.c
> [2] https://github.com/RobertCNelson/linux-dev/blob/master/patches/drivers/ti/gpio/0001-BeagleBone-pinmux-helper.patch
> [3] https://github.com/beagleboard/BeagleBoard-DeviceTrees/blob/v5.4.x-ti-overlays/src/arm/am335x-bone-common-univ.dtsi#L2084
> [4] https://github.com/beagleboard/beaglebone-black/wiki/System-Reference-Manual#section-7-1
> [5] https://github.com/beagleboard/bb.org-overlays/blob/master/tools/beaglebone-universal-io/config-pin

--
With Best Regards,
Andy Shevchenko
