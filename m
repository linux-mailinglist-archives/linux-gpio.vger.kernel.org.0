Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1BF3EB1BA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 09:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239380AbhHMHlW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 03:41:22 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:43134 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239573AbhHMHlS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Aug 2021 03:41:18 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UirWlCO_1628840427;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UirWlCO_1628840427)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 13 Aug 2021 15:40:50 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     geert+renesas@glider.be
Cc:     linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] pinctrl: renesas: Remove unneeded semicolon
Date:   Fri, 13 Aug 2021 15:40:13 +0800
Message-Id: <1628840413-21880-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/pinctrl/renesas/pinctrl-rzg2l.c:1124:2-3: Unneeded semicolon.
./drivers/pinctrl/renesas/pinctrl-rzg2l.c:1114:2-3: Unneeded semicolon.
./drivers/pinctrl/renesas/pinctrl-rzg2l.c:1080:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9efe3f2..dbf2f52 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1077,7 +1077,7 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 	if (ret) {
 		dev_err(pctrl->dev, "failed to add GPIO chip: %i\n", ret);
 		return ret;
-	};
+	}
 
 	return 0;
 }
@@ -1111,7 +1111,7 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 		ret = PTR_ERR(pctrl->clk);
 		dev_err(pctrl->dev, "failed to get GPIO clk : %i\n", ret);
 		return ret;
-	};
+	}
 
 	spin_lock_init(&pctrl->lock);
 
@@ -1121,7 +1121,7 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(pctrl->dev, "failed to enable GPIO clk: %i\n", ret);
 		return ret;
-	};
+	}
 
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_pinctrl_clk_disable,
 				       pctrl->clk);
-- 
1.8.3.1

