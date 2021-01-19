Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96492FB172
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 07:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbhASGao (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 01:30:44 -0500
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:48368 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbhASG37 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 01:29:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1089962|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00400365-0.000545466-0.995451;FP=11637145905088366247|1|1|1|0|-1|-1|-1;HT=ay29a033018047203;MF=liu.xiang@zlingsmart.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.JMd8d.7_1611037752;
Received: from localhost(mailfrom:liu.xiang@zlingsmart.com fp:SMTPD_---.JMd8d.7_1611037752)
          by smtp.aliyun-inc.com(10.194.97.246);
          Tue, 19 Jan 2021 14:29:12 +0800
From:   Liu Xiang <liu.xiang@zlingsmart.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, liuxiang_1999@126.com,
        Liu Xiang <liu.xiang@zlingsmart.com>
Subject: [PATCH] pinctrl: sunxi: fix use-after-free in sunxi_pmx_free()
Date:   Tue, 19 Jan 2021 14:29:08 +0800
Message-Id: <20210119062908.20169-1-liu.xiang@zlingsmart.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When CONFIG_REGULATOR is not set, sunxi_pmx_request() always return
success. Even a group of pins call sunxi_pmx_request(), the refcount
is only 1. This can cause a use-after-free warning in sunxi_pmx_free().
To solve this problem, go to err path if regulator_get() return NULL
or error.

Signed-off-by: Liu Xiang <liu.xiang@zlingsmart.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index dc8d39ae0..d1a8974eb 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -777,7 +777,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
 	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg)) {
+	if (IS_ERR_OR_NULL(reg)) {
 		dev_err(pctl->dev, "Couldn't get bank P%c regulator\n",
 			'A' + bank);
 		return PTR_ERR(reg);
@@ -811,7 +811,7 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
-	if (!refcount_dec_and_test(&s_reg->refcount))
+	if (!s_reg->regulator || !refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
 	regulator_disable(s_reg->regulator);
-- 
2.17.1

