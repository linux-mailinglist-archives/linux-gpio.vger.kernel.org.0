Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFC8220EF2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 16:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgGOOOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 10:14:07 -0400
Received: from pi.codeconstruct.com.au ([103.231.89.101]:35654 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgGOOOG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 10:14:06 -0400
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jul 2020 10:14:04 EDT
Received: by codeconstruct.com.au (Postfix, from userid 20001)
        id A1AB340172; Wed, 15 Jul 2020 10:06:30 -0400 (EDT)
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] gpio/aspeed-sgpio: don't enable all interrupts by default
Date:   Wed, 15 Jul 2020 21:54:18 +0800
Message-Id: <20200715135418.3194860-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715135418.3194860-1-jk@codeconstruct.com.au>
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, the IRQ setup for the SGPIO driver enables all interrupts for
dual-edge trigger mode. Since the default handler is handle_bad_irq, any
state change on input GPIOs will trigger bad IRQ warnings.

This change applies sensible (disabled) IRQ defaults.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 927d46f159b8..23a3a40901d6 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -451,9 +451,7 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 		/* trigger type is edge */
 		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
 		/* dual edge trigger mode. */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_type2));
-		/* enable irq */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_enable));
+		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
 	}
 
 	return 0;
-- 
2.27.0

