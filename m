Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF91259AD2A
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Aug 2022 12:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344474AbiHTKQr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Aug 2022 06:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiHTKQq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Aug 2022 06:16:46 -0400
X-Greylist: delayed 582 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 20 Aug 2022 03:16:45 PDT
Received: from mail-m11885.qiye.163.com (mail-m11885.qiye.163.com [115.236.118.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBB5CD0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Aug 2022 03:16:45 -0700 (PDT)
Received: from localhost (unknown [103.29.142.67])
        by mail-m11885.qiye.163.com (Hmail) with ESMTPA id A28F04C0309;
        Sat, 20 Aug 2022 18:07:02 +0800 (CST)
From:   Jeffy Chen <jeffy.chen@rock-chips.com>
To:     Heiko Stuebner <heiko@sntech.de>,
        Doug Anderson <dianders@chromium.org>
Cc:     Jeffy Chen <jeffy.chen@rock-chips.com>,
        linux-rockchip@lists.infradead.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] gpio/rockchip: Toggle edge trigger mode after acking
Date:   Sat, 20 Aug 2022 17:59:33 +0800
Message-Id: <20220820095933.20234-2-jeffy.chen@rock-chips.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220820095933.20234-1-jeffy.chen@rock-chips.com>
References: <20220820095933.20234-1-jeffy.chen@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUNOVk0eH0pLSk5NTE5IH1UTARMWGhIXJBQOD1
        lXWRgSC1lBWUpLSFVJQlVKT0lVTUxZV1kWGg8SFR0UWUFZT0tIVUpISkJITVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6Dxw4ST0rCRUyD1YzHAo#
        ORkKC1ZVSlVKTU1LQkJLS0lISktPVTMWGhIXVREeHR0CVRgTHhU7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlOSUg3Bg++
X-HM-Tid: 0a82bab864142eb9kusna28f04c0309
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Otherwise the trigger mode might be out-of-sync when a level change
occurred in between.

Fixes: 53b1bfc76df2 ("pinctrl: rockchip: Avoid losing interrupts when supporting both edges")
Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

 drivers/gpio/gpio-rockchip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index a98351cd6821..736b4d90f1ca 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -338,7 +338,7 @@ static void rockchip_irq_demux(struct irq_desc *desc)
 		irq = __ffs(pend);
 		pend &= ~BIT(irq);
 
-		dev_dbg(bank->dev, "handling irq %d\n", irq);
+		generic_handle_domain_irq(bank->domain, irq);
 
 		/*
 		 * Triggering IRQ on both rising and falling edge
@@ -370,8 +370,6 @@ static void rockchip_irq_demux(struct irq_desc *desc)
 						     bank->gpio_regs->ext_port);
 			} while ((data & BIT(irq)) != (data_old & BIT(irq)));
 		}
-
-		generic_handle_domain_irq(bank->domain, irq);
 	}
 
 	chained_irq_exit(chip, desc);
-- 
2.20.1

