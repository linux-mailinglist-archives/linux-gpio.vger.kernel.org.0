Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 071234CD0CA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Mar 2022 10:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236686AbiCDJHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Mar 2022 04:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbiCDJG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Mar 2022 04:06:28 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0FE18C7AE
        for <linux-gpio@vger.kernel.org>; Fri,  4 Mar 2022 01:05:28 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id 8C1CC1DFEB0;
        Fri,  4 Mar 2022 17:05:26 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/3] gpio: rockchip: get pinctrl node from 'gpio-ranges' property
Date:   Fri,  4 Mar 2022 17:05:22 +0800
Message-Id: <20220304090523.1748297-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304090523.1748297-1-jay.xu@rock-chips.com>
References: <20220304090523.1748297-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRpPHxpWHUlIGU4eQh
        odSU1CVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBA6Qzo6Ez5PDT9OFxkdLAss
        GDowFCtVSlVKTU9NSENPTElNQkpKVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUlDS083Bg++
X-HM-Tid: 0a7f542d429fda2bkuws8c1cc1dfeb0
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The dt nodes for rockchip soc designes as

    pinctrl: pinctrl {
        gpio {
	};
    };

Currently, we get the pinctrl dt node from parent of gpio, this patch
try to get pinctrl dt node from 'gpio-ranges' property.

After this patch, the dt nodes possible to be

    gpio {
        gpio-ranges = <&pinctrl xxx>;
    };

    pinctrl: pinctrl {
    };

then the gpio driver could register as platform device itself, but not
populate from pinctrl driver.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 1da0324445cc..46c54dff92db 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -690,6 +690,9 @@ rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
 	int i, found = 0;
 
 	info = pinctrl_dev_get_drvdata(pctldev);
+	if (!info)
+		return NULL;
+
 	bank = info->ctrl->pin_banks;
 	for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
 		if (bank->bank_num == id) {
@@ -705,15 +708,16 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *pctlnp = of_get_parent(np);
+	struct device_node *pctlnp = NULL;
 	struct pinctrl_dev *pctldev = NULL;
 	struct rockchip_pin_bank *bank = NULL;
 	struct rockchip_pin_output_deferred *cfg;
 	static int gpio;
 	int id, ret;
 
-	if (!np || !pctlnp)
-		return -ENODEV;
+	pctlnp = of_parse_phandle(np, "gpio-ranges", 0);
+	if (!pctlnp)
+		pctlnp = of_get_parent(np);
 
 	pctldev = of_pinctrl_get(pctlnp);
 	if (!pctldev)
-- 
2.25.1

