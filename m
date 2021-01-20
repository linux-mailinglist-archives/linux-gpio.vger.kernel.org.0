Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010A22FCBEC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 08:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbhATHoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 02:44:04 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:36806 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728852AbhATHoD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 02:44:03 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UMJS1pF_1611128583;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMJS1pF_1611128583)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 15:43:06 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] pinctrl: nomadik: Assign boolean values to a bool variable
Date:   Wed, 20 Jan 2021 15:43:01 +0800
Message-Id: <1611128581-73345-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/pinctrl/nomadik/pinctrl-nomadik.c:1397:6-16: WARNING:
Assignment of 0/1 to bool variable.

./drivers/pinctrl/nomadik/pinctrl-nomadik.c:1380:4-14: WARNING:
Assignment of 0/1 to bool variable.

./drivers/pinctrl/nomadik/pinctrl-nomadik.c:1370:6-16: WARNING:
Assignment of 0/1 to bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index d4ea108..770cbf7 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1367,7 +1367,7 @@ static const char *nmk_find_pin_name(struct pinctrl_dev *pctldev, const char *pi
 static bool nmk_pinctrl_dt_get_config(struct device_node *np,
 		unsigned long *configs)
 {
-	bool has_config = 0;
+	bool has_config = false;
 	unsigned long cfg = 0;
 	int i, val, ret;
 
@@ -1377,7 +1377,7 @@ static bool nmk_pinctrl_dt_get_config(struct device_node *np,
 		if (ret != -EINVAL) {
 			if (nmk_dt_pin_config(i, val, &cfg) == 0) {
 				*configs |= cfg;
-				has_config = 1;
+				has_config = true;
 			}
 		}
 	}
@@ -1394,7 +1394,7 @@ static int nmk_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	int ret;
 	const char *function = NULL;
 	unsigned long configs = 0;
-	bool has_config = 0;
+	bool has_config = false;
 	struct property *prop;
 	struct device_node *np_config;
 
-- 
1.8.3.1

