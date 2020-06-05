Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80141EF18D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 08:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgFEGpM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 02:45:12 -0400
Received: from inva021.nxp.com ([92.121.34.21]:56918 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725986AbgFEGpL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 02:45:11 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6AC8F2014A4;
        Fri,  5 Jun 2020 08:45:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E92692002BD;
        Fri,  5 Jun 2020 08:45:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C9704402AD;
        Fri,  5 Jun 2020 14:44:59 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/8] pinctrl: imx: Export necessary APIs for i.MX pinctrl drivers
Date:   Fri,  5 Jun 2020 14:34:27 +0800
Message-Id: <1591338874-4733-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591338874-4733-1-git-send-email-Anson.Huang@nxp.com>
References: <1591338874-4733-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export imx_pinctrl_probe()/imx_pinctrl_pm_ops/imx_pinctrl_sc_ipc_init()
to support i.MX SoCs' pinctrl driver to be built as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 2 ++
 drivers/pinctrl/freescale/pinctrl-scu.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index cb7e0f0..f18f0d7 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -878,6 +878,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 
 	return pinctrl_enable(ipctl->pctl);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_probe);
 
 static int __maybe_unused imx_pinctrl_suspend(struct device *dev)
 {
@@ -897,3 +898,4 @@ const struct dev_pm_ops imx_pinctrl_pm_ops = {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
 					imx_pinctrl_resume)
 };
+EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);
diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
index 23cf04b..200e875 100644
--- a/drivers/pinctrl/freescale/pinctrl-scu.c
+++ b/drivers/pinctrl/freescale/pinctrl-scu.c
@@ -41,6 +41,7 @@ int imx_pinctrl_sc_ipc_init(struct platform_device *pdev)
 {
 	return imx_scu_get_handle(&pinctrl_ipc_handle);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_sc_ipc_init);
 
 int imx_pinconf_get_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 			unsigned long *config)
-- 
2.7.4

