Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8776F445682
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 16:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhKDPoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 11:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhKDPoQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 11:44:16 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E0DC061714;
        Thu,  4 Nov 2021 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=tzR1bzDNHCL2xV55dg6t9T/nvYHiJSyDmOp1Hab1RAs=; b=OlfEnUoHiQPn2iXeER+unFtYQd
        OFLMsPIjQGxjVUS0LlQqrzuLTz5xYaUxz86Bk49l/PnHmbkG87jrHRWTjXtLwnXOXI8INIVuz+KLp
        6dnn4JUvTnQDZQjxk1pBme81J8XgETznFg0lY4Lx/e3h+2AgaEakEVjPorxMXJqVzab08XDJ1s032
        EiQftayVJjDO9hswhucaNiE9+Dr20OUsIz/OuqOr8Zj48QtU1+Du1VOI1UZ3hh7ZDHOh5SgHviQBt
        SEtS6YH21/lPQKcHsdZ7pNjUH7yVKIBlW0Db16x/DPjDZqZeIaIaAHEJ3wX4v4yIYUKJ5yy7L67Rl
        fi3GchlQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mierw-009Hvk-1d; Thu, 04 Nov 2021 15:41:36 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: [PATCH] gpio/rockchip: fix Kconfig to prevent build errors
Date:   Thu,  4 Nov 2021 08:41:35 -0700
Message-Id: <20211104154135.2119-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO_ROCKCHIP needs to enable GENERIC_IRQ_CHIP to prevent build errors.

Eliminates these build errors:
ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_irq_disable':
gpio-rockchip.c:(.text+0x6c9): undefined reference to `irq_gc_mask_set_bit'
ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_irq_enable':
gpio-rockchip.c:(.text+0x709): undefined reference to `irq_gc_mask_clr_bit'
ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_gpio_probe':
gpio-rockchip.c:(.text+0xe25): undefined reference to `irq_generic_chip_ops'
ld: gpio-rockchip.c:(.text+0xe7e): undefined reference to `__irq_alloc_domain_generic_chips'
ld: gpio-rockchip.c:(.text+0xeb9): undefined reference to `irq_get_domain_generic_chip'
ld: gpio-rockchip.c:(.text+0xf04): undefined reference to `irq_gc_ack_set_bit'
ld: gpio-rockchip.c:(.text+0xf0e): undefined reference to `irq_gc_mask_set_bit'
ld: gpio-rockchip.c:(.text+0xf18): undefined reference to `irq_gc_mask_clr_bit'
ld: gpio-rockchip.c:(.text+0xf36): undefined reference to `irq_gc_set_wake'

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jianqun Xu <jay.xu@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20211104.orig/drivers/gpio/Kconfig
+++ linux-next-20211104/drivers/gpio/Kconfig
@@ -524,6 +524,7 @@ config GPIO_ROCKCHIP
 	tristate "Rockchip GPIO support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
+	select GENERIC_IRQ_CHIP
 	default ARCH_ROCKCHIP
 	help
 	  Say yes here to support GPIO on Rockchip SoCs.
