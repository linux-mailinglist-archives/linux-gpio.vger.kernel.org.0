Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12375228DC3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 03:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731746AbgGVBuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 21:50:14 -0400
Received: from inva021.nxp.com ([92.121.34.21]:55180 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731737AbgGVBuN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 21:50:13 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CDFE7200779;
        Wed, 22 Jul 2020 03:50:11 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28E94200768;
        Wed, 22 Jul 2020 03:49:59 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D8DF3402FC;
        Wed, 22 Jul 2020 09:31:09 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, peter.chen@nxp.com,
        oleksandr.suvorov@toradex.com, andreas@kemnade.info,
        peng.fan@nxp.com, hverkuil-cisco@xs4all.nl, olof@lixom.net,
        krzk@kernel.org, alexandre.torgue@st.com, patrice.chotard@st.com,
        arnd@arndb.de, m.szyprowski@samsung.com, joel@jms.id.au,
        lkundrak@v3.sk, christian.gmeiner@gmail.com,
        bjorn.andersson@linaro.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 3/4] ARM: imx_v6_v7_defconfig: Build in CONFIG_GPIO_MXC by default
Date:   Wed, 22 Jul 2020 09:45:52 +0800
Message-Id: <1595382353-17486-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC
as built-in manually.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 82d3ffb..02f83c8 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -226,6 +226,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCF857X=y
 CONFIG_GPIO_STMPE=y
 CONFIG_GPIO_74X164=y
+CONFIG_GPIO_MXC=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-- 
2.7.4

