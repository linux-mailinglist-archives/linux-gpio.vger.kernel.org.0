Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B62135125
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 03:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgAICBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 21:01:15 -0500
Received: from inva020.nxp.com ([92.121.34.13]:51538 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726913AbgAICBP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 21:01:15 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 51FAC1A07E9;
        Thu,  9 Jan 2020 03:01:13 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0DC9C1A0F74;
        Thu,  9 Jan 2020 03:01:03 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7ED15402C8;
        Thu,  9 Jan 2020 10:00:50 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        catalin.marinas@arm.com, will@kernel.org, abel.vesa@nxp.com,
        olof@lixom.net, maxime@cerno.tech, dinguyen@kernel.org,
        leonard.crestez@nxp.com, marcin.juszkiewicz@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V5 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MP by default
Date:   Thu,  9 Jan 2020 09:57:03 +0800
Message-Id: <1578535023-10064-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578535023-10064-1-git-send-email-Anson.Huang@nxp.com>
References: <1578535023-10064-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable CONFIG_PINCTRL_IMX8MP by default to support i.MX8MP
pinctrl driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
---
No changes.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d0ea0d0..d35b417 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -396,6 +396,7 @@ CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_IMX8MM=y
 CONFIG_PINCTRL_IMX8MN=y
+CONFIG_PINCTRL_IMX8MP=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IPQ8074=y
-- 
2.7.4

