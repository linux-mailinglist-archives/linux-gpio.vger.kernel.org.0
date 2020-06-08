Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1758A1F1677
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 12:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729340AbgFHKLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 06:11:01 -0400
Received: from inva020.nxp.com ([92.121.34.13]:38600 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729269AbgFHKLA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 06:11:00 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5F7821A00E0;
        Mon,  8 Jun 2020 12:10:59 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 36F601A00CE;
        Mon,  8 Jun 2020 12:10:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id BEDC640297;
        Mon,  8 Jun 2020 18:10:49 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com
Cc:     linux-gpio@vger.kernel.org, haibo.chen@nxp.com
Subject: [PATCH] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Date:   Mon,  8 Jun 2020 18:00:01 +0800
Message-Id: <1591610401-12590-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

This patch block system booting, find on imx7d-sdb board.
From the dts we can see, iomux and iomux_lpsr share the memory region
[0x30330000-0x3033ffff], so will trigger the following issue:

[    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl driver
[    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for resource [mem 0x30330000-0x3033ffff]
[    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16

This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index cb7e0f08d2cf..1f81569c7ae3 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -824,13 +824,12 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 				return -EINVAL;
 			}
 
-			ipctl->input_sel_base = devm_of_iomap(&pdev->dev, np,
-							      0, NULL);
+			ipctl->input_sel_base = of_iomap(np, 0);
 			of_node_put(np);
-			if (IS_ERR(ipctl->input_sel_base)) {
+			if (!ipctl->input_sel_base) {
 				dev_err(&pdev->dev,
 					"iomuxc input select base address not found\n");
-				return PTR_ERR(ipctl->input_sel_base);
+				return -ENOMEM;
 			}
 		}
 	}
-- 
2.17.1

