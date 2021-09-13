Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B40B640A10B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 00:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350122AbhIMWxk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 18:53:40 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51186 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349679AbhIMWvB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Sep 2021 18:51:01 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=localhost.localdomain)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mPulW-0003SX-C6; Tue, 14 Sep 2021 00:49:30 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     heiko@sntech.de, jay.xu@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] gpio/rockchip: fix get_direction value handling
Date:   Tue, 14 Sep 2021 00:49:24 +0200
Message-Id: <20210913224926.1260726-3-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210913224926.1260726-1-heiko@sntech.de>
References: <20210913224926.1260726-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function uses the newly introduced rockchip_gpio_readl_bit()
which directly returns the actual value of the requeste bit.
So using the existing bit-wise check for the bit inside the value
will always return 0.

Fix this by dropping the bit manipulation on the result.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpio/gpio-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 16d9bf7188e3..3335bd57761d 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -141,7 +141,7 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip,
 	u32 data;
 
 	data = rockchip_gpio_readl_bit(bank, offset, bank->gpio_regs->port_ddr);
-	if (data & BIT(offset))
+	if (data)
 		return GPIO_LINE_DIRECTION_OUT;
 
 	return GPIO_LINE_DIRECTION_IN;
-- 
2.29.2

