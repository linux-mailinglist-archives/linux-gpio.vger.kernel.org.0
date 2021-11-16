Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BE7452B2D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 07:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhKPGtd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 01:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhKPGt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 01:49:29 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4D0C061570;
        Mon, 15 Nov 2021 22:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=HjTfbnyLEWqf7wlM5iLYLNzwk3sphwsrakixHm4TYKg=; b=uZ8HS5NEk7RjEopFyCl7ddZk8k
        bTkzK1fpUGcSN1BqSwsrtjLrsos8vdUH2P9T0yGU5fKzKae0xYZkd8/h0JQ4m+uSOawAhIkw+blQO
        fyGbiPhhg9CRjlhVQfjmZVLY1cB8xns7UvS13bf+YXZEhFKslX3KjrCUSz8JfwBlDM5Mw0T4X+CuD
        bqNeGds/Z+Iy9bvmzjrfWh2uPIncLTRgPSADP8LWT8mv2DLCmI7FLPlLC4MlyzbnuxPMQUryh6bW5
        5I7vnEwYeRKK0AZuzDJIlC9cLF8yodk4JFldrJUYzaBMnzWsxLfykRdF+fteK+qyqT7HNMrLHX5gQ
        +RDZvbYw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mmsEe-000TaG-JV; Tue, 16 Nov 2021 06:46:28 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio/rockchip: needs GENERIC_IRQ_CHIP to fix build errors
Date:   Mon, 15 Nov 2021 22:46:27 -0800
Message-Id: <20211116064627.27115-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpio-rockchip uses interfaces that are provided by the Kconfig
symbol GENERIC_IRQ_CHIP, so the driver should select that symbol
in order to prevent build errors.

Fixes these build errors (and more):

aarch64-linux-ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_irq_disable':
gpio-rockchip.c:(.text+0x454): undefined reference to `irq_gc_mask_set_bit'
aarch64-linux-ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_irq_enable':
gpio-rockchip.c:(.text+0x478): undefined reference to `irq_gc_mask_clr_bit'
aarch64-linux-ld: drivers/gpio/gpio-rockchip.o: in function `rockchip_interrupts_register':
gpio-rockchip.c:(.text+0x518): undefined reference to `irq_generic_chip_ops'
aarch64-linux-ld: gpio-rockchip.c:(.text+0x594): undefined reference to `__irq_alloc_domain_generic_chips'
aarch64-linux-ld: gpio-rockchip.c:(.text+0x5cc): undefined reference to `irq_get_domain_generic_chip'
aarch64-linux-ld: gpio-rockchip.c:(.text+0x5e0): undefined reference to `irq_gc_ack_set_bit'
aarch64-linux-ld: gpio-rockchip.c:(.text+0x604): undefined reference to `irq_gc_set_wake'

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20211116.orig/drivers/gpio/Kconfig
+++ linux-next-20211116/drivers/gpio/Kconfig
@@ -523,6 +523,7 @@ config GPIO_REG
 config GPIO_ROCKCHIP
 	tristate "Rockchip GPIO support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select GENERIC_IRQ_CHIP
 	select GPIOLIB_IRQCHIP
 	default ARCH_ROCKCHIP
 	help
