Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF261F329A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 05:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgFIDiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 23:38:20 -0400
Received: from inva020.nxp.com ([92.121.34.13]:41140 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgFIDiT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 23:38:19 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6AD591A01AE;
        Tue,  9 Jun 2020 05:38:17 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 862061A01B9;
        Tue,  9 Jun 2020 05:38:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3C4C140299;
        Tue,  9 Jun 2020 11:38:06 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com,
        christophe.jaillet@wanadoo.fr, dan.carpenter@oracle.com
Cc:     linux-gpio@vger.kernel.org, haibo.chen@nxp.com
Subject: [PATCH v2] Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a resource leak in case of error in 'imx_pinctrl_probe()'"
Date:   Tue,  9 Jun 2020 11:27:03 +0800
Message-Id: <1591673223-1680-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

This reverts commit ba403242615c2c99e27af7984b1650771a2cc2c9.

After commit 26d8cde5260b ("pinctrl: freescale: imx: add shared
input select reg support"). i.MX7D has two iomux controllers
iomuxc and iomuxc-lpsr which share select_input register for
daisy chain settings.
If use 'devm_of_iomap()', when probe the iomuxc-lpsr, will call
devm_request_mem_region() for the region <0x30330000-0x3033ffff>
for the first time. Then, next time when probe the iomuxc, API
devm_platform_ioremap_resource() will also use the API
devm_request_mem_region() for the share region <0x30330000-0x3033ffff>
again, then cause issue, log like below:

[    0.179561] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX pinctrl driver
[    0.191742] imx7d-pinctrl 30330000.pinctrl: can't request region for resource [mem 0x30330000-0x3033ffff]
[    0.191842] imx7d-pinctrl: probe of 30330000.pinctrl failed with error -16

Fixes: ba403242615c ("pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a resource leak in case of error in 'imx_pinctrl_probe()'")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
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

