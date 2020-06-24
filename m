Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F98206C89
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 08:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389128AbgFXGfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 02:35:38 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47366 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388262AbgFXGfh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jun 2020 02:35:37 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4392C200F31;
        Wed, 24 Jun 2020 08:35:35 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B3F0A200179;
        Wed, 24 Jun 2020 08:35:30 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CAB7E402CA;
        Wed, 24 Jun 2020 14:35:24 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V6 2/9] pinctrl: imx: scu: Support i.MX8 SCU SoCs pinctrl driver built as module
Date:   Wed, 24 Jun 2020 14:23:57 +0800
Message-Id: <1592979844-18833-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
References: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Export necessary APIs to support i.MX8 SCU SoCs pinctrl driver to be
built as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V5:
	- keep it still built in, ONLY export APIs for SoCs pinctrl driver;
---
 drivers/pinctrl/freescale/pinctrl-scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
index 23cf04b..9df45d3 100644
--- a/drivers/pinctrl/freescale/pinctrl-scu.c
+++ b/drivers/pinctrl/freescale/pinctrl-scu.c
@@ -41,6 +41,7 @@ int imx_pinctrl_sc_ipc_init(struct platform_device *pdev)
 {
 	return imx_scu_get_handle(&pinctrl_ipc_handle);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_sc_ipc_init);
 
 int imx_pinconf_get_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 			unsigned long *config)
@@ -66,6 +67,7 @@ int imx_pinconf_get_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(imx_pinconf_get_scu);
 
 int imx_pinconf_set_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 			unsigned long *configs, unsigned num_configs)
@@ -101,6 +103,7 @@ int imx_pinconf_set_scu(struct pinctrl_dev *pctldev, unsigned pin_id,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(imx_pinconf_set_scu);
 
 void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
 			       unsigned int *pin_id, struct imx_pin *pin,
@@ -119,3 +122,4 @@ void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
 	dev_dbg(ipctl->dev, "%s: 0x%x 0x%08lx", info->pins[pin->pin].name,
 		pin_scu->mux_mode, pin_scu->config);
 }
+EXPORT_SYMBOL_GPL(imx_pinctrl_parse_pin_scu);
-- 
2.7.4

