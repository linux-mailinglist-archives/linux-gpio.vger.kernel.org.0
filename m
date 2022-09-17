Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEC95BB69A
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 08:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiIQGJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 02:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIQGJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 02:09:35 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33801DB4
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 23:09:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id C7DA7900348;
        Sat, 17 Sep 2022 14:09:31 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 2/2] pinctrl: rockchip: get match data by device_get_match_data
Date:   Sat, 17 Sep 2022 14:09:29 +0800
Message-Id: <20220917060929.657778-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220917060929.657778-1-jay.xu@rock-chips.com>
References: <20220917060929.657778-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGU8aVh1MSEhDQxpCHUMdTlUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46Nww*ND0vHBpKCRQSEToK
        KxoaCQJVSlVKTU1ISEJPQkxJT0pLVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUhIT0s3Bg++
X-HM-Tid: 0a834a11015c2eafkusnc7da7900348
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch fixes to use device_get_match_data to get match data, instead
of of_match_node to adapt for the acpi.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
v2 RESEND:
- use fwnode instead of of node
- add a second patch to this serail

 drivers/pinctrl/pinctrl-rockchip.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 5b828798bfa5..0ecb84d8dd2a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3033,11 +3033,15 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 					      struct rockchip_pinctrl *info)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *child;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct device_node *np, *child;
 	int ret;
 	int i;
 
+	if (!is_of_node(fwnode))
+		return 0;
+
+	np = to_of_node(fwnode);
 	rockchip_pinctrl_child_count(info, np);
 
 	dev_dbg(dev, "nfunctions = %d\n", info->nfunctions);
@@ -3129,15 +3133,11 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 						struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
-	const struct of_device_id *match;
 	struct rockchip_pin_ctrl *ctrl;
 	struct rockchip_pin_bank *bank;
 	int grf_offs, pmu_offs, drv_grf_offs, drv_pmu_offs, i, j;
 
-	match = of_match_node(rockchip_pinctrl_dt_match, node);
-	ctrl = (struct rockchip_pin_ctrl *)match->data;
-
+	ctrl = (struct rockchip_pin_ctrl *)device_get_match_data(&pdev->dev);
 	grf_offs = ctrl->grf_mux_offset;
 	pmu_offs = ctrl->pmu_mux_offset;
 	drv_pmu_offs = ctrl->pmu_drv_offset;
@@ -3308,7 +3308,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	int ret, i;
 
 	if (is_of_node(fwnode)) {
-		ret = of_platform_populate(np, NULL, NULL, NULL);
+		ret = of_platform_populate(to_of_node(fwnode), NULL, NULL, NULL);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register gpio device\n");
 	}
-- 
2.25.1

