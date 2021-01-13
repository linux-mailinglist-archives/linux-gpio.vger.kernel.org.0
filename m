Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C3B2F42A3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 04:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbhAMDo1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 22:44:27 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:47021 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725536AbhAMDo1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Jan 2021 22:44:27 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0ULZwgN0_1610509396;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0ULZwgN0_1610509396)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Jan 2021 11:43:38 +0800
From:   Yang Li <abaci-bugfix@linux.alibaba.com>
To:     baolin.wang7@gmail.com
Cc:     orsonzhai@gmail.com, linus.walleij@linaro.org,
        zhang.lyra@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH v2] pinctrl: sprd: Simplify bool comparison
Date:   Wed, 13 Jan 2021 11:43:15 +0800
Message-Id: <1610509395-107554-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following coccicheck warning:
./drivers/pinctrl/sprd/pinctrl-sprd.c:690:8-23: WARNING: Comparison to
bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
---
Changes in v2:
    - make "pinctrl: sprd:" as subject prefix

 drivers/pinctrl/sprd/pinctrl-sprd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 08dc193..dca7a50 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -687,7 +687,7 @@ static int sprd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
 				shift = INPUT_SCHMITT_SHIFT;
 				break;
 			case PIN_CONFIG_BIAS_PULL_UP:
-				if (is_sleep_config == true) {
+				if (is_sleep_config) {
 					val |= SLEEP_PULL_UP;
 					mask = SLEEP_PULL_UP_MASK;
 					shift = SLEEP_PULL_UP_SHIFT;
-- 
1.8.3.1

