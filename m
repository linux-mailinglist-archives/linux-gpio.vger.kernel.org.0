Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF24F345F05
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 14:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhCWNKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 09:10:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:43948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231301AbhCWNKH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 09:10:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56F1E619A9;
        Tue, 23 Mar 2021 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616505007;
        bh=O4d9mf5szkECVTZN9/wTulI82KmEbZJBxSHDoo1NfVM=;
        h=From:To:Cc:Subject:Date:From;
        b=C6veXxYDJwBTQanhhUpTW9g9vm/HSOPq1531lBlzKzG4zxyUfeFDKdtHUU096V+NT
         m6yKKo9YjY0O4+WyebJT3//quh8i5siaRTJoKP9gPAjMIIW57wdZsBd7tSsuAUbcXy
         oAnosuyJCo9TkoRK9yF5gN7lFpv7MRah3d6OLav29uAG+ysOLKjrGxAOOP09KfRUzx
         4qEigzxHv2wdUXIvCL3fiuWDlMEumxvahxXDxTxsSCZbJxABl2odpbaReWw9kjBlAJ
         iU1bu1ddgv4vRWAoRHdyghSIpBXO1cQcIpb8RUgigQIKII30vBOBfC2DxxKP5++SP+
         TP265wlZYQyMA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: microchip: fix array overflow
Date:   Tue, 23 Mar 2021 14:09:51 +0100
Message-Id: <20210323131002.2418896-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Building with 'make W=1' shows an array overflow:

drivers/pinctrl/pinctrl-microchip-sgpio.c: In function 'microchip_sgpio_irq_settype':
drivers/pinctrl/pinctrl-microchip-sgpio.c:154:39: error: array subscript 10 is above array bounds of 'const u8[10]' {aka 'const unsigned char[10]'} [-Werror=array-bounds]
  154 |  u32 regoff = priv->properties->regoff[rno] + off;
      |               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
drivers/pinctrl/pinctrl-microchip-sgpio.c:55:5: note: while referencing 'regoff'
   55 |  u8 regoff[MAXREG];
      |     ^~~~~~

It's not clear to me what was meant here, my best guess is that the
offset should have been applied to the third argument instead of the
second.

Fixes: be2dc859abd4 ("pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index f35edb0eac40..4740613cdd03 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -572,7 +572,7 @@ static void microchip_sgpio_irq_settype(struct irq_data *data,
 	/* Type value spread over 2 registers sets: low, high bit */
 	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER, addr.bit,
 			 BIT(addr.port), (!!(type & 0x1)) << addr.port);
-	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER + SGPIO_MAX_BITS, addr.bit,
+	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER, addr.bit + SGPIO_MAX_BITS,
 			 BIT(addr.port), (!!(type & 0x2)) << addr.port);
 
 	if (type == SGPIO_INT_TRG_LEVEL)
-- 
2.29.2

