Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB45C2F764A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 11:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbhAOKKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 05:10:04 -0500
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:54795 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728287AbhAOKKD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Jan 2021 05:10:03 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0ULo2FI1_1610705350;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0ULo2FI1_1610705350)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 15 Jan 2021 18:09:14 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     rjui@broadcom.com
Cc:     sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] drivers/pinctrl/bcm: Simplify bool comparison
Date:   Fri, 15 Jan 2021 18:09:09 +0800
Message-Id: <1610705349-24310-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the follow coccicheck warnings:

./drivers/pinctrl/bcm/pinctrl-ns2-mux.c:856:29-38: WARNING:
Comparison to bool.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 57044ab..0fe4a1f 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -853,7 +853,7 @@ static int ns2_pin_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
 		ns2_pin_get_pull(pctldev, pin, &pull_up, &pull_down);
-		if ((pull_up == false) && (pull_down == false))
+		if (!pull_up && !pull_down)
 			return 0;
 		else
 			return -EINVAL;
-- 
1.8.3.1

