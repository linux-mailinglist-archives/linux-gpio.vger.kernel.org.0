Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765F475B0D6
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjGTOIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjGTOIa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:08:30 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76E07211F
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=Tc8ki60neDbZDKDXdc
        pEuHUnrcBvO3cBQjJ/0Y/pqsU=; b=mo6vnc3AiNGmmNKOhkfNbt9zFy8fiow2oy
        kXoEDMopeZZkNWVjgLM8lQUGJFvwSzfAH4qsiO2va9Oi/vVrLjhOR7TxiILk2QAT
        xUbxAjeEfRtvRXciumzyFDVek73RPnKeHHsCNvL1nMY3NCtxn7Hi64p0GBhf6Y/d
        vh2Sdgf0I=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wB37nrFP7lknINKAw--.14425S4;
        Thu, 20 Jul 2023 22:08:11 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-gpio@vger.kernel.org
Cc:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] pinctrl: mvebu: use devm_clk_get_enabled() in dove_pinctrl_probe()
Date:   Thu, 20 Jul 2023 22:08:03 +0800
Message-Id: <20230720140803.33174-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wB37nrFP7lknINKAw--.14425S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw13Kr1ftr4xCFy8Zr4xWFg_yoWkuwb_ua
        yxAryftry3Wr18Xryjyw4rZFWIkF4kur10gr1vvFWakFy7Xw1DK397ursxCws7Ww47Jr98
        GFyUZFWfC34fAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRBMKPUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiJw6y5V5vE1q+SwABsy
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

in dove_pinctrl_probe(), the return value of function
clk_prepare_enable() should be checked, since it may fail.
using devm_clk_get_enabled() instead of devm_clk_get() and
clk_prepare_enable() can avoid this problem.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/pinctrl/mvebu/pinctrl-dove.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
index 545486d98532..bcd72fef4c85 100644
--- a/drivers/pinctrl/mvebu/pinctrl-dove.c
+++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
@@ -777,12 +777,11 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	 * General MPP Configuration Register is part of pdma registers.
 	 * grab clk to make sure it is ticking.
 	 */
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Unable to get pdma clock");
 		return PTR_ERR(clk);
 	}
-	clk_prepare_enable(clk);
 
 	mpp_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, mpp_res);
-- 
2.17.1

