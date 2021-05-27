Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959D8392A15
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhE0IwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 04:52:19 -0400
Received: from gloria.sntech.de ([185.11.138.130]:35124 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235736AbhE0IwI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 04:52:08 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lmBiq-0006sp-Le; Thu, 27 May 2021 10:50:32 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH v5 0/7] gpio-rockchip driver
Date:   Thu, 27 May 2021 10:50:32 +0200
Message-ID: <3546107.C4sosBPzcN@diego>
In-Reply-To: <20210527071239.1424430-1-jay.xu@rock-chips.com>
References: <20210527071239.1424430-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jay,

Am Donnerstag, 27. Mai 2021, 09:12:32 CEST schrieb Jianqun Xu:
> Separate gpio driver from pinctrl driver, and support v2 controller.
> 
> Jianqun Xu (7):
>   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
>   pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
>   gpio: separate gpio driver from pinctrl-rockchip driver
>   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
>   gpio/rockchip: support next version gpio controller
>   gpio/rockchip: always enable clock for gpio controller
>   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type

You did want to pick the
	"dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank"
patch from the rk3568 dt series to here.
The binding is part of the gpio-driver area, so should be part
of this series.

Heiko


> 
>  drivers/gpio/Kconfig               |   8 +
>  drivers/gpio/Makefile              |   1 +
>  drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.c | 910 +----------------------------
>  drivers/pinctrl/pinctrl-rockchip.h | 287 +++++++++
>  5 files changed, 1073 insertions(+), 891 deletions(-)
>  create mode 100644 drivers/gpio/gpio-rockchip.c
>  create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
> 
> 




