Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1012ACF93
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 07:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgKJGXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 01:23:06 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:34524 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726006AbgKJGXG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 01:23:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.7373277|0.8969188;CH=green;DM=|SPAM|false|;DS=CONTINUE|ham_system_inform|0.0234519-0.000501654-0.976046;FP=9760415410618500791|1|1|17|0|-1|-1|-1;HT=ay29a033018047208;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.Iuo2IDa_1604989377;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.Iuo2IDa_1604989377)
          by smtp.aliyun-inc.com(10.147.42.198);
          Tue, 10 Nov 2020 14:23:01 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     tiny.windzz@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Yangtao Li <frank@allwinnertech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [RESEND PATCH 01/19] pinctrl: sunxi: fix irq bank map for the Allwinner A100 pin controller
Date:   Tue, 10 Nov 2020 14:22:55 +0800
Message-Id: <9db51667bf9065be55beafd56e5c319e3bbe8310.1604988979.git.frank@allwinnertech.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604988979.git.frank@allwinnertech.com>
References: <cover.1604988979.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yangtao Li <frank@allwinnertech.com>

A100's pin starts with PB, so it should start with 1.

Fixes: 473436e7647d6 ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")
Signed-off-by: Yangtao Li <frank@allwinnertech.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
index 19cfd1e76ee2..e69f6da40dc0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
@@ -677,7 +677,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 19)),
 };
 
-static const unsigned int a100_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6};
+static const unsigned int a100_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7};
 
 static const struct sunxi_pinctrl_desc a100_pinctrl_data = {
 	.pins = a100_pins,
-- 
2.28.0

