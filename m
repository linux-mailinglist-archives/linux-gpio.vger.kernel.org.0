Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C44B2F2A00
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 09:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405363AbhALI2w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 03:28:52 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:33013 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725988AbhALI2w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Jan 2021 03:28:52 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0ULVUsv2_1610440082;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0ULVUsv2_1610440082)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 12 Jan 2021 16:28:09 +0800
From:   YANG LI <abaci-bugfix@linux.alibaba.com>
To:     linus.walleij@linaro.org
Cc:     orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        linhua.xu@unisoc.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        YANG LI <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] pinctrl: sprd: style: Simplify bool comparison
Date:   Tue, 12 Jan 2021 16:28:00 +0800
Message-Id: <1610440080-68600-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following coccicheck warning:
./drivers/pinctrl/sprd/pinctrl-sprd.c:690:8-23: WARNING: Comparison to
bool

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
---
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

