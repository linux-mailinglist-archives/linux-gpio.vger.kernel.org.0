Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFBB2FCB82
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 08:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbhATHaL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 02:30:11 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:53821 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726509AbhATHaJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 02:30:09 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UMJjrIa_1611127758;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMJjrIa_1611127758)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 15:29:23 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] pinctrl: qcom: spmi-gpio: Assign boolean values to a bool variable
Date:   Wed, 20 Jan 2021 15:29:17 +0800
Message-Id: <1611127757-52999-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:340:3-15: WARNING:
Assignment of 0/1 to bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index b5949f7..eb0b60c 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -331,13 +331,13 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_BIAS_DISABLE:
 			pin->bias = PM8XXX_GPIO_BIAS_NP;
 			banks |= BIT(2);
-			pin->disable = 0;
+			pin->disable = false;
 			banks |= BIT(3);
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			pin->bias = PM8XXX_GPIO_BIAS_PD;
 			banks |= BIT(2);
-			pin->disable = 0;
+			pin->disable = false;
 			banks |= BIT(3);
 			break;
 		case PM8XXX_QCOM_PULL_UP_STRENGTH:
@@ -350,11 +350,11 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
 		case PIN_CONFIG_BIAS_PULL_UP:
 			pin->bias = pin->pull_up_strength;
 			banks |= BIT(2);
-			pin->disable = 0;
+			pin->disable = false;
 			banks |= BIT(3);
 			break;
 		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
-			pin->disable = 1;
+			pin->disable = true;
 			banks |= BIT(3);
 			break;
 		case PIN_CONFIG_INPUT_ENABLE:
-- 
1.8.3.1

