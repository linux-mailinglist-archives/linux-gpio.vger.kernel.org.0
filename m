Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7060B26D33F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 07:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgIQFtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 01:49:02 -0400
Received: from inva021.nxp.com ([92.121.34.21]:39148 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgIQFs7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 01:48:59 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D99C200BFD;
        Thu, 17 Sep 2020 07:40:59 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 31F2E201507;
        Thu, 17 Sep 2020 07:40:48 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C29174029E;
        Thu, 17 Sep 2020 07:40:34 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        peng.fan@nxp.com, andreas@kemnade.info, hverkuil-cisco@xs4all.nl,
        olof@lixom.net, krzk@kernel.org, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aisheng.dong@nxp.com,
        lkundrak@v3.sk, joel@jms.id.au, bjorn.andersson@linaro.org,
        leoyang.li@nxp.com, vkoul@kernel.org, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 3/4] ARM: imx_v6_v7_defconfig: Build in CONFIG_GPIO_MXC by default
Date:   Thu, 17 Sep 2020 13:33:48 +0800
Message-Id: <1600320829-1453-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600320829-1453-1-git-send-email-Anson.Huang@nxp.com>
References: <1600320829-1453-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

i.MX SoC GPIO driver provides the basic functions of GPIO pin operations
and IRQ operations, it is now changed from "def_bool y" to "tristate", so
it should be explicitly enabled to make sure all consumers work normally.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V2:
	- improve commit message to explain why CONFIG_GPIO_MXC needs to be enabled.
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0fa79bd..221f5c3 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -217,6 +217,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCF857X=y
 CONFIG_GPIO_STMPE=y
 CONFIG_GPIO_74X164=y
+CONFIG_GPIO_MXC=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-- 
2.7.4

