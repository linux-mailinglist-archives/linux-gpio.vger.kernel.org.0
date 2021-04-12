Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFCE35C7A9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 15:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241756AbhDLNbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 09:31:05 -0400
Received: from gloria.sntech.de ([185.11.138.130]:48306 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241807AbhDLNbA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Apr 2021 09:31:00 -0400
Received: from [95.90.166.74] (helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lVwe5-0002K0-Lw; Mon, 12 Apr 2021 15:30:29 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Peter Geis <pgwipeout@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] gpio-rockchip driver
Date:   Mon, 12 Apr 2021 15:30:28 +0200
Message-ID: <2004066.IobQ9Gjlxr@diego>
In-Reply-To: <CAHp75Ve=1EbJ1qOjnTLKOwvv-UKLfxMHS-UUp=ET0zoJ9fV=ng@mail.gmail.com>
References: <20210411133030.1663936-1-pgwipeout@gmail.com> <CAHp75Ve=1EbJ1qOjnTLKOwvv-UKLfxMHS-UUp=ET0zoJ9fV=ng@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 12. April 2021, 14:13:37 CEST schrieb Andy Shevchenko:
> On Sun, Apr 11, 2021 at 4:35 PM Peter Geis <pgwipeout@gmail.com> wrote:
> >
> > Separate gpio driver from pinctrl driver, and support v2 controller.
> >
> > Tested on rk3566-quartz64 prototype board.
> 
> Can you give a bit more context?
> Usually separation means that hardware is represented by two different
> IP blocks that are (almost) independent to each other. Was it the case
> on the original platforms? Do you have different pin controller (or
> it's absent completely) on some new / old platform?

They are separate on all Rockchip SoCs.

I.e. the pinconfig (muxing, pulls, etc) is done via some registers inside
the "General Register Files" [area for misc registers]
and control for the gpio functionality is done in separate blocks
for each bank.

Lumping that stuff together into one driver, was a design-mistake
from younger-me back in 2013 ;-)


Heiko

> >
> > Patch History:
> > V2 - Rebase to latest linux-next.
> >
> > Tested-by: Peter Geis <pgwipeout@gmail.com>
> >
> > Jianqun Xu (7):
> >   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
> >   pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
> >   gpio: separate gpio driver from pinctrl-rockchip driver
> >   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
> >   gpio/rockchip: support next version gpio controller
> >   gpio/rockchip: always enable clock for gpio controller
> >   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
> >
> >  drivers/gpio/Kconfig               |   8 +
> >  drivers/gpio/Makefile              |   1 +
> >  drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
> >  drivers/pinctrl/pinctrl-rockchip.c | 911 +----------------------------
> >  drivers/pinctrl/pinctrl-rockchip.h | 287 +++++++++
> >  5 files changed, 1073 insertions(+), 892 deletions(-)
> >  create mode 100644 drivers/gpio/gpio-rockchip.c
> >  create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
> >
> > --
> > 2.25.1
> >
> 
> 
> 




